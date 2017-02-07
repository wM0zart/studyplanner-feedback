class FeedbackTag < ActiveRecord::Base
	belongs_to :feedback
	belongs_to :tag
end