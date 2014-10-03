require 'rails_helper'

describe 'OmniAuth' do
  before do
    visit "/users/auth/facebook"
  end

  it 'Signing in with correct credentials' do
    expect(page).to have_link "Sign out"
  end
end