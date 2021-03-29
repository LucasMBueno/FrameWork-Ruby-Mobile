def tirar_foto(nome_foto, resultado)
  time = Time.now.strftime('%Y-%m-%d %H%M%S')
  caminho = "reports/screenshots/test_#{resultado}"
  foto = "#{caminho}/#{nome_foto}_#{time}.png"
  @allure = save_viewport_screenshot(foto)
end

def carregar_massa(struct, indice = nil)
  temp_massa = MASSA[struct[0]]
  indice_massa = struct.count
  i = 1
  while i < indice_massa
    temp_massa = temp_massa[struct[i]]
    i += 1
  end
  indice.eql?(nil) ? temp_massa.sample : temp_massa[indice]
end

def buscar(args)
  @type, @value = args if args.is_a? Array
  raise 'O valor deve ser um Array [:type, "value"]' unless args.is_a? Array

  find_element(@type, @value)
end
