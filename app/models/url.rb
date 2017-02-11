class Url < ApplicationRecord
	is_impressionable
	validates :uinput, :url => true
	validates :uinput, :uniqueness => true
	
end
