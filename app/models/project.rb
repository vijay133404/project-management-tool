class Project < ApplicationRecord
	# belongs_to :user,optional:true
	mount_uploader :document, AvatarUploader
	has_many :tasks,dependent: :destroy
	has_many :project_teams
	has_many :teams, through: :project_teams
	has_many :project_users
    has_many :users,:through=>:project_users
end