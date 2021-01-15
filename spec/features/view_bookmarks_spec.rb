feature "View bookmarks" do
  scenario "view bookmarks" do
    Bookmark.create(name: "Google", url: "http://www.google.com")
    Bookmark.create(name: "Makers", url: "http://www.makersacademy.com")

    visit("/bookmarks")

    expect(page).to have_content("Google")
    expect(page).to have_content("http://www.google.com")
    expect(page).to have_content("Makers Academy")
    expect(page).to have_content("http://www.makersacademy.com")
  end
end