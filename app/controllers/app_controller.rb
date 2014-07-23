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

      @user.team_members.each do |team_member|
        if team_member.role != 'null'

          @project_id = team_member.team.project_id
          @role = team_member.role

          if !(@value_roles.has_key?(@project_id)) || (@priority_role[@role] < @priority_role[@value_roles[@project_id]]) 
              @value_roles[@project_id] = @role
          end 

        end
      end   
      @roles = @value_roles.to_json   
    end
end
