class Image < ActiveRecord::Base

  belongs_to :tag
  validates_associated :tag

  validates_uniqueness_of :flickr_id, :scope => :tag_id

  def flickr
    @flickr ||= Flickr::Photos::Photo.new(Flickr.new(RAILS_ROOT + '/config/flickr.yml') , :id => self.flickr_id )
  end

end
