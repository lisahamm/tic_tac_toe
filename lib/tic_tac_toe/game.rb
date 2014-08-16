module TicTacToe
  class Game
    attr_accessor :board, :players, :current_player, :turn_counter

    def initialize(board, player1, player2)
      @board = board
      @players = [player1, player2]
      @turn_counter = 0
      @current_player = get_current_player
    end

    def get_current_player
      players[turn_counter % 2]
    end

    def get_player_move
        puts "#{current_player}, it's your turn. What cell would you like to mark (1-9)?"
        cell_number = gets.chomp
        cell_number = cell_number.to_i
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

    def play
      while in_progress?
        take_turn
        switch_turn
        board.display
      end
      end_game
    end

    def take_turn
      player_mark = current_player.mark
      if player_mark == 'O'
        current_player.comp_take_turn(board)
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

    def get_new_state(board, cell_number, player)
      new_board = board.dup
      new_board.set_cell(cell_number, player)
    end


    def in_progress?
      if winner?
        winning_player = get_winning_player
        display_winning_message(winning_player)
        return false
      elsif tie?
        display_tie_message
        return false
      end
      true
    end

    def winner?
      board.winner?
    end

    def get_winning_player
      winning_mark = board.get_winning_mark
      if winning_mark == players[0].mark
        players[0]
      else
        players[1]
      end
    end

    def tie?
      board.tie_game?
    end

    def end_game
      puts "Would you like to play again? Enter 1 to play again or enter 2 to quit game"
      option = gets.chomp
      if option == 1
        game = Game.new
        game.play
      elsif option == 2
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
      self.turn_counter += 1
      self.current_player = get_current_player
    end

  end
end