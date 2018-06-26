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
      @recipientA = setRecipient(Recipient.new)
      @recipientB = setRecipient(Recipient.new)
      @recipientA.save
      @recipientB.save
      @question = Question.create(question_num: q_num, user_id: user_id, donation_type: [*0..1].sample(1).first, recipientA_id: @recipientA.id, recipientB_id: @recipientB.id)
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
    # @question = @question.new(question_params)
    # @question.recipient_choice = 'A' if recipientA?
    # @question.recipient_choice = 'B' if recipientB?
    # if @question.save
    #   redirect_to new_question_path, notice: "Question was successfully updated"
    # else
    #   redirect_to new_question_path, notice: "You should choose between recipient A or B"
    # end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    @question.recipient_choice = 'A' if recipientA?
    @question.recipient_choice = 'B' if recipientB?
    if @question.update(question_params)
      puts(@question.recipient_choice)
      redirect_to new_question_path, notice: 'Question was successfully updated.'
    else
      redirect_to errors_path, notice: "You should choose between recipient A or B"
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

    def setRecipient(recipient)
      # randomly select which question to compare
      organizationSize = [*0..4].sample(1).first
      travelTime = [*0..3].sample(1).first
      foodAccess = [*0..2].sample(1).first
      incomeLevel = [*0..5].sample(1).first
      povertyLevel = nil
      lastDonation = [*0..12].sample(1).first
      totalDonation = [*0..91].sample(1).first
      # last donation & total donation combo
      if lastDonation == 0
        totalDonation = 0
      elsif totalDonation == 0
        lastDonation = 0
      end

      # income level & poverty level combo 
      if incomeLevel == 0
        povertyLevel = [*2..6].sample(1).first
      elsif incomeLevel == 1 or incomeLevel == 2
        povertyLevel = [*0..4].sample(1).first
      else
        povertyLevel = [*0..2].sample(1).first
      end

      # set recipients with corresponding values
      recipient.attributes = {
        organization_size: organizationSize,
        food_access: foodAccess,
        income_level: incomeLevel,
        poverty_level: povertyLevel,
        last_donation: lastDonation,
        total_donation: totalDonation,
        travel_time: travelTime
      }
      return recipient
    end

    def todayRecord(uid)
      possible = Array.new
      today = Date.today
      records = Question.where({user_id: uid})
      records.each do |record|
        recordDate = record.created_at
        if (recordDate.year == today.year) && (recordDate.month == today.month) && (recordDate.day == today.day)
          possible.push(record)
        end
      end
      return possible
    end

    def recipientA?
      params[:commit] == "Recipient A"
    end

    def recipientB?
      params[:commit] == "Recipient B"
    end 

end
