module TicTacToe
  class HumanPlayer < Player
    attr_accessor :io, :view

    def initialize(mark, io, view)
      @mark = mark
      @io = io
      @view = view
    end

    def take_turn(board)
      view.display
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
      io.output("#{self}, it's your turn. What cell would you like to mark (1-9)?")
      get_user_input.chomp.to_i - 1
    end

    def get_user_input
      io.input
    end

    def valid_move?(cell_number, board)
      correct_range?(cell_number) && board.empty_cell?(cell_number)
    end

    def correct_range?(cell_number)
      cell_number >= 0 && cell_number < 9
    end

    def display_error_message(cell_number)
      if !correct_range?(cell_number)
        io.output("The cell number you entered is not valid.")
      else
        io.output("That cell has already been marked. Please select an unmarked cell.")
      end
    end
  end
end
