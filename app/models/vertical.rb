class Vertical < ApplicationRecord
  include Indexes::VerticalConcern
  include UniquenessConcern
  has_many :categories, dependent: :destroy

  validates :name, presence: true
  validate :name_uniqueness

  scope :by_name, ->(name) { where('name iLike ?', name) }

  accepts_nested_attributes_for :categories, allow_destroy: true

  after_commit :update_index
end
