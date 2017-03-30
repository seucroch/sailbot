# app/bot/listen.rb
require "facebook/messenger"
include Facebook::Messenger
# cut from line below append with out space (access_token: ENV["ACCESS_TOKEN"])
Facebook::Messenger::Subscriptions.subscribe
# message.id          # => 'mid.1457764197618:41d102a3e1ae206a38'
# message.sender      # => { 'id' => '1008372609250235' }
# message.seq         # => 73
# message.sent_at     # => 2016-04-22 21:30:36 +0200
# message.text        # => 'Hello, bot!'
# message.attachments # => [ { 'type' => 'image', 'payload' => { 'url' => 'https://www.example.com/1.jpg' } } ]

Bot.on :message do |message|

  brain = Brain.new
  brain.set_message(message)
  brain.start_typing
  brain.create_log
  brain.process_message
  brain.stop_typing

end

Bot.on :postback do |postback|

  brain = Brain.new
  brain.set_postback(postback)
  brain.start_typing
  brain.create_log
  brain.process_postback
  brain.stop_typing

end