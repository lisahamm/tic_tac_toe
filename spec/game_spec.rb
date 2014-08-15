require "spec_helper"

module TicTacToe
  describe Game do
    let(:game) {Game.new(Board.new, Player.new('X'), Player.new('O'))}

    describe "#get_empty_cells" do
      it "should contain all empty cells" do
        expect(game.get_empty_cells).to eq [1, 2, 3, 4, 5, 6, 7, 8, 9]
      end
    end
  end
end