class StaffTrackingPositionsController < ApplicationController
  # GET /staff_tracking_positions
  # GET /staff_tracking_positions.json
  def index
    @staff_tracking_positions = StaffTrackingPosition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @staff_tracking_positions }
    end
  end

  # GET /staff_tracking_positions/1
  # GET /staff_tracking_positions/1.json
  def show
    @staff_tracking_position = StaffTrackingPosition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @staff_tracking_position }
    end
  end

  # GET /staff_tracking_positions/new
  # GET /staff_tracking_positions/new.json
  def new
    @staff_tracking_position = StaffTrackingPosition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @staff_tracking_position }
    end
  end

  # GET /staff_tracking_positions/1/edit
  def edit
    @staff_tracking_position = StaffTrackingPosition.find(params[:id])
  end

  # POST /staff_tracking_positions
  # POST /staff_tracking_positions.json
  def create
    @staff_tracking_position = StaffTrackingPosition.new(params[:staff_tracking_position])

    respond_to do |format|
      if @staff_tracking_position.save
        format.html { redirect_to @staff_tracking_position, notice: 'Staff tracking position was successfully created.' }
        format.json { render json: @staff_tracking_position, status: :created, location: @staff_tracking_position }
      else
        format.html { render action: "new" }
        format.json { render json: @staff_tracking_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /staff_tracking_positions/1
  # PUT /staff_tracking_positions/1.json
  def update
    @staff_tracking_position = StaffTrackingPosition.find(params[:id])

    respond_to do |format|
      if @staff_tracking_position.update_attributes(params[:staff_tracking_position])
        format.html { redirect_to @staff_tracking_position, notice: 'Staff tracking position was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @staff_tracking_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /staff_tracking_positions/1
  # DELETE /staff_tracking_positions/1.json
  def destroy
    @staff_tracking_position = StaffTrackingPosition.find(params[:id])
    @staff_tracking_position.destroy

    respond_to do |format|
      format.html { redirect_to staff_tracking_positions_url }
      format.json { head :no_content }
    end
  end
end
