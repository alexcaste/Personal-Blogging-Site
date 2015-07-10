class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def go_back
    #Attempt to redirect
    redirect_to :back
    #Catch exception and redirect to root
    rescue ActionController::RedirectBackError
      redirect_to root_path
  end


  rescue_from CanCan::AccessDenied do |exception|
    go_back
    flash[:alert] = exception.message
  end

end
