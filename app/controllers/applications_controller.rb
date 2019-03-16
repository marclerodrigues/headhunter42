class ApplicationsController < ApplicationController
  def new
    @application = ApplicationForm.new
  end

  def create
    @application = ApplicationForm.new(application_params)

    if @application.create
      redirect_to vacancies_path, flash: { notice: 'Application submitted!' }
    else
      render :new
    end
  end

  private

  def application_params
    params.require(:application).permit(:first_name, :last_name, :email, :user_id, :vacancy_id, :resume, :cover_letter)
  end
end
