class Clip < ActiveRecord::Base
  belongs_to :ip
  attr_accessible :encryption, :text, :ip_id

  #validates :text, :presence => true
  validates :ip_id, :presence => true
  validates :encryption, :length => {:maximum => 128}
end
