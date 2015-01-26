require_relative '../spec_helper'

module Priori
  DATA_DIR = "#{File.dirname(__FILE__)}/../data"

  describe Importer do
    context "#import" do
      it "no data" do
        persons = Importer.new(
          input:     "#{DATA_DIR}/no_data.txt",
          delimiter: 'd',
          formats:   [:a, :b]
        ).import

        expect(persons.size).to              eq(0)
      end
    end
  end

  describe SpaceImporter do
    context "#import" do
      it "valid data" do
        persons = SpaceImporter.new(input: "#{DATA_DIR}/space_delimited.txt").import

        expect(persons.size).to              eq(3)
        expect(persons[0].last_name).to      eq("Kournikova")
        expect(persons[0].first_name).to     eq("Anna")
        expect(persons[0].middle_initial).to eq("F")
        expect(persons[0].gender).to         eq("Female")
        expect(persons[0].dob).to            eq(Date.parse("3-6-1975"))
        expect(persons[0].favorite_color).to eq("Red")
      end
    end
  end

  describe CommaImporter do
    context "#import" do
      it "valid data" do
        persons = CommaImporter.new(input: "#{DATA_DIR}/comma_delimited.txt").import

        expect(persons.size).to              eq(3)
        expect(persons[0].last_name).to      eq("Abercrombie")
        expect(persons[0].first_name).to     eq("Neil")
        expect(persons[0].gender).to         eq("Male")
        expect(persons[0].dob).to            eq(Date.parse("13-2-1943"))
        expect(persons[0].favorite_color).to eq("Tan")
      end
    end
  end


  describe PipeImporter do
    context "#import" do
      it "valid data" do
        persons = PipeImporter.new(input: "#{DATA_DIR}/pipe_delimited.txt").import

        expect(persons.size).to              eq(3)
        expect(persons[0].last_name).to      eq("Smith")
        expect(persons[0].first_name).to     eq("Steve")
        expect(persons[0].middle_initial).to eq("D")
        expect(persons[0].gender).to         eq("Male")
        expect(persons[0].dob).to            eq(Date.parse("3-3-1985"))
        expect(persons[0].favorite_color).to eq("Red")
      end
    end
  end

  describe ImporterFactory do
    context "#get_importer" do
      it "get space Importer" do
        expect(ImporterFactory.get_importer(' ').class).to be(SpaceImporter)
      end
      
      it "get comma Importer" do
        expect(ImporterFactory.get_importer(',').class).to be(CommaImporter)
      end

      it "get pipe Importer" do
        expect(ImporterFactory.get_importer('|').class).to be(PipeImporter)
      end

      it "not implemented" do
        expect{ ImporterFactory.get_importer('d') }.to raise_error(NotImplementedError)
      end
    end
  end
end

