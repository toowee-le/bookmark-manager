feature "View bookmarks" do
  scenario "view bookmarks" do
    visit("/bookmarks")

    expect(page).to have_content("www.google.com")
    expect(page).to have_content("www.bbc.com")
  end
end