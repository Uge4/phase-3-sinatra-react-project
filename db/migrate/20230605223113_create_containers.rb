class CreateContainers < ActiveRecord::Migration[6.1]
  def change
    create_table :containers do |t|
      t.string :name
      t.string :domain_name
      t.timestamps
    end
  end
end
