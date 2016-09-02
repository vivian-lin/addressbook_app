require 'rails_helper'

RSpec.feature "LandingPages", type: :feature do
  context 'Going to a website' do
    Steps 'You are welcomed' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then 'I can see a welcome message' do
        expect(page).to have_content 'Welcome'
      end
    end
  end #end context
  context 'Saving a new contact' do
    Steps 'To save a contact to your address book' do
      Given 'I am on the landing page' do
        visit '/'
      end
      Then "I can enter in a contact's information" do
        fill_in 'given_name', with: 'Vivian'
        fill_in 'family_name', with: 'Lin'
        fill_in 'email', with: 'vivian@home.com'
        fill_in 'address', with: '123 Main St. San Diego, CA'
        click_button 'Save Contact'
      end
      Then 'I can see that the contact has saved successfully' do
        expect(page).to have_content 'Your contact Vivian Lin has been saved.'
      end
    end
  end
end
