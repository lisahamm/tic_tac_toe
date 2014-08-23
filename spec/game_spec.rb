require "spec_helper"

module TicTacToe
  describe Game do
    before :each do
      @cells = [Cell.new('X'), Cell.new('X'), Cell.new('O'),
                Cell.new('O'), Cell.new('X'), Cell.new('X'),
                Cell.new('X'), Cell.new('O'), Cell.new('X')]
      @board = Board.new(@cells)
      @player1 = Player.new('X')
      @player2 = Player.new('O')
      @game = Game.new(@board, @player1, @player2)
    end

    context "when game is over" do
      it "is no longer in progress" do
        expect(@game.in_progress?).to eq false
      end

      it "checks if game has a winner" do
        expect(@game.winner?).to eq true
      end

      it "diplays the winner if a player won" do
        expect(@game.get_winning_player).to eq @player1
      end

      it "knows if the game ends in a tie" do
        expect(@game.tie?).to eq false
      end
    end
  end
end