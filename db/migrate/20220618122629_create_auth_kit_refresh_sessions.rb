class CreateAuthKitRefreshSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :auth_kit_refresh_sessions do |t|
      t.references :auth_kit_user, null: false, foreign_key: true
      t.string :refresh_token, null: false
      t.string :user_agent, null: false
      t.string :fingerprint
      t.inet :ip
      t.datetime :expires_in, null: false
      t.timestamps
    end
      add_index :auth_kit_refresh_sessions, :refresh_token
  end
end
