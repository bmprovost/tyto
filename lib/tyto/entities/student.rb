module Tyto
  class Student < Entity
    attr_reader :username, :email, :phone_number
    attr_accessor :id, :password_digest, :assignments
    validates_presence_of :username, :email, :phone_number

    def correct_password?(password)
      @password_digest == password
    end
  end
end
