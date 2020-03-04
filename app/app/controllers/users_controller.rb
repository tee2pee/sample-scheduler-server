class UsersController < ApplicationController
  def new
    # パラメータ
    usr_params = params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
    usr_params[:deleted] = false
    # ユーザー
    usr = User.create(usr_params)
    # カレンダー
    cal = Calendar.create(
      title: 'MyCalendar',
      deleted: false
    )
    # リレーション
    rel = Relationship.create(
      user_id: usr.id,
      calendar_id: cal.id,
      deleted: false
    )
    # レスポンス
    render :json => { status: true }
  end
end
