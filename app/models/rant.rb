class Rant < ActiveRecord::Base

  belongs_to :task_list

  validates :task, presence:{:message => "Your rant could not be posted"}
end