class CreateBacklogItems < ActiveRecord::Migration
  def change
    create_table :backlog_items do |t|
      t.string :title
      t.string :description
      t.integer :estimation
      t.integer :parent_id
      t.string :status
      t.string :item_type
	  t.string :info

      t.timestamps
    end
  end
end
