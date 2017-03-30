class Invention < ActiveRecord::Base
  serialize :bits, Array
  serialize :materials, Array

  validates_presence_of :uuid, :title, :description, :bits, :creator_id

  before_create :set_uuid, :set_creator

  private
  def set_uuid
    self.uuid ||= SecureRandom.uuid
  end

  def set_creator
    # Hardcoding creator for now since we do not have user login, but would determine which user can edit the invention
    self.creator_id = 1
  end
end
