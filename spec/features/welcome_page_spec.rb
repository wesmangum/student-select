feature "Welcome Page" do
  scenario "is displayed when loading the site" do
    visit '/'
    expect(page).to have_content("Welcome to StudentSelect")
    expect(page).to have_content("Students")
  end
end