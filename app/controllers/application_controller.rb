class ApplicationController < ActionController::Base

    protected

    def after_sign_in_path_for(resource)
      # return the path based on resource
      return '/items'
    end
  
    def after_sign_out_path_for(resource)
      # return the path based on resource
      return "/homepage"


      
    end
    
end
