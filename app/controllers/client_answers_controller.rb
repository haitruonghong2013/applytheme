class ClientAnswersController < ApplicationController
  # GET /client_answers
  # GET /client_answers.json
  def index
    @client_answers = ClientAnswer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @client_answers }
    end
  end

  # GET /client_answers/1
  # GET /client_answers/1.json
  def show
    @client_answer = ClientAnswer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @client_answer }
    end
  end

  # GET /client_answers/new
  # GET /client_answers/new.json
  def new
    @client_answer = ClientAnswer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client_answer }
    end
  end

  # GET /client_answers/1/edit
  def edit
    @client_answer = ClientAnswer.find(params[:id])
  end

  # POST /client_answers
  # POST /client_answers.json
  def create
    @client_answer = ClientAnswer.new(params[:client_answer])

    respond_to do |format|
      if @client_answer.save
        format.html { redirect_to @client_answer, notice: 'Client answer was successfully created.' }
        format.json { render json: @client_answer, status: :created, location: @client_answer }
      else
        format.html { render action: "new" }
        format.json { render json: @client_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /client_answers/1
  # PUT /client_answers/1.json
  def update
    @client_answer = ClientAnswer.find(params[:id])

    respond_to do |format|
      if @client_answer.update_attributes(params[:client_answer])
        format.html { redirect_to @client_answer, notice: 'Client answer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client_answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client_answers/1
  # DELETE /client_answers/1.json
  def destroy
    @client_answer = ClientAnswer.find(params[:id])
    @client_answer.destroy

    respond_to do |format|
      format.html { redirect_to client_answers_url }
      format.json { head :no_content }
    end
  end
end
