local function run(msg, matches)
  local url , res = http.request('http://probot.000webhostapp.com/api/time.php/')
  if res ~= 200 then return tdcli.sendMessage(msg.chat_id_, msg.id_, 1, '<b>No Connection</b>', 1, 'html') end
  local jdat = json:decode(url)
   if jdat.L == "0" then
   jdat_L = 'خیر'
   elseif jdat.L == "1" then
   jdat_L = 'بله'
   end
  local text = 'ساعت : <code>'..jdat.Stime..'</code>\n\nتاریخ : <code>'..jdat.FAdate..'</code>\n\nتعداد روز های ماه جاری : <code>'..jdat.t..'</code>\n\nعدد روز در هفته : <code>'..jdat.w..'</code>\n\nشماره ی این هفته در سال : <code>'..jdat.W..'</code>\n\nنام باستانی ماه : <code>'..jdat.p..'</code>\n\nشماره ی ماه از سال : <code>'..jdat.n..'</code>\n\nنام فصل : <code>'..jdat.f..'</code>\n\nشماره ی فصل از سال : <code>'..jdat.b..'</code>\n\nتعداد روز های گذشته از سال : <code>'..jdat.z..'</code>\n\nدر صد گذشته از سال : <code>'..jdat.K..'</code>\n\nتعداد روز های باقیمانده از سال : <code>'..jdat.Q..'</code>\n\nدر صد باقیمانده از سال : <code>'..jdat.k..'</code>\n\nنام حیوانی سال : <code>'..jdat.q..'</code>\n\nشماره ی قرن هجری شمسی : <code>'..jdat.C..'</code>\n\nسال کبیسه : <code>'..jdat_L..'</code>\n\nمنطقه ی زمانی تنظیم شده : <code>'..jdat.e..'</code>\n\nاختلاف ساعت جهانی : <code>'..jdat.P..'</code>\n\nاختلاف ساعت جهانی به ثانیه : <code>'..jdat.A..'</code>\n'
  tdcli.sendMessage(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
-- By @Ali_Niestani
return {
  patterns ={
"^[!/#]([Dd][Aa][Tt][Ee])$",
"^(time)$",
"^(Time)$",
"^(ساعت)$",
 },
  run = run
}
