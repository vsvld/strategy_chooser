class StrategiesController < ApplicationController
  before_action :get_company
  before_action :set_strategy, only: [:show, :edit, :update, :destroy]

  # GET /strategies
  # GET /strategies.json
  def index
    @strategies = @company.strategies
  end

  # GET /strategies/1
  # GET /strategies/1.json
  def show
  end

  # GET /strategies/new
  def new
    @strategy = @company.strategies.new
  end

  # GET /strategies/1/edit
  def edit
  end

  # POST /strategies
  # POST /strategies.json
  def create
    @strategy = @company.strategies.new(strategy_params)

    respond_to do |format|
      if @strategy.save
        format.html { redirect_to company_strategy_path(@company, @strategy), notice: 'Вітаємо! Стратегія успішно розроблена!' }
        format.json { render :show, status: :created, location: @strategy }
      else
        format.html { render :new }
        format.json { render json: @strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /strategies/1
  # PATCH/PUT /strategies/1.json
  def update
    respond_to do |format|
      if @strategy.update(strategy_params)
        format.html { redirect_to company_strategy_path(@company, @strategy), notice: 'Strategy was successfully updated.' }
        format.json { render :show, status: :ok, location: @strategy }
      else
        format.html { render :edit }
        format.json { render json: @strategy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /strategies/1
  # DELETE /strategies/1.json
  def destroy
    @strategy.destroy
    respond_to do |format|
      format.html { redirect_to company_strategies_url(@company), notice: 'Strategy was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def get_company
    @company = Company.find(params[:company_id])
  end

  def set_strategy
    @strategy = @company.strategies.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def strategy_params
    params.require(:strategy).permit(:strategy_model_id, :periods_group_id)
  end
end
