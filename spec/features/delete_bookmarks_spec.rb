feature 'Deleting bookmarks' do
  before { Bookmark.create(name: 'Google', url: 'http://www.google.com') }
  before { Bookmark.create(name: 'Makers', url: 'https://www.makers.tech') }

  scenario 'user can delete a bookmark' do
    bookmarks = Bookmark.all
    first_bookmark, second_bookmark = bookmarks[0], bookmarks[1]

    visit('/bookmarks')

    expect(page).to have_link(first_bookmark.name, href: first_bookmark.url)
    expect(page).to have_link(second_bookmark.name, href: second_bookmark.url)
    
    # within "#bookmark-#{first_bookmark.id}" do
    #   click_button 'Delete'
    # end

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link(first_bookmark.name, href: first_bookmark.url)
    expect(page).to have_link(second_bookmark.name, href: second_bookmark.url)
  end
end