class Book < ApplicationRecord
	belongs :user

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
