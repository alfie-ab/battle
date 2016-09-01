require 'sinatra/base'
require './lib/player'
require './lib/game'

class Battle < Sinatra::Base
  enable :sessions

  get '/' do
    erb(:index)
  end

  post '/names' do
    $player1 = Player.new(params[:user_name_one])
    $player2 = Player.new(params[:user_name_two])
    $game = Game.new($player1, $player2)
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
    $game.attack
    @player_2_hp = $player2.hp
    erb(:attack)
  end

  run! if app_file == $0
end
