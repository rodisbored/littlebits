class Material < ActiveRecord::Base
  include SharedMethods

  before_validation :set_uuid

  validates_presence_of :name, :uuid
  validates_uniqueness_of :name, :uuid
end
