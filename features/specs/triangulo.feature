#language: pt

@triangulo
Funcionalidade: Realizar o calculo do triangulo

@#responsavel
@rally_jira @tags
Esquema do Cenario: Realizar o calculo do triangulo
  Dado que eu tenho os lados do triangulo "<formato>"
  Quando digito as informações para calcular o triangulo
  Entao verifico se o triangulo é "<formato>"

  @bvt
  Exemplos:
    | formato    |
    | Isósceles  |
    | Escaleno   |
    | Equilátero |
