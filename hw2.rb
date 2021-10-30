# frozen_string_literal: true

module Validations

  def length_validator(str, min = nil, max = nil)
    if str.length.zero? || str.nil?
      raise ArgumentError, 'username or text can not be blank'
    elsif min && str.length < min
      raise ArgumentError, "password can not be too short"
    elsif max && str.length > max
      raise ArgumentError, 'text can not be too long'
    else
      puts str
    end
  end
end

class User
  include Validations
  attr_reader :username, :password

  MIN_PASSW_LENGTH = 8

  def initialize(username, password)
    self.username = username
    self.password = password
  end

  def username=(username)
    length_validator(username)
    @username = username
  end

  def password=(password)
    length_validator(password, MIN_PASSW_LENGTH)
    @password = password
  end
end

class Message
  include Validations
  attr_reader :text

  MAX_TEXT_LENGTH = 280

  def initialize(text)
    self.text = text
  end

  def text=(text)
    length_validator(text, MAX_TEXT_LENGTH)
    @text = text
  end
end
