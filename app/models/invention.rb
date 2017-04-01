class Invention < ActiveRecord::Base
  include SharedMethods

  serialize :bits, Array
  serialize :materials, Array

  before_validation :set_uuid, :set_creator

  validates_presence_of :uuid, :title, :description, :bits, :creator_id
  validates_uniqueness_of :uuid

  private
  def set_creator
    # Hardcoding creator for now since we do not have user login, but would determine which user can edit the invention
    self.creator_id = 1
  end
end
