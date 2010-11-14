module Overpromotion

  class Board

    attr_reader :rows

    def initialize
      @rows = []
      2.times { @rows << Array.new(8) { Stone.new(:white) } }
      4.times { @rows << Array.new(8)                       }
      2.times { @rows << Array.new(8) { Stone.new(:black) } }
    end

  end

end
