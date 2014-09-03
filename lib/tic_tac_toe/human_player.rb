module TicTacToe
  class HumanPlayer < Player

    def take_turn(board)
      puts BoardView.new(board).display
      cell_number = get_valid_move(board)
      make_move(board, cell_number)
    end

    private

    def make_move(board, cell_number)
      board.set_cell(cell_number, mark)
    end

    def get_valid_move(board)
      while true
        move = get_move
        if valid_move?(move, board)
          return move
        else
          display_error_message(move)
        end
      end
    end

    def get_move
      puts "#{self}, it's your turn. What cell would you like to mark (1-9)?"
      get_user_input.chomp.to_i
    end

    def get_user_input
      gets
    end

    def valid_move?(cell_number, board)
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
  end
end
