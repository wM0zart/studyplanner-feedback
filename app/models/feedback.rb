class Feedback < ActiveRecord::Base
	# Связь один-к-одному, т.е. у одного отзыва может быть только один автор
	belongs_to :user	
	# Связь один-ко-многим, т.е. у одного отзыва может быть много комментариев
 	has_many :comments, dependent: :destroy
	# Связь многие-ко-многим, т.е. у одного отзыва может быть несколько тэгов
	# при этом каждый тэг может использовать в нескольких отзывах
	has_many :feedback_tags
	# Связь осуществляется через дополнительную таблицу feedback_tags
	has_many :tags, through: :feedback_tags
	
	# Валидация данных. 
	# Заголовок не менее 5 символов
	validates :title, presence: true,length: { minimum: 5 }
	# Описание не менее 5 символов и не более 140
	validates :description, presence: true,length: { minimum: 5, maximum: 140 }
	# Обязательно наличие выбранного типа отзыва
    validates :typefeedback, presence: true                   
                    
end

