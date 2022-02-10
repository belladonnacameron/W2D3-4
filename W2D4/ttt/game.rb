#game.rb
require_relative 'board'
require_relative 'human_player'
# The Game class will be the main class that houses the instances of Board and HumanPlayer required for gameplay. 
# It will be responsible for passing data between the board and players. It will also serve to contain the main game loop.

# Be sure to require your board.rb and human_player.rb files into game.rb.

# Game#initialize(player_1_mark, player_2_mark)
# An instance of Game should have instance variables for player one, player two, and the board.
#  Design the #initialize method to accept the mark values to be used for the players.

# You should also initialize an instance variable to contain the current player. By default, player one should begin as the current player.

# Game#switch_turn
# This method should set the current player to the other player. Calling this method repeatedly should switch the current player back and 
# forth between the two players.

# This method is critical for gameplay so be sure to test it in pry. Here is how our switching mechanic performs:

class Game 
    attr_accessor :player_1_mark, :player_2_mark

    def initialize(player_1_mark, player_2_mark)
        @player_1 = Human_Player.new(player_1_mark)
        @player_2  = Human_Player.new(player_2_mark)
        @p1_mark = player_1_mark
        @p2_mark = player_2_mark
        @current_mark = player_1_mark 
        @current_player = @player_1
        puts "Lets play...."
        @board = Board.new 
    end 

    def switch_turn
        if @current_player == @player_1
            @current_player = @player_2
            @current_mark = @player_2_mark
        else
            @current_player = @player_1
            @current_mark = @player_1_mark
        end
    end

    #     Game#play
# This method will contain the main game loop. Here is some psuedocode for the loop:

# while there exists empty positions on the board 1
# print the board 2
# get a position from the current player 3
# place their mark at that position of the board 4
# check if that user has won 5
# if they win, print out a 'victory' message saying who won and return to end the game
# otherwise they did not win, so switch turns
# if we finish the while loop without returning, that means there are no more empty positions on the board and noone has won, so print a 'draw' message
# Test your game in pry. Play a few games by creating an instance of Game and invoking #play on it. After a game is over, 
# be sure to create a new instance of Game to play again, this is the only way to get a fresh board. Some scenarios to test are: player one winning, 
# player two winning, and a draw.

# If any errors are raised during gameplay, your game loop and #play method will end immediately, so you'll have to start a new game and retry!
        
    def play 
        while @board.empty_position? #1
            @board.print #2
            
            i_g = gets.chomp.to_i
            @current_player.get_position(i_g) #3 
            @board.place_mark(i_g, @current_mark) #4
            if @board.win?(@current_mark)
                #5
                puts "victory" + @current_player.to_s #5
            else 
                puts 'you did not win' #6
                self.switch_turn 
            end

        end
        puts 'draw'

    end 

end 