require 'telegram/bot'
require 'json'
# token = '344332555:AAH-wGajr3-DC2WTOJ1wAAcxWKUTHbeA9TI'


token = JSON.parse(File.read("./ressources/config/default.json"))["token"];

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end
