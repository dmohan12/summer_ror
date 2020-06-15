class StaticController < ApplicationController

#grabs erb file from static folder 
    def show
        render template: "static/#{params[:page]}"
    end
    
end
