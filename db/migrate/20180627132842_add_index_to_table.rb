class AddIndexToTable < ActiveRecord::Migration[5.2]
  def change
  	add_index :questions, :recipientA_id
  	add_index :questions, :recipientB_id
  end
end
