class List < ActiveRecord::Base
	belongs_to :listable, polymorphic: true
	has_many :lists , as: :listable, dependent: :destroy
	validates :list_text, presence: true


end
