module Priori
  class Formatter
    def initialize(opts = {})
      @inputs = opts[:inputs]

      if opts[:output]
        @output = opts[:output]
        output_dir = File.dirname(@output)
        FileUtil.mk_p(output_dir) unless File.exists? output_dir
      end
    end

    def format
      persons = @inputs.map do |input|
        Priori::ImporterFactory.get_importer(
          $options.inputs[:delimiter],
          input:  $options.input[:file]
        ).import
      end.flatten
    end
  end
end
