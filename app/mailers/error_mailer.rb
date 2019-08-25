class ErrorMailer < ApplicationMailer
    default form: 'dipper@example.com'    
    
    def report
        @user = params[:user]
        @data = params[:data]
        mail(to: @user.email, subject: 'Error Report')
    end 
end
