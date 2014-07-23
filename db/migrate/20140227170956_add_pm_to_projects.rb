class AddPmToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :pm, :string
  end
end
