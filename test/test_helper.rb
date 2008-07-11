ENV["RAILS_ENV"] = "test"

require 'test/unit'
require 'rubygems'
require 'active_record'
require File.join(File.dirname(__FILE__), '..', 'lib', 'validations.rb')
::ActiveRecord::Base.send :include, Validations

class User < ActiveRecord::Base
  validates_email :email
end

ActiveRecord::Base.configurations = {"sqlite3"=>{:adapter=>"sqlite3", :database=>":memory:"}}
ActiveRecord::Base.establish_connection('sqlite3')

ActiveRecord::Schema.define :version => 0 do
  create_table :users, :force => true do |t|
    t.column :email, :string
  end
end