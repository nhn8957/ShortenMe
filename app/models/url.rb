class Url < ApplicationRecord
	is_impressionable
	validates :original_url, :url => true
	validates :original_url, :uniqueness => true

end
