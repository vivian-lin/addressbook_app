require 'rails_helper'

RSpec.feature "AddressBookViews", type: :feature do
  context 'Contact List page' do
    Steps 'Viewing all my contacts' do
      Given 'I am on the Contact List page' do
        visit '/'
        fill_in 'given_name', with: 'Vivian'
        fill_in 'family_name', with: 'Lin'
        fill_in 'email', with: 'vivian@home.com'
        fill_in 'address', with: '123 Main St. San Diego, CA'
        click_button 'Save Contact'
        click_button 'View AddressBook'
        visit '/contacts/view'
      end
      Then 'I can see all my saved contacts' do
        expect(page).to have_content 'Vivian Lin vivian@home.com 123 Main St. San Diego, CA'
      end
      Then 'I can click a button to update selected contact' do
        click_button 'Update'
        visit '/contacts/update'
      end
      Then 'I am on a update contact page' do
        expect(page).to have_content 'Update Contact'
      end
    end
  end
end
