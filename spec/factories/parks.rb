FactoryGirl.define do
  factory :park do
    name('Jurassic Park')
    description('the best place on earth')
    national_park(false)
    state_id(1)
  end
end
