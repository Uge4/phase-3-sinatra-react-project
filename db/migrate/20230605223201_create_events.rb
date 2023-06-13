class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :trigger_name
      t.string :event_name
      t.string :type_event
      t.integer :container_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
