class User < ActiveRecord::Base
	# Связь один-ко-многим, т.е. у одного пользователя может быть много отзывов
	has_many :feedbacks, dependent: :destroy
	# Связь один-ко-многим, т.е. у одного пользователя может быть много комментариев	
	has_many :comments, dependent: :destroy
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
	# Валидация данных. 
	# Имя пользователя не менее 5 символов
	validates :username, presence: true, length: { minimum: 5 }
end