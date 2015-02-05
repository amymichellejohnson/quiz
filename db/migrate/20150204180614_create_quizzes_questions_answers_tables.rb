class CreateQuizzesQuestionsAnswersTables < ActiveRecord::Migration
  def change

    create_table :quizzes do |t|
      t.string :name
      t.timestamps null:false
    end

    create_table :questions do |t|
      t.string :question
      t.integer :quiz_id
      t.timestamps null:false
    end

    create_table :answers do |t|
      t.string :answer
      t.integer :question_id
      t.boolean :correct
      t.boolean :chosen
      t.timestamps null:false
    end

  end
end
