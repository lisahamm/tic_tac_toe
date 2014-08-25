require "spec_helper"

module TicTacToe
  describe HumanPlayer do
    let(:human_player) {HumanPlayer.new('X')}
    let(:board) {Board.new}

    describe "#take_turn" do
      it "places its mark in selected cell" do
        allow(human_player).to receive(:get_user_input) {"1"}
        human_player.take_turn(board)
        expect(board.get_cell(1).value).to eq "X"
      end
    end
  end
end