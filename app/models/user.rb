class User < ApplicationRecord
    validates :name, presence: { message: "を入力してください" }
    validates :email, presence: { message: "を入力してください" }
    validates :email, uniqueness: { message: "はすでに使用されています" }
    validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_validation { email.downcase! }
    has_secure_password
    validates :password, presence: { message: "を入力してください" }
    validates :password, length: {minimum:6,too_short: "は6文字以上で入力してください",}
    validate :password_confirmation_match

    private
  
    def password_confirmation_match
      if password != password_confirmation
        errors.add(:password_confirmation, "とパスワードの入力が一致しません")
      end
    end

end
