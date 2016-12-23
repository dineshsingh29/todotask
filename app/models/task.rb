class Task < ActiveRecord::Base
	belongs_to :user, class_name: 'User'
	has_many :lists, as: :listable, dependent: :destroy
end
