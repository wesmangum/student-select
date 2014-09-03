require 'rails_helper'

RSpec.describe Student, :type => :model do
  before  do
    Fabricate(:student, name: "Ask Ketchum")
  end
  it {should validate_presence_of :name}
  it {should validate_uniqueness_of :name}
end
