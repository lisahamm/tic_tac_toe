module TicTacToe
  class BoardView
    attr_accessor :cells

    def initialize(board)
      @cells = space(board.cells)
    end

    def space(cells)
      cells.map {|cell| cell = cell == nil ?  ' ' : cell}
    end

    def to_s
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