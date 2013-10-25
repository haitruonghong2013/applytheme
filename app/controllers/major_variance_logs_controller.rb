class MajorVarianceLogsController < ApplicationController
  # GET /major_variance_logs
  # GET /major_variance_logs.json
  def index
    @major_variance_logs = MajorVarianceLog.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @major_variance_logs }
    end
  end

  # GET /major_variance_logs/1
  # GET /major_variance_logs/1.json
  def show
    @major_variance_log = MajorVarianceLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @major_variance_log }
    end
  end

  # GET /major_variance_logs/new
  # GET /major_variance_logs/new.json
  def new
    @major_variance_log = MajorVarianceLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @major_variance_log }
    end
  end

  # GET /major_variance_logs/1/edit
  def edit
    @major_variance_log = MajorVarianceLog.find(params[:id])
  end

  # POST /major_variance_logs
  # POST /major_variance_logs.json
  def create
    @major_variance_log = MajorVarianceLog.new(params[:major_variance_log])

    respond_to do |format|
      if @major_variance_log.save
        format.html { redirect_to @major_variance_log, notice: 'Major variance log was successfully created.' }
        format.json { render json: @major_variance_log, status: :created, location: @major_variance_log }
      else
        format.html { render action: "new" }
        format.json { render json: @major_variance_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /major_variance_logs/1
  # PUT /major_variance_logs/1.json
  def update
    @major_variance_log = MajorVarianceLog.find(params[:id])

    respond_to do |format|
      if @major_variance_log.update_attributes(params[:major_variance_log])
        format.html { redirect_to @major_variance_log, notice: 'Major variance log was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @major_variance_log.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /major_variance_logs/1
  # DELETE /major_variance_logs/1.json
  def destroy
    @major_variance_log = MajorVarianceLog.find(params[:id])
    @major_variance_log.destroy

    respond_to do |format|
      format.html { redirect_to major_variance_logs_url }
      format.json { head :no_content }
    end
  end
end
