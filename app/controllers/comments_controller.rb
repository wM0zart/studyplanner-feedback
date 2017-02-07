class CommentsController < ApplicationController
	def show
		
	end
	def create
	    @feedback = Feedback.find(params[:feedback_id])
	    @comment = @feedback.comments.create(comment_params)
	    @comment.user_id = current_user.id
	    if @comment.save
			flash[:success] = "Ваш комментарий успешно добавлен"
			redirect_to feedback_path(@feedback)	    
		  else
		    flash.now[:danger] = "Произошла ошибка при добавлении комментария. Попробуйте еще раз"
		  end
	  end
	 
	  def destroy
	    @feedback = Feedback.find(params[:feedback_id])
	    @comment = @feedback.comments.find(params[:id])
	    @comment.destroy
	    redirect_to feedback_path(@feedback)
	  end
	  private
	    def comment_params
	      params.require(:comment).permit(current_user, :message)
	    end
end
