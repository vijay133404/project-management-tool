class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #has_many :projects
         belongs_to :team,optional:true
          has_many :project_users
          has_many :projects,:through=>:project_users
end
