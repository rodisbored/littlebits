class Invention < ActiveRecord::Base
  include SharedMethods

  serialize :bits, Array
  serialize :materials, Array

  before_validation :set_uuid, :set_creator
  before_save :add_materials

  validates_presence_of :uuid, :title, :description, :bits, :creator_id
  validates_uniqueness_of :uuid

  private
  def set_creator
    # Hardcoding creator for now since we do not have user login, but would determine which user can edit the invention
    self.creator_id = 1
  end

  def add_materials
    # Probably would want to optimize this so it could insert in bulk after figuring out which
    # materials are already in the list
    materials.each do |material|
      Material.create(name: material)
    end
  rescue => e
    # Probably don't care, but could log or do other things
  end
end
