class UserQuestionsController < ApplicationController
  before_action :set_user_question, only: [:show, :edit, :update, :destroy]

  # GET /user_questions
  # GET /user_questions.json
  def index
    @user_questions = UserQuestion.all
  end

  # GET /user_questions/1
  # GET /user_questions/1.json
  def show
  end

  # GET /user_questions/new
  def new
    @user_question = UserQuestion.new
  end

  # GET /user_questions/1/edit
  def edit
  end

  # POST /user_questions
  # POST /user_questions.json
  def create
    
    @user_question = UserQuestion.new(user_question_params)

    respond_to do |format|
      if @user_question.save
        format.html { redirect_to @user_question, notice: 'User question was successfully created.' }
        format.json { render :show, status: :created, location: @user_question }
      else
        format.html { render :new }
        format.json { render json: @user_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_questions/1
  # PATCH/PUT /user_questions/1.json
  def update
    respond_to do |format|
      if @user_question.update(user_question_params)
        format.html { redirect_to @user_question, notice: 'User question was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_question }
      else
        format.html { render :edit }
        format.json { render json: @user_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_questions/1
  # DELETE /user_questions/1.json
  def destroy
    @user_question.destroy
    respond_to do |format|
      format.html { redirect_to user_questions_url, notice: 'User question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_question
      @user_question = UserQuestion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_question_params
      params.require(:user_question).permit(:recipient_choice, :question_num)
    end
end
