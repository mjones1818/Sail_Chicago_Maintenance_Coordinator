class Task < ActiveRecord::Base
  has_many :user_tasks
  has_many :users, through: :user_tasks
  belongs_to :sailboat
  has_many :part_tasks
  has_many :parts, through: :part_tasks
end
