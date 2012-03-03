class Task < ActiveRecord::Base
  belongs_to :contact
  
  validates :title, presence: :true
end
