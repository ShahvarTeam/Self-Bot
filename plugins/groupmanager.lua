--begin groupmanager by @BeyondTeam :)
--This Is Self Bot Based On BDReborn :D
--Edit & Persian-making By @Majhoiboy ;)
local function action_by_reply(arg, data)
   local cmd = arg.cmd
  if data.sender_user_id_ then
   if cmd == "inv" or cmd == "دعوت" then
 invite_user(data.sender_user_id_, data.chat_id_)
   end
   if cmd == "kick" or cmd == "اخراج" then
 kick_user(data.sender_user_id_, data.chat_id_)
   end
  if cmd == "delall" or cmd == "حذف همه" then
tdcli.deleteMessagesFromUser(data.chat_id_, data.sender_user_id_, dl_cb, nil)
   end
   if cmd == "id" or cmd == "شناسه" then
    tdcli.sendMessage(data.chat_id_, "", 0, "*"..data.sender_user_id_.."*", 0, "md")
   end
else
  return tdcli.sendMessage(data.chat_id_, "", 0, "*User not founded*", 0, "md")
     end
  end

local function action_by_username(arg, data)
   local cmd = arg.cmd
  if data.id_ then
   if cmd == "inv" or cmd == "دعوت" then
 invite_user(data.id_, arg.chat_id)
   end
   if cmd == "kick" or cmd == "اخراج" then
 kick_user(data.id_, arg.chat_id)
   end
   if cmd == "delall" or cmd == "حذف همه" then
tdcli.deleteMessagesFromUser(arg.chat_id, data.id_, dl_cb, nil)
   end
   if cmd == "id" or cmd == "شناسه" then
     tdcli.sendMessage(arg.chat_id, "", 0, "*"..data.id_.."*", 0, "md")
   end
else
  return tdcli.sendMessage(arg.chat_id, "", 0, "*User not founded*", 0, "md")
     end
  end

local function run(msg, matches)
   local chat = msg.to.id
   local user = msg.from.id
  if is_sudo(msg) then
if matches[1] == "gpid" or matches[1] == "شناسه گروه" then
if not matches[2] and not msg.reply_id then
     if chat:match("-100") then
    gpid = string.gsub(chat, "-100", "")
        else
    gpid = string.gsub(chat, "-", "")
   end
return "*Group ID :* _"..gpid.."_"
  end
end
if matches[1] == "id" or matches[1] == "شناسه" then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="id"})
  end
if matches[2] and not msg.reply_id then
   tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="id"})
      end
   end
 if matches[1] == "kick" or matches[1] == "اخراج" then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_to_message_id_
    }, action_by_reply, {chat_id=msg.to.id,cmd="kick"})
end
  if matches[2] and string.match(matches[2], '^%d+$') and not msg.reply_id then
   kick_user(matches[2], msg.to.id)
   end
  if matches[2] and not string.match(matches[2], '^%d+$') and not msg.reply_id then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="kick"})
         end
      end
if matches[1] == "inv"or matches[1] == "دعوت" then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="inv"})
end
  if matches[2] and string.match(matches[2], '^%d+$') and not msg.reply_id then
   invite_user(matches[2], msg.to.id)
   end
  if matches[2] and not string.match(matches[2], '^%d+$') and not msg.reply_id then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="inv"})
         end
      end
 if matches[1] == "delall" or matches[1] == "حذف همه" and msg.to.type == "channel" then
if not matches[2] and msg.reply_id then
    tdcli_function ({
      ID = "GetMessage",
      chat_id_ = msg.to.id,
      message_id_ = msg.reply_id
    }, action_by_reply, {chat_id=msg.to.id,cmd="delall"})
end
  if matches[2] and string.match(matches[2], '^%d+$') and not msg.reply_id then
tdcli.deleteMessagesFromUser(msg.to.id, matches[2], dl_cb, nil)
   end
  if matches[2] and not string.match(matches[2], '^%d+$') and not msg.reply_id then
    tdcli_function ({
      ID = "SearchPublicChat",
      username_ = matches[2]
    }, action_by_username, {chat_id=msg.to.id,username=matches[2],cmd="delall"})
         end
      end
