class InteractionsController < ApplicationController
  before_action :authenticate_user!, except: [:new, :ask]
  before_action :set_interaction, only: [:show]
    
  # GET /interactions
  def new
    # Displays the form where users can submit a new question
  end

  def index
    @interactions = current_user.interactions
    @user = current_user
  end

  def show
    @interaction = Interaction.find(params[:id])
    @user = current_user 
  end

  def ask
    question = params[:question]
    answer_content = OpenAiChatService.new(question).ask
    interaction = current_user.interactions.create(question: question, answer: answer_content)
    
    respond_to do |format|
      if interaction.persisted?
        format.html { redirect_to interaction_path(interaction), notice: "Question asked successfully." }
      else
        format.html { redirect_to new_interaction_path, alert: "Failed to ask question." }
      end
    end
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
