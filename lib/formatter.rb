module Priori
  class Formatter
    def initialize(opts = {})
      @input = opts[:input]

      if opts[:output]
        @output = opts[:output]
        output_dir = File.dirname(@output)
        FileUtil.mk_p(output_dir) unless File.exists? output_dir
      end
    end

    def format
      raise NotImplementedError
    end
  end

  class SpaceFormatter < Formatter
    def format
      CSV.foreach(input[:file], col_sep: ' ' ) do |row|
        puts row
      end
    end
  end

  class CommaFormatter < Formatter
    def format
      CSV.foreach(input[:file], col_sep: ',') do |row|
        puts row
      end
    end
  end

  class PipeFormatter < Formatter
    def format
      CSV.foreach(input[:file], col_sep: '|') do |row|
        puts row
      end
    end
  end
end
