class RegistrationsController < Devise::RegistrationsController

  protected
     # By default we want to require a password checks on update.
    # You can overwrite this method in your own RegistrationsController.
    def update_resource(resource, params)
      if resource.identities.first.provider == "facebook" || "twitter" || "vkontakte"
        params.delete("current_password")
        resource.update_without_password(params)
      else
      resource.update_with_password(params)
      end
    end


end




