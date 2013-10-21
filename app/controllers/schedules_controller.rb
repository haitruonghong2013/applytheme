class SchedulesController < ApplicationController
  # GET /schedules
  # GET /schedules.json
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    if params[:schedule_date]
      @schedules = Schedule.where(:schedule_date => params[:schedule_date]).paginate(:page => params[:page], :per_page => params[:size]? params[:size]:PAGE_SIZE )
    else
      @schedules = Schedule.paginate(:page => params[:page], :per_page => params[:size]? params[:size]:PAGE_SIZE )
    end


    respond_to do |format|
      format.html # index.html.erb

      #format.json { render json: @schedules.to_json(:include => :meetings) }
      format.json { render json: @schedules.to_json(:include => {:meetings => { :only => [:client_id, :meeting_duration,:meeting_time]}}) }
    end
  end

  # GET /schedules/1
  # GET /schedules/1.json
  def show
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/new
  # GET /schedules/new.json
  def new
    @schedule = Schedule.new
    @clients = Client.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @schedule }
    end
  end

  # GET /schedules/1/edit
  def edit
    @schedule = Schedule.find(params[:id])
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = Schedule.new(params[:schedule])
    start_time = DateTime.parse(params[:schedule][:schedule_date] +' '+ params[:schedule][:start_time])
    end_time = DateTime.parse(params[:schedule][:schedule_date] +' '+ params[:schedule][:end_time])
    @schedule.start_time = start_time
    @schedule.end_time = end_time
    @schedule.created_by = current_user.id

    #add meetings
    if params[:meeting] and params[:meeting].length != 0
      params[:meeting].each do |meeting_item|
        meeting = Meeting.new()
        meeting.client_id = meeting_item[1][:id]
        meeting.save
      end
    end

    respond_to do |format|
      if @schedule.save
        format.html { redirect_to schedules_url, notice: 'Schedule was successfully created.' }
        format.json { render json: @schedule, status: :created, location: @schedule }
      else
        format.html { render action: "new" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /schedules/1
  # PUT /schedules/1.json
  def update
    @schedule = Schedule.find(params[:id])

    respond_to do |format|
      if @schedule.update_attributes(params[:schedule])
        format.html { redirect_to schedules_url, notice: 'Schedule was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule = Schedule.find(params[:id])
    @schedule.destroy

    respond_to do |format|
      format.html { redirect_to schedules_url }
      format.json { head :no_content }
    end
  end
end
