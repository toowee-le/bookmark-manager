feature "Add bookmarks" do
  scenario "A user can add a new bookmark to Bookmark Manager" do
    visit("/bookmarks/new")

    fill_in("Website", with: "http://freecodecamp.org")
    click_button("Add")

    expect(page).to have_content("http://freecodecamp.org")
  end
end