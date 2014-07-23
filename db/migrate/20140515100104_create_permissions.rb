class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.text :allowed_for
      t.text :denied_for
      t.references :dash_button, index: true

      t.timestamps
    end
  end
end
