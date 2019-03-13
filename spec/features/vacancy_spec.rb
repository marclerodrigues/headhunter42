require 'rails_helper'

RSpec.describe "Vacancy", type: :feature do
  let(:user) { create(:user, role: :admin) }
  let(:pipeline) { create(:pipeline) }
  let!(:vacancy) { create(:vacancy, pipeline: pipeline) }

  before do
    create(:company)
    sign_in user
  end

  scenario "action show vacancy also show their pipeline" do
    visit (admin_vacancy_path(vacancy.id))

    expect(page).to have_content(pipeline.name)
    expect(page).to have_content(vacancy.name)
    expect(page).to have_content(vacancy.description)
    expect(page).to have_content(vacancy.perks)
    expect(page).to have_content(vacancy.min_salary)
    expect(page).to have_content(vacancy.max_salary)
    expect(page).to have_content(I18n.l(vacancy.start_date))
    expect(page).to have_content(I18n.l(vacancy.end_date))
  end

  scenario "user creates a new vacancy", ss: true do
    visit(new_admin_vacancy_path)
    fill_in('vacancy_name', with: "Frontend Teresina")
    select(pipeline.name, from: 'Cargo')
    check('vacancy_active')
    fill_in('vacancy_description', with: "Javascript, CSS and HTML")
    fill_in('vacancy_perks', with: "Sodexo")
    fill_in('vacancy_min_salary', with: 1000)
    fill_in('vacancy_max_salary', with: 5000)
    fill_in('Data inicial', with: "01/01/2018")
    fill_in('Data final', with: "06/06/2018")

    click_button('Salvar')

    expect(page).to have_text(I18n.t('messages.vacancy_created'))
  end

  scenario "user does not create a vacancy" do
    visit (new_admin_vacancy_path)

    fill_in('vacancy_name', with: "")
    select(pipeline.name, from: 'Cargo')
    check('vacancy_active')
    fill_in('vacancy_description', with: "Javascript, CSS and HTML")
    fill_in('vacancy_perks', with: "Sodexo")
    fill_in('vacancy_min_salary', with: 1000)
    fill_in('vacancy_max_salary', with: 5000)
    fill_in('vacancy_start_date', with: "01/01/2018")
    fill_in('vacancy_end_date', with: "06/06/2018")

    click_button('Salvar')

    expect(page).to have_text(I18n.t('errors.messages.blank'))
  end

  scenario "user edit the vacancy" do
    visit (edit_admin_vacancy_path(vacancy.id))

    fill_in('vacancy_name', with: "Backend Batatais")
    click_button('Salvar')

    expect(page).to have_text(I18n.t('messages.vacancy_updated'))
  end

  scenario "user does not edit the vacancy" do
    visit (edit_admin_vacancy_path(vacancy.id))

    fill_in('vacancy_name', with: "")
    click_button('Salvar')

    expect(page).to have_text(I18n.t('errors.messages.blank'))
  end
end
