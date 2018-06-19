class CreateUserQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_questions do |t|
      t.string :recipient_choice, default: nil
      t.integer :question_num

      t.timestamps
    end
  end
end
