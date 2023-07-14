require 'rails_helper'

RSpec.describe "users/splash_screen", type: :view do
  it "renders the splash screen" do
    render

    expect(rendered).to have_content("AllInOne")
    expect(rendered).to have_link("Log in", href: new_user_session_path)
    expect(rendered).to have_link("Sign up", href: new_user_registration_path)
  end
end
