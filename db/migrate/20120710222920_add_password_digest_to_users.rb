class AddPasswordDigestToUsers < ActiveRecord::Migration
  def change
    add_column :users, :password_digest, :string
    add_column :users, :lastname, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :nickname, :string
    add_column :users, :gender, :string
  end
end
