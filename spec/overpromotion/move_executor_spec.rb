module Overpromotion

  describe MoveExecutor do

    context '#execute' do

      it 'executes example moves from the relevant fixture' do
        YAML.load_file('spec/fixtures/move_executor.yml').each do |example|
          me = MoveExecutor.new(Board.from_s(example['before']))
          player, from, to, expected = *example['move']
          after, result = *me.execute(player.to_sym, from, to)
          after.to_s.should == Board.from_s(example['after']).to_s
          result.should == expected.to_sym
        end
      end

    end

  end

end
