feature 'Updating bookmarks' do
  scenario 'user can update a bookmark' do
    bookmark = Bookmark.create(name: 'Makers Academy', url: 'http://www.makersacademy.com')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('Site Name', with: 'Makers')
    fill_in('Site URL', with: 'http://www.makers.tech')
    click_button('Submit')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Makers', href: 'http://www.makers.tech')
  end
end