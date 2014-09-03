feature "User selects student" do
  scenario "should randomly select a student and update their time" do
    student_1 = Fabricate(:student, name: "Ash")
    Fabricate(:student, name: "Misty")
    Fabricate(:student, name: "Brock")
    visit "/"
    Array.any_instance.stub(:sample) do |array|
      array[0]
    end
    click_on "Pick Someone"
    expect current_path == call_on_student_path
    expect(page).to have_content("Ash")
  end

  scenario "should randomly select a student and update their time" do
    Fabricate(:student, name: "Ash")
    Fabricate(:student, name: "Misty")
    student_3 = Fabricate(:student, name: "Brock")
    Fabricate(:student, name: "Gary")

    student_3.updated_at = DateTime.now
    student_3.save

    visit "/"
    Array.any_instance.stub(:sample) do |array|
      array.last
    end
    click_on "Pick Someone"
    expect current_path == call_on_student_path
    expect(page).to have_content("Brock")
  end
end