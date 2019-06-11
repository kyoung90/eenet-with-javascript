class InternetPackagesController < ApplicationController

    def index
        @internet_packages = InternetPackage.all
    end 

    def show
        @internet_package = InternetPackage.find_by(id: params[:id])
        if !@internet_package
            redirect_to internet_packages_index, alert: "Internet Package Not Found."
        end 

        respond_to do |format|
            format.html { render :show }
            format.json { render json: @internet_package }
        end
    end 
end
