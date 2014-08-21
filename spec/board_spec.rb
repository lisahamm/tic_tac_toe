require "spec_helper"

module TicTacToe
  describe Board do
    let(:board) {Board.new}

    describe "cell accessors" do
      it "can set and get a cell value" do
        board.set_cell(1, 'X')
        expect(board.get_cell(1).value).to eq 'X'
      end
    end

    describe "#dup" do
      it "can creates a new copy" do
        board.set_cell(1, 'X')
        dup = board.dup
        expect(dup.get_cell(1).value).to eq 'X'
        dup.set_cell(9, 'O')
        expect(dup.get_cell(9).value).to eq 'O'
        expect(board.get_cell(9).value).to be_nil
      end
    end

    describe "#empty_cell?" do
      it "can identify an empty cell" do
        expect(board.empty_cell?(1)).to eq true
      end
    end

    describe "#empty_cells" do
      it "can return all empty cells" do
        expect(board.empty_cells).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9]
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

    describe "#empty?" do
      it "can determine if the entire board is empty" do
        expect(board.empty?).to eq true
      end
    end

    describe "#tie_game?" do
      it "can determine if the board contains a tie game" do
        board = Board.new([Cell.new('X'), Cell.new('X'), Cell.new('O'), Cell.new('O'),
          Cell.new('O'), Cell.new('X'), Cell.new('X'), Cell.new('O'), Cell.new('X')])
        expect(board.tie_game?).to eq true
      end
    end

    describe "#over?" do
      it "can determine if the game is over" do
        board = Board.new([Cell.new('X'), Cell.new('X'), Cell.new('O'), Cell.new('O'),
          Cell.new('O'), Cell.new('X'), Cell.new('X'), Cell.new('O'), Cell.new('X')])
        expect(board.over?).to eq true
      end
    end
  end
end