class SessionsController < ApplicationController
  def new
  end

  def create
    user = login(params[:email], params[:password])
    if user
      redirect_to step_records_path, notice: 'ログインしました。'
    else
      flash[:alert] = 'メールアドレスかパスワードが間違っています'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    logout
    redirect_to root_path, notice: 'ログアウトしました。'
  end
end
