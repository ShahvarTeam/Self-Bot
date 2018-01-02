--start
local function run(msg, matches)
local type = "typing:"..msg.chat_id_
if matches[1] == "typing" and is_sudo(msg) or matches[1] == "تایپینگ" and is_sudo(msg) then
--Enable
if matches[2] == "on" or matches[2] == "روشن" then 
redis:set(type, true) 
return "*Typing* _Action Has Been Enabled_"
--Disable
elseif matches[2] == "off" or matches[2] == "خاموش" then 
redis:del(type) 
return "*Typing* _Action Has Been Disabled_"
end 
end 
if redis:get(type) then
tdcli.sendChatAction(msg.chat_id_, "Typing")
end
end
return { 
patterns = {
"^[!/#](typing) (.*)$",
"^(تایپینگ) (.*)$",
"(.*)",
},
run = run
}
--by @secure_dev
--@secure_channel