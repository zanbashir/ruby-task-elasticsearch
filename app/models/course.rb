class Course < ApplicationRecord
  include Indexes::CourseConcern

  belongs_to :category

  validates :name, :author, :state, presence: true
  validates :name, uniqueness: { scope: [:category_id, :author] }

  enum state: %i[active inactive]

  after_commit :update_index
end
