class Veteranarian
  attr_reader :name,
              :customers,
              :pets

  def initialize(name)
    @name = name
    @customers = []
    @pets = []
  end

  def add_customer(customer)
    @customers << customer
  end

  def add_pet(pet)
    @pets << pet
  end

  def pets_by_age
    @pets.sort_by do |pet|
      -pet.age
    end
  end

  def pets_per_customer(customer)
    customer.pets.count
  end

end
