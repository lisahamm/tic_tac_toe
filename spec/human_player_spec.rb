require "spec_helper"

module TicTacToe
  describe HumanPlayer do
    let(:board) {Board.new}
    let(:io) {InputOutput.new}
    let(:view) {BoardView.new(board, io)}
    let(:human_player) {HumanPlayer.new('X', io, view)}

    describe "#take_turn" do
      it "places its mark in valid selected cell" do
        allow(io).to receive(:output) {}
        allow(human_player).to receive(:get_user_input) {"1"}
        human_player.take_turn(board)
        expect(board.get_cell(0)).to eq "X"
      end
    end
  end
end