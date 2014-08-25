require "spec_helper"

module TicTacToe
  describe ComputerPlayer do
    let(:computer_player) {ComputerPlayer.new('O')}

    describe "#take_turn" do
      context "when able to win" do
        it "makes the winning move" do
          board = Board.new([Cell.new('O'), Cell.new('O'), Cell.new, Cell.new('X'), Cell.new('X'), Cell.new, Cell.new, Cell.new, Cell.new])
          computer_player.take_turn(board)
          expect(board.get_cell(3).value).to eq 'O'
        end
      end

      context "when opponent is able to win" do
        it "blocks the winning move" do
          board = Board.new([Cell.new('X'), Cell.new('X'), Cell.new, Cell.new, Cell.new('O'), Cell.new, Cell.new, Cell.new, Cell.new])
          computer_player.take_turn(board)
          expect(board.get_cell(3).value).to eq 'O'
        end
      end
    end
  end
end