class UserQuestionsController < ApplicationController
  # GET /user_questions
  # GET /user_questions.json
  def index
    @user_questions = UserQuestion.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @user_questions }
    end
  end

  # GET /user_questions/1
  # GET /user_questions/1.json
  def show
    @user_question = UserQuestion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user_question }
    end
  end

  # GET /user_questions/new
  # GET /user_questions/new.json
  def new
    @user_question = UserQuestion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user_question }
    end
  end

  # GET /user_questions/1/edit
  def edit
    @user_question = UserQuestion.find(params[:id])
  end

  # POST /user_questions
  # POST /user_questions.json
  def create
    @user_question = UserQuestion.new(params[:user_question])

    respond_to do |format|
      if @user_question.save
        format.html { redirect_to @user_question, notice: 'User question was successfully created.' }
        format.json { render json: @user_question, status: :created, location: @user_question }
      else
        format.html { render action: "new" }
        format.json { render json: @user_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /user_questions/1
  # PUT /user_questions/1.json
  def update
    @user_question = UserQuestion.find(params[:id])

    respond_to do |format|
      if @user_question.update_attributes(params[:user_question])
        format.html { redirect_to @user_question, notice: 'User question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_questions/1
  # DELETE /user_questions/1.json
  def destroy
    @user_question = UserQuestion.find(params[:id])
    @user_question.destroy

    respond_to do |format|
      format.html { redirect_to user_questions_url }
      format.json { head :no_content }
    end
  end
end
