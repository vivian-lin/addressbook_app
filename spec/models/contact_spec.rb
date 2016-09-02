require 'rails_helper'

RSpec.describe Contact, type: :model do
  it 'is a thing' do
    expect{Contact.new}.to_not raise_error
  end
  it 'has a given name, family_name, email, and address' do
    contact = Contact.new
    contact.given_name = 'Larry'
    contact.family_name = 'Smith'
    contact.email = 'lsmith@home.com'
    contact.address = '123 D Street San Diego, CA'
    expect(contact.save).to eq true
    c2 = Contact.find_by_given_name('Larry')
    expect(c2.given_name).to eq 'Larry'
    expect(c2.family_name).to eq 'Smith'
    expect(c2.email).to eq 'lsmith@home.com'
    expect(c2.address).to eq '123 D Street San Diego, CA'
  end
end
