require 'cucumber'
require 'rspec'
require 'pry'
require 'appium_lib'
require 'appium_lib_core'
require_relative 'utils'
require 'allure-cucumber'

Cucumber::Core::Test::Step.module_eval do
  def name
    return text if text == 'Before hook'
    return text if text == 'After hook'

    "#{source.last.keyword}#{Resultado}"
  end
end

AMBIENTE = ENV['ambiente']
MASSA = YAML.load_file(File.dirname(__FILE__) + "/massa/#{AMBIENTE}.yml")

def caps
  {
    caps: {
      platformName: 'Android',
      app: File.join(File.dirname(__FILE__), '/apk/TrianguloApp.apk'),
      appPackage: 'com.eliasnogueira.trianguloapp',
      appActivity: 'com.eliasnogueira.trianguloapp.MainActivity',
      newCommandTimeout: '3600',
      autoGrantPermissions: true,
      autoAcceptAlerts: true
    }
  }
end

Appium::Driver.new(caps, true)

require_relative 'page_helper'
World(PageObjects)

FileUtils.rm_rf('reports')
FileUtils.rm_rf('reports_allure')
FileUtils.mkdir_p('reports')
FileUtils.mkdir_p('reports\screenshots\test_Passou')
FileUtils.mkdir_p('reports\screenshots\test_Falhou')
FileUtils.mkdir_p('reports_allure')
