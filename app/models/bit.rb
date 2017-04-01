class Bit < ActiveRecord::Base
  include SharedMethods

  before_validation :set_uuid

  validates_presence_of :oid, :uuid
  validates_uniqueness_of :oid, :uuid
end
