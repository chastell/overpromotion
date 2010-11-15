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

    context '#play' do

      it 'makes Players take turns, with black first, until one gives up' do
        black, white = mock(Player), mock(Player)
        Player.should_receive(:new).twice.and_return(black, white)
        black.should_receive(:make_move).ordered.and_return([[6,0], [5,0]])
        white.should_receive(:make_move).ordered.and_return([[1,0], [2,0]])
        black.should_receive(:make_move).ordered.and_return([[6,1], [5,1]])
        white.should_receive(:make_move).ordered.and_return([[1,1], [2,1]])
        black.should_receive(:make_move).ordered.and_return(nil)
        Game.new(Player, Player).play
      end

    end

  end

end
