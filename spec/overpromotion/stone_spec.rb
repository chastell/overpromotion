module Overpromotion describe Stone do

  describe '#==' do

    it 'considers Stones of the same colour equal' do
      Stone.new(:black).should == Stone.new(:black)
    end

    it 'considers two Stones of a different colour inequal' do
      Stone.new(:black).should_not == Stone.new(:white)
    end

    it 'considers Stone activation as well' do
      Stone.new(:black).should_not        == Stone.new(:black).deactivate
      Stone.new(:black).deactivate.should == Stone.new(:black).deactivate
    end

  end

  describe '#activate' do

    it 'activates a Stone' do
      stone = Stone.new :black
      stone.deactivate
      stone.activate.should be_active
    end

  end

  describe '#active?' do

    it 'is a predicate whether a Stone is active' do
      Stone.new(:black).should be_active
    end

  end

  describe '#deactivate' do

    it 'deactivates a Stone' do
      Stone.new(:black).deactivate.should_not be_active
    end

  end

end end
