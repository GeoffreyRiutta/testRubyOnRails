class RpGsController < ApplicationController
  before_action :set_rpg, only: [:show, :edit, :update, :destroy]

  # GET /rpgs
  # GET /rpgs.json
  def index
    @rpgs = Rpg.all
  end

  # GET /rpgs/1
  # GET /rpgs/1.json
  def show
  end

  # GET /rpgs/new
  def new
    @rpg = Rpg.new
  end

  # GET /rpgs/1/edit
  def edit
  end

  # POST /rpgs
  # POST /rpgs.json
  def create
    @rpg = Rpg.new(rpg_params)

    respond_to do |format|
      if @rpg.save
        format.html { redirect_to @rpg, notice: 'Rpg was successfully created.' }
        format.json { render :show, status: :created, location: @rpg }
      else
        format.html { render :new }
        format.json { render json: @rpg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rpgs/1
  # PATCH/PUT /rpgs/1.json
  def update
    respond_to do |format|
      if @rpg.update(rpg_params)
        format.html { redirect_to @rpg, notice: 'Rpg was successfully updated.' }
        format.json { render :show, status: :ok, location: @rpg }
      else
        format.html { render :edit }
        format.json { render json: @rpg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rpgs/1
  # DELETE /rpgs/1.json
  def destroy
    @rpg.destroy
    respond_to do |format|
      format.html { redirect_to rpgs_url, notice: 'Rpg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rpg
      @rpg = Rpg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rpg_params
      params.require(:rpg).permit(:name, :hp, :max_hp, :potion, :scrawl, :enemy_name, :enemy_hp)
    end
end
