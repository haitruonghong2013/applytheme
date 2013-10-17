class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index
    #@meetings = Meeting.all
    @meeting = Meeting.paginate(:page => params[:page], :per_page => params[:size]? params[:size]:PAGE_SIZE )
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meetings }
    end
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    @meeting = Meeting.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/1/edit
  def edit
    @meeting = Meeting.find(params[:id])
  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(params[:meeting])
    @meeting.created_by= current_user.id

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: 'Meeting was successfully created.' }
        format.json { render json: @meeting, status: :created, location: @meeting }
      else
        format.html { render action: "new" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = Meeting.find(params[:id])
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :no_content }
    end
  end


  def get_my_meetings
    @meetings = Meeting.where(:created_by => current_user.id).paginate(:page => params[:page], :per_page => params[:size]? params[:size]:PAGE_SIZE )
    respond_to do |format|
      format.json { render json: @meetings }
    end
  end

  def get_meetings_by_staff
    @meetings = Meeting.where(:created_by => params[:staff_id]).paginate(:page => params[:page], :per_page => params[:size]? params[:size]:PAGE_SIZE )
    respond_to do |format|
      format.json { render json: @meetings }
    end
  end
end
