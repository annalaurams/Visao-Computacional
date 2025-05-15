clear; clc;

imgSize = 50;
numImages = 10;
noise_std = 70;

verticalImages = cell(1, numImages);
horizontalImages = cell(1, numImages);

% ---------- GERAR IMAGENS ----------
for i = 1:numImages
    img = zeros(imgSize, imgSize, 'double');
    offset = randi([0, 2]);
    for col = 1+offset:4:imgSize
        if col + 2 <= imgSize
            val = randi([100, 255]);
            img(:, col:col+2) = val;
        end
    end
    img = img + noise_std * randn(size(img));
    img = uint8(min(max(img, 0), 255));
    verticalImages{i} = img;
end

for i = 1:numImages
    img = zeros(imgSize, imgSize, 'double');
    offset = randi([0, 2]);
    for row = 1+offset:4:imgSize
        if row + 2 <= imgSize
            val = randi([100, 255]);
            img(row:row+2, :) = val;
        end
    end
    img = img + noise_std * randn(size(img));
    img = uint8(min(max(img, 0), 255));
    horizontalImages{i} = img;
end

% ---------- VISUALIZAR ----------

figure('Name','Imagens com ruído');
for i = 1:10
    subplot(2, 10, i); imshow(verticalImages{i}); title(sprintf('V %d', i));
    subplot(2, 10, i+10); imshow(horizontalImages{i}); title(sprintf('H %d', i));
end

% ---------- VETORIZAÇÃO ----------

X_verticais = zeros(numImages, 2500);
X_horizontais = zeros(numImages, 2500);
for i = 1:numImages
    X_verticais(i, :) = reshape(verticalImages{i}, 1, []);
    X_horizontais(i, :) = reshape(horizontalImages{i}, 1, []);
end

X = [X_verticais; X_horizontais];
y = [zeros(numImages,1); ones(numImages,1)];

% ---------- TREINO E TESTE ----------

idx_treino = [1:5,11:15];
idx_teste  = [6:10,16:20];

X_treino = X(idx_treino, :);
y_treino = y(idx_treino);
X_teste  = X(idx_teste, :);
y_teste  = y(idx_teste);

% ---------- SVM ORIGINAL ----------

modelo = fitcsvm(X_treino, y_treino, 'KernelFunction','linear');
y_pred = predict(modelo, X_teste);
acuracia = mean(y_pred == y_teste) * 100;
fprintf('Acurácia no teste: %.2f%%\n\n', acuracia);

% ---------- PCA ----------

[coeff, ~, ~, ~, ~, mu] = pca(X);
X_treino_2D = (X_treino - mu) * coeff(:, 1:2);
X_teste_2D  = (X_teste  - mu) * coeff(:, 1:2);

% ---------- NOVO SVM EM 2D ----------

modelo_2D = fitcsvm(X_treino_2D, y_treino, 'KernelFunction','linear');

[x1Grid, x2Grid] = meshgrid( ...
    linspace(min(X_teste_2D(:,1))-500, max(X_teste_2D(:,1))+500, 100), ...
    linspace(min(X_teste_2D(:,2))-500, max(X_teste_2D(:,2))+500, 100));
gridPoints = [x1Grid(:), x2Grid(:)];
[~, scores] = predict(modelo_2D, gridPoints);

% ---------- PREDIÇÃO 2D ----------

y_pred_2D = predict(modelo_2D, X_teste_2D);

% ---------- PLOT COM ERROS ----------
figure;
gscatter(X_teste_2D(:,1), X_teste_2D(:,2), y_teste, 'rb', 'ox', 8);
hold on;
contour(x1Grid, x2Grid, reshape(scores(:,2), size(x1Grid)), [0 0], 'k', 'LineWidth', 2);

% Marcar erros de predição

for i = 1:length(y_teste)
    if y_pred_2D(i) ~= y_teste(i)
        plot(X_teste_2D(i,1), X_teste_2D(i,2), 'ks', 'MarkerSize', 12, 'LineWidth', 2); % quadrado preto
    end
end

title('Separação do SVM após PCA (dados de TESTE)');
legend('Vertical (0)', 'Horizontal (1)', 'Fronteira de decisão', 'Erro de classificação');
xlabel('Componente Principal 1');
ylabel('Componente Principal 2');
grid on;



%%  ---------- COMENTÁRIO ----------

% O experimento apresenta um modelo SVM linear treinado para classificar imagens com listas verticais e horizontais sob alto nível de ruído e desalinhamento,
% com a visualização realizada após redução de dimensionalidade via PCA. No gráfico, observa-se que a fronteira de decisão traçada pelo SVM não separa perfeitamente as classes,
% evidenciando erros de classificação destacados por quadrados pretos. 
% Isso é esperado, pois o ruído introduzido torna as classes parcialmente sobrepostas no espaço projetado.
% Ainda assim, o modelo consegue identificar padrões relevantes para distinguir boa parte das imagens,
% indicando que a informação visual é parcialmente preservada mesmo após a distorção. 