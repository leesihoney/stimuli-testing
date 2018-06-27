class ChangeRecipientAIdToBeBigintInRecipients < ActiveRecord::Migration[5.2]
  def change
  	change_column :questions, :recipientA_id, :bigint
  	change_column :questions, :recipientB_id, :bigint
  end
end
