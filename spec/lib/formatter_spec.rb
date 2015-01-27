require_relative '../spec_helper'

module Priori
  describe Formatter do
    let(:data_dir) { "#{File.dirname(__FILE__)}/../data" }

    def self.run_print_tests(index)
      it "#print_sorted_last_name" do
        formatter.format
        expect(formatter.print_sorted_last_name).to eq(File.read("#{data_dir}/sorted_last_name#{index}.txt"))
      end

      it "#print_sorted_dob" do
        formatter.format
        expect(formatter.print_sorted_dob).to eq(File.read("#{data_dir}/sorted_dob#{index}.txt"))
      end

      it "#print_sorted_gender_and_last_name" do
        formatter.format
        expect(formatter.print_sorted_gender_and_last_name).to \
          eq(File.read("#{data_dir}/sorted_gender_and_last_name#{index}.txt"))
      end
    end

    context "one file" do
      let(:formatter) { Formatter.new(
          inputs: [
            {
              file: "#{data_dir}/space_delimited.txt", 
              delimiter: ' '
            }
          ]
        )
      }

      it "#format" do
        persons = formatter.format
        expect(persons.size).to           eq(3)
        expect(persons[0].last_name).to   eq('Kournikova')
        expect(persons[-1].last_name).to  eq('Seles')
      end

      run_print_tests(1)
    end

    context "two files" do
      let(:formatter) { Formatter.new(
          inputs: [
            {
              file: "#{data_dir}/space_delimited.txt", 
              delimiter: ' '
            },
            {
              file: "#{data_dir}/comma_delimited.txt", 
              delimiter: ','
            }
          ]
        )
      }

      it "#format" do
        persons   = formatter.format
        expect(persons.size).to           eq(6)
        expect(persons[0].last_name).to   eq('Kournikova')
        expect(persons[-1].last_name).to  eq('Kelly')
      end

      run_print_tests(2)
    end
  end
end
