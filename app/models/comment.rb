class Comment < ActiveRecord::Base
	# Связь один-к-одному, т.е. у одного комментария может быть только один автор
	belongs_to :user
	# Связь один-к-одному, т.е. один комментарий может быть добавлен только к одному отзву
	belongs_to :feedback
	# Валидация данных. 
	# Содержимое комментария не менее 5 символов и не более 140
	validates :description, presence: true,length: { minimum: 5, maximum: 140 }
end