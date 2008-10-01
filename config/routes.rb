ActionController::Routing::Routes.draw do |map|


  map.resources :lists do |list|
    list.resources :tags  do |tag|
      tag.resources :images, :collection => { :search => :get }
    end
  end


  map.root :controller => 'lists', :action => 'index', :resource_path => '/lists'

end
