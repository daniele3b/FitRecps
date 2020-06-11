module AggimpHelper
    def listamitutto
        @users = User.where(employee: true)
        #@users.each do |user|      
        #    user.cognome
        #end
    end
end
