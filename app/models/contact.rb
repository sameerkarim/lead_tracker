class Contact < ActiveRecord::Base
  validates :name, presence: :true
  validates :user_id, presence: true
  attr_accessible :name, :title, :company, :phone, :email, :notes
  
  has_many :tasks, :dependent => :destroy
  has_many :leads, dependent: :destroy
  belongs_to :user
  
  #default_scope order: 'contacts.created_at DESC'
end
