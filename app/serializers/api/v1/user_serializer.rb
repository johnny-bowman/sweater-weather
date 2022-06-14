class Api::V1::UserSerializer
  class << self
    def new_user(user)
      {
        data: {
          type: 'users',
          id: user.id,
          attributes: {
            email: user.email,
            api_key: user.api_key
          }
        }
      }
    end

    def creation_error(user)
      if (user.email.nil? || user.email.empty?)
        { error: "email can't be blank" }
      elsif User.find_by(email: user.email)
        { error: "that email is already taken" }
      elsif user.password != user.password_confirmation
        { error: "password confirmation doesn't match password" }
      end
    end

    def credential_error
      { error: 'email or password is incorrect' }
    end

    def new_session(user)
      {
        data: {
          type: 'users',
          id: user.id,
          attributes: {
            email: user.email,
            api_key: user.api_key
          }
        }
      }
    end
  end
end
