module Overpromotion class MoveValidator

  def initialize board
    @board = board
  end

  def valid_move? player, from, to
    @player = player
    private_methods(false).grep(/^valid_move_/).all? do |method|
      send method, from, to
    end
  end

  private

  def valid_move_axes from, to
    [
      from.first == to.first,
      from.last  == to.last,
      (from.first - to.first).abs == (from.last - to.last).abs,
    ].any?
  end

  def valid_move_empty_fields_in_path from, to
    @board.fields_between(from, to).all? { |field| @board.empty? field }
  end

  def valid_move_in_board from, to
    [from, to].flatten.all? { |coord| coord.between? 0, 7 }
  end

  def valid_move_in_place from, to
    from != to
  end

  def valid_move_no_capturing_of_own_stones from, to
    @board.empty? to or @board.stone_at(to).colour != @player
  end

  def valid_move_stone_exists from, to
    not @board.empty? from
  end

  def valid_move_stone_owned from, to
    @board.stone_at(from).colour == @player
  end

end end
