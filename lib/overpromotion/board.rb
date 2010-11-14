module Overpromotion

  class Board

    attr_reader :rows

    def initialize
      @rows = []
      2.times { @rows << Array.new(8) { Stone.new(:white) } }
      4.times { @rows << Array.new(8)                       }
      2.times { @rows << Array.new(8) { Stone.new(:black) } }
    end

    def to_s
      rows.map do |row|
        row.map do |field|
          case field
          when nil               then '.'
          when Stone.new(:black) then 'x'
          when Stone.new(:white) then 'o'
          end
        end.join
      end.join("\n")
    end

  end

end
