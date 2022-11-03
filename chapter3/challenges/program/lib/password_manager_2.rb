class PasswordManager2
    #initiate using an empty list, contains hashemap hash containing a hash set of system:pass and dateadded:date
    #e.g. [{service:x, password:y date_added:z}, etc]
    def initialize
        @pwm = []
    end
    
    #stores service and password
    #unless password is not unique -> password_exists?
    #or service already has a stored password 
    def add(service,password)
        if !password_exists?(password)
            if !service_exists?(service)
                @pwm << {service: service,
                        password: password,
                        added_on: Time.now}
            else
                return "ERROR: Service names must be unique"
            end
        else
            return "ERROR: Passwords must be unique"
        end
    end

    #deletes service and password
    def remove(service)
        @pwm.delete(@pwm.find {|serv| serv[:service]==service})
    end

    #lists services which has a password -> password_exists?
    def services
        @pwm.map {|serv| serv[:service]}
    end

    #sorts by list and returns services sorted as such
    def sort_by(list)
        if list == "service"
            services().sort
        elsif list == "added_on"
            return @pwm.sort_by! {|date| date[:date_added]}.reverse.map {|x| x[:service]}
        else 
            return "please enter service or added_on"
        end
    end

    #returns password for service
    def password_for(service)
        @pwm.find {|serv| serv[:service]==service}[:password]
    end
    
    #updates password 
    #unless password already exists -> password_exists?
    def update(service, new_password)
        if !password_exists?(new_password)
            @pwm.find {|serv| serv[:service]==service}[:password] = new_password
        else
            return "ERROR: not updated password is not unique"
        end
    end

    #check is password already exists within the list and returns true if so
    def password_exists?(password)
        if @pwm.empty?
            return false 
        elsif @pwm.map {|pass| pass[:password]}.include?(password)
            return true
        else
            return false
        end
    end

        #checks to see if service exists within the list and returns true if so
    def service_exists?(service)
        if @pwm.empty?
            return false
        #checks if :service => service is within the pwm
        elsif @pwm.find {|serv| serv[:service]}[:service] == service
            return true
        else
            return false
        end
    end

end

