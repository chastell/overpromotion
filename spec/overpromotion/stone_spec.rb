module Overpromotion

  describe Stone do

    context '#==' do

      it 'considers Stones of the same colour equal' do
        Stone.new(:black).should == Stone.new(:black)
      end

      it 'considers two Stones of a different colour inequal' do
        Stone.new(:black).should_not == Stone.new(:white)
      end

    end

    context '#active?' do

      it 'is a predicate whether a Stone is active' do
        Stone.new(:black).should be_active
      end

    end

    context '#deactivate!' do

      it 'deactivates a Stone' do
        Stone.new(:black).deactivate!.should_not be_active
      end

    end

  end

end
