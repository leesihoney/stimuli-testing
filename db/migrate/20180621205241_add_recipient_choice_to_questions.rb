class AddRecipientChoiceToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :recipient_choice, :string
  end
end
