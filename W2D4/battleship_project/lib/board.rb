class Board
    attr_accessor :n 
    
    def initialize(n)
        
        @grid = Array.new(n) {Array.new(n)}
        @grid.each_with_index do |arr, i|
            arr.each_with_index do |x,y|
                @grid[i][y] = :N 
            end
        end
        @size = n*n
        @n = n
    end 

    def size 
        return @size 
    end 

    def [](arr) 
        row = arr[0]
        col = arr[1]
        @grid[row][col]
    end

    def []= (pos, val)
        row = pos[0]
        col = pos[1]
        @grid[row][col] = val 
    end  

    def num_ships 
        count = 0
        @grid.each_with_index do |arr, i|
            arr.each_with_index do |c,x|
                if c == :S  
                    count += 1
                end
            end
        end

        return count 
    end 

    def attack(pos)
        
        if self.[](pos) == :S 
            self.[]=(pos,:H)
            puts 'you sunk my battleship!'
            return true 
        else 
            self.[]=(pos,:X)
            return false 

        end
    end 

    def place_random_ships 
        e = @size/4
        until self.num_ships == e 
            self.[]=([Random.rand(n), Random.rand(n)], :S)
        end
      
    end

    def hidden_ships_grid ()
        # p '------'
        # print narr 
        # p @grid 
        # p narr == @grid 
        # 
        @grid.map.with_index do |arr,i|
                arr.map.with_index do |x,ii|
                    if @grid[i][ii] == :S
                        :N
                    else 
                        x
                    end
                end 
        end
    end 

   def self.print_grid(a2rr) # class method ::
    
        a2rr.each do |arr|
            puts arr.join (' ')
        end

    end 

    def cheat 
        Board.print_grid(@grid) # class method called on class literally! Board::class_method 
    end

    def print 
        Board.print_grid(self.hidden_ships_grid) # instance 
    end 

end
