class Admin::UsersController < AdminController

  def index
    @users = User.includes(:groups).all
  end

  def edit
    @user = User.find(params[:id])
    # 跟刚才后台情况一样，如果没有 @user.profile，要先新建一个
     # unless @user.profile 等同于 if !@user.profile 或 if @user.profile.nil?
     @user.create_profile unless @user.profile
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render "edit"
    end
  end

  protected

  def user_params
    params.require(:user).permit(:email, :group_ids => [])
  end

end
