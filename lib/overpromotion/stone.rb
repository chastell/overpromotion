module Overpromotion

  class Stone

    attr_reader :colour

    def initialize(colour)
      @colour = colour
      @active = true
    end

    def ==(other)
      colour == other.colour and active? == other.active?
    end

    def activate
      @active = true
      self
    end

    def active?
      @active
    end

    def deactivate
      @active = false
      self
    end

  end

end
