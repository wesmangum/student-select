class StudentsController < ApplicationController
  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      flash.notice = "#{@student.name} has been saved"
      redirect_to root_path
    else
      flash.now[:alert] = "Student could not be added"
      render :new
    end
  end

  def call_on
    @random_student = Student.all.sample
    @random_student.updated_at = DateTime.now
    @random_student.save
  end

  protected

  def student_params
    params.require(:student).permit(:name)
  end
end
