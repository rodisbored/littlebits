class MaterialsController < ApplicationController
  def index
    materials = Material.all
    render locals: { materials: materials }
  end
end
