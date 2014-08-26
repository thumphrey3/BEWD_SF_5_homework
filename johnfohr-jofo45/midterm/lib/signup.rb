class Signup
  attr_accessor :email, :name, :sex, :date_of_birth, :accounts_linked

  def initialize(email, name)
    @email = email
    @name = name

    @sex = sex
    @date_of_birth = date_of_birth
    @accounts_linked = []
   end

end


