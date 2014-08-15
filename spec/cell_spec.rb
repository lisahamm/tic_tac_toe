require "spec_helper"

module TicTacToe
  describe Cell do
    let(:cell) {Cell.new}

    describe "#empty?" do
      context "when its value is unassigned" do
        it "is true" do
          expect(cell.empty?).to eq true
        end
      end

      context "when its value is assigned" do
        it "is false" do
          cell.value = 'X'
          expect(cell.empty?).to eq false
        end
      end
    end
  end
end