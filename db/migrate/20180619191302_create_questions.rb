class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.integer :donation_type
      t.integer :recipientA_id
      t.integer :recipientB_id

      t.timestamps
    end
    add_index :recipientA_id, :recipientB_id
  end
end
