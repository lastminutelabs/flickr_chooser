class Tag < ActiveRecord::Base

  validates_uniqueness_of :tagname, :scope => :list_id
  has_many :images, :dependent => :destroy

  belongs_to :list


end
