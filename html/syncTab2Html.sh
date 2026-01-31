#!/bin/sh

rm -rf /var/www/html/khan3/item_miscellaneous.tab
rm -rf /var/www/html/khan3/mon_attr_ex.tab
rm -rf /var/www/html/khan3/monsterdrop_content.tab
rm -rf /var/www/html/khan3/horse_drop_content.tab
rm -rf /var/www/html/khan3/horse_jichu.tab
rm -rf /var/www/html/khan3/equipmodel.tab
rm -rf /var/www/html/khan3/Extra_Bag.tab
rm -rf /var/www/html/khan3/Timer.tab

cp /home/khan3/MAP/Share/Config/item_miscellaneous.tab /var/www/html/khan3/
cp /home/khan3/MAP/Share/Config/mon_attr_ex.tab /var/www/html/khan3/
cp /home/khan3/MAP/Share/Config/horse_jichu.tab /var/www/html/khan3/
cp /home/khan3/MAP/Share/Config/equipmodel.tab /var/www/html/khan3/
cp /home/khan3/MAP/Share/Config/Extra_Bag.tab /var/www/html/khan3/
cp /home/khan3/MAP/Server/Config/monsterdrop_content.tab /var/www/html/khan3/
cp /home/khan3/MAP/Server/Config/horse_drop_content.tab /var/www/html/khan3/
cp /home/khan3/GL/Server/Config/Timer.tab /var/www/html/khan3/


