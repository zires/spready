class LiquidHandler
  
  def call(template)
    # puts "*************\n"
    # puts template.source
    # puts "end=========\n"
    # template_source = template.source.dup.force_encoding("BINARY")
    # puts "&&&&&&&&&&&&&&&&\n"
    # puts template_source
    #liquid = Liquid::Template.parse(template.source)
    #liquid.render
    #options = Haml::Template.options.dup
    #s = Haml::Engine.new(template.source, options).send(:precompiled_with_ambles, [])
    #puts "#{s}   #{s.class}"
    #s
    liquid = Liquid::Template.parse(template.source)
    #puts "=======#{src}"
    # puts "#{liquid.render}"
    # liquid.render
    # "liquid = ::Liquid::Template.parse(#{template.source});" + "self.output_buffer = liquid.render;"
    # "self.output_buffer = '#{liquid.render}';"
    # "@output_buffer = output_buffer || ActionView::OutputBuffer.new;"+
    # "@output_buffer << #{src.inspect};"
    #(liquid.render + template.source).inspect
    "@output_buffer = output_buffer || ActionView::OutputBuffer.new;" + 
    "@output_buffer << #{liquid.render};"
  end

  def self.call(template)
    new.call(template)
  end

end