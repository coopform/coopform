class User < ApplicationRecord

    before_create :confirmation_token
  
    validates :email, presence: true, :format => /@/, uniqueness: {case_sensitive: false}
    validates :name, presence: true
    validates :surname, presence: true
  
    def email_activate
      self.email_confirmed = true
      self.confirm_token = nil
      save!(:validate => false)
    end
  
    has_secure_password
    
    private
  
    def confirmation_token
      if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
    end
  
end
  