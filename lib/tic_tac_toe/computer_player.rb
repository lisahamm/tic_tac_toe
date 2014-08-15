module TicTacToe
  class ComputerPlayer < Player
    def comp_take_turn(board)
      cell =
        if board.all_empty?
          (1..9).to_a.sample
        else
          minimax(board, mark)
        end
      board.set_cell(cell, mark)
    end

    def opponent(player)
      player == 'X' ? 'O' : 'X'
    end

    def score(board, depth)
      if board.get_winning_mark == mark
        return 10 - depth
      elsif board.get_winning_mark == opponent(mark)
        return depth - 10
      else
        return 0
      end
    end

    def minimax(board, player, depth = 0)
      return score(board, depth) if board.over?
      scores = []
      moves = []
      opponent = opponent(player)

      board.empty_cells.each do |cell_number|
        new_board = board.dup
        new_board.set_cell(cell_number, player)
        scores.push minimax(new_board, opponent, depth + 1)
        moves.push cell_number
      end

      if depth.zero?
        get_max_score_and_move(scores, moves) [:move]
      elsif player == mark
        get_max_score_and_move(scores, moves) [:score]
      else
        get_min_score_and_move(scores, moves) [:score]
      end
    end

    def get_max_score_and_move(scores, moves)
      max_score_index = scores.each_with_index.max[1]
      {score: scores[max_score_index], move: moves[max_score_index]}
    end

    def get_min_score_and_move(scores, moves)
      min_score_index = scores.each_with_index.min[1]
      {score: scores[min_score_index], move: moves[min_score_index]}
    end
  end
end