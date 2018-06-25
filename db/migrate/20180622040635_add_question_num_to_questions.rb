class AddQuestionNumToQuestions < ActiveRecord::Migration[5.2]
  def change
    add_column :questions, :question_num, :integer
  end
end
