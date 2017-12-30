class Project < ApplicationRecord
	belongs_to :user,optional: true
	mount_uploader :document, AvatarUploader
	has_many :tasks,dependent: :destroy
end