class AddFinishToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :finish, :string
  end
end
