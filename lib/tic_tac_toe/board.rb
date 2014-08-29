module TicTacToe
  BOARD_SIZE = 3

  class Board
    attr_accessor :cells, :size

    def initialize(size = BOARD_SIZE, cells=nil)
      @size = size
      @cells = cells || Array.new(size*size) {nil}
    end

    # def to_s
    #   s = "\n+- - - - - -+\n"
    #   s << "| #{board[0]} | #{board[1]} | #{board[2]} |"
    #   s << "\n+- - - - - -+\n"
    #   s << "| #{board[3]} | #{board[4]} | #{board[5]} |"
    #   s << "\n+- - - - - -+\n"
    #   s << "| #{board[6]} | #{board[7]} | #{board[8]} |"
    #   s << "\n+- - - - - -+\n"
    # end

    def dup
      new_board = Board.new(size)
      cells.each_with_index {|cell, index| new_board.set_cell(index + 1, cells[index])}
      new_board
    end

    def get_cell(cell_number)
      cells[cell_number-1]
    end

    def set_cell(cell_number, player_mark)
      cells[cell_number-1] = player_mark
    end

    def empty_cell?(cell_number)
      cells[cell_number-1] == nil
    end

    def empty_cells
      available_cells = []
      cells.each_with_index {|cell, index| available_cells << (index + 1) if empty_cell?(index+1)}
      available_cells
    end

    def get_winning_mark
      winning_solutions.each do |solution|
        cell1 = cells[solution[0]-1]
        cell2 = cells[solution[1]-1]
        cell3 = cells[solution[2]-1]
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
      cells.all? {|cell| empty_cell?(cell)}
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
      cells.none? {|cell| empty_cell?}
    end
  end
end