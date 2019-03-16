class ApplicationForm
  include ActiveModel::Model
  extend Refile::Attachment

  def self.model_name
    ActiveModel::Name.new(self, nil, 'Application')
  end

  attr_accessor(
    :first_name,
    :last_name,
    :email,
    :resume,
    :cover_letter,
    :vacancy_id,
    :application
  )

  validates(
    :first_name,
    :last_name,
    :email,
    :resume,
    :cover_letter,
    :vacancy_id,
    presence: true
  )

  attachment :resume, extension: :pdf, content_type: ["application/pdf"]
  attachment :cover_letter, extension: :pdf, content_type: ["application/pdf"]

  def create
    if valid?
      create_application
    else
      false
    end
  end

  private

  def create_application
    @application = Application.new(application_attributes)

    @application.save
  end

  def application_attributes
    {
      resume: resume,
      cover_letter: cover_letter,
      user: user,
      vacancy: vacancy
    }
  end

  def user
    @_user ||= User.find_or_create_by(email: email) do |u|
      u.first_name = first_name
      u.last_name = last_name
      u.password = Devise.friendly_token[0, 20]
    end
  end

  def vacancy
    @_vacancy ||= Vacancy.active.find(vacancy_id)
  end
end
