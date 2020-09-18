class TrainingsController < ApplicationController
  def index
  	@trainings = Training.all.order(created_at: :desc)
  end

  def show
  	@training = Training.find_by(id: params[:id])
    @user = @training.user
  end

  def new
  	@training =Training.new
  end	

  def edit
  	@training = Training.find_by(id: params[:id])
  end

  def create
  	@training = Training.new(content: params[:content])
    @training.save
    redirect_to("/trainings/index")

  end
  def update
  	@training = Training.find_by(id: params[:id])
    @training.content = params[:content]
    @training.save
    redirect_to("/trainings/index")
  end

  def destroy
  	@training = Training.find_by(id: params[:id])
    @training.destroy
    flash[:notice]="投稿を削除しました"
    redirect_to("/trainings/index")
  end
end
