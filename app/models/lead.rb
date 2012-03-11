class Lead < ActiveRecord::Base
  belongs_to :contact
  
  validates :title, presence: :true
  validates :contact_id, presence: true
  
  attr_accessible :title, :description, :notes, :target_date 
end
