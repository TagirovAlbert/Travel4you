class UserDecorator < Draper::Decorator
  delegate :id, :first_name,:last_name, :email, :login, :identities

  def full_name_with_email
    "#{object.first_name} #{object.last_name} (#{object.email})"
  end

  def full_name
    "#{object.first_name} #{object.last_name}"
  end


  def not_have_ident?
    object.identities.first.nil?
  end
end
