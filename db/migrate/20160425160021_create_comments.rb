class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :feedback, index: true, foreign_key: true
      t.text :message

      t.timestamps null: false
    end
  end
end
