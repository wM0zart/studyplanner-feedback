class CreateFeedbackTags < ActiveRecord::Migration
  def change
    create_table :feedback_tags do |t|
    	t.integer :feedback_id
    	t.integer :tag_id
    end
  end
end
