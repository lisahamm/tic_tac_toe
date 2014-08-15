module TicTacToe
  class Cell
    attr_accessor :value

    def empty?
      value.nil?
    end

    def to_s
      if empty?
        ' '
      else
        value
      end
    end
  end
end