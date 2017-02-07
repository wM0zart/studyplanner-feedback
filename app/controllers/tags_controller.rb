class TagsController < ApplicationController
  
  before_action :authenticate_user!
  before_action :require_admin_user, only: [:edit, :update, :destroy]
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @tag = Tag.find(params[:id])
    @tag_feedbacks = @tag.feedbacks.paginate(page: params[:page], per_page: 5)
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      flash[:success] = "эг был успешно добавлен"
      redirect_to tags_path
    else 
      render 'new'
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    if @tag.update(tag_params)
      flash[:success] = "Название тэга успешно изменено"
      redirect_to tags_path
    else
      render 'edit'
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    flash[:danger] = "Тэг удален"
    redirect_to tags_path
  end

  def require_admin_user
    if !current_user.admin?
      flash[:danger] = "Недостаточно прав для выполнения данной операции"
      redirect_to root_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name)
    end
end
