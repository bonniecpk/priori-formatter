module Priori
  class Importer
    def initialize(opts = {})
      @input     = opts[:input]
      @delimiter = opts[:delimiter]
      @formats   = opts[:formats]
    end

    def import
      persons = []
      CSV.foreach(@input, col_sep: @delimiter) do |row|
        persons << Person.new(Hash[@formats.each_with_index.map { |attr,index| [attr, row[index].strip] }])
      end
      persons
    end
  end

  class SpaceImporter < Importer
    FORMATS = [
      :last_name,
      :first_name,
      :middle_initial,
      :gender,
      :dob,
      :favorite_color
    ]

    def initialize(opts = {})
      super(opts.merge(delimiter: ' ', formats: FORMATS))
    end
  end

  class CommaImporter < Importer
    FORMATS = [
      :last_name,
      :first_name,
      :gender,
      :favorite_color,
      :dob
    ]

    def initialize(opts = {})
      super(opts.merge(delimiter: ',', formats: FORMATS))
    end
  end

  class PipeImporter < Importer
    FORMATS = [
      :last_name,
      :first_name,
      :middle_initial,
      :gender,
      :favorite_color,
      :dob
    ]

    def initialize(opts = {})
      super(opts.merge(delimiter: '|', formats: FORMATS))
    end
  end

  class ImporterFactory
    class << self
      def get_importer(delimiter, opts = {})
        case delimiter
        when ' ' then SpaceImporter.new(opts)
        when ',' then CommaImporter.new(opts)
        when '|' then PipeImporter.new(opts)
        else raise NotImplementedError
        end
      end
    end
  end
end
