# encoding: UTF-8

module Overpromotion

  describe Board do

    context '.new' do

      it 'sets the 8×8 Board up with Stones in the right positions' do
        Board.new.to_s.should == '
          oooooooo
          oooooooo
          ........
          ........
          ........
          ........
          xxxxxxxx
          xxxxxxxx
        '.strip.tr(' ', '')
      end

    end

    context '.from_s' do

      it 'returns a Board built from the String representation' do
        smile = '
          ..oooo..
          .o....o.
          o.x..x.o
          o......o
          o.x..x.o
          o..xx..o
          .o....o.
          ..oooo..
        '.strip.tr(' ', '')
        Board.from_s(smile).to_s.should == smile
      end

    end

    context '#empty?' do

      it 'is a predicate whether a given Board field is empty' do
        Board.new.empty?(0,0).should be_false
        Board.new.empty?(7,7).should be_false
        Board.new.empty?(3,3).should be_true
      end

    end

    context '#stone_at' do

      it 'returns the Stone at the given Board field' do
        Board.new.stone_at(0,0).should == Stone.new(:white)
        Board.new.stone_at(7,7).should == Stone.new(:black)
        Board.new.stone_at(3,3).should == nil
      end

    end

    context '#to_s' do

      it 'returns a String representation of the Board' do
        Board.new.to_s.should == '
          oooooooo
          oooooooo
          ........
          ........
          ........
          ........
          xxxxxxxx
          xxxxxxxx
        '.strip.tr(' ', '')
      end

    end

  end

end
