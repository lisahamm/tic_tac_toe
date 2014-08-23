module TicTacToe
  class Game

    def initialize(board, player1, player2)
      @board = board
      @players = [player1, player2]
      @current_player = player1
    end

    def play
      while in_progress?
        take_turn
        switch_turn
        board.display
      end
      end_game
      play_again?
    end

    private

    attr_accessor :board, :players, :current_player

    def take_turn
      current_player.take_turn(board)
    end

    def in_progress?
      !winner? && !tie?
    end

    def winner?
      board.winner?
    end

    def get_winning_player
      board.get_winning_mark == players[0].mark ? players[0] : players[1]
    end

    def tie?
      board.tie_game?
    end

    def end_game
      if winner?
        display_winning_message(get_winning_player)
      elsif tie?
        display_tie_message
      end
    end

    def play_again?
      puts "Would you like to play again? Enter 1 to play again or enter 2 to quit game"
      option = gets.chomp
      if option == 1
        Game.new(Board.new, Player.new('X'), ComputerPlayer.new('O')).play
      else
        exit
      end
    end

    def display_winning_message(winning_player)
      puts "Game Over, we have a winner. Congratulations player #{winning_player}!"
    end

    def display_tie_message
      puts "Board is full. Tie game."
    end

    def switch_turn
      self.current_player = current_player == players[0] ? players[1] : players[0]
    end
  end
end