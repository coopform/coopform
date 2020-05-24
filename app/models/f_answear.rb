class FAnswear < ApplicationRecord

    def self.get_for_user(id)
        a = where(:user_id => id)
        result = {}
        a.each {|a|
            result[a.number] = a.value
        }
        return result
    end

end