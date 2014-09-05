class Rant < ActiveRecord::Base

  belongs_to :user

  validates :task, presence: {:message => "Your rant could not be posted"}

end