class TagsController < ApplicationController

  resources_controller_for :tags


  def index
    self.resources = find_resources

    respond_to do |format|
      format.html # index.rhtml
      format.js
      format.xml  { render :xml => resources }
      format.csv { send_data( self.resources.map{|tag| tag.tagname + "," + tag.images.map{|i| i.flickr_id }.join(",") }.join("\n") , :type => 'text/csv; header=present', :filename => @list.name + '.csv') }


    end
  end



  # POST /events.xml
  def create
    self.resource = new_resource

    respond_to do |format|
      if resource_saved?
        format.html do
          flash[:notice] = "#{resource_name.humanize} was successfully creat
                                                             ed."
          redirect_to resource_images_url
        end
        format.js
        format.xml  { render :xml => resource, :status => :created, :location => resource_url }
      else
        format.html { render :action => "new" }
        format.js   { render :action => "new" }
        format.xml  { render :xml => resource.errors, :status => :unprocessable_entity }
      end
    end
  end


  def show
    self.resource = find_resource
    respond_to do |format|
      format.html { redirect_to resource_images_url }
      format.js
      format.xml  { render :xml => resource }
    end
  end


end
