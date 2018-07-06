class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    user_id = current_user.id
    q_num = todayRecord(user_id).length+1
    if q_num<=100
      # initializing recipients
      @recipientA = Recipient.create(
        question_id: nil,
        organization_size: rand(5), 
        food_access: rand(3), 
        income_level: rand(6),
        poverty_level: nil,
        last_donation: rand(13),
        total_donation: rand(91),
        travel_time: rand(4)
        )
      @recipientB = Recipient.create(
        question_id: nil,
        organization_size: rand(5), 
        food_access: rand(3), 
        income_level: rand(6),
        poverty_level: nil,
        last_donation: rand(13),
        total_donation: rand(91),
        travel_time: rand(4)
        )

      # set both recipientA and recipient B's last donation and total donation value logically 
      if @recipientA.last_donation == 0
        @recipientA.total_donation = 0 
      elsif @recipientA.total_donation == 0
        @recipientA.last_donation = 0
      end

      if @recipientB.last_donation == 0
        @recipientB.total_donation = 0 
      elsif @recipientB.total_donation == 0
        @recipientB.last_donation = 0
      end

      # set both recipientA and recipient B's poverty level logically 

      if @recipientA.income_level == 0
        @recipientA.poverty_level = rand(5)+2
      elsif @recipientA.income_level == 1 or @recipientA.income_level == 2
        @recipientA.poverty_level = rand(5)
      else
        @recipientA.poverty_level = rand(3)
      end

      if @recipientB.income_level == 0
        @recipientB.poverty_level = rand(5)+2
      elsif @recipientB.income_level == 1 or @recipientB.income_level == 2
        @recipientB.poverty_level = rand(5)
      else
        @recipientB.poverty_level = rand(3)
      end     

      @question = Question.create(question_num: q_num, user_id: user_id, donation_type: rand(2))
      @recipientA.question_id = @question.id
      @recipientB.question_id = @question.id

      if @recipientA.save && @recipientB.save
        @question.recipientA_id = @recipientA.id
        @question.recipientB_id = @recipientB.id
        @question.save
      end
    else
      redirect_to results_path
    end
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    @question.recipient_choice = 'A' if recipientA?
    @question.recipient_choice = 'B' if recipientB?

    # when clicking submit button 
    if submit? && @question.update(question_params)
      redirect_to new_question_path, success: 'Question was successfully updated.'
    # when clicking End Session Button
    elsif yes?
      puts("Pressed Yes")
      redirect_to results_path, success: "Successfully ended the testing!"
    end
  end


  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.permit(:donation_type, :recipientA_id, :recipientB_id, :user_id)
    end


    def recipientA?
      params[:question][:recipient_choice] == "Recipient A"
    end

    def recipientB?
      params[:question][:recipient_choice] == "Recipient B"
    end 

    def submit?
      params[:commit] == "Submit"
    end

    def endSession?
      params[:commit] == "End Session"
    end

    def yes?
      params[:commit] == "Yes"
    end
end
