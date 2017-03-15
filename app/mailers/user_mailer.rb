class UserMailer < ApplicationMailer
    default from: ' "OMRv" <postmaster@sandbox7b38853cde2f4ef8ae54504c3ccfd0d6.mailgun.org>'
    
    def welcome_email(user)
        @user = user
        email_with_name = %("#{@user.name}" <#{@user.email}>)
        mail(to: email_with_name, subject: 'Welcome to Online Movie Review(OMRv).')
    end
    
    def followedEmail(user, current_user)
        @user = user
        @current_user = current_user
        mail(to: @user.email, subject: 'Someone just followed you.')
    end
    
end
