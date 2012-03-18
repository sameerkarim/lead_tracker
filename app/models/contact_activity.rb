class ContactActivity < ActiveRecord::Base
  belongs_to :contact
  attr_accessible :activity_date, :description
  validates :contact_id, presence: true
  validates :activity_date, presence: :true
  
  
end
