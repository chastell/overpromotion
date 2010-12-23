module Overpromotion class MoveExecutor

  def initialize board
    @board = board
  end

  def execute player, from, to
    @player, @from, @to = player, from, to

    valid_move = MoveValidator.new(@board).valid_move? @player, @from, @to

    if valid_move
      move_stone
      activate_returning
      deactivate_regenerating
    end

    result = case
             when (not valid_move)   then :invalid
             when @board.monotonous? then :winning
             when regeneration?      then :regeneration
             else                         :successful
             end

    [@board, result]
  end

  private

  def activate_returning
    if (@player == :black and @to.first > 3) or
       (@player == :white and @to.first < 4)
      @board.stone_at(@to).activate
    end
  end

  def deactivate_regenerating
    @board.stone_at(@to).deactivate if regeneration?
  end

  def move_stone
    @board.place_at @to, @board.stone_at(@from)
    @board.place_at @from, nil
  end

  def regeneration?
    (@player == :black and @to.first == 0 and not @board.full_row?(7)) or
    (@player == :white and @to.first == 7 and not @board.full_row?(0))
  end

end end
