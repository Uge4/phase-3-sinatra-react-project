class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.string :type_tag
      t.integer :container_id
      t.timestamps 
    end
  end
end
