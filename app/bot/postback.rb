class Postback

  attr_reader :payload, :user

  def initialize(payload, user_id)
    @payload = payload
    @user = User.find(user_id)
  end

  def process

    case payload
    when "new_thread"
      send_onboard
    end
  end

  private

  def send_onboard
    [
      {
        type: "text",
        text: "Hey there #{user.first_name}. I’ll send you top stories from your favorite publications. You can view all sources at any time from the menu. You can also subscribe to a publication and receive top stories daily at a scheduled time."
      },
      {
        type: "text",
        text: "Here's the list of publications I have available."
      }
    ] 
  end

end

