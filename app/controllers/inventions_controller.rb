class InventionsController < ApplicationController
  before_action :set_invention, only: [:show, :edit, :update]

  ALLOWED_INVENTION_CREATE_UPDATE_PARAMS = [:title, :description, :username, :email, { bits: [] }, {materials: [] }]
  ALLOWED_INVENTION_INDEX_PARAMS = [:sort_order, :sort_by]
  INDEX_SORT = %w(title username)
  SORT_ORDER_PARAMS = %w(asc desc)

  # GET /inventions.json
  def index
    inventions = Invention.all
    order_direction = SORT_ORDER_PARAMS.include?(index_params[:sort_order]) ? index_params[:sort_order].to_sym : :asc
    inventions = if INDEX_SORT.include?(index_params[:sort_by])
      inventions.order(index_params[:sort_by].to_sym => order_direction)
    else
      inventions.order(title: order_direction)
    end

    render locals: { inventions: inventions }
  end

  # GET /inventions/1.json
  def show
    render locals: { invention: @invention}
  end

  # GET /inventions/new
  def new
    @invention = Invention.new
  end

  # GET /inventions/1/edit
  def edit
  end

  # POST /inventions
  # POST /inventions.json
  def create
    @invention = Invention.new(create_update_params)

    if @invention.save
      render :show, status: :created, location: @invention
    else
      render json: @invention.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /inventions/1
  # PATCH/PUT /inventions/1.json
  def update
    if @invention.update(create_update_params)
      render :show, status: :ok, location: @invention
    else
      render json: @invention.errors, status: :unprocessable_entity
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_invention
    @invention = Invention.find_by_id(params[:id]) || Invention.find_by_uuid(params[:id])
    unless @invention
      msg = "Could not find invention with id or uuid: #{params[:id]}"
      Rails.logger.info(msg)
      render json: msg, status: :not_found
    end
  end

  def index_params
    params.permit(*ALLOWED_INVENTION_INDEX_PARAMS)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def create_update_params
    params.permit(*ALLOWED_INVENTION_CREATE_UPDATE_PARAMS)
  end

  def validate_bits
    bit_oids = create_update_params[:bits].uniq
    if bit_oids.count.zero?
      Rails.logger.error('Bits param is empty')
      head :unprocessable_entity
    elsif Bit.where(oid: bit_oids).count != bit_oids.count
      Rails.logger.error("Invalid bits included in bit array. Bits: #{bit_oids}")
      head :unprocessable_entity
    end
  end
end
