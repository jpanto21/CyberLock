# app/services/open_ai_chat_service.rb
require 'openai'

class OpenAiChatService
  def initialize(question)
    @question = question
  end

  def ask
    client = OpenAI::Client.new(access_token: Rails.application.credentials.openai[:api_key])

    response = client.chat(
      parameters:{
      model: "gpt-4-0125-preview",  # Adjust model as needed
      messages: [
        { role: "user", content: @question }
      ],
      temperature: 0.7
    })

    content= response.dig("choices", 0, "message", "content")
  rescue => e
    puts "Error: #{e}"
    "Sorry, we couldn't process your question."
  end
end
