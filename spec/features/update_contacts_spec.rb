require 'rails_helper'

RSpec.feature "UpdateContacts", type: :feature do
  context 'Updating contacts' do
    Steps 'Updating a specific contact' do
      Given 'I am on the update contacts page' do
        visit '/contacts/update'
      end
    end
  end
end
