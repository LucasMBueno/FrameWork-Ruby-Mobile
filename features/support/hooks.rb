Before do
  # Inicia o driver.
  $driver.start_driver(open_timeout: 36000, read_timeout: 36000)
  # Seta um timeout interno no driver, pelo caps nao funciona.
  $driver.manage.timeouts.implicit_wait = 35
  call_driver
end

def call_driver
  # herda os metodos para o cucumber.
  Appium.promote_appium_methods Object
  update_settings(ignoreUnimportantViews: true)
  update_settings({ fixImageFindScreenshotDims: true, fixImageTemplateSize: true, autoUpdateImageElementPosition: true })
end

After do |scenario|
  raise 'O browser finalizou stop "after scenario"' if $driver.nil?

  @scenario_name = scenario.name.gsub(/\s+/, '_').tr('/', '_')
  # vai tirar print para evidencia
  if scenario.failed?
    tirar_foto(@scenario_name.downcase!, 'Falhou')
  else
    tirar_foto(@scenario_name.downcase!, 'Passou')
  end

  Allure.add_attachment(
    name: 'Evidencia',
    source: File.open(@allure),
    type: Allure::ContentType::PNG
  )
  # $driver.driver_quit
end
