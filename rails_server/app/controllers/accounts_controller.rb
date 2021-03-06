class AccountsController < ApplicationController
  def index
    existing_session = Tyto.db.get_session(session[:app_session_id])
    if existing_session.student_id
      redirect_to "/students/#{existing_session.student_id}/edit"
    elsif existing_session.teacher_id
      redirect_to "/teachers/#{existing_session.teacher_id}/edit"
    else
      redirect_to root_url
    end
  end
end
