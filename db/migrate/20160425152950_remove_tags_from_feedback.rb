class RemoveTagsFromFeedback < ActiveRecord::Migration
  def change
    remove_column :feedbacks, :tags, :text
  end
end
