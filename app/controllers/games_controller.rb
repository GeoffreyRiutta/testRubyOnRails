class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  def attack
    @game = Game.find(params[:game_id])
    @game.scrawl = ""
    if @game.hp < 1
      @game.scrawl = "Alas #{@game.name} is food for the crows"
      @game.save
    else
      attack_enemy
    end

    redirect_to @game
  end
  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def spawn_enemy
      @game.enemy_name = "goblin"
      @game.enemy_hp = 4
      @game.scrawl = "#{@game.scrawl}\nA #{@game.enemy_name} appears!"
      @game.save
    end

    def attack_enemy
      roll = 1+rand(6)
      if roll >= @game.enemy_hp
        @game.scrawl = "#{@game.scrawl}\n#{@game.name} slays #{@game.enemy_name} with #{roll} damage!"
        spawn_enemy
      else
        @game.scrawl = "#{@game.scrawl}\n#{@game.enemy_name} is hit for #{roll}!"
        @game.enemy_hp = @game.enemy_hp - roll
        @game.save
        attack_player
      end
    end

    def attack_player
      roll = 1+rand(3)
      if roll >= @game.hp
        @game.scrawl = "#{@game.scrawl}\nAlas the #{@game.enemy_name} slew #{@game.name}"
        @game.hp = 0
        @game.save
      else
        @game.scrawl = "#{@game.scrawl}\n#{@game.name} is hit for #{roll}!"
        @game.hp = @game.hp - roll
        @game.save
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :hp, :max_hp, :potion, :scrawl, :enemy_name, :enemy_hp)
    end
end
