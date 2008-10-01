class ImagesController < ApplicationController

  resources_controller_for :images

  def index

    self.resources = find_resources

    flickr = Flickr.new(RAILS_ROOT + '/config/flickr.yml')

    if params[:page]
      @flickr_images = flickr.photos.search(
                                            :license => 5,   # sharealike! I think.
                                            :text => params[:q] || @tag.tagname, 
                                            :sort => "relevance",
                                            :per_page => 20, 
                                            :page => params[:page] || 1 )
    end

    respond_to do |format|
      format.html # index.rhtml
      format.js
      format.xml  { render :xml => resources }
    end

  end


end
