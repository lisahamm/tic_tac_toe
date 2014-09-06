require "spec_helper"

module TicTacToe
  describe HumanPlayer do
    let(:board) {Board.new}
    let(:io) {InputOutput.new}
    let(:view) {BoardView.new(board, io)}
    let(:human_player) {HumanPlayer.new('X', io, view)}

    describe "#take_turn" do
      it "places its mark in selected cell" do
        allow($stdout).to receive(:puts) {}
        allow(human_player).to receive(:get_user_input) {"1"}
        human_player.take_turn(board)
        expect(board.get_cell(1)).to eq "X"
      end
    end
  end
end