module Overpromotion describe Game do

  describe '.new' do

    it 'creates a new Board and two Players (from provided classes)' do
      Board.should_receive :new
      Player.should_receive(:new).twice
      Game.new Player, Player
    end

    it 'falls defaults to Player if no classes are provided' do
      Player.should_receive(:new).twice
      Game.new
    end

  end

  describe '#play' do

    before do
      @black, @white = mock(Player), mock(Player)
      Player.should_receive(:new).twice.and_return @black, @white
    end

    after do
      Game.new(Player, Player).play
    end

    it 'makes Players take turns, with black first, until one gives up' do
      @black.should_receive(:make_move).ordered.and_return [[6,0], [5,0]]
      @white.should_receive(:make_move).ordered.and_return [[1,0], [2,0]]
      @black.should_receive(:make_move).ordered.and_return [[6,1], [5,1]]
      @white.should_receive(:make_move).ordered.and_return [[1,1], [2,1]]
      @black.should_receive(:make_move).ordered.and_return nil
    end

    it 'makes Players take turns, until MoveExecutor makes one win' do
      @black.should_receive(:make_move).ordered.and_return [[6,0], [5,0]]
      @white.should_receive(:make_move).ordered.and_return [[1,0], [2,0]]
      @black.should_receive(:make_move).ordered.and_return [[6,1], [5,1]]
      executor = mock MoveExecutor
      MoveExecutor.should_receive(:new).exactly(3).times.and_return executor
      executor.should_receive(:execute).with(:black, [6,0], [5,0]).ordered.and_return [mock(Board), :successful]
      executor.should_receive(:execute).with(:white, [1,0], [2,0]).ordered.and_return [mock(Board), :successful]
      executor.should_receive(:execute).with(:black, [6,1], [5,1]).ordered.and_return [mock(Board), :winning]
    end

    it 'passes the Board to each Player and MoveExecutor' do
      board = mock Board
      Board.should_receive(:new).and_return board
      @black.should_receive(:make_move).with(board).and_return [[6,0], [5,0]]
      @white.should_receive(:make_move).with(board).and_return [[1,0], [2,0]]
      @black.should_receive(:make_move).with(board).and_return nil
      executor = mock MoveExecutor, execute: [board, :successful]
      MoveExecutor.should_receive(:new).with(board).twice.and_return executor
    end

    it 'forces a given Player to redo invalid moves' do
      @black.should_receive(:make_move).ordered.and_return [[3,3], [3,3]]
      @black.should_receive(:make_move).ordered.and_return [[3,3], [3,3]]
      @black.should_receive(:make_move).ordered.and_return [[6,0], [5,0]]
      @white.should_receive(:make_move).ordered.and_return [[3,3], [3,3]]
      @white.should_receive(:make_move).ordered.and_return [[1,0], [2,0]]
      @black.should_receive(:make_move).ordered.and_return [[3,3], [3,3]]
      @black.should_receive(:make_move).ordered.and_return nil
    end

    it 'gives the relevant Player an option to regenerate (if possible)' do
      executor = mock MoveExecutor
      MoveExecutor.should_receive(:new).twice.and_return executor
      @black.should_receive(:make_move).and_return [[6,0], [5,0]]
      executor.should_receive(:execute).and_return [mock(Board), :successful]
      board = mock Board
      @white.should_receive(:make_move).and_return [[1,0], [2,0]]
      executor.should_receive(:execute).and_return [board, :regeneration]
      board.should_receive(:empty_fields).with(0).and_return [[0,1], [0,3]]
      @white.should_receive(:regenerate?).with([[0,1], [0,3]]).and_return [0,3]
      board.should_receive(:place_at).with [0,3], Stone.new(:white)
      @black.should_receive(:make_move).and_return nil
    end

  end

end end
