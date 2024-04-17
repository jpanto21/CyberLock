class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :ask]
  before_action :set_interaction, only: [:show]

  def new
    # Displays the form where users can submit a new question
  end

  def ask
    question = params[:question]
    answer_content = OpenAiChatService.new(question).ask
    interaction = current_user.interactions.create(question: question, answer: answer_content)
    
    respond_to do |format|
      if interaction.persisted?
        format.html { redirect_to show_question_path(interaction), notice: "Question asked successfully." }
      else
        format.html { redirect_to new_question_path, alert: "Failed to ask question." }
      end
    end
  end

  def show
    # @interaction is set by set_interaction
    # Assuming you want to display the user associated with the interaction:
    @user = @interaction.user
  end

  private

  def set_interaction
    # This ensures that only interactions belonging to the current user can be accessed
    @interaction = current_user.interactions.find_by(id: params[:id])
    if @interaction.nil?
      redirect_to root_path, alert: "Question not found."
    end
  end
end
