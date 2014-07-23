class DashButtonsController < ApplicationController
  before_action :set_dash_button, only: [:show, :edit, :update, :destroy]

  # GET /dash_buttons
  # GET /dash_buttons.json
  def index
    @dash_buttons = DashButton.all
	
  end

  # GET /dash_buttons/1
  # GET /dash_buttons/1.json
  def show
  end

  # GET /dash_buttons/new
  def new
    @dash_button = DashButton.new
  end

  # GET /dash_buttons/1/edit
  def edit
  end

  # POST /dash_buttons
  # POST /dash_buttons.json
  def create
    @dash_button = DashButton.new(dash_button_params)

    respond_to do |format|
      if @dash_button.save
        format.html { redirect_to @dash_button, notice: 'Dash button was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dash_button }
      else
        format.html { render action: 'new' }
        format.json { render json: @dash_button.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dash_buttons/1
  # PATCH/PUT /dash_buttons/1.json
  def update
    respond_to do |format|
      if @dash_button.update(dash_button_params)
        format.html { redirect_to @dash_button, notice: 'Dash button was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dash_button.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dash_buttons/1
  # DELETE /dash_buttons/1.json
  def destroy
    @dash_button.destroy
    respond_to do |format|
      format.html { redirect_to dash_buttons_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dash_button
      @dash_button = DashButton.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dash_button_params
      params.require(:dash_button).permit(:btn_content, :btn_type, :permission)
    end
end
