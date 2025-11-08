# Visão Computacional 

Este repositório contém os scripts utilizados nas aulas de Visão Computacional.

## 🔗 Projeto Final: Classificador Multiclasse de Animais

Este repositório está associado ao projeto [**Classificador Multiclasse de Animais**](https://github.com/annalaurams/Classificador_multiclasse_animais), que utiliza técnicas de **Visão Computacional** e **Aprendizado de Máquina** para a **classificação de imagens** de diferentes espécies.  
O sistema aplica modelos como **MobileNetV2** e **Random Forest**, com uso do **aumento de dados (Data Augmentation)** e **métricas de avaliação** como acurácia, precisão, revocação e F1-score.  

## 🔍 Conteúdo Aulas

- **Aula1.m**  
  Gera e exibe matrizes de imagens aleatórias em tons de cinza 

- **Aula2.m**  
  Cria e exibe matrizes coloridas, utilizando diferentes canais de cor 

- **Aula3.m**  
  Lê uma imagem de arquivo, separa os canais R, G, B e exibe cada canal individualmente

- **Aula4.m**  
  Gera uma matriz de imagem aleatória em tons de cinza (3x3) e implementa o espelhamento horizontal e vertical dessa imagem.

- **Aula5.m**  
  Cria uma imagem RGB aleatória (3x3) e implementa o espelhamento horizontal e vertical para imagens coloridas

- **Aula6.m**  
  Gera uma imagem RGB aleatória, realiza espelhamentos e rotações de 90° e 180°.

- **Aula7.m**  
  Lê uma imagem de arquivo, realiza espelhamentos e rotações de 90° e 180°.
  
- **Aula8.m**  
  Aplica filtros de convolução clássicos como o Laplaciano (realce de bordas) e o Gaussiano (suavização). Em seguida, é utilizado um filtro de máximo com janela 3x3 para realçar regiões de maior intensidadee e ainda é usado o operador de Sobel.


## Atividades

- **Atividade 1**  
  Consiste na criação de imagens aleatórias em tons de cinza e RGB, utilizando matrizes com valores de intensidade de pixels. 

- **Atividade 2**  
  Envolve a aplicação de filtros convolucionais em imagens, tanto em escala de cinza quanto em RGB. Além disso, são utilizados conceitos como padding e normalização para preservar o tamanho da imagem e melhorar a visualização dos resultados.

- **Atividade 3**  
  São aplicados filtros do tipo passa-alta e passa-baixa com variação de parâmetros. No item (a), é utilizado o filtro Sobel para extração de bordas. No item (b), é aplicado o filtro Average (média). No item (c), o filtro Gaussiano é testado com diferentes tamanhos de máscara e desvios padrão (σ), mostrando como o alisamento pode ser controlado de forma mais precisa.

- **Atividade 4**  
Realiza a segmentação semântica de vídeo em cenário urbano utilizando um modelo pré-treinado baseado em DeepLabV3 + MobileNetV2. O vídeo é processado com diferentes taxas de amostragem, e é gerado um novo vídeo com as segmentações sobrepostas. Além disso, são coletados e analisados os tempos de processamento por frame, permitindo avaliar o impacto da amostragem na eficiência computacional.
  
- **Atividade 5**  
O experimento apresenta um modelo SVM linear treinado para classificar imagens com listas verticais e horizontais sob alto nível de ruído e desalinhamento, com a visualização realizada após redução de dimensionalidade via PCA.
