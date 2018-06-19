class CreateRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipients do |t|
      t.belongs_to :question
      t.integer :organization_size
      t.integer :food_access
      t.integer :income_level
      t.integer :poverty_level
      t.integer :last_donation
      t.integer :total_donation
      t.integer :travel_time

      t.timestamps
    end
  end
end
