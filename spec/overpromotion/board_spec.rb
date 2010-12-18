# encoding: UTF-8

module Overpromotion

  describe Board do

    describe '.new' do

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

    describe '.from_s' do

      it 'returns a Board built from the String representation' do
        smile = '
          ..oooo..
          .o....o.
          o.X..X.o
          o......o
          o.x..x.o
          o..xx..o
          .o....o.
          ..OOOO..
        '
        Board.from_s(smile).to_s.should == smile.strip.tr(' ', '')
        marked = '
            01234567
          0 ..oooo..
          1 .o....o.
          2 o.X..X.o
          3 o......o
          4 o.x..x.o
          5 o..xx..o
          6 .o....o.
          7 ..OOOO..
        '
        Board.from_s(marked).to_s.should == smile.strip.tr(' ', '')
      end

    end

    describe '#empty?' do

      it 'is a predicate whether a given Board field is empty' do
        Board.new.empty?([0,0]).should be_false
        Board.new.empty?([7,7]).should be_false
        Board.new.empty?([3,3]).should be_true
      end

    end

    describe '#empty_fields' do

      it 'returns fields that are empty in the given row' do
        Board.new.empty_fields(0).should == []
        Board.new.empty_fields(2).should == (0..7).map { |col| [2, col] }
        exemplary = Board.from_s('
          o.o.o.o.
          .x.x.x.x
          ..oo..OO
          xx..XX..
          ........
          xxxXXxxx
          ........
          ........
        ')
        exemplary.empty_fields(0).should == [[0,1], [0,3], [0,5], [0,7]]
        exemplary.empty_fields(1).should == [[1,0], [1,2], [1,4], [1,6]]
        exemplary.empty_fields(2).should == [[2,0], [2,1], [2,4], [2,5]]
        exemplary.empty_fields(3).should == [[3,2], [3,3], [3,6], [3,7]]
      end

    end

    describe '#fields_between' do

      it 'returns an Array of fields between the two given fields' do
        Board.new.fields_between([3,4], [3,4]).should == []
        Board.new.fields_between([3,4], [2,5]).should == []
        Board.new.fields_between([3,4], [0,7]).should == [[2,5], [1,6]]
        Board.new.fields_between([3,4], [5,2]).should == [[4,3]]
        Board.new.fields_between([3,4], [7,0]).should == [[4,3], [5,2], [6,1]]
        Board.new.fields_between([3,4], [0,4]).should == [[2,4], [1,4]]
        Board.new.fields_between([3,4], [5,4]).should == [[4,4]]
        Board.new.fields_between([3,4], [3,0]).should == [[3,3], [3,2], [3,1]]
        Board.new.fields_between([3,4], [3,6]).should == [[3,5]]
      end

    end

    describe '#full_row?' do

      it 'is a predicate whether a given row is full' do
        Board.new.full_row?(0).should be_true
        Board.new.full_row?(2).should be_false
        Board.new.full_row?(7).should be_true
        exemplary = Board.from_s('
          oooooooo
          oooOOooo
          xxxXXxxx
          xxxxxxxx
          oo.ooooo
          oo.Ooooo
          xx.Xxxxx
          xx.xxxxx
        ')
        (0..3).each { |row| exemplary.full_row?(row).should be_true  }
        (4..7).each { |row| exemplary.full_row?(row).should be_false }
      end

    end

    describe '#monotonous?' do

      it 'is a predicate whether all Stones (if any) are of the same colour' do
        Board.new.should_not be_monotonous
        Board.from_s('
          oooOOooo
          oooooooo
          ........
          ........
          ........
          ........
          ........
          ........
        ').should be_monotonous
        Board.from_s('
          ........
          ........
          ........
          ........
          ........
          ........
          xxxxxxxx
          xxxXXxxx
        ').should be_monotonous
        Board.from_s('
          ........
          ........
          ........
          ........
          ........
          ........
          ........
          ........
        ').should be_monotonous
      end

    end

    describe '#place_at' do

      it 'puts the passed Stone at the given field (or clears it with nil)' do
        drop = Board.new
        drop.stone_at([3,3]).should == nil
        drop.place_at([3,3], Stone.new(:black))
        drop.stone_at([3,3]).should == Stone.new(:black)
        clear = Board.new
        clear.stone_at([0,0]).should == Stone.new(:white)
        clear.place_at([0,0], nil)
        clear.stone_at([0,0]).should == nil
      end

    end

    describe '#stone_at' do

      it 'returns the Stone at the given Board field' do
        Board.new.stone_at([0,0]).should == Stone.new(:white)
        Board.new.stone_at([7,7]).should == Stone.new(:black)
        Board.new.stone_at([3,3]).should == nil
      end

    end

    describe '#to_s' do

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
