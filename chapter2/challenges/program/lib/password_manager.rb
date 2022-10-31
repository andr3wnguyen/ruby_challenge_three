class PasswordManager
    def initialize
        @hash = {}
    end

    def add(service, password)
        if password.length > 7 && password.match?(/[!@£$&%]/)
            @hash[service] = password
        end
    end

    def password_for(service)
        return @hash[service]
    end

    def services
        return @hash.keys
    end
end
