class NumbersController < ApplicationController

  def index
  		 generate_random_number if !session[:random_number].present?
  end
  def submit
  	flash[:message] = "You got it!"
  	flash[:status] = false

  	if params[:guess].present?
  		input_number = params[:guess].to_i
  		 if input_number > session[:random_number]
  		 	flash[:message] = "Too high"
  		 elsif input_number < session[:random_number]
  		 	flash[:message] = "Too Low"
  		 else
  		 	generate_random_number
  		 	flash[:status] = true
  		 end
  		 		
  		
  	
  	redirect_to action: 'index'
  end
  end
  def reset
  	session[:random_number] = rand(1..100)
  	redirect_to action: 'index'
  end
  private
  def generate_random_number
  	session[:random_number] = rand(1..100)
end
end
