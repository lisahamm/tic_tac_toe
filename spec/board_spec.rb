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

    describe "#to_s" do
      it "creates string representation of board in 3x3 cell format" do
        expect(board.to_s).to eq "\n+- - - - - -+\n|   |   |   |\n+- - - - - -+\n|   |   |   |\n+- - - - - -+\n|   |   |   |\n+- - - - - -+\n"
      end
    end

    describe "cell accessors" do
      it "can set and get a cell value" do
        board.set_cell(1, 'X')
        expect(board.get_cell(1).value).to eq 'X'
      end
    end

    describe "#dup" do
      it "creates a new copy" do
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
      it "returns the empty cell numbers" do
        expect(board.empty_cells).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9]
      end
    end

    describe "#get_winning_mark" do
      context "when won" do
        it "returns the winner's mark" do
          expect(won_board.get_winning_mark).to eq 'X'
        end
      end

      context "when no winner" do
        it "is nil" do
          expect(board.get_winning_mark).to eq nil
        end
      end
    end

    describe "#winner?" do
      context "when won" do
        it "is true" do
          expect(won_board.winner?).to eq true
        end
      end

      context "when tied" do
        it "is false" do
          expect(tie_board.winner?).to eq false
        end
      end

      context "when all cells are empty" do
        it "is false" do
          expect(board.winner?).to eq false
        end
      end
    end

    describe "#empty?" do
      context "when all cells are empty" do
        it "is true" do
          expect(board.empty?).to eq true
        end
      end

      context "when not all cells are empty" do
        it "is false" do
          board.set_cell(1, 'X')
          expect(board.empty?).to eq false
        end
      end
    end

    describe "#tie_game?" do
      context "when tied" do
        it "is true" do
          expect(tie_board.tie_game?).to eq true
        end
      end

      context "when won" do
        it "is false" do
          expect(won_board.tie_game?).to eq false
        end
      end

      context "when all cells are empty" do
        it "is false" do
          expect(board.tie_game?).to eq false
        end
      end
    end

    describe "#over?" do
      context "when tied" do
        it "is true" do
          expect(tie_board.over?).to eq true
        end
      end

      context "when won" do
        it "is true" do
          expect(won_board.over?). to eq true
        end
      end

      context "when all cells are empty" do
        it "is false" do
          expect(board.over?).to eq false
        end
      end
    end
  end
end