class UsersController < ApplicationController
  
  before_action :authenticate_user!, :except => [:show, :index]
  before_action :set_user, only: [:edit, :update, :show, :destroy]
  before_action :require_same_user, only: [:edit, :update,  :destroy]


  def index
  	@users = User.paginate(page: params[:page], per_page: 4)
  end

  def show  	
  	@user_feedbacks = @user.feedbacks.paginate(page: params[:page], per_page: 2)
  end

  def edit
  end

  def update 
		if @user.update(user_params)
			redirect_to @user
		else
			render 'edit'
		end
	end

	def set_user
		@user = User.find(params[:id])
	end

	def require_same_user
		if current_user != @user and !current_user.admin?
			flash[:danger] = "Недостаточно прав для выполнения данной операции.
			Вы можете редактировать только свой профиль"
			redirect_to root_path
		end
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end
end
