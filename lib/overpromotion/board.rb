module Overpromotion

  class Board

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
      board.instance_variable_get(:@rows).replace(rows)
      board
    end

    def empty?(row, column)
      @rows[row][column].nil?
    end

    def fields_between(from, to)
      case
      when from == to
        rows = [from.first]
        cols = [from.last]
      when from.first == to.first
        cols = from.last.step(to.last, to.last <=> from.last).to_a
        rows = [from.first] * cols.size
      when from.last == to.last
        rows = from.first.step(to.first, to.first <=> from.first).to_a
        cols = [from.last] * rows.size
      else
        rows = from.first.step(to.first, to.first <=> from.first).to_a
        cols = from.last.step(to.last, to.last <=> from.last).to_a
      end
      rows.zip(cols) - [from, to]
    end

    def stone_at(row, column)
      @rows[row][column]
    end

    def to_s
      @rows.map do |row|
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
