module Overpromotion

  class Board

    attr_reader :rows

    def initialize
      @rows = []
      2.times { @rows << Array.new(8) { Stone.new(:white) } }
      4.times { @rows << Array.new(8)                       }
      2.times { @rows << Array.new(8) { Stone.new(:black) } }
    end

    def self.from_s(string)
      rows = string.split("\n").map do |line|
        line.split('').map do |field|
          case field
          when '.' then nil
          when 'x' then Stone.new(:black)
          when 'o' then Stone.new(:white)
          end
        end
      end
      board = Board.new
      board.rows.replace(rows)
      board
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
