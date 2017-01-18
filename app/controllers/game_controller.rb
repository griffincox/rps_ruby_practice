class GameController < ApplicationController
  def rps
    @user_move = params[:the_move] # string output

    # randomly pick a number 0, 1, or 2, and assign @computer_move paper, scissors, or rock respectively
    random_move = rand(3)
    if random_move == 2
      @computer_move = "rock"
    elsif random_move == 1
      @computer_move = "scissors"
    elsif random_move == 0
      @computer_move = "paper"
    end

    # compare @user_move and @computer_move and change result_message accordingly
    if @user_move == "rock"
        if @computer_move == "rock"
          result_message = "tied!"
        elsif @computer_move == "scissors"
          result_message = "win!"
        elsif @computer_move == "paper"
          result_message = "lose! Try again"
        end
    elsif @user_move == "scissors"
      if @computer_move == "rock"
        result_message = "lose! Try again"
      elsif @computer_move == "scissors"
        result_message = "tied!"
      elsif @computer_move == "paper"
        result_message = "win!"
      end
    elsif @user_move == "paper"
      if @computer_move == "rock"
        result_message = "win!"
      elsif @computer_move == "scissors"
        result_message = "lose! Try again"
      elsif @computer_move == "paper"
        result_message = "tied!"
      end
    end

    #set @result to the result_message
    @result = result_message

    render("rps.html.erb")
  end
end
