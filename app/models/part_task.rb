class PartTask < ActiveRecord::Base
  belongs_to :part
  belongs_to :task
end
