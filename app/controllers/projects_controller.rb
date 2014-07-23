class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render action: 'show', status: :created, location: @project }
      else
        format.html { render action: 'new' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end

  def get_projects
      @user = User.find(params[:id])

      @proj = []
      @roles = {}
      @priority_role = {
                          "techlead" => 1,
                          "developer" => 2,
                          "watcher" => 3
                      }    

      @user.team_members.each do |team_member|
        if team_member.role != 'null'
          @project_id = team_member.team.project_id
          @role = team_member.role

          if !(@roles.has_key?(@project_id)) || (@priority_role[@role] < @priority_role[@roles[@project_id]]) 
              @roles[@project_id] = @role
          end 
        end
      end

      @projects = @user.team_members.each do |team_member| 
      if team_member.role != 'null'
        @proj_id = team_member.team.project_id
        @project = Project.find(params[:id] = @proj_id)

        @project_new = {
          :id =>  @project.id,
          :title => @project.title,
          :description => @project.description,
          :owner => @project.owner,
          :start => @project.start,
          :finish => @project.finish,
          :role => @roles[@proj_id],
          :pm => { 
            :user_id => @project.pm,
            :first_name => User.where(["id = ?", @project.pm]).first.first_name,
            :last_name => User.where(["id == ?",@project.pm]).first.last_name
          }
        }
        @proj.push(@project_new)
      end
    end
  end

  def get_project_info
      @user = User.find(params[:id])

      @projects = @user.team_members.each do |team_member| 
       if team_member.role != 'null'
          @proj_id = team_member.team.project_id
          @project = Project.find(params[:id] = @proj_id)
                    
          @project_new = {
            :id =>  @project.id,
            :title => @project.title,
            :description => @project.description,
            :owner => @project.owner,
            :start => @project.start,
            :finish => @project.finish,
            :role => team_member.role,
            :pm => { 
              :user_id => @project.pm,
              :first_name => User.where(["id = ?", @project.pm]).first.first_name,
              :last_name => User.where(["id == ?",@project.pm]).first.last_name
            }
          }
          return @project_new
        end
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:title, :description)
    end
end
