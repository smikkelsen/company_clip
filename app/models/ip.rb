class Ip < ActiveRecord::Base
  attr_accessible :address, :blacklisted, :clips_attributes

  has_many :clips, :order => 'created_at DESC'
  accepts_nested_attributes_for :clips, :allow_destroy => true


  validates :address, :presence => true, :uniqueness => true, :length => {:maximum => 64}

end
