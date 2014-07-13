class Todo < ActiveRecord::Base

belongs_to :user 
validates :description, length: {minimum: 1 }, presence: true

  scope :visible_to, ->(user) { user ? all : where(public: false) }
end
