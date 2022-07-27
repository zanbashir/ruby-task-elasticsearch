class Category < ApplicationRecord
  include Indexes::CategoryConcern
  include UniquenessConcern

  belongs_to :vertical
  has_many   :courses, dependent: :destroy

  validates :name, :state, presence: true
  validate :name_uniqueness

  scope :by_name, ->(name) { where('name iLike ?', name) }

  enum state: %i[active inactive]

  accepts_nested_attributes_for :courses, allow_destroy: true

  after_commit :update_index
end
