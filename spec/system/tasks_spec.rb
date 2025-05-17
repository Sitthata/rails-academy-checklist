require 'rails_helper'

describe 'Tasks', type: :system do
  context 'index page' do
    before do
      visit tasks_path
    end

    it 'displays the tasks list' do
      expect(page).to have_content "Quest Checklist"
    end

    it 'allow user to create a new task' do
      click_link 'Add New Quest'

      expect(page).to have_content "New Quest"

      add_task('พิมดีด')

      expect(page).to have_content 'พิมดีด'
    end

    it 'allow user to edit a task' do
      add_task('พิมดีด')

      expect(page).to have_content 'พิมดีด'

      click_link 'Edit'

      fill_in 'พิมดีด', with: 'พิมดีด 2'

      click_button 'Create Quest'

      expect(page).to have_content 'พิมดีด 2'
    end

  end

end

def add_task(name)
  fill_in 'Your quest', with: name
  click_button 'Create Quest'
end