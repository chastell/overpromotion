module Overpromotion

  class Stone

    attr_reader :colour

    def initialize(colour)
      @colour = colour
      @active = true
    end

    def ==(other)
      colour == other.colour
    end

    def active?
      @active
    end

  end

end
