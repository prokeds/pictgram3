class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    #binding.pry
    #@user = User.new(name: params[:user][:name], email: params[:user][:email])
      if @user.save
        redirect_to root_path, success: '登録が完了しました'
      else
        flash.now[:danger] = "登録に失敗しました"
        render :new
      end
  end
  def search
      user_search = UserSearch.new(params_user_search)
      @user = user_search.execute.first()
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def params_user_search
    params.permit(:search_name)
  end

end
