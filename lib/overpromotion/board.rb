module Overpromotion

  class Board

    attr_reader :rows

    def initialize
      @rows = Array.new(8)
      @rows.each_index do |i|
        @rows[i] = []
        case i
        when 0, 1 then 8.times { @rows[i] << Stone.new(:white) }
        when 6, 7 then 8.times { @rows[i] << Stone.new(:black) }
        else           8.times { @rows[i] << nil }
        end
      end
    end

  end

end
