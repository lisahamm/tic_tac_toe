require "spec_helper"

module TicTacToe
  describe ComputerPlayer do
    let(:computer_player) {ComputerPlayer.new('O')}
    let(:board) {Board.new}

    describe "#take_turn" do
      it "makes a winning move when possible" do
        board.set_cell(1, 'O')
        expect(board.get_cell(1).value).to eq 'O'
        board.set_cell(2, 'O')
        board.set_cell(4, 'X')
        board.set_cell(5, 'X')
        computer_player.take_turn(board)
        expect(board.get_cell(3).value).to eq 'O'
      end
    end

  end
end