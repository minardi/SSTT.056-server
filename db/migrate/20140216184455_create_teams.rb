class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.integer :project_id

      t.timestamps
    end
  end
end
