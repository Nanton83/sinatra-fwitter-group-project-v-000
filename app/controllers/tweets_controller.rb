class TweetsController < ApplicationController
    set :session_secret, "my_application_secret"
    set :views, Proc.new { File.join(root, "../views/") }

    get '/tweets' do
        if logged_in?
        @tweets = Tweet.all
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

    post '/tweets' do
        if logged_in? && params[:content] == ""
            redirect to '/tweets/new'
        elsif logged_in?
        @tweet = params[:content]
        redirect to '/tweets/tweets'
        else
        redirect to "/login"
        end
    end
 

    get '/tweets/:id' do
        if logged_in?
            @tweet = Tweet.find_by_id(params[:id])
        erb :'tweets/show_tweet'
        else
            redirect to "/login"
        end
    end


end
