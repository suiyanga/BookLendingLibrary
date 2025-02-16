class AddUniqueIndexToUsersEmail < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :email, unique: true
    add_index :books, :isbn, unique: true
  end
end
