class User < ActiveRecord::Base
  has_many :identities, :dependent => :delete_all
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Получить identity пользователя, если он уже существует
    identity = Identity.find_for_oauth(auth)

    # Если signed_in_resource предоставлен оно всегда переписывает существующего пользователя
    # что бы identity не была закрыта случайно созданным аккаунтом.
    # Заметьте, что это может оставить зомби-аккаунты (без прикрепленной identity)
    # которые позже могут быть удалены
    user = signed_in_resource ? signed_in_resource : identity.user

    # Создать пользователя, если нужно
    if user.nil?

      # Получить email пользователя, если его предоставляет провайдер
      # Если email не был предоставлен мы даем пользователю временный и просим
      # пользователя установить и подтвердить новый в следующим шаге через UsersController.finish_signup
      email = auth['extra']['raw_info']['email']
      user = User.where(:email => email).first if email

      # Создать пользователя, если это новая запись
      if user.nil?
        user = User.new(
            first_name: auth['extra']['raw_info']['first_name']||auth['extra']['raw_info']['name'].split.second,
            last_name: auth['extra']['raw_info']['last_name']||auth['extra']['raw_info']['name'].split.first,
            email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
            password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
      end
    end

    # Связать identity с пользователем, если необходимо
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end
end
