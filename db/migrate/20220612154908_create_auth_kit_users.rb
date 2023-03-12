# frozen_string_literal: true

class CreateAuthKitUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :auth_kit_users do |t|
      t.string :phone, default: nil
      t.string :email, default: nil
      t.string :password_digest, null: false
      t.string :reset_password_token, default: nil
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet :current_sign_in_ip
      t.inet :last_sign_in_ip
      t.string :confirmation_email_token, default: nil
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string :unconfirmed_email
      t.integer :failed_attempts, default: 0, null: false
      t.string :unlock_token, default: nil
      t.datetime :locked_at
      t.integer :priority
      t.datetime :discarded_at
      t.timestamps
    end
    add_index :auth_kit_users, :phone, unique: true, where: 'phone IS NOT NULL'
    add_index :auth_kit_users, :email, unique: true, where: 'email IS NOT NULL'
    add_index :auth_kit_users, :reset_password_token, unique: true, where: 'reset_password_token IS NOT NULL'
    add_index :auth_kit_users, :confirmation_email_token, unique: true, where: 'confirmation_email_token IS NOT NULL'
    add_index :auth_kit_users, :unlock_token, unique: true, where: 'unlock_token IS NOT NULL'
    add_index :auth_kit_users, :discarded_at
  end
end
