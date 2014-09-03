feature "User Adds student" do
  scenario "Happy Path, should add student to list" do
    visit "/"
    click_on "Add Student"
    fill_in "Name", with: "Ash Ketchum"
    click_on "Submit"
    expect current_path == root_path
    expect(page).to have_content("Ash Ketchum")
    expect(page).to have_content(Date.today.strftime("%m/%d/%Y"))
  end

  scenario "Sad Path, should not add student to list" do
    visit "/"
    click_on "Add Student"
    click_on "Submit"
    expect current_path == new_student_path
    expect(page).to have_content("can't be blank")
  end

  scenario "Sad Path, already a student with that name" do
    Fabricate(:student, name: "Ash Ketchum")
    visit "/"
    click_on "Add Student"
    fill_in "Name", with: "Ash Ketchum"
    click_on "Submit"
    expect current_path == new_student_path
    expect(page).to have_content("has already been taken")
  end
end