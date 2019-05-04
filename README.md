# Implementação de um Sistema Especialista Fuzzy para Controle de Massa Corporal IMC

Emilio Fuhs

Giancarlo Samori

## 1. Introdução

Neste relatório será detalhada a implementação de um Sistema Especialista Fuzzy utilizando a ferramenta FuzzyClips. A finalidade do sistema é saber qual o nível de sua massa corporal, considerando como variáveis auxiliares o peso e altura.
As variáveis lingüísticas de entrada e saída são mostradas na Tabela 1:

Colocar a tabela 1

Na primeira coluna da tabela estão descritos os valores possíveis para o peso da pessoa, enquanto na primeira linha estão descritos os valores possíveis para a altura dela. Baixa é de 100 a 160cm, média de 160 a 180cm e alto 180 a 250cm. Os demais valores da tabela são o indice de massa corporal que cada pessoa atinge conforme os dados.


## 2. Implementação e Testes

![image](https://user-images.githubusercontent.com/42296433/57185227-ed336500-6e9d-11e9-914f-aaac8ab5e3d3.png)

![image](https://user-images.githubusercontent.com/42296433/57184383-29ac9400-6e91-11e9-93b1-b03649e0dd89.png)
Figura 1

A Figura 1 ilustra os valores numéricos possíveis para a Peso, considerando as variáveis lingüísticas definidas na Tabela 1 e no template respectivo.


As regras que definirão a Altura, foi utilizado duas funções pré-definidas (z e s) e uma trapezóide:

![image](https://user-images.githubusercontent.com/42296433/57185290-e3f6c800-6e9e-11e9-912b-4c98f5bbbeb6.png)

![image](https://user-images.githubusercontent.com/42296433/57185301-17d1ed80-6e9f-11e9-8df3-69b62742fcd7.png)
Figura 2

A Figura 2 ilustra os valores numéricos possíveis para a Altura.

Para a defuzzificação, foi criada uma variável global. A regra defuzifica foi declarada com salience 0 de forma a ser executada posteriormente às demais regras do sistema.

![image](https://user-images.githubusercontent.com/42296433/57185389-d17d8e00-6ea0-11e9-91da-dfeaeed20106.png)

Foram gerados valores através do deffacts, no sentido de testar as regras e obter os valores numéricos relacionados aos resultados. O código-fonte abaixo ilustra a utilização de valores para a Peso e Altura.


## Conclusão 

Conclui-se que tendo as variaveis de peso e altura conseguimos chegar no IMC que é o indice de massa corporal. Colocamos as variaveis no deftemplate para o programa CLIPS fazer os gráficos com a linguagem Fuzzy.
