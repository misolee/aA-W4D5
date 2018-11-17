# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  
  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_length_of(:password).is_at_least(6) }
  
  describe 'session token' do
    it 'asigns a session_token if one is not given' do
      harry = User.create(username: 'harry_potter', password: 'abcdef')
      expect(harry.session_token).not_to be_nil
    end
  end
  
  describe 'password encryption' do 
    it 'does not save passwords to the database' do 
      User.create!(username: 'harry_potter', password: 'abcdef')
      user = User.find_by(username: 'harry_potter')
      expect(user.password).not_to be('abcdef')
    end 
  end 
  
  describe 'find_by_credentials' do 
    it 'finds user' do 
      harry = User.create!(username: 'harry_potter', password: 'abcdef')
      user = User.find_by_credentials('harry_potter', 'abcdef')
      expect(user.id).to eq(harry.id)
    end 
  end 
  
  describe 'is_password?' do 
    it 'checks if the password is the same' do 
      harry = User.create!(username: 'harry_potter', password: 'abcdef')
      expect(harry.is_password?('abcdef')).to be_truthy 
      expect(harry.is_password?('aaaaaaa')).to be_falsey
    end 
  end 
      
end
