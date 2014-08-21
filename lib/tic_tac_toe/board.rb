module TicTacToe
  class Board

    def initialize(cells = nil)
      @board = cells || Array.new(9) {Cell.new}
    end

    def display
      puts to_s
    end

    def to_s
      s = "+- - - - - -+\n"
      s << "| #{board[0]} | #{board[1]} | #{board[2]} |"
      s << "\n+- - - - - -+\n"
      s << "| #{board[3]} | #{board[4]} | #{board[5]} |"
      s << "\n+- - - - - -+\n"
      s << "| #{board[6]} | #{board[7]} | #{board[8]} |"
      s << "\n+- - - - - -+\n"
    end

    def dup
      new_board = Board.new
      board.each_with_index do |cell, index|
        new_board.set_cell(index + 1, cell.value)
      end
      new_board
    end

    def get_cell(cell_number)
      board[cell_number-1]
    end

    def set_cell(cell_number, player_mark)
      get_cell(cell_number).value = player_mark
    end

    def empty_cell?(cell_number)
      get_cell(cell_number).empty?
    end

    def empty_cells
      available_cells = []
      board.each_with_index do |cell, index|
        available_cells << (index + 1) if cell.empty?
      end
      available_cells
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
      full? && !winner?
    end

    def empty?
      board.all? {|cell| cell.empty?}
    end

    def over?
      winner? || tie_game?
    end

    private

    attr_accessor :board

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

    def full?
      board.none? {|cell| cell.empty?}
    end
  end
end