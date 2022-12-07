class ApplicationController < ActionController::Base
	before_action :parameter_permit,
				  if: :devise_controller?

	private

	def parameter_permit
		devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
		devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
	end
end
