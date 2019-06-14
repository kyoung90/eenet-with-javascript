class PaymentsController < ApplicationController
    def index
        # byebug
        user = User.find_by(id: current_user)
        if user 
            if params[:filter_plan]
                @payments = user.sorted_payments.joins(:internet_package).where(internet_packages: {plan: params[:filter_plan]}) 
            else
                @payments = user.sorted_payments
            end 
        else 
            redirect_to new_session_path, alert: "You must be logged in to do that."
        end 
    end 

    def create
        internet_package = InternetPackage.find_by(id: params[:internet_package_id])
        user = User.find_by(id: current_user)
        if internet_package && user
            @payment = internet_package.payments.create(payment_params)
            if @payment 
                time = DateTime.now
                @payment.payed_date = time
                @payment.user = user 
                @payment.save

                # attempt mikrotik connection
                # Commented out because I no longer have access to internet
                # if user.activate_internet
                    @service_period = ServicePeriod.create_or_find_and_update(internet_package, user, time, params[:payment][:months].to_i)
                # end
                
                render json: user, status: 201
            else 
                redirect_to payments_path, alert: "Something went wrong. Payment not processed"
            end 
        else 
            redirect_to internet_packages_path, alert: "Package not found or you are not logged in"
        end     
    end 
   
    def payment_params
        params.require(:payment).permit(:months)
    end 
end
