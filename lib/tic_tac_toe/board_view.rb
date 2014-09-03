module TicTacToe
  class BoardView
    attr_accessor :cells

    #pass in an instance of the IO class
    def initialize(board)
      @cells = format_empty_cells(board.cells)
    end

    def format_empty_cells(cells)
      cells.map {|cell| cell == nil ?  ' ' : cell}
    end

    def display
      s = "\n+- - - - - -+\n"
      s << "| #{cells[0]} | #{cells[1]} | #{cells[2]} |"
      s << "\n+- - - - - -+\n"
      s << "| #{cells[3]} | #{cells[4]} | #{cells[5]} |"
      s << "\n+- - - - - -+\n"
      s << "| #{cells[6]} | #{cells[7]} | #{cells[8]} |"
      s << "\n+- - - - - -+\n"
    end
  end
end