class Pickup < ActiveRecord::Base
  belongs_to :student
  belongs_to :user

  has_paper_trail :only => [:current_pickup]
end
