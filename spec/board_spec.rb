require "spec_helper"

module TicTacToe
  describe Board do
    let(:board) {Board.new}

    let(:won_board) do
      cells = [Cell.new('X'), Cell.new('X'), Cell.new('O'),
               Cell.new('O'), Cell.new('X'), Cell.new('X'),
               Cell.new('X'), Cell.new('O'), Cell.new('X')]
      Board.new(cells)
    end

    let(:tie_board) do
      cells = [Cell.new('X'), Cell.new('X'), Cell.new('O'),
               Cell.new('O'), Cell.new('O'), Cell.new('X'),
               Cell.new('X'), Cell.new('O'), Cell.new('X')]
      Board.new(cells)
    end

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
      context "when cell is empty" do
        it "is true" do
          expect(board.empty_cell?(1)).to eq true
        end
      end

      context "when cell is full" do
        it "is false" do
          board.set_cell(1, 'X')
          expect(board.empty_cell?(1)).to eq false
        end
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
      context "when entire board is empty" do
        it "is true" do
          expect(board.empty?).to eq true
        end
      end

      context "when board contains a mark" do
        it "is false" do
          board.set_cell(1, 'X')
          expect(board.empty?).to eq false
        end
      end
    end

    describe "#tie_game?" do
      context "when board is full without winner" do
        it "is true" do
          expect(tie_board.tie_game?).to eq true
        end
      end

      context "when same mark appears in 3 consecutive cells" do
        it "is false" do
          expect(won_board.tie_game?).to eq false
        end
      end
    end

    describe "#over?" do
      context "when board is full without winner" do
        it "is true" do
          expect(tie_board.over?).to eq true
        end
      end

      context "when same mark appears in 3 consecutive cells" do
        it "is true" do
          expect(won_board.over?). to eq true
        end
      end

      context "when board is empty" do
        it "is false" do
          expect(board.over?).to eq false
        end
      end
    end
  end
end