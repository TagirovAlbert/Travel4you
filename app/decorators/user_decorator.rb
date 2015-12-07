class UserDecorator < ApplicationDecorator
  delegate :id, :first_name,:last_name, :email, :identities

  def full_name_with_email
    "#{object.first_name} #{object.last_name} (#{object.email})"
  end
  def is_sign_omni?
    "#{object.identities.first.nil?}"
  end
end
