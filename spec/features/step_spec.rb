require 'rails_helper'

RSpec.describe Step, type: :feature do
  before do
    create(:company)
    visit_sign_in_and_fill_form
  end

  let(:user) { create(:user, role: :admin) }
  let!(:pipeline) {create(:pipeline) }
  let!(:step1) { create(:step, pipeline: pipeline, order: 1) }
  let!(:step2) { create(:step, pipeline: pipeline, order: 2) }
  let!(:step3) { create(:step, pipeline: pipeline, order: 3) }
  let!(:skill1) { create(:skill, step: step1) }
  let!(:skill2) { create(:skill, step: step1) }

  scenario "action show step also show their skills" do
    visit (admin_step_path(step1.id))

    expect(page).to have_content(step1.name)
    expect(page).to have_content(skill1.name)
    expect(page).to have_content(skill1.description)
    expect(page).to have_content(skill2.name)
    expect(page).to have_content(skill2.description)
  end

  scenario "user edit the step" do
    visit (edit_admin_step_path(step1.id))

    fill_in('step_name', with: "First Step")
    fill_in('step_order', with: "1")
    fill_in('step_description', with: "Iron fist is boring")

    click_button('Salvar')

    expect(page).to have_text("Etapa atualizada com sucesso!")
  end

  scenario "user does not edit the step" do
    visit (edit_admin_step_path(step1.id))

    fill_in('step_name', with: "")
    fill_in('step_order', with: "1")
    fill_in('step_description', with: "Iron fist is boring")

    click_button('Salvar')

    expect(page).to have_text("Nome não pode ficar em branco")
  end

  def visit_sign_in_and_fill_form
    visit('/user/sign_in')

    fill_in('user[email]', with: user.email)
    fill_in('user[password]', with: user.password)

    click_button('Log in')
  end
end
