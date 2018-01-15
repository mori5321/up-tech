require 'rails_helper'

describe User do
  it 'has a valid user factory' do
    expect(build(:user)).to be_valid
  end

  it 'has a valid guest factory' do
    expect(build(:guest)).to be_valid
  end

  it 'has a valid manager factory' do
    expect(build(:manager)).to be_valid
  end

  it 'has a valid admin factory' do
    expect(build(:admin)).to be_valid
  end
end