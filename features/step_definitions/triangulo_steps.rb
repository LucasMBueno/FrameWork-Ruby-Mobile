Dado('que eu tenho os lados do triangulo {string}') do |tipo_triangulo|
  triangulo.excluir_popup
  @massa = carregar_massa(['Triangulo', tipo_triangulo])
end

Quando('digito as informações para calcular o triangulo') do
  triangulo.preencher_lados(@massa)
  triangulo.calcular
end

Entao('verifico se o triangulo é {string}') do |tipo_triangulo|
  texto = triangulo.resultado
  resultado = case tipo_triangulo
              when 'Isósceles' then 'O triângulo é Isósceles'
              when 'Escaleno' then 'O triângulo é Escaleno'
              when 'Equilátero' then 'O triângulo é Equilátero'
              end
  expect(texto).to eql(resultado)
end
