class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        if params[:username].empty? || params[:email].empty?
            erb :'users/signup'
        else
            user = User.create(params)
            session[:user_id] = user.id
            redirect '/posts'
        end
        
    end

    get '/login' do 
        erb :'users/login'
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
           redirect '/posts'
        else
            redirect '/login'
        end
    end

    get '/logout' do
        session.clear
        redirect '/'
    end


    # get '/users/dash' do
    #     erb :'users/dashboard'
    # end 
end