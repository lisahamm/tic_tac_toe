require "spec_helper"

module TicTacToe
  describe BoardView do
    let(:board) {Board.new}
    let(:io) {InputOutput.new}
    let(:board_view) {BoardView.new(board, io)}

    describe "#display" do
      it "can output string to screen" do
        allow(io).to receive(:output).with("\n+- - - - - -+\n|   |   |   |\n+- - - - - -+\n|   |   |   |\n+- - - - - -+\n|   |   |   |\n+- - - - - -+\n")
        board_view.display
      end
    end
  end
end