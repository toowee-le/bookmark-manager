feature "Add bookmarks" do
  scenario "A user can add a new bookmark to Bookmark Manager" do
    visit("/bookmarks/new")
    fill_in("Site Name", with: "Google")
    fill_in("Site URL", with: "http://www.google.com")
    click_button("Add")

    expect(page).to have_link("Google", href: "http://www.google.com")
  end
end