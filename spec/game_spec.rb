require "spec_helper"

module TicTacToe
  describe Game do
    let(:player1) {Player.new('X')}
    let(:player2) {Player.new('O')}

    let(:game) {Game.new(Board.new, player1, player2)}

    let(:game_in_play) do
      cells = ['O', 'O', nil,
               nil, 'X', nil,
               nil, nil, nil]
      board = Board.new(3, cells)
      Game.new(board, player1, player2)
    end

    let(:won_game) do
      cells = ['X', 'X', 'O',
               'O', 'X', 'X',
               'X', 'O', 'X']
      board = Board.new(3, cells)
      Game.new(board, player1, player2)
    end

    let(:tie_game) do
      cells = ['X', 'X', 'O',
               'O', 'O', 'X',
               'X', 'O', 'X']
      board = Board.new(3, cells)
      Game.new(board, player1, player2)
    end

    describe "#in_progress?" do
      context "when in play" do
        it "is true" do
          expect(game_in_play.in_progress?).to eq true
        end
      end

      context "when won" do
        it "is false" do
          expect(won_game.in_progress?).to eq false
        end
      end

      context "when tied" do
        it "is false" do
          expect(tie_game.in_progress?).to eq false
        end
      end
    end

    describe "#winner?" do
      context "when in play" do
        it "is false" do
          expect(game_in_play.winner?).to eq false
        end
      end

      context "when won" do
        it "is true" do
          expect(won_game.winner?).to eq true
        end
      end

      context "when tied" do
        it "is false" do
          expect(tie_game.winner?).to eq false
        end
      end
    end

    describe "#get_winning_player" do
      context "when won" do
        it "is winner's mark" do
          expect(won_game.get_winning_player).to eq player1
        end
      end

      context "when tied" do
        it "is nil" do
          expect(tie_game.get_winning_player).to eq nil
        end
      end

      context "when in play" do
        it "is nil" do
          expect(game_in_play.get_winning_player).to eq nil
        end
      end
    end

    describe "#tie?" do
      context "when in play" do
        it "is false" do
          expect(game_in_play.tie?).to eq false
        end
      end

      context "when tied" do
        it "is true" do
          expect(tie_game.tie?).to eq true
        end
      end

      context "when won" do
        it "is false" do
          expect(won_game.tie?).to eq false
        end
      end
    end
  end
end