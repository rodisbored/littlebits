class Bit < ActiveRecord::Base
  include Shared

  before_create :set_uuid
  validates_presence_of :oid
end
