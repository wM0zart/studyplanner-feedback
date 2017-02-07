class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.references :user, index: true, foreign_key: true
      t.string :typefeedback
      t.string :title
      t.text :description
      t.text :tags

      t.timestamps null: false
    end
  end
end
