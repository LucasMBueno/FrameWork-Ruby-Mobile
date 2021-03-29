class Triangulo
  def initialize
    @btn_ok = :id, 'android:id/button1'
    @triangulo_lado1 = :id, 'com.eliasnogueira.trianguloapp:id/txtLado1'
    @triangulo_lado2 = :id, 'com.eliasnogueira.trianguloapp:id/txtLado2'
    @triangulo_lado3 = :id, 'com.eliasnogueira.trianguloapp:id/txtLado3'
    @btn_calcular = :id, 'com.eliasnogueira.trianguloapp:id/btnCalcular'
    @resultado = :id, 'com.eliasnogueira.trianguloapp:id/txtResultado'
  end

  def excluir_popup
    buscar(@btn_ok).click
  end

  def preencher_lados(massa)
    buscar(@triangulo_lado1).send_keys(massa['a'])
    buscar(@triangulo_lado2).send_keys(massa['b'])
    buscar(@triangulo_lado3).send_keys(massa['c'])
  end

  def calcular
    buscar(@btn_calcular).click
  end

  def resultado
    buscar(@resultado).text
  end
end
