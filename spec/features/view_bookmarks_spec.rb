feature "View bookmarks" do
  scenario "view bookmarks" do
    Bookmark.create(name: "Google", url: "http://www.google.com")
    Bookmark.create(name: "Makers", url: "http://www.makersacademy.com")

    visit("/bookmarks")

    expect(page).to have_link("Google", href: "http://www.google.com")
    expect(page).to have_link("Makers", href: "http://www.makersacademy.com")
  end
end