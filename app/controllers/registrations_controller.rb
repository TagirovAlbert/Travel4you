class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    current_user.identities.each do |ident|
     puts ident.uid
     puts ident.provider
      if ident.provider == "facebook"
        params.delete("current_password")
        resource.update_without_password(params)
      else
        resource.update_with_password(params)
      end
    end

  end

end