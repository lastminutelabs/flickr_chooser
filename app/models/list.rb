class List < ActiveRecord::Base

  validates_uniqueness_of :name

  has_many :tags, :dependent => :destroy

end
