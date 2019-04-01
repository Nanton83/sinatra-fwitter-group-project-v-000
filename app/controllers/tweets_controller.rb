class TweetsController < ApplicationController
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }

    get '/tweets' do
        if logged_in?
        erb :'tweets/tweets'
        else
            redirect to "/login"
        end
    end

    get '/tweets/new' do
        if logged_in?
        erb :'tweets/new'
        else
            redirect to "/login"
        end
    end 

    get '/tweets/:id' do
        if logged_in?
            @tweets = @current_user.tweets
        erb :'user/show'
        binding.pry
        else
            redirect to "/login"
        end
    end


end
