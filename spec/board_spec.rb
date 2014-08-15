require "spec_helper"

module TicTacToe
  describe Board do
    let(:board) {Board.new}

    describe "#get_cell_value" do
      it "can get a cell value" do
        expect(board.get_cell_value(1)).to eq nil
      end
    end

    describe "#set_cell" do
      it "can set a cell value" do
        expect(board.set_cell(1, 'X')).to eq 'X'
      end
    end

    describe "#empty_cell?" do
      it "can identify an empty cell" do
        expect(board.empty_cell?(1)).to eq true
      end
    end

    describe "#get_winning_mark" do
      it "can return the winner's mark" do
        board.set_cell(1, 'X')
        board.set_cell(2, 'X')
        board.set_cell(3, 'X')
        expect(board.get_winning_mark).to eq 'X'
      end
    end

    describe "#winner?" do
      it "can deterimine when a player has won the game" do
        board.set_cell(1, 'X')
        board.set_cell(2, 'X')
        board.set_cell(3, 'X')
        expect(board.winner?).to eq true
      end
    end
  end
end