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
      @persons = @inputs.map do |input|
        Priori::ImporterFactory.get_importer(input[:delimiter], input: input[:file]).import
      end.flatten
    end

    def print
      str = "Output 1\n"
      str << print_sorted_gender_and_last_name
      str << "Output 2\n"
      str << print_sorted_dob
      str << "Output 3\n"
      str << print_sorted_last_name

      File.open(@output, 'w') { |file| file.write(str) }
    end

    def print_sorted_last_name
      @persons.sort { |a,b| b.last_name <=> a.last_name }.join("\n") + "\n"
    end

    def print_sorted_dob
      @persons.sort { |a,b| a.dob <=> b.dob }.join("\n") + "\n"
    end

    def print_sorted_gender_and_last_name
      @persons.sort do |a,b| 
        comp = (a.gender <=> b.gender)
        comp.zero? ? (a.last_name <=> b.last_name) : comp
      end.join("\n") + "\n"
    end
  end
end
