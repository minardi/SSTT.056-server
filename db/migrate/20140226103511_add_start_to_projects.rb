class AddStartToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :start, :string
  end
end
