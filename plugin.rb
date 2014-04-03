after_initialize do
  # Rails Engine for accepting votes.
  module AutoActivationPlugin
	  require_dependency 'users_controller'
	  UsersController.class_eval do
			private
		    def user_params
		    	merge_fields = {ip_address: request.ip}
		    	merge_fields.merge!(active: true) if SiteSetting.auto_activation_enabled
		      params.permit(
		        :name,
		        :email,
		        :password,
		        :username,
		        :wedding_date,
		      ).merge(merge_fields)
		    end
	  end
  end
end
