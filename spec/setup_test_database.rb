require 'pg'

def setup_test_database
  p "Setting up test database..."

  # Connect to the test database
  connection = PG.connect( dbname: 'bookmark_manager_test' )
  
  # Reset the bookmarks table
  connection.exec( "TRUNCATE bookmarks" )
end
