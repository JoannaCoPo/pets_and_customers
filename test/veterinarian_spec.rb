require 'rspec'
require './lib/veterinarian'
require './lib/customer'
require './lib/pet'


RSpec.describe Veteranarian do
  it 'exists' do
    veteranarian = Veteranarian.new("Dr. Doolittle")
    expect(veteranarian).to be_an_instance_of(Veteranarian)
  end

  it "has attributes" do
    veteranarian = Veteranarian.new("Dr. Doolittle")
    expect(veteranarian.name).to eq("Dr. Doolittle")
  end

  it 'has customers' do
    veteranarian = Veteranarian.new("Dr. Doolittle")
    joel = Customer.new("Joel", 2)
    expect(veteranarian.customers).to eq([])
    veteranarian.add_customer(joel)
    expect(veteranarian.customers).to eq([joel])
  end

  it 'has pets under care' do
    veteranarian = Veteranarian.new("Dr. Doolittle")
    lucy = Pet.new({name: "Lucy", type: :cat, age: 4})
    samson = Pet.new({name: "Samson", type: :dog, age: 7})
    expect(veteranarian.pets).to eq([])
    veteranarian.add_pet(lucy)
    veteranarian.add_pet(samson)
    expect(veteranarian.pets).to eq([lucy, samson])
    expect(veteranarian.pets_by_age).to eq([samson, lucy])
  end

  it 'has number of pets per customer' do
    veteranarian = Veteranarian.new("Dr. Doolittle")
    joel = Customer.new("Joel", 2)
    lucy = Pet.new({name: "Lucy", type: :cat, age: 4})
    samson = Pet.new({name: "Samson", type: :dog, age: 7})
    joel.adopt(lucy)
    joel.adopt(samson)
    expect(veteranarian.pets_per_customer(joel)).to eq(2)
  end
end
