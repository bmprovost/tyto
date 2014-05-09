class TeachersController < ApplicationController
  def new
  end

  def create
    result = Tyto::TeacherSignUp.run(teacher_params)
    if result.success?
      @teacher = result.teacher
      redirect_to "/teachers/#{@teacher.id}"
    else
      render 'new'
    end
  end

  def show
    @teacher = Tyto.db.get_teacher(params[:id])
    @classrooms = Tyto.db

  end

  private

  def teacher_params
    params.permit(:username,
                  :email,
                  :phone_number,
                  :password,
                  :password_confirmation)
  end
end
