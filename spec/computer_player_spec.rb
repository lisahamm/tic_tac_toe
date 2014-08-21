require "spec_helper"

module TicTacToe
  describe ComputerPlayer do
    let(:computer_player) {ComputerPlayer.new('O')}

    describe "#take_turn" do
      it "makes a winning move when possible" do
        board = Board.new([Cell.new('O'), Cell.new('O'), Cell.new, Cell.new('X'), Cell.new('X'), Cell.new, Cell.new, Cell.new, Cell.new])
        computer_player.take_turn(board)
        expect(board.get_cell(3).value).to eq 'O'
      end
    end
  end
end