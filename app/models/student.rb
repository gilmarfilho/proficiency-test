class Student < ActiveRecord::Base
	validates :name, presence: true, length: {minimum: 5, maximum: 25}
	validates :register_number,  presence: true
	validates :status,  presence: true

	belongs_to :classroom
end
