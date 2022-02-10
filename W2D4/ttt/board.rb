#tictactoe
# is responsible for adding a player's marks, checking for winners, and printing the game board. 
# A board instance must have an attribute to represent the grid. For simplicity, give the grid 
# the dimensions of classic tic-tac-toe, 3x3.

class Board 
    def initialize 
        @grid = 
        [
            ['_','_','_'], #00, 01, 02
            ['_','_','_'], #10, 11, 12
            ['_','_','_']  #20, 21, 22

        ]
    end

    def valid (position)
        x = position[0]
        y = position[1]
        if y <= 2 && x <= 2
            return true 
        else
            return false
        end 
    end 

    def empty?(position)
        if @grid[position[0].to_i][position[1].to_i] == '_'
            return true 
        else
            return false 
        end 
    end

    def place_mark(position, mark)
        x = position[0]
        y = position[1]
        if self.valid(position) and self.empty?(position)
            @grid[x][y]= mark 
        else 
            raise "Error 1: Invalid position or the grid is full."
            
         end
    end 

    #This method should simply print out the board and all of the marks that have been placed on it. 
    # Feel free to style the printing as much as you'd like, but be sure to print out each row of the board on a new line. 
    # This will help us visualize the board better as we debug or even play the game!
    def print 
        @grid.each do |row|
            
            puts row.to_s 
            puts ''
            
        end
    end

    def win_row?(mark)
        if @grid[0][0]==mark and @grid[0][1]==mark and @grid[0][2]==mark
            return true 
        elsif @grid[1][0]==mark and @grid[1][1]==mark and @grid[1][2]==mark
            return true 
        elsif @grid[2][0]==mark and @grid[2][1]==mark and @grid[2][2]==mark
            return true 
        else
            return false
        end 
    end

    def win_col?(mark)
        if @grid[0][0]==mark and @grid[1][0]==mark and @grid[2][0]==mark
            return true 
        elsif @grid[0][1]==mark and @grid[1][1]==mark and @grid[2][1]==mark
            return true 
        elsif @grid[2][0]==mark and @grid[2][1]==mark and @grid[2][2]==mark
            return true 
        else 
            return false 
        end
    end

    def win_diag?(mark)
        if @grid[0][0]==mark and @grid[1][1]==mark and @grid[2][2]==mark
            return true 
        elsif @grid[2][0]==mark and @grid[1][1]==mark and @grid[0][2]==mark
            return true 
        else 
            return false 
        end 
    end

    def win?(mark)
        if win_col?(mark) or win_diag?(mark) or win_row?(mark)
            return true 
        else 
            return false 
        end 
    end 


    def empty_position?
        @grid.each do |ele|
            ele.each do |x|
                if x == '_'
                    return true 
                end
            end
        end
        return false 
    end


end


