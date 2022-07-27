module UniquenessConcern
  extend ActiveSupport::Concern

  def name_uniqueness
    errors.add(:base, "#{self.class.name} Name already taken") if self.class.by_name(name).any?
  end
end
