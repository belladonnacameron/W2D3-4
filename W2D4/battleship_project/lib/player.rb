class Player

    def get_move
        puts "enter a position with coordinates separated with a space like '4 7'"
        inp = gets.chomp 
        i1 = inp[0]
        i2 = inp[2]
        narr = []
        narr << i1.to_i
        narr << i2.to_i

        return narr 
    end

    def board 
        return @board 
    end 



    
end
