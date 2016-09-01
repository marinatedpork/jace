class DeviseTokenAuthCreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table(:users) do |t|
      t.string   :provider, :null => false, :default => "email"
      t.string   :uid, :null => false, :default => ""
      t.string   :encrypted_password, :null => false, :default => ""
      t.string   :reset_password_token
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.string   :confirmation_token
      t.string   :unconfirmed_email
      t.string   :name
      t.string   :nickname
      t.string   :image
      t.string   :email
      t.string   :phone
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.datetime :current_sign_in_at
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.datetime :last_sign_in_at
      t.json     :tokens
      t.integer  :sign_in_count, :default => 0, :null => false
      t.timestamps
    end
    add_index :users, :email
    add_index :users, [:uid, :provider],     :unique => true
    add_index :users, :reset_password_token, :unique => true
  end
end
