class VacanciesController < ApplicationController
  def index
    @vacancies = Vacancy.active
  end

  def show
    @vacancy = Vacancy.active.find(params[:id])
  end
end
