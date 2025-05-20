require 'rails_helper'

describe 'Tasks', type: :system do
  context 'index page' do
    before do
      create(:task, description: 'Task 1')
      visit tasks_path
    end

    it 'display the task' do
      expect(page).to have_content('Task 1')
    end

    it 'allows user to create a new task' do
      click_link 'Add New Quest'
      add_task('New Task')
      expect(page).to have_content('New Task')
    end

    it 'allows user to edit a task' do
      click_link 'Edit'
      fill_in 'Your quest', with: 'Updated Task'
      click_button 'update-quest'
      expect(page).to have_content('Updated Task')
    end

    it 'allows user to delete a task' do
      click_button 'Delete'

      should_display_a_delete_modal
      click_button 'delete-task-button'
      expect(page).not_to have_content('Task 1')
    end
  end
end

def should_display_a_delete_modal
  expect(page).to have_selector('.modal', visible: true)
  expect(page).to have_content('Are you sure you want to delete this task?')
end

def add_task(name)
  fill_in 'description-input', with: name
  click_button 'create-quest'
end
