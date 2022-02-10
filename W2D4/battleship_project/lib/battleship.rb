require_relative "board"
require_relative "player"

class Battleship
    attr_accessor :n 

    def initialize (n)
        @n = n
        @player = Player.new 
        Board::new(n)
        @board = Board.new(n*n)
        
        @remaining_misses = 5
    end

    def board 
        return @board 

    end

    def player 
        return @player 
    end

    def start_game
        @board.place_random_ships
        puts @board.num_ships
        # puts @board.print_grid
    end

    def lose?
        if @remaining_misses <= 0
            puts 'you lose'
            return true
        elsif @remaining_misses > 0
            return false 
        end
    end

    def win?
        if @board.num_ships == 0 
            puts 'you win'
            return true 
        else 
            return false
        end
    end

    def game_over? 
        if self.win? || self.lose?
            return true 
        end
        if @remaining_misses == 0
            return false 
        end
        if @board.attack 
            @remaining_misses -= 1
        end
    end

    def turn 
       narr = @player.get_move
       @board.attack(narr)
       puts @remaining_misses
        if @board.attack(narr)
            @remaining_misses -= 1
        end
        @board.print
    end
end
