require 'test_helper'

module Api::Services
  describe Signup do
    attr_reader :service

    before do
      @service = Signup.new(email: "robert@example.com", password: "password")
      service.call
    end

    it "encrypts the password" do
      assert service.user.encrypted_password.length > 32,
        "Expect password to be greater than 32, got #{service.user.encrypted_password.length}."
    end

    it "saves the user" do
      service.user.id.wont_be_nil
    end

    it "has a created_at timestamp" do
      service.user.created_at.must_be :<, Time.now
    end

    it "signs up a user" do
      service.status.must_equal :ok
    end
  end
end
