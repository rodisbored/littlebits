class BitsController < ApplicationController
  # TODO: Add in routes and api's to create, update, or remove new bits
  def index
    bits = Bit.all
    render locals: { bits: bits }
  end
end
