class Project < ActiveRecord::Base
    has_many :teams
	has_many :stories
	has_many :sprints
end
