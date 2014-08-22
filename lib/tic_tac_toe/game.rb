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

    def get_player_move
        puts "#{current_player}, it's your turn. What cell would you like to mark (1-9)?"
        gets.chomp.to_i
    end

    def valid_move?(cell_number)
      correct_range?(cell_number) && board.empty_cell?(cell_number)
    end

    def correct_range?(cell_number)
      cell_number > 0 && cell_number < 10
    end

    def display_error_message(cell_number)
      if !correct_range?(cell_number)
        puts "The cell number you entered is not valid."
      else
        puts "That cell has already been marked. Please select an unmarked cell."
      end
    end

    def take_turn
      player_mark = current_player.mark
      if player_mark == 'O'
        current_player.take_turn(board)
      else
        cell_number = get_player_move
        if valid_move?(cell_number)
          board.set_cell(cell_number, player_mark)
        else
          display_error_message(cell_number)
          take_turn
        end
      end
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