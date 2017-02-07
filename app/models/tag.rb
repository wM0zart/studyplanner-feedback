class Tag < ActiveRecord::Base
	# Связь многие-ко-многим, т.е. у одного отзыва может быть несколько тэгов
	# при этом каждый тэг может использовать в нескольких отзывах
	has_many :feedback_tags
	# Связь осуществляется через дополнительную таблицу feedback_tags
	has_many :feedbacks, through: :feedback_tags
	
	# Валидация данных. 
	# Название не менее 3 символов и не более 25
	validates :name, presence: true, length: { minimum: 3, maximum: 25}
	# Проверка на уникальность названия тэга (чтобы исключить дубликаты)
	validates_uniqueness_of :name

	# Метод для вывода названия тэга
	def name_label
		"#{name}"
	end
end