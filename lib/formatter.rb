module Priori
  class Formatter
    def initialize(opts)
      @inputs = opts[:inputs]

      if opts[:output]
        @output = opts[:output]
        output_dir = File.dirname(@output)
        FileUtil.mk_p(output_dir) unless File.exists? output_dir
      end
    end

    def format
      @inputs.each do |input|
        input[:file]
        input[:delimiter]
      end
    end
  end
end
