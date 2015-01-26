module Priori
  class Person
    attr_accessor :first_name,
                  :last_name,
                  :middle_initial,
                  :favorite_color

    attr_reader :dob,
                :gender

    def initialize(attrs = {})
      attrs.each do |key, val|
        send("#{key}=", val)
      end
    end

    def gender=(g)
      @gender = case g
                when 'M' then 'Male'
                when 'F' then 'Female'
                else g
                end
    end

    def dob=(date)
      @dob = Date.strptime(date, "%m-%d-%Y") rescue Date.strptime(date, "%m/%d/%Y")
    end
  end
end
