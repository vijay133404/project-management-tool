class Milestone < ApplicationRecord
	belongs_to :task, optional: true
end
