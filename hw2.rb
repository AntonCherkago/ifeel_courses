# frozen string literal true

module Validations
  MIN_LENGTH = 8
  MAX_LENGTH = 280

  def validator(str)
    if str.length == 0 || str == nil
      raise ArgumentError.new('password & text can not be blank or nil')
    elsif str.length > MAX_LENGTH && str == @text
      raise ArgumentError.new('text can not be too long')
    elsif str.length < MIN_LENGTH && str == @password
      raise ArgumentError.new('password can not be too short')
    else
      puts str
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
    validator(username)
  end

  def password=(password)
    @password = password
    validator(password)
  end
end

class Message
  include Validations
  attr_accessor :text

  def initialize(text)
    self.text = text
  end

  def text=(text)
    @text = text
    validator(text)
  end
end
