class User < ActiveRecord::Base
  has_secure_password
  has_many :user_tasks
  has_many :tasks, through: :user_tasks
end
