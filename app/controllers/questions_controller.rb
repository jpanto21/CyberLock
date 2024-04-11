# app/controllers/questions_controller.rb
class QuestionsController < ApplicationController
  def new
    # Display the form for asking a question
  end

def show
  @answer = session[:answer]
end

  def ask
    question = params[:question]
     # Initialize the service and directly call .ask on it to get the answer
     @answer = OpenAiChatService.new(question).ask
      puts "JHGBGYBGYBUH" + @answer
      respond_to do |format|
        if @answer.presence
          session[:answer] = @answer
          format.html { redirect_to show_question_path, notice: "Successfully created." }
          # format.json { render :show, status: :created, location: @organization }
        else
          format.html { redirect_to new_question_path, alert: "Unsuccessfully created." }
          # format.json { render json: @organization.errors, status: :unprocessable_entity }
        end
      end
  end 
end
