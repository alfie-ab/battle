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
    @game = $game
    erb(:play)
  end

  post '/switchplayers' do
    @game = $game
    @game.switch_players
    redirect '/play'
  end

  post '/attack' do
   @game = $game
   @game.attack
   if @game.continue? == true
      redirect '/game_over'
   else
     erb(:attack)
   end
  end

  get '/game_over' do
    erb(:game_over)
  end

  run! if app_file == $0
end
