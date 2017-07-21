class AddParks < ActiveRecord::Migration[5.1]
  def change
    create_table :parks do |t|
      t.column :name, :string
      t.column :description, :text
      t.column :state_park, :boolean
      t.column :national_park, :boolean

      t.timestamps
    end
  end
end
