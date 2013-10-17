class PushNotificationsController < ApplicationController
  # GET /push_notifications
  # GET /push_notifications.json
  def index
    @push_notifications = PushNotification.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @push_notifications }
    end
  end

  # GET /push_notifications/1
  # GET /push_notifications/1.json
  def show
    @push_notification = PushNotification.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @push_notification }
    end
  end

  # GET /push_notifications/new
  # GET /push_notifications/new.json
  def new
    @push_notification = PushNotification.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @push_notification }
    end
  end

  # GET /push_notifications/1/edit
  def edit
    @push_notification = PushNotification.find(params[:id])
  end

  # POST /push_notifications
  # POST /push_notifications.json
  def create
    @push_notification = PushNotification.new(params[:push_notification])

    respond_to do |format|
      if @push_notification.save
        format.html { redirect_to @push_notification, notice: 'Push notification was successfully created.' }
        format.json { render json: @push_notification, status: :created, location: @push_notification }
      else
        format.html { render action: "new" }
        format.json { render json: @push_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /push_notifications/1
  # PUT /push_notifications/1.json
  def update
    @push_notification = PushNotification.find(params[:id])

    respond_to do |format|
      if @push_notification.update_attributes(params[:push_notification])
        format.html { redirect_to @push_notification, notice: 'Push notification was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @push_notification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /push_notifications/1
  # DELETE /push_notifications/1.json
  def destroy
    @push_notification = PushNotification.find(params[:id])
    @push_notification.destroy

    respond_to do |format|
      format.html { redirect_to push_notifications_url }
      format.json { head :no_content }
    end
  end
end
