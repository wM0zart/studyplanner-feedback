class CreateTypeFeedbacks < ActiveRecord::Migration
  def change
    create_table :type_feedbacks do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
