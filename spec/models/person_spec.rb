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

    context "#dob_display" do
      pairs = {
        "3-3-1985"    => "3/3/1985",
        "12-13-1985"  => "12/13/1985"
      }

      pairs.each do |input, output|
        it output do
          expect(Person.new(dob: input).dob_display).to eq(output)
        end
      end
    end

    context "#to_s" do
      let(:person) { Person.new(
        first_name:      'Poki',
        last_name:       'Chui',
        gender:          'F',
        dob:             '10/2/1980',
        favorite_color:  'yellow')
      }

      it { expect(person.to_s).to eq("Chui Poki Female 10/2/1980 yellow") }
    end
  end
end
