class Task < ApplicationRecord
	belongs_to :project ,optional: true
	
	has_many :dependencies,dependent: :destroy
end
