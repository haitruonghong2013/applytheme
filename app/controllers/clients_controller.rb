class ClientsController < ApplicationController
  # GET /clients
  # GET /clients.json
  before_filter :authenticate_user!
  load_and_authorize_resource
  def index

    @clients = Client.paginate(:page => params[:page], :per_page => params[:size]? params[:size]:PAGE_SIZE )

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new
    @client.location = Location.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])
    @client.created_by= current_user.id
    respond_to do |format|
      if @client.save
        format.html { redirect_to clients_url, notice: 'Client was successfully created.' }
        format.json { render json: @client, status: :created, location: @client }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to clients_url, notice: 'Client was successfully updated.' }
        #format.json { head :no_content }
        format.json { render json: @client, status: :ok, location: @client }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  def get_my_client
    @clients = Client.where(:created_by => current_user.id).paginate(:page => params[:page], :per_page => params[:size]? params[:size]:PAGE_SIZE )
    respond_to do |format|
      format.json { render json: @clients }
    end
  end

  def get_all_clients_by_user
    @clients = Client.where(:created_by => params[:staff_id]).paginate(:page => params[:page], :per_page => params[:size]? params[:size]:PAGE_SIZE )
    respond_to do |format|
      format.json { render json: @clients }
    end
  end

  def search_all_clients
    @clients = Client.where(:name => params[:key]).paginate(:page => params[:page], :per_page => params[:size]? params[:size]:PAGE_SIZE )
    respond_to do |format|
      format.json { render json: @clients }
    end
  end

  def search_my_clients
    @clients = Client.where(:created_by => current_user.id,:name => params[:key]).paginate(:page => params[:page], :per_page => params[:size]? params[:size]:PAGE_SIZE )
    respond_to do |format|
      format.json { render json: @clients }
    end
  end

  def search_clients_by_staff
    @clients = Client.where(:created_by => params[:staff_id],:name => params[:key]).paginate(:page => params[:page], :per_page => params[:size]? params[:size]:PAGE_SIZE )
    respond_to do |format|
      format.json { render json: @clients }
    end
  end
end
