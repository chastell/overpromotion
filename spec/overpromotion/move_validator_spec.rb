module Overpromotion

  describe MoveValidator do

    describe '#valid_move?' do

      it 'validates example moves from the relevant fixture' do
        YAML.load_file('spec/fixtures/move_validator.yml').each do |example|
          mv = MoveValidator.new(Board.from_s(example['board']))
          example['moves'].each do |move|
            player, from, to, valid = *move
            mv.valid_move?(player.to_sym, from, to).should == valid
          end
        end
      end

    end

  end

end
