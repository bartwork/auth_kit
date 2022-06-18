class CreateAuthKitJwtDenylist < ActiveRecord::Migration[7.0]
  def change
    create_table :auth_kit_jwt_denylist do |t|
      t.string :jti, null: false
      t.datetime :exp, null: false
      t.timestamps
    end
    add_index :auth_kit_jwt_denylist, :jti
  end
end
