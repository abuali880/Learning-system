class User < ActiveRecord::Base
has_secure_password
  acts_as_voter
validates_uniqueness_of :email

    # Using a private method to encapsulate the permissible parameters is
    # just a good pattern since you'll be able to reuse the same permit
    # list between create and update. Also, you can specialize this method
    # with per-user checking of permissible attributes.
    def user_params
      return self.email
    end

end
