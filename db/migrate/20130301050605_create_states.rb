class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :country_id
      t.string :name
      t.integer :ranking

      t.timestamps
    end
  end
end
