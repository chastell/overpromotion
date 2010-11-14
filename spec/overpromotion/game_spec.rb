module Overpromotion

  describe Game do

    context '.new' do

      it 'creates a new Board' do
        Board.should_receive :new
        Game.new
      end

    end

  end

end
