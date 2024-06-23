# frozen_string_literal: true

class AddAuthDataToUsers < ActiveRecord::Migration[7.0]
  def up
    if ActiveRecord::Base.connection.table_exists? 'users'
      add_column :users, :phone, :string, default: nil
      add_column :users, :email, :string, default: nil
      add_column :users, :password_digest, :string, null: false
      add_column :users, :reset_password_token, :string, default: nil
      add_column :users, :reset_password_sent_at, :datetime, default: nil
      add_column :users, :remember_created_at, :datetime, default: nil
      add_column :users, :sign_in_count, :integer, default: 0
      add_column :users, :current_sign_in_at, :datetime, default: nil
      add_column :users, :last_sign_in_at, :datetime, default: nil
      add_column :users, :current_sign_in_ip, :inet
      add_column :users, :last_sign_in_ip, :inet
      add_column :users, :confirmation_email_token, :string, default: nil
      add_column :users, :confirmed_at, :datetime, default: nil
      add_column :users, :confirmation_sent_at, :datetime, default: nil
      add_column :users, :unconfirmed_email, :string, default: nil
      add_column :users, :failed_attempts, :integer, default: 0, null: false
      add_column :users, :unlock_token, :string, default: nil
      add_column :users, :locked_at, :datetime, default: nil
      add_column :users, :priority, :integer, default: nil
      add_column :users, :discarded_at, :datetime, default: nil unless column_exists?(:users, :discarded_at)

  else
    create_table :users do |t|
      t.string :phone, default: nil
      t.string :email, default: nil
      t.string :password_digest, null: false
      t.string :reset_password_token, default: nil
      t.datetime :reset_password_sent_at, default: nil
      t.datetime :remember_created_at, default: nil
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at, default: nil
      t.datetime :last_sign_in_at, default: nil
      t.inet :current_sign_in_ip
      t.inet :last_sign_in_ip
      t.string :confirmation_email_token, default: nil
      t.datetime :confirmed_at, default: nil
      t.datetime :confirmation_sent_at, default: nil
      t.string :unconfirmed_email, default: nil
      t.integer :failed_attempts, default: 0, null: false
      t.string :unlock_token, default: nil
      t.datetime :locked_at, default: nil
      t.integer :priority, default: nil
      t.datetime :discarded_at, default: nil
      t.timestamps
    end
  end

  add_index :users, :phone, unique: true, where: 'phone IS NOT NULL'
  add_index :users, :email, unique: true, where: 'email IS NOT NULL'
  add_index :users, :reset_password_token, unique: true, where: 'reset_password_token IS NOT NULL'
  add_index :users, :confirmation_email_token, unique: true, where: 'confirmation_email_token IS NOT NULL'
  add_index :users, :unlock_token, unique: true, where: 'unlock_token IS NOT NULL'
  add_index :users, :discarded_at unless index_exists?(:users, :discarded_at)
end

def down
  remove_column :users, :phone
  remove_column :users, :email, :string, default: nil
  remove_column :users, :password_digest, :string, null: false
  remove_column :users, :reset_password_token, :string, default: nil
  remove_column :users, :reset_password_sent_at, :datetime, default: nil
  remove_column :users, :remember_created_at, :datetime, default: nil
  remove_column :users, :sign_in_count, :integer, default: 0
  remove_column :users, :current_sign_in_at, :datetime, default: nil
  remove_column :users, :last_sign_in_at, :datetime, default: nil
  remove_column :users, :current_sign_in_ip, :inet
  remove_column :users, :last_sign_in_ip, :inet
  remove_column :users, :confirmation_email_token, :string, default: nil
  remove_column :users, :confirmed_at, :datetime, default: nil
  remove_column :users, :confirmation_sent_at, :datetime, default: nil
  remove_column :users, :unconfirmed_email, :string, default: nil
  remove_column :users, :failed_attempts, :integer, default: 0, null: false
  remove_column :users, :unlock_token, :integer, default: nil
  remove_column :users, :locked_at, :datetime, default: nil
  remove_column :users, :priority, :integer, default: nil
  remove_column :users, :discarded_at, :datetime, default: nil
  remove_index :users, :phone
  remove_index :users, :email
  remove_index :users, :reset_password_token
  remove_index :users, :confirmation_email_token
  remove_index :users, :unlock_token
  remove_index :users, :discarded_at
end

end
