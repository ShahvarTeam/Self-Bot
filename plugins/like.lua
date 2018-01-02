local function run(msg, matches)
local bot_like = 190601014
if matches[1]:lower() == 'like' or matches[1]:lower() == 'لایک' then
local function likebot(arg, data)
if data.results_ and data.results_[0] then
tdcli.sendInlineQueryResultMessage(msg.chat_id_, msg.id_, 0, 1, data.inline_query_id_, data.results_[0].id_)
else
tdcli.sendMessage(msg.chat_id_, msg.id_, 0, 1, nil, 'پاسخی از ربات @Like دریافت نکردم، دوباره تلاش کنید', 1, 'md')
end
end
tdcli.getInlineQueryResults(bot_like, msg.chat_id_, 0, 0, matches[2], 0, likebot, nil)
end
end
return {
patterns = {
"^[/#!]([lL][iI][kK][eE]) (.*)",
"^(لایک) (.*)"
},
run = run,
}
