class UsersController < ApplicationController
  def index
  	@users = User.all
    @users = User.search(params[:search])
  end

  def show
  	@user = User.find_by(id: params[:id])
    @data = [['2020-09-13', 3], ['2020-09-14', 5], ['2020-09-15', 1]]
  end

  def create
    @user = User.new(
      name: params[:name],
      email: params[:email],
    )
    if @user.save
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  def user_search_params
    params.fetch(:search, {}).permit(:name)
  end
end
