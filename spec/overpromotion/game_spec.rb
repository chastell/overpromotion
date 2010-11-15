module Overpromotion

  describe Game do

    context '.new' do

      it 'creates a new Board and two Players (from provided classes)' do
        Board.should_receive(:new)
        Player.should_receive(:new).twice
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

      it 'makes Players take turns, until MoveExecutor makes one win' do
        black, white = mock(Player), mock(Player)
        Player.should_receive(:new).twice.and_return(black, white)
        black.should_receive(:make_move).ordered.and_return([[6,0], [5,0]])
        white.should_receive(:make_move).ordered.and_return([[1,0], [2,0]])
        black.should_receive(:make_move).ordered.and_return([[6,1], [5,1]])
        executor = mock(MoveExecutor)
        MoveExecutor.should_receive(:new).exactly(3).times.and_return(executor)
        executor.should_receive(:execute).with(:black, [6,0], [5,0]).ordered
          .and_return([mock(Board), :successful])
        executor.should_receive(:execute).with(:white, [1,0], [2,0]).ordered
          .and_return([mock(Board), :successful])
        executor.should_receive(:execute).with(:black, [6,1], [5,1]).ordered
          .and_return([mock(Board), :winning])
        Game.new(Player, Player).play
      end

      it 'passes the Board to each Player and MoveExecutor' do
        board = mock(Board)
        Board.should_receive(:new).and_return(board)
        black, white = mock(Player), mock(Player)
        Player.should_receive(:new).with(board).twice.and_return(black, white)
        black.should_receive(:make_move).with(board).and_return([[6,0], [5,0]])
        white.should_receive(:make_move).with(board).and_return([[1,0], [2,0]])
        black.should_receive(:make_move).with(board).and_return(nil)
        executor = mock(MoveExecutor, execute: [board, :successful])
        MoveExecutor.should_receive(:new).with(board).twice.and_return(executor)
        Game.new(Player, Player).play
      end

    end

  end

end