if matches[1] == 'setlink'or matches[1] == 'تنظیم لینک' then
            hash = 'gplink:'..chat
            redis:set(hash, matches[2])
    return "*Newlink* _has been set_"
  end
    if matches[1] == 'link'or matches[1] == 'لینک' and is_sudo(msg) then
            hash = 'gplink:'..chat
            local linkgp = redis:get(hash)
            if not linkgp then
     return "_First set a link with_ *using ➣ /setlink link*"
         end
        tdcli.sendMessage(user, "", 1, "<b>Group Link :</b>\n"..linkgp, 1, 'html')
            return "_Link was send in your private message_"
     end
if matches[1] == "setname"or matches[1] == "تنظیم نام" and matches[2] then
local gp_name = string.gsub(matches[2], "_","")
tdcli.changeChatTitle(chat, gp_name, dl_cb, nil)
end
if matches[1] == 'tosuper'or matches[1] == 'تبدیل به سوپرگروه' then
local id = msg.to.id
     if msg.to.type == "channel" then
   return "_This Chat Is Already SuperGroup...!_"
     else
   tdcli.migrateGroupChatToChannelChat(id)
    return '_Group Has Been Changed To SuperGroup!_'
   end
end
     if msg.to.type == "channel" then
    if matches[1] == "mute"or matches[1] == "سکوت" then
    if matches[2] == "all"or matches[2] == "همه" then
                    local hash = 'mute_gp:'..chat
                    if redis:get(hash) then
                    return "Mute All Is Already Enabled"
                else
                    redis:set(hash, true)
                    return "Mute All Has Been Enabled"
                     end
                  end
    elseif matches[1] == "unmute"or matches[1] == "حذف سکوت" then
      if matches[2] == 'all'or matches[2] == 'همه' then
                    local hash = 'mute_gp:'..chat
                    if not redis:get(hash) then
                    return "Mute All Is Not Enabled"
                else
                    redis:del(hash)
                    return "Mute All Has Been Disabled"
                   end
					   end
             end
  if matches[1] == "setdes"or matches[1] == "تنظیم توضیحات" and matches[2] then
   tdcli.changeChannelAbout(chat, matches[2], dl_cb, nil)
    return "*Description* _has been set_"
  end
if matches[1] == "del"or matches[1] == "حذف" then
   del_msg(msg.to.id, msg.reply_id)
del_msg(msg.to.id, msg.id)
end
if matches[1] == "pin"or matches[1] == "سنجاق" and msg.reply_id then
tdcli.pinChannelMessage(msg.to.id, msg.reply_id, 1, dl_cb, nil)
return "*Message Has Been Pinned*"
end
if matches[1] == 'unpin'or matches[1] == 'حذف سنجاق' then
tdcli.unpinChannelMessage(msg.to.id, dl_cb, nil)
return "*Pin message has been unpinned*"
         end
      end
   end
end
return { 
patterns = { 
"^[!/#](pin)$", 
"^[!/#](unpin)$",
"^[!/#](inv)$", 
"^[!/#](kick)$",
"^[!/#](inv) (.*)$", 
"^[!/#](kick) (.*)$",
"^[!/#](id)$",
"^[!/#](id) (.*)$", 
"^[!/#](delall)$",
"^[!/#](delall) (.*)$", 
"^[!/#](gpid)$",
"^[!/#](del)$", 
"^[!/#](tosuper)$", 
"^[!/#](setname) (.*)$",
"^[!/#](link)$",
"^[!/#](setlink) (.*)$", 
"^[!/#](setdes) (.*)$",
"^[!/#](import) (.*)$",
"^[!/#](mute) (.*)$",
"^[!/#](unmute) (.*)$",
"^(سنجاق)$",
"^(حذف سنجاق)$",
"^(دعوت)$",
"^(اخراج)$",
"^(دعوت) (.*)$",
"^(اخراج) (.*)$",
"^(شناسه)$",
"^(شناسه) (.*)$",
"^(حذف همه)$",
"^(حذف همه) (.*)$",
"^(شناسه گروه)$",
"^(حذف)$",
"^(تبدیل به سوپرگروه)$",
"^(تنظیم نام) (.*)$",
"^(لینک)$",
"^(تنظیم لینک) (.*)$",
"^(تنظیم توضیحات) (.*)$",
"^(سکوت) (.*)$",
"^(حذف سکوت) (.*)$",
}, 
run = run 
}

