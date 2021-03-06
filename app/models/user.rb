class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password,:password_confirmation

  validates_presence_of :email, message: "邮箱不能为空"
  validates :email, uniqueness: true

  validates_presence_of :password, message: "密码不能为空", if: :need_validate_password
  validates_presence_of :password_confirmation, message: "密码确认不能为空", if: :need_validate_password
  validates_confirmation_of :password, message: "密码不一致", if: :need_validate_password
  validates :password, length: { minimum: 6, too_short: "密码最短%{count}位)" }, if: :need_validate_password

  private
    def need_validate_password
      self.new_record? || (!self.password.nil? or !self.password_confirmation.nil?)
    end
end
