class DemoController < ApplicationController
  
  layout 'application'

  def index
  
  end

  def hello

  #render('index')
  @array = ['s','a','i','t','e','j']

 #@id=params['id'].to_i
 
 #@page=params[:page].to_i
  end

def other_hello
	redirect_to(:controller =>'demo', :action => 'index')
end

def facebook

	redirect_to("http://facebook.com")
end

def text_helpers
	
end

def escape_output
  
end

end
