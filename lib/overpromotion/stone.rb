module Overpromotion

  class Stone

    attr_reader :colour

    def initialize(colour)
      @colour = colour
    end

    def ==(other)
      colour == other.colour
    end

  end

end
