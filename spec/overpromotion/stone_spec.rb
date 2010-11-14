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

  end

end
