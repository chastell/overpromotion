module Overpromotion

  describe Game do

    context '.new' do

      it 'creates a new Board and two Players' do
        board = mock Board
        Board.should_receive(:new).and_return(board)
        Player.should_receive(:new).with(board).twice
        Game.new(Player, Player)
      end

    end

  end

end
