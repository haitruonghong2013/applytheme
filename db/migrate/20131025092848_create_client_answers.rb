class CreateClientAnswers < ActiveRecord::Migration
  def change
    create_table :client_answers do |t|
      t.integer :client_id
      t.integer :question_id
      t.text :content

      t.timestamps
    end
  end
end
