# Self-Bot
# با عرض سلام خدمت دوستان
اینم قول من به شما سورس سلف باتی که خودم ادیت کردم 
سورس اصلی سلف بیوند هست که من دستورات رو دوزبانه کردم و یه سری تغییرات دادم
امیدوارم خوشتون بیاد  
بریم سراغ اموزش نصب:

# ابتدا پیش نیاز ها رو نصب میکنیم:
```sh
 sudo apt-get update; sudo apt-get upgrade; sudo apt-get install tmux; sudo apt-get install luarocks; sudo apt-get install screen; sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev lua-socket lua-sec lua-expat libevent-dev make unzip git redis-server autoconf g++ libjansson-dev libpython-dev expat libexpat1-dev; sudo apt-get update; sudo apt-get install; sudo apt-get install upstart-sysv
```
```sh
# wget http://luarocks.org/releases/luarocks-2.2.2.tar.gz;tar zxpf luarocks-2.2.2.tar.gz;cd luarocks-2.2.2 && ./configure; sudo make bootstrap;sudo luarocks install luasocket;sudo luarocks install luasec;sudo luarocks install redis-lua;sudo luarocks install lua-term;sudo luarocks install serpent;sudo luarocks install dkjson;sudo luarocks install lanes;sudo luarocks install Lua-cURL
```
# سپس دستور زیر را بزنید
# cd
# حال سورس را کلون کنید
# git clone https://github.com/ShahvarTeam/Self-Bot.git

# سورس کلون ک شد به مسیر زیر برید و ایدی خودتون رو جایگزین کنید

# Self-Bot/bot/bot.lua    line 118
# سیو کنید و خارج بشید کد های زیر را جهت نصب وارد کنین
```sh
cd Self-Bot
chmod +x self.sh
./self.sh install
./self.sh
```
# بعد از این مرحله از شما شماره و کد میخواد بزنید و تمام
# خب بریم واس اتو لانج
```sh
killall screen
killall bash
tmux
./self.sh
```
# موفق و پیروز باشید
# ستاره یادتون نره

[Majholboy](https://github.com/MajhoIboy) ([Telegram](https://telegram.me/MahgoIboy))
[@ShahvarTeam](https://telegram.me/shahvarteam)
