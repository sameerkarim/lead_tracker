class Task < ActiveRecord::Base
  attr_accessible :title, :description, :priority, :target_date, :actual_date
  belongs_to :contact
  
  validates :title, presence: :true
end
