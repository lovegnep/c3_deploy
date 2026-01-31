#!/bin/sh

rm -rf /var/www/html/khan3/item_miscellaneous.tab
rm -rf /var/www/html/khan3/mon_attr_ex.tab
rm -rf /var/www/html/khan3/monsterdrop_content.tab
rm -rf /var/www/html/khan3/horse_drop_content.tab
rm -rf /var/www/html/khan3/horse_jichu.tab
rm -rf /var/www/html/khan3/equipmodel.tab
rm -rf /var/www/html/khan3/Extra_Bag.tab
rm -rf /var/www/html/khan3/Timer.tab
rm -rf /var/www/html/khan3/tabs

mkdir -p /var/www/html/khan3/tabs

cp /home/khan3/MAP/Share/Config/item_miscellaneous.tab /var/www/html/khan3/tabs/
cp /home/khan3/MAP/Share/Config/mon_attr_ex.tab /var/www/html/khan3/tabs/
cp /home/khan3/MAP/Share/Config/horse_jichu.tab /var/www/html/khan3/tabs/
cp /home/khan3/MAP/Share/Config/equipmodel.tab /var/www/html/khan3/tabs/
cp /home/khan3/MAP/Share/Config/Extra_Bag.tab /var/www/html/khan3/tabs/
cp /home/khan3/MAP/Share/Config/trophy.tab /var/www/html/khan3/tabs/
cp /home/khan3/MAP/Server/Config/monsterdrop_content.tab /var/www/html/khan3/tabs/
cp /home/khan3/MAP/Server/Config/horse_drop_content.tab /var/www/html/khan3/tabs/
cp /home/khan3/GL/Server/Config/Timer.tab /var/www/html/khan3/tabs/



cp /home/khan3/MAP/Share/LuaScript/common/cangbaotu/common_huangjincangbaotu_baoshi_bind.lua /var/www/html/khan3/tabs/
cp /home/khan3/MAP/Share/LuaScript/common/cangbaotu/common_huangjincangbaotu_shizhuang_bind.lua /var/www/html/khan3/tabs/
cp /home/khan3/MAP/Share/LuaScript/common/cangbaotu/common_huangjincangbaotu_waizhuang_bind.lua /var/www/html/khan3/tabs/
cp /home/khan3/MAP/Share/LuaScript/common/cangbaotu/common_huangjincangbaotu_xishiji_bind.lua /var/www/html/khan3/tabs/
cp /home/khan3/MAP/Share/LuaScript/common/cangbaotu/common_huangjincangbaotu_bind.lua /var/www/html/khan3/tabs/
cp /home/khan3/MAP/Share/LuaScript/cjsh/hmm/common_jieri_gongce08.lua /var/www/html/khan3/tabs/
cp /home/khan3/MAP/Share/LuaScript/cjsh/hmm/930101.lua /var/www/html/khan3/tabs/