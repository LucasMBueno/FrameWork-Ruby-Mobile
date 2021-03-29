module PageObjects
  Dir[File.join(File.dirname(__FILE__), '../Pages/*_po.rb')].sort.each { |file| require file }

  def triangulo
    @triangulo ||= Triangulo.new
  end
end
