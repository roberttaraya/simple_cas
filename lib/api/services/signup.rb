module Api::Services
  class Signup
    attr_reader :email, :user, :status

    def initialize email: nil, password: nil
      @email = email
      @password = password
    end

    def call
      @user = User.new email: @email
      @encrypted_password = Digest::SHA1.hexdigest @password
      @user.encrypted_password = @encrypted_password
      if @user.save
        @status = :ok
      end
    end
  end
end
