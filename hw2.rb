# frozen_string_literal: true

module Validations
  attr_accessor :str, :type, :max, :min

  def length_validator(str, type, max = 280, min = 8)
    self.str = str
    self.type = type
    self.max = max
    self.min = min

    if (str.length.zero? || str.nil?) && (type.eql?(:username) || type.eql?(:text))
      raise ArgumentError, 'username or text can not be blank'
    elsif str.length > max && type.eql?(:text)
      raise ArgumentError, 'text can not be too long'
    elsif str.length < min && type.eql?(:password)
      raise ArgumentError, 'password can not be too short'
    end
  end
end

class User
  include Validations
  attr_reader :username, :password

  def initialize(username, password)
    self.username = username
    self.password = password
  end

  def username=(username)
    @username = username
    length_validator(username, :username)
  end

  def password=(password)
    @password = password
    length_validator(password, :password)
  end
end

class Message
  include Validations
  attr_reader :text

  def initialize(text)
    self.text = text
  end

  def text=(text)
    @text = text
    length_validator(text, :text)
  end
end
