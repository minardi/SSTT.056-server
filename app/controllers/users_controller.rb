class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def get_all
    @team = Team.find(params[:id])
    @users = []
    team_ids = @team.team_members.map(&:user_id)

    @team.team_members.each do |team_member|
      @user_c = {
        :id =>  team_member.user.id,
        :first_name => team_member.user.first_name,
        :last_name => team_member.user.last_name,
        :role =>  team_member.role 
      }
      @users.push(@user_c)
    end

    User.find(:all, :conditions => ["id not in (?)", team_ids]).each do |user| 
      @user_c = {
        :id =>  user.id,
        :first_name => user.first_name,
        :last_name => user.last_name,
        :role =>  ""  
      }
      @users.push(@user_c)
    end

  end

 def get_team_members
    @team = Team.find(params[:id])
    @users = []
    
    @team.team_members.each do |team_member|
      @user_c = {
        :id =>  team_member.user.id,
        :first_name => team_member.user.first_name,
        :last_name => team_member.user.last_name,
        :role =>  team_member.role 
      }
      @users.push(@user_c)
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def get_roles
      @user = current_user
      @priority_role = {
                          "techlead" => 1,
                          "developer" => 2,
                          "watcher" => 3
                      }
      @roles = {}
      @value_roles = {}

      @user.team_members.each do |team_member|
        if team_member.role != 'null'

          @project_id = team_member.team.project_id
          @role = team_member.role

          if !(@value_roles.has_key?(@project_id)) || (@priority_role[@role] < @priority_role[@value_roles[@project_id]]) 
              @value_roles[@project_id] = @role
          end 

        end
      end
    @roles = {:roles => @value_roles}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name)
    end
end
