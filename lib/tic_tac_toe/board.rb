module TicTacToe
  class Board
    attr_accessor :board
    def initialize
      @board = Array.new(3) {Array.new(3) {Cell.new}}
    end

    def display
      puts to_s
    end

    def to_s
      s = "+- - - - - -+\n"
      for row in 0..2
        s << "| "
        for column in 0..2
          cell = board[row][column]
          s << "#{cell} | "
        end
        s << "\n+- - - - - -+\n"
      end
      s
    end

    def get_cell(cell_number)
      cell_number = cell_number - 1
      row = cell_number / 3
      column = cell_number % 3
      board[row][column]
    end

    def dup
      new_board = Board.new
      for i in 1..9
        new_board.set_cell(i, get_cell_value(i))
      end
      new_board
    end

    def get_cell_value(cell_number)
      get_cell(cell_number).value
    end

    def all_empty?
      for i in 1 .. 9
        if !empty_cell?(i)
          return false
        end
      end
    end

    def set_cell(cell_number, player_mark)
      get_cell(cell_number).value = player_mark
    end

    def empty_cell?(cell_number)
      get_cell(cell_number).empty?
    end

    def cell_num_array
      [1, 2, 3, 4, 5, 6, 7, 8, 9]
    end

    def empty_cells
      empty_cells = []
      cell_num_array.each do |cell_number|
        if empty_cell?(cell_number)
          empty_cells << cell_number
        end
      end
      empty_cells
    end

    def winning_solutions_rows
      [[1, 2, 3],
       [4, 5, 6],
       [7, 8, 9]]
    end

    def winning_solutions_cols
      [[1, 4, 7],
       [2, 5, 8],
       [3, 6, 9]]
    end

    def winning_solutions_diags
      [[1, 5, 9],
       [3, 5, 7]]
    end

    def winning_solutions
      winning_solutions_rows + winning_solutions_cols + winning_solutions_diags
    end

    def get_winning_mark
      for i in 0 .. winning_solutions.length - 1
        cell1 = get_cell(winning_solutions[i][0])
        cell2 = get_cell(winning_solutions[i][1])
        cell3 = get_cell(winning_solutions[i][2])
        if cell1.value == cell2.value && cell2.value == cell3.value && cell1.empty? == false
          return "#{cell1}"
        end
      end
      nil
    end

    def winner?
      get_winning_mark != nil
    end

    def tie_game?
      board_full?
    end

    def board_full?
      for i in 1 .. 9
        if get_cell(i).empty?
          return false
        end
      end
      true
    end

    def over?
      winner? || tie_game?
    end
  end
end