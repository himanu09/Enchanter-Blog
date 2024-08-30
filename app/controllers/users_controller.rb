class UsersController < ApplicationController
  # http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  before_action :authenticate_user!, except: [:show, :index]

  def show
    @user = current_user
  end

  # def edit
  #   @user = current_user
  # end

  # def update
  #   @user = current_user

  #   if @user.update(user_params)
  #     redirect_to user_path
  #   else
  #     render :edit, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @article = Article.find(params[:id])
  #   @article.destroy

  #   redirect_to root_path, status: :see_other
  # end

  # private

  # def user_params
  #   params.require(:user).permit(:name, :email, :mobile_no, :role)
  # end
end
