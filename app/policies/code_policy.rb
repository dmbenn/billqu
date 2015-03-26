class CodePolicy < ApplicationPolicy
  
   class Scope
     attr_reader :user, :scope
 
     def initialize(user, scope)
       @user = user
       @scope = scope
     end
 
     def resolve
       codes = []
       if user.role == 'admin'
         codes = scope.all # if the user is an admin, show them all the codes
       elsif user.role == 'premium'
         all_codes = scope.all
         all_codes.each do |code|
           if code.public? || code.user == user || code.users.include?(user)
             codes << code # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
           end
         end
       else # this is the lowly standard user
         all_codes = scope.all
         codes = []
         all_codes.each do |code|
           if code.public? || code.users.include?(user)
             codes << code # only show standard users public wikis and private wikis they are a collaborator on
           end
         end
       end
       codes # return the wikis array we've built up
     end
   end
end