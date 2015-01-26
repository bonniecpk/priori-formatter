require_relative '../spec_helper'

module Priori
  describe FormatterFactory do
    context "#get_formatter" do
      it "get space formatter" do
        expect(FormatterFactory.get_formatter(' ').class).to be(SpaceFormatter)
      end
      
      it "get comma formatter" do
        expect(FormatterFactory.get_formatter(',').class).to be(CommaFormatter)
      end

      it "get pipe formatter" do
        expect(FormatterFactory.get_formatter('|').class).to be(PipeFormatter)
      end

      it "not implemented" do
        expect{ FormatterFactory.get_formatter('d') }.to raise_error(NotImplementedError)
      end
    end

  end
end

