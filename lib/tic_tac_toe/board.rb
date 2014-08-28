module TicTacToe
  class Board
    attr_accessor :cells

    def initialize(cells = nil)
      @board = cells || Array.new(9) {Cell.new}
    end

    def to_s
      s = "\n+- - - - - -+\n"
      s << "| #{board[0]} | #{board[1]} | #{board[2]} |"
      s << "\n+- - - - - -+\n"
      s << "| #{board[3]} | #{board[4]} | #{board[5]} |"
      s << "\n+- - - - - -+\n"
      s << "| #{board[6]} | #{board[7]} | #{board[8]} |"
      s << "\n+- - - - - -+\n"
    end

    def dup
      new_board = Board.new
      board.each_with_index {|cell, index| new_board.set_cell(index + 1, cell.value)}
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
      board.each_with_index {|cell, index| available_cells << (index + 1) if cell.empty?}
      available_cells
    end

    def get_winning_mark
      winning_solutions.each do |solution|
        cell1 = get_cell(solution[0]).value
        cell2 = get_cell(solution[1]).value
        cell3 = get_cell(solution[2]).value
        if cell1 == cell2 && cell1 == cell3 && cell1 != nil
          return cell1
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

    attr_accessor :board, :winning_solutions

    def winning_solutions
      self.winning_solutions = [
        [1, 2, 3], [4, 5, 6], [7, 8, 9],
        [1, 4, 7], [2, 5, 8], [3, 6, 9],
        [1, 5, 9], [3, 5, 7]]
    end

    def full?
      board.none? {|cell| cell.empty?}
    end
  end
end