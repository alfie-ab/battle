require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  get '/play' do
    @user_name_one = session['user_name_one']
    @user_name_two = session['user_name_two']
    erb(:play)
  end

  post '/names' do
    session['user_name_one'] = params[:user_name_one]
    session['user_name_two'] = params[:user_name_two]
    redirect '/play'
  end

  post '/attack' do
    @user_name_one = session['user_name_one']
    @user_name_two = session['user_name_two']
    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
