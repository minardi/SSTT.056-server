class AppController < ApplicationController
	def main
		@user = current_user
		@priority_role = {
                          "techlead" => 1,
                          "developer" => 2,
                          "watcher" => 3
                      }
		@roles = {}
		@value_roles = {}
		@value_projects = {}
		@users_projects = []

		@user.team_members.each do |team_member|
			if team_member.role != 'null'

			@project_id = team_member.team.project_id
			@role = team_member.role

			if !(@value_roles.has_key?(@project_id)) || (@priority_role[@role] < @priority_role[@value_roles[@project_id]]) 
				@value_roles[@project_id] = @role
			end 

			@project = Project.find(params[:id] = @project_id)
			
			@project_new = {
				:id =>  @project.id,
				:title => @project.title,
				:description => @project.description,
				:owner => @project.owner,
				:start => @project.start,
				:finish => @project.finish,
				:role => @role,
				:pm => {
					:user_id => @project.pm,
					:first_name => User.where(["id = ?", @project.pm]).first.first_name,
					:last_name => User.where(["id == ?",@project.pm]).first.last_name
				}
			}
			@value_projects[@project_id] = @project_new.to_json

		end
      end   
      @roles = @value_roles.to_json   
	  @users_projects = @value_projects.values
    end
end
