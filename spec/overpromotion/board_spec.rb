# encoding: UTF-8

module Overpromotion

  describe Board do

    context '.new' do

      it 'sets the 8×8 Board up with Stones in the right positions' do
        board = Board.new
        black = Stone.new(:black)
        white = Stone.new(:white)
        board.rows.should == [
          [white, white, white, white, white, white, white, white],
          [white, white, white, white, white, white, white, white],
          [nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil],
          [nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil],
          [nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil],
          [nil,   nil,   nil,   nil,   nil,   nil,   nil,   nil],
          [black, black, black, black, black, black, black, black],
          [black, black, black, black, black, black, black, black],
        ]
      end

    end

  end

end
