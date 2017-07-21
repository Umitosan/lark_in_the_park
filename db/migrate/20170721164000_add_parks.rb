class AddParks < ActiveRecord::Migration[5.1]
  def change
    create_table :parks do |t|
      t.column :name, :string
      t.column :description, :string
      t.column :national_park, :boolean, default: false
      t.column :state_id, :integer

      t.timestamps
    end
  end
end
