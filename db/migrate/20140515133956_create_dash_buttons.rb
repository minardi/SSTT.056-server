class CreateDashButtons < ActiveRecord::Migration
  def change
    create_table :dash_buttons do |t|
      t.string :btn_content
      t.string :btn_type
      t.string :permission

      t.timestamps
    end
  end
end
