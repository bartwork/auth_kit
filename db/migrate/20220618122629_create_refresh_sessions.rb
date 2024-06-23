class CreateRefreshSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :refresh_sessions do |t|
      t.integer :user_id, null: false, foreign_key: true
      t.string :refresh_token, null: false
      t.string :user_agent
      t.string :fingerprint
      t.inet :ip
      t.datetime :expires_in, null: false
      t.timestamps
    end
    add_index :refresh_sessions, :refresh_token
  end
end
