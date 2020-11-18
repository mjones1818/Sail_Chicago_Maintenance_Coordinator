class Task < ActiveRecord::Base
  has_many :user_tasks
  has_many :users, through: :user_tasks
  belongs_to :sailboat

  def self.organize_tasks 
  end 
end
