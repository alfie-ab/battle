require 'sinatra/base'
require './lib/player'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:user_name_one])
    $player2 = Player.new(params[:user_name_two])
    redirect '/play'
  end

  get '/play' do
    @player_1_name = $player1.name
    @player_2_name = $player2.name
    erb(:play)
  end

  post '/attack' do
    @player_1_name = $player1.name
    @player_2_name = $player2.name
    $player2.reduce_hp_by(10)
    @player_2_hp = $player2.hp

    erb(:attack)
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
