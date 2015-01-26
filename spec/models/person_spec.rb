require_relative '../spec_helper'

module Priori
  describe Person do
    context "#gender=" do
      pairs = {
        "F"      => "Female",
        "Female" => "Female",
        "M"      => "Male",
        "Male"   => "Male"
      }

      pairs.each do |input, output|
        it input do
          expect(Person.new(gender: input).gender).to eq(output)
        end
      end
    end

    context "#dob=" do
      pairs = {
        "3-13-1985"  => "3/13/1985",
        "03-13-1985" => "3/13/1985",
        "3/13/1985"  => "3/13/1985",
        "03/13/1985" => "3/13/1985",
      }

      pairs.each do |input, output|
        it input do
          expect(Person.new(dob: input).dob_display).to eq(output)
        end
      end
    end
  end
end
