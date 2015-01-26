module Priori
  class FormatterFactory
    class << self
      def get_formatter(delimiter, opts = {})
        case delimiter
        when ' ' then SpaceFormatter.new(opts)
        when ',' then CommaFormatter.new(opts)
        when '|' then PipeFormatter.new(opts)
        else raise NotImplementedError
        end
      end
    end
  end
end
