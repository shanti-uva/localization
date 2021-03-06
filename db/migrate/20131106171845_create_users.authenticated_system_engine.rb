# This migration comes from authenticated_system_engine (originally 25)
class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users, :options => 'CHARACTER SET=utf8' do |t|
      t.integer :person_id
      t.string :login, :limit => 80, :null => false
      t.string :crypted_password, :limit => 40
      t.string :shibboleth_id
      t.string :email
      t.string :identity_url
      
      t.string :salt, :limit => 40
      t.timestamps
      t.string :remember_token
      t.datetime :remember_token_expires_at
    end
    add_index :users, :login, :unique => true    
    AuthenticatedSystem::User.create :login => 'root', :password => 'rootdude', :password_confirmation => 'rootdude', :email => 'root@root'
  end

  def self.down
    drop_table :users
  end
end
