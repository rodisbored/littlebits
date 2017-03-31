class InventionsController < ApplicationController
  before_action :set_invention, only: [:show, :edit, :update]

  ALLOWED_INVENTION_PARAMS = [:title, :description, :username, :email, { bits: [String] }, { materials: [String] }]

  # GET /inventions
  # GET /inventions.json
  def index
    @inventions = Invention.all
  end

  # GET /inventions/1
  # GET /inventions/1.json
  def show
  end

  # GET /inventions/new
  def new
    @invention = Invention.new

    # Setup view
  end

  # GET /inventions/1/edit
  def edit
  end

  # POST /inventions
  # POST /inventions.json
  def create
    @invention = Invention.new(invention_params)

    # Create materials here when creating invention.

    respond_to do |format|
      if @invention.save
        format.html { redirect_to @invention, notice: 'Invention was successfully created.' }
        format.json { render :show, status: :created, location: @invention }
      else
        format.html { render :new }
        format.json { render json: @invention.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventions/1
  # PATCH/PUT /inventions/1.json
  def update
    # Add additional materials here when updating an invention if the objects don't already exist.

    respond_to do |format|
      if @invention.update(invention_params)
        format.html { redirect_to @invention, notice: 'Invention was successfully updated.' }
        format.json { render :show, status: :ok, location: @invention }
      else
        format.html { render :edit }
        format.json { render json: @invention.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_invention
    @invention = Invention.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def invention_params
    # params.fetch(:invention, {})
    params.permit(*ALLOWED_INVENTION_PARAMS)
  end
end
