const fs = require('fs');


let str = `22260\t22260\t9\t1\tCJSH_Monster_touxiang_11_8\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t三头凶蛟坐骑激活：全属性+13\t1\t三头凶蛟坐骑激活：全属性+13
22261\t22261\t9\t1\tCJSH_Monster_touxiang_11_8\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t三头凶蛟坐骑激活：全属性+13\t1\t三头凶蛟坐骑激活：全属性+13
22262\t22262\t9\t1\tHAN2_Ride_touxiang_8_4\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t赤鳞饕餮坐骑激活：全属性+26\t1\t赤鳞饕餮坐骑激活：全属性+26
22263\t22263\t9\t1\tHAN2_Ride_touxiang_8_4\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t赤鳞饕餮坐骑激活：全属性+26\t1\t赤鳞饕餮坐骑激活：全属性+26
22264\t22264\t9\t1\tHAN2_Ride_touxiang_8_8\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t金眼狻猊坐骑激活：全属性+39\t1\t金眼狻猊坐骑激活：全属性+39
22265\t22265\t9\t1\tHAN2_Ride_touxiang_8_8\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t金眼狻猊坐骑激活：全属性+39\t1\t金眼狻猊坐骑激活：全属性+39
22266\t22266\t9\t1\tHAN2_Ride_touxiang_8_6\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t九色毕方坐骑激活：全属性+52\t1\t九色毕方坐骑激活：全属性+52
22267\t22267\t9\t1\tHAN2_Ride_touxiang_8_6\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t九色毕方坐骑激活：全属性+52\t1\t九色毕方坐骑激活：全属性+52
22268\t22268\t9\t1\tHAN2_Ride_touxiang_8_12\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t银脊珠杌坐骑激活：全属性+65\t1\t银脊珠杌坐骑激活：全属性+65
22269\t22269\t9\t1\tHAN2_Ride_touxiang_8_12\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t银脊珠杌坐骑激活：全属性+65\t1\t银脊珠杌坐骑激活：全属性+65
22270\t22270\t9\t1\tHAN2_Ride_touxiang_8_9\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t吞天烛龙坐骑激活：全属性+78\t1\t吞天烛龙坐骑激活：全属性+78
22271\t22271\t9\t1\tHAN2_Ride_touxiang_8_9\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t吞天烛龙坐骑激活：全属性+78\t1\t吞天烛龙坐骑激活：全属性+78
22272\t22272\t9\t1\tHAN2_Monster_touxiang_20_2\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t毛驴坐骑激活：全属性+91\t1\t毛驴坐骑激活：全属性+91
22273\t22273\t9\t1\tHAN2_Monster_touxiang_20_2\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t毛驴坐骑激活：全属性+91\t1\t毛驴坐骑激活：全属性+91
22274\t22274\t9\t1\tHAN2_Monster_touxiang_19_6\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t羊驼坐骑激活：全属性+104\t1\t羊驼坐骑激活：全属性+104
22275\t22275\t9\t1\tHAN2_Monster_touxiang_19_6\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t羊驼坐骑激活：全属性+104\t1\t羊驼坐骑激活：全属性+104
22276\t22276\t9\t1\tCJSH_Monster_touxiang_15_3\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t赤炎螳螂坐骑激活：全属性+117\t1\t赤炎螳螂坐骑激活：全属性+117
22277\t22277\t9\t1\tCJSH_Monster_touxiang_15_3\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t赤炎螳螂坐骑激活：全属性+117\t1\t赤炎螳螂坐骑激活：全属性+117
22278\t22278\t9\t1\tCJSH_Monster_touxiang_2_7\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t青螭坐骑激活：全属性+130\t1\t青螭坐骑激活：全属性+130
22279\t22279\t9\t1\tCJSH_Monster_touxiang_2_7\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t青螭坐骑激活：全属性+130\t1\t青螭坐骑激活：全属性+130
22280\t22280\t9\t1\tHAN2_Ride_touxiang_9_11\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t多彩豆豆虎坐骑激活：全属性+143\t1\t多彩豆豆虎坐骑激活：全属性+143
22281\t22281\t9\t1\tHAN2_Ride_touxiang_9_11\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t多彩豆豆虎坐骑激活：全属性+143\t1\t多彩豆豆虎坐骑激活：全属性+143
22282\t22282\t9\t1\tHAN2_Ride_touxiang_8_13\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t幽灵狼坐骑激活：全属性+156\t1\t幽灵狼坐骑激活：全属性+156
22283\t22283\t9\t1\tHAN2_Ride_touxiang_8_13\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t幽灵狼坐骑激活：全属性+156\t1\t幽灵狼坐骑激活：全属性+156
22284\t22284\t9\t1\tHAN2_Ride_touxiang_8_15\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t巨齿鳄坐骑激活：全属性+169\t1\t巨齿鳄坐骑激活：全属性+169
22285\t22285\t9\t1\tHAN2_Ride_touxiang_8_15\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t巨齿鳄坐骑激活：全属性+169\t1\t巨齿鳄坐骑激活：全属性+169
22286\t22286\t9\t1\tHAN2_Ride_touxiang_8_14\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t双头恶犬坐骑激活：全属性+182\t1\t双头恶犬坐骑激活：全属性+182
22287\t22287\t9\t1\tHAN2_Ride_touxiang_8_14\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t双头恶犬坐骑激活：全属性+182\t1\t双头恶犬坐骑激活：全属性+182
22288\t22288\t9\t1\tCJSH_Monster_touxiang_16_11\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t雷芒雨工坐骑激活：全属性+195\t1\t雷芒雨工坐骑激活：全属性+195
22289\t22289\t9\t1\tCJSH_Monster_touxiang_16_11\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t雷芒雨工坐骑激活：全属性+195\t1\t雷芒雨工坐骑激活：全属性+195
22290\t22290\t9\t1\tCJSH_Monster_touxiang_10_16\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t幽铠魇虎(黄)坐骑激活：全属性+208\t1\t幽铠魇虎(黄)坐骑激活：全属性+208
22291\t22291\t9\t1\tCJSH_Monster_touxiang_10_16\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t幽铠魇虎(黄)坐骑激活：全属性+208\t1\t幽铠魇虎(黄)坐骑激活：全属性+208
22292\t22292\t9\t1\tCJSH_Monster_touxiang_9_1\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t幽铠魇虎(白)坐骑激活：全属性+221\t1\t幽铠魇虎(白)坐骑激活：全属性+221
22293\t22293\t9\t1\tCJSH_Monster_touxiang_9_1\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t幽铠魇虎(白)坐骑激活：全属性+221\t1\t幽铠魇虎(白)坐骑激活：全属性+221
22294\t22294\t9\t1\tCJSH_Monster_touxiang_10_12\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t幽铠魇虎(黑)坐骑激活：全属性+234\t1\t幽铠魇虎(黑)坐骑激活：全属性+234
22295\t22295\t9\t1\tCJSH_Monster_touxiang_10_12\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t幽铠魇虎(黑)坐骑激活：全属性+234\t1\t幽铠魇虎(黑)坐骑激活：全属性+234
22296\t22296\t9\t1\tCJSH_Add_0_15\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t圣诞熊坐骑激活：全属性+247\t1\t圣诞熊坐骑激活：全属性+247
22297\t22297\t9\t1\tCJSH_Add_0_15\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t圣诞熊坐骑激活：全属性+247\t1\t圣诞熊坐骑激活：全属性+247
22298\t22298\t9\t1\tHAN2_Ride_touxiang_9_12\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t金鬃狂狮坐骑激活：全属性+260\t1\t金鬃狂狮坐骑激活：全属性+260
22299\t22299\t9\t1\tHAN2_Ride_touxiang_9_12\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t金鬃狂狮坐骑激活：全属性+260\t1\t金鬃狂狮坐骑激活：全属性+260
22300\t22300\t9\t1\tHAN2_Pet_touxiang_1_9\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t烈焱战马坐骑激活：全属性+273\t1\t烈焱战马坐骑激活：全属性+273
22301\t22301\t9\t1\tHAN2_Pet_touxiang_1_9\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t烈焱战马坐骑激活：全属性+273\t1\t烈焱战马坐骑激活：全属性+273
22302\t22302\t9\t1\tCJSH_Monster_touxiang_19_6\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t无双赤兔马坐骑激活：全属性+286\t1\t无双赤兔马坐骑激活：全属性+286
22303\t22303\t9\t1\tCJSH_Monster_touxiang_19_6\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t无双赤兔马坐骑激活：全属性+286\t1\t无双赤兔马坐骑激活：全属性+286
22304\t22304\t9\t1\tCJSH_Monster_touxiang_19_7\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t神行绝影马坐骑激活：全属性+299\t1\t神行绝影马坐骑激活：全属性+299
22305\t22305\t9\t1\tCJSH_Monster_touxiang_19_7\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t神行绝影马坐骑激活：全属性+299\t1\t神行绝影马坐骑激活：全属性+299
22306\t22306\t9\t1\tCJSH_Monster_touxiang_21_10\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t乔巴坐骑激活：全属性+312\t1\t乔巴坐骑激活：全属性+312
22307\t22307\t9\t1\tCJSH_Monster_touxiang_21_10\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t乔巴坐骑激活：全属性+312\t1\t乔巴坐骑激活：全属性+312
22308\t22308\t9\t1\tCJSH_Monster_touxiang_19_11\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t神火啸天兽坐骑激活：全属性+325\t1\t神火啸天兽坐骑激活：全属性+325
22309\t22309\t9\t1\tCJSH_Monster_touxiang_19_11\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t神火啸天兽坐骑激活：全属性+325\t1\t神火啸天兽坐骑激活：全属性+325
22310\t22310\t9\t1\tCJSH_Monster_touxiang_19_8\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t福瑞金象坐骑激活：全属性+338\t1\t福瑞金象坐骑激活：全属性+338
22311\t22311\t9\t1\tCJSH_Monster_touxiang_19_8\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t福瑞金象坐骑激活：全属性+338\t1\t福瑞金象坐骑激活：全属性+338
22312\t22312\t9\t1\tCJSH_Monster_touxiang_19_10\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t机关战马坐骑激活：全属性+351\t1\t机关战马坐骑激活：全属性+351
22313\t22313\t9\t1\tCJSH_Monster_touxiang_19_10\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t机关战马坐骑激活：全属性+351\t1\t机关战马坐骑激活：全属性+351
22314\t22314\t9\t1\tCJSH_Monster_touxiang_21_2\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t暗夜魔虎坐骑激活：全属性+364\t1\t暗夜魔虎坐骑激活：全属性+364
22315\t22315\t9\t1\tCJSH_Monster_touxiang_21_2\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t暗夜魔虎坐骑激活：全属性+364\t1\t暗夜魔虎坐骑激活：全属性+364
22316\t22316\t9\t1\tCJSH_Monster_touxiang_21_4\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t碧海蓝晶兽坐骑激活：全属性+377\t1\t碧海蓝晶兽坐骑激活：全属性+377
22317\t22317\t9\t1\tCJSH_Monster_touxiang_21_4\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t碧海蓝晶兽坐骑激活：全属性+377\t1\t碧海蓝晶兽坐骑激活：全属性+377
22318\t22318\t9\t1\tCJSH_Monster_touxiang_19_5\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t绝世的卢战马坐骑激活：全属性+390\t1\t绝世的卢战马坐骑激活：全属性+390
22319\t22319\t9\t1\tCJSH_Monster_touxiang_19_5\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t绝世的卢战马坐骑激活：全属性+390\t1\t绝世的卢战马坐骑激活：全属性+390
22320\t22320\t9\t1\tCJSH_Monster_touxiang_21_3\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t金光纵地兽坐骑激活：全属性+403\t1\t金光纵地兽坐骑激活：全属性+403
22321\t22321\t9\t1\tCJSH_Monster_touxiang_21_3\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t金光纵地兽坐骑激活：全属性+403\t1\t金光纵地兽坐骑激活：全属性+403
22322\t22322\t9\t1\tHAN2_Ride_touxiang_10_2\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t地狱魔龙坐骑激活：全属性+416\t1\t地狱魔龙坐骑激活：全属性+416
22323\t22323\t9\t1\tHAN2_Ride_touxiang_10_2\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t地狱魔龙坐骑激活：全属性+416\t1\t地狱魔龙坐骑激活：全属性+416
22324\t22324\t9\t1\tCJSH_Monster_touxiang_19_4\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t星月天虎坐骑激活：全属性+429\t1\t星月天虎坐骑激活：全属性+429
22325\t22325\t9\t1\tCJSH_Monster_touxiang_19_4\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t星月天虎坐骑激活：全属性+429\t1\t星月天虎坐骑激活：全属性+429
22326\t22326\t9\t1\tCJSH_Monster_touxiang_20_16\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t至尊魔龙坐骑激活：全属性+442\t1\t至尊魔龙坐骑激活：全属性+442
22327\t22327\t9\t1\tCJSH_Monster_touxiang_20_16\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t至尊魔龙坐骑激活：全属性+442\t1\t至尊魔龙坐骑激活：全属性+442
22328\t22328\t9\t1\tCJSH_Ma_touxiang_3_3\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你四不像坐骑激活：全属性+455\t1\t迷你四不像坐骑激活：全属性+455
22329\t22329\t9\t1\tCJSH_Ma_touxiang_3_3\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你四不像坐骑激活：全属性+455\t1\t迷你四不像坐骑激活：全属性+455
22330\t22330\t9\t1\tCJSH_Monster_touxiang_17_7\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你火麒麟坐骑激活：全属性+468\t1\t迷你火麒麟坐骑激活：全属性+468
22331\t22331\t9\t1\tCJSH_Monster_touxiang_17_7\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你火麒麟坐骑激活：全属性+468\t1\t迷你火麒麟坐骑激活：全属性+468
22332\t22332\t9\t1\tHAN2_Pet_touxiang_1_12\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你布老虎坐骑激活：全属性+481\t1\t迷你布老虎坐骑激活：全属性+481
22333\t22333\t9\t1\tHAN2_Pet_touxiang_1_12\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你布老虎坐骑激活：全属性+481\t1\t迷你布老虎坐骑激活：全属性+481
22334\t22334\t9\t1\tHAN2_Ride_touxiang_8_13\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你幽灵狼坐骑激活：全属性+494\t1\t迷你幽灵狼坐骑激活：全属性+494
22335\t22335\t9\t1\tHAN2_Ride_touxiang_8_13\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你幽灵狼坐骑激活：全属性+494\t1\t迷你幽灵狼坐骑激活：全属性+494
22336\t22336\t9\t1\tHAN2_Ride_touxiang_8_15\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你巨齿鳄坐骑激活：全属性+507\t1\t迷你巨齿鳄坐骑激活：全属性+507
22337\t22337\t9\t1\tHAN2_Ride_touxiang_8_15\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你巨齿鳄坐骑激活：全属性+507\t1\t迷你巨齿鳄坐骑激活：全属性+507
22338\t22338\t9\t1\tHAN2_Ride_touxiang_8_14\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你双头恶犬坐骑激活：全属性+520\t1\t迷你双头恶犬坐骑激活：全属性+520
22339\t22339\t9\t1\tHAN2_Ride_touxiang_8_14\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你双头恶犬坐骑激活：全属性+520\t1\t迷你双头恶犬坐骑激活：全属性+520
22340\t22340\t9\t1\tHAN2_Monster_touxiang_3_15\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你冰魄冥虎坐骑激活：全属性+533\t1\t迷你冰魄冥虎坐骑激活：全属性+533
22341\t22341\t9\t1\tHAN2_Monster_touxiang_3_15\t\t\t人物身体前置点\t\t\t人物头部绑定点\t1\t0\t0\t0\t\t\t\t\t\t迷你冰魄冥虎坐骑激活：全属性+533\t1\t迷你冰魄冥虎坐骑激活：全属性+533
22342\t22342\t9\t1\tHAN2_Pet_touxiang_1_12\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t布老虎坐骑激活：全属性+546\t1\t布老虎坐骑激活：全属性+546
22343\t22343\t9\t1\tHAN2_Pet_touxiang_1_12\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t布老虎坐骑激活：全属性+546\t1\t布老虎坐骑激活：全属性+546
22344\t22344\t9\t1\tCJSH_Monster_touxiang_17_1\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t淘气的泡泡鱼坐骑激活：全属性+559\t1\t淘气的泡泡鱼坐骑激活：全属性+559
22345\t22345\t9\t1\tCJSH_Monster_touxiang_17_1\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t淘气的泡泡鱼坐骑激活：全属性+559\t1\t淘气的泡泡鱼坐骑激活：全属性+559
22346\t22346\t9\t1\tCJSH_Monster_touxiang_17_4\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t潘达坐骑激活：全属性+572\t1\t潘达坐骑激活：全属性+572
22347\t22347\t9\t1\tCJSH_Monster_touxiang_17_4\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t潘达坐骑激活：全属性+572\t1\t潘达坐骑激活：全属性+572
22348\t22348\t9\t1\tCJSH_Monster_touxiang_17_6\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t大角坐骑激活：全属性+585\t1\t大角坐骑激活：全属性+585
22349\t22349\t9\t1\tCJSH_Monster_touxiang_17_6\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t大角坐骑激活：全属性+585\t1\t大角坐骑激活：全属性+585
22350\t22350\t9\t1\tCJSH_Monster_touxiang_17_7\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t炽焰火麟坐骑激活：全属性+598\t1\t炽焰火麟坐骑激活：全属性+598
22351\t22351\t9\t1\tCJSH_Monster_touxiang_17_7\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t炽焰火麟坐骑激活：全属性+598\t1\t炽焰火麟坐骑激活：全属性+598
22352\t22352\t9\t1\tCJSH_Monster_touxiang_10_12\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t剑齿魔虎坐骑激活：全属性+611\t1\t剑齿魔虎坐骑激活：全属性+611
22353\t22353\t9\t1\tCJSH_Monster_touxiang_10_12\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t剑齿魔虎坐骑激活：全属性+611\t1\t剑齿魔虎坐骑激活：全属性+611
22354\t22354\t9\t1\tCJSH_Monster_touxiang_17_3\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t生命源龙坐骑激活：全属性+624\t1\t生命源龙坐骑激活：全属性+624
22355\t22355\t9\t1\tCJSH_Monster_touxiang_17_3\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t生命源龙坐骑激活：全属性+624\t1\t生命源龙坐骑激活：全属性+624
22356\t22356\t9\t1\tCJSH_Monster_touxiang_16_13\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t机械鸟坐骑激活：全属性+637\t1\t机械鸟坐骑激活：全属性+637
22357\t22357\t9\t1\tCJSH_Monster_touxiang_16_13\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t机械鸟坐骑激活：全属性+637\t1\t机械鸟坐骑激活：全属性+637
22358\t22358\t9\t1\tHAN2_Pet_touxiang_1_10\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t寒霜坐骑激活：全属性+650\t1\t寒霜坐骑激活：全属性+650
22359\t22359\t9\t1\tHAN2_Pet_touxiang_1_10\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t寒霜坐骑激活：全属性+650\t1\t寒霜坐骑激活：全属性+650
22360\t22360\t9\t1\tCJSH_Monster_touxiang_17_6\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t圣诞麋鹿坐骑激活：全属性+663\t1\t圣诞麋鹿坐骑激活：全属性+663
22361\t22361\t9\t1\tCJSH_Monster_touxiang_17_6\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t圣诞麋鹿坐骑激活：全属性+663\t1\t圣诞麋鹿坐骑激活：全属性+663
22362\t22362\t9\t1\tHAN2_Ride_touxiang_3_11\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t王者麒麟蓝坐骑激活：全属性+676\t1\t王者麒麟蓝坐骑激活：全属性+676
22363\t22363\t9\t1\tHAN2_Ride_touxiang_3_11\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t王者麒麟蓝坐骑激活：全属性+676\t1\t王者麒麟蓝坐骑激活：全属性+676
22364\t22364\t9\t1\tHAN2_Pet_touxiang_1_2\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t九命狸猫坐骑激活：全属性+689\t1\t九命狸猫坐骑激活：全属性+689
22365\t22365\t9\t1\tHAN2_Pet_touxiang_1_2\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t九命狸猫坐骑激活：全属性+689\t1\t九命狸猫坐骑激活：全属性+689
22366\t22366\t9\t1\tHAN2_Pet_touxiang_1_3\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t七彩陆行鸟坐骑激活：全属性+702\t1\t七彩陆行鸟坐骑激活：全属性+702
22367\t22367\t9\t1\tHAN2_Pet_touxiang_1_3\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t七彩陆行鸟坐骑激活：全属性+702\t1\t七彩陆行鸟坐骑激活：全属性+702
22368\t22368\t9\t1\tCJSH_Ma_touxiang_3_3\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t四不像坐骑激活：全属性+715\t1\t四不像坐骑激活：全属性+715
22369\t22369\t9\t1\tCJSH_Ma_touxiang_3_3\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t四不像坐骑激活：全属性+715\t1\t四不像坐骑激活：全属性+715
22370\t22370\t9\t1\tCJSH_Monster_touxiang_21_12\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t咆哮战狼坐骑激活：全属性+728\t1\t咆哮战狼坐骑激活：全属性+728
22371\t22371\t9\t1\tCJSH_Monster_touxiang_21_12\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t咆哮战狼坐骑激活：全属性+728\t1\t咆哮战狼坐骑激活：全属性+728
22372\t22372\t9\t1\tCJSH_Monster_touxiang_18_11\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t地煞灭魂机甲坐骑激活：全属性+741\t1\t地煞灭魂机甲坐骑激活：全属性+741
22373\t22373\t9\t1\tCJSH_Monster_touxiang_18_11\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t地煞灭魂机甲坐骑激活：全属性+741\t1\t地煞灭魂机甲坐骑激活：全属性+741
22374\t22374\t9\t1\tCJSH_Monster_touxiang_18_12\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t天擎金刚机甲坐骑激活：全属性+754\t1\t天擎金刚机甲坐骑激活：全属性+754
22375\t22375\t9\t1\tCJSH_Monster_touxiang_18_12\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t天擎金刚机甲坐骑激活：全属性+754\t1\t天擎金刚机甲坐骑激活：全属性+754
22376\t22376\t9\t1\tCJSH_Ma_touxiang_3_5\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t炫彩疾风鸟坐骑激活：全属性+767\t1\t炫彩疾风鸟坐骑激活：全属性+767
22377\t22377\t9\t1\tCJSH_Ma_touxiang_3_5\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t炫彩疾风鸟坐骑激活：全属性+767\t1\t炫彩疾风鸟坐骑激活：全属性+767
22378\t22378\t9\t1\tCJSH_Monster_touxiang_17_2\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t玉兔坐骑激活：全属性+780\t1\t玉兔坐骑激活：全属性+780
22379\t22379\t9\t1\tCJSH_Monster_touxiang_17_2\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t玉兔坐骑激活：全属性+780\t1\t玉兔坐骑激活：全属性+780
22380\t22380\t9\t1\tHAN2_Ride_touxiang_3_10\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t国王黄金麒麟坐骑激活：全属性+793\t1\t国王黄金麒麟坐骑激活：全属性+793
22381\t22381\t9\t1\tHAN2_Ride_touxiang_3_10\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t国王黄金麒麟坐骑激活：全属性+793\t1\t国王黄金麒麟坐骑激活：全属性+793
22382\t22382\t9\t1\tCJSH_Ma_touxiang_4_2\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t电光独角兽(红)坐骑激活：全属性+806\t1\t电光独角兽(红)坐骑激活：全属性+806
22383\t22383\t9\t1\tCJSH_Ma_touxiang_4_2\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t电光独角兽(红)坐骑激活：全属性+806\t1\t电光独角兽(红)坐骑激活：全属性+806
22384\t22384\t9\t1\tCJSH_Ma_touxiang_4_2\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t电光独角兽(蓝)坐骑激活：全属性+819\t1\t电光独角兽(蓝)坐骑激活：全属性+819
22385\t22385\t9\t1\tCJSH_Ma_touxiang_4_2\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t电光独角兽(蓝)坐骑激活：全属性+819\t1\t电光独角兽(蓝)坐骑激活：全属性+819
22386\t22386\t9\t1\tCJSH_Monster_touxiang_19_15\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t九尾雪狐坐骑激活：全属性+832\t1\t九尾雪狐坐骑激活：全属性+832
22387\t22387\t9\t1\tCJSH_Monster_touxiang_19_15\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t九尾雪狐坐骑激活：全属性+832\t1\t九尾雪狐坐骑激活：全属性+832
22388\t22388\t9\t1\tCJSH_Ma_touxiang_4_6\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t暗地金龙坐骑激活：全属性+845\t1\t暗地金龙坐骑激活：全属性+845
22389\t22389\t9\t1\tCJSH_Ma_touxiang_4_6\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t暗地金龙坐骑激活：全属性+845\t1\t暗地金龙坐骑激活：全属性+845
22390\t22390\t9\t1\tCJSH_Monster_touxiang_21_6\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你泡泡蟹坐骑激活：全属性+858\t1\t迷你泡泡蟹坐骑激活：全属性+858
22391\t22391\t9\t1\tCJSH_Monster_touxiang_21_6\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你泡泡蟹坐骑激活：全属性+858\t1\t迷你泡泡蟹坐骑激活：全属性+858
22392\t22392\t9\t1\tHAN2_Pet_touxiang_1_11\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t比翼神鸟坐骑激活：全属性+871\t1\t比翼神鸟坐骑激活：全属性+871
22393\t22393\t9\t1\tHAN2_Pet_touxiang_1_11\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t比翼神鸟坐骑激活：全属性+871\t1\t比翼神鸟坐骑激活：全属性+871
22394\t22394\t9\t1\tHAN2_Ride_touxiang_8_5\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t祥瑞神鸟坐骑激活：全属性+884\t1\t祥瑞神鸟坐骑激活：全属性+884
22395\t22395\t9\t1\tHAN2_Ride_touxiang_8_5\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t祥瑞神鸟坐骑激活：全属性+884\t1\t祥瑞神鸟坐骑激活：全属性+884
22396\t22396\t9\t1\tHAN2_Ride_touxiang_9_9\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t皇帝坐骑坐骑激活：全属性+897\t1\t皇帝坐骑坐骑激活：全属性+897
22397\t22397\t9\t1\tHAN2_Ride_touxiang_9_9\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t皇帝坐骑坐骑激活：全属性+897\t1\t皇帝坐骑坐骑激活：全属性+897
22398\t22398\t9\t1\tHAN2_Monster_touxiang_3_15\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你变异冰魄冥虎坐骑激活：全属性+910\t1\t迷你变异冰魄冥虎坐骑激活：全属性+910
22399\t22399\t9\t1\tHAN2_Monster_touxiang_3_15\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你变异冰魄冥虎坐骑激活：全属性+910\t1\t迷你变异冰魄冥虎坐骑激活：全属性+910
22400\t22400\t9\t1\tCJSH_Ma_touxiang_3_2\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t地狱猪皇坐骑激活：全属性+923\t1\t地狱猪皇坐骑激活：全属性+923
22401\t22401\t9\t1\tCJSH_Ma_touxiang_3_2\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t地狱猪皇坐骑激活：全属性+923\t1\t地狱猪皇坐骑激活：全属性+923
22402\t22402\t9\t1\tHAN2_Monster_touxiang_19_3\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你熊猫坐骑激活：全属性+936\t1\t迷你熊猫坐骑激活：全属性+936
22403\t22403\t9\t1\tHAN2_Monster_touxiang_19_3\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你熊猫坐骑激活：全属性+936\t1\t迷你熊猫坐骑激活：全属性+936
22404\t22404\t9\t1\tCJSH_Monster_touxiang_16_11\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你雷芒雨工坐骑激活：全属性+949\t1\t迷你雷芒雨工坐骑激活：全属性+949
22405\t22405\t9\t1\tCJSH_Monster_touxiang_16_11\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你雷芒雨工坐骑激活：全属性+949\t1\t迷你雷芒雨工坐骑激活：全属性+949
22406\t22406\t9\t1\tCJSH_Monster_touxiang_21_16\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t炽炎年兽坐骑激活：全属性+962\t1\t炽炎年兽坐骑激活：全属性+962
22407\t22407\t9\t1\tCJSH_Monster_touxiang_21_16\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t炽炎年兽坐骑激活：全属性+962\t1\t炽炎年兽坐骑激活：全属性+962
22408\t22408\t9\t1\tCJSH_Monster_touxiang_16_11\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t变异迷你雷芒雨工坐骑激活：全属性+975\t1\t变异迷你雷芒雨工坐骑激活：全属性+975
22409\t22409\t9\t1\tCJSH_Monster_touxiang_16_11\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t变异迷你雷芒雨工坐骑激活：全属性+975\t1\t变异迷你雷芒雨工坐骑激活：全属性+975
22410\t22410\t9\t1\tCJSH_Ma_touxiang_3_16\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t圣诞雪猿坐骑激活：全属性+988\t1\t圣诞雪猿坐骑激活：全属性+988
22411\t22411\t9\t1\tCJSH_Ma_touxiang_3_16\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t圣诞雪猿坐骑激活：全属性+988\t1\t圣诞雪猿坐骑激活：全属性+988
22412\t22412\t9\t1\tCJSH_Monster_touxiang_19_12\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t熔岩地狱犬坐骑激活：全属性+1001\t1\t熔岩地狱犬坐骑激活：全属性+1001
22413\t22413\t9\t1\tCJSH_Monster_touxiang_19_12\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t熔岩地狱犬坐骑激活：全属性+1001\t1\t熔岩地狱犬坐骑激活：全属性+1001
22414\t22414\t9\t1\tCJSH_Monster_touxiang_19_14\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你赤炎火鸟(黄)坐骑激活：全属性+1014\t1\t迷你赤炎火鸟(黄)坐骑激活：全属性+1014
22415\t22415\t9\t1\tCJSH_Monster_touxiang_19_14\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你赤炎火鸟(黄)坐骑激活：全属性+1014\t1\t迷你赤炎火鸟(黄)坐骑激活：全属性+1014
22416\t22416\t9\t1\tCJSH_Monster_touxiang_19_14\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你赤炎火鸟(蓝)坐骑激活：全属性+1027\t1\t迷你赤炎火鸟(蓝)坐骑激活：全属性+1027
22417\t22417\t9\t1\tCJSH_Monster_touxiang_19_14\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你赤炎火鸟(蓝)坐骑激活：全属性+1027\t1\t迷你赤炎火鸟(蓝)坐骑激活：全属性+1027
22418\t22418\t9\t1\tCJSH_Monster_touxiang_17_2\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你玉兔坐骑激活：全属性+1040\t1\t迷你玉兔坐骑激活：全属性+1040
22419\t22419\t9\t1\tCJSH_Monster_touxiang_17_2\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你玉兔坐骑激活：全属性+1040\t1\t迷你玉兔坐骑激活：全属性+1040
22420\t22420\t9\t1\tCJSH_Monster_touxiang_20_1\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t天命猫妖坐骑激活：全属性+1053\t1\t天命猫妖坐骑激活：全属性+1053
22421\t22421\t9\t1\tCJSH_Monster_touxiang_20_1\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t天命猫妖坐骑激活：全属性+1053\t1\t天命猫妖坐骑激活：全属性+1053
22422\t22422\t9\t1\tCJSH_Monster_touxiang_21_1\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t七彩凤凰坐骑激活：全属性+1066\t1\t七彩凤凰坐骑激活：全属性+1066
22423\t22423\t9\t1\tCJSH_Monster_touxiang_21_1\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t七彩凤凰坐骑激活：全属性+1066\t1\t七彩凤凰坐骑激活：全属性+1066
22424\t22424\t9\t1\tCJSH_Monster_touxiang_21_8\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t银焰独角兽坐骑激活：全属性+1079\t1\t银焰独角兽坐骑激活：全属性+1079
22425\t22425\t9\t1\tCJSH_Monster_touxiang_21_8\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t银焰独角兽坐骑激活：全属性+1079\t1\t银焰独角兽坐骑激活：全属性+1079
22426\t22426\t9\t1\tCJSH_Monster_touxiang_21_7\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t巨型幽纹梦魇坐骑激活：全属性+1092\t1\t巨型幽纹梦魇坐骑激活：全属性+1092
22427\t22427\t9\t1\tCJSH_Monster_touxiang_21_7\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t巨型幽纹梦魇坐骑激活：全属性+1092\t1\t巨型幽纹梦魇坐骑激活：全属性+1092
22428\t22428\t9\t1\tCJSH_Monster_touxiang_21_7\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t幽纹梦魇坐骑激活：全属性+1105\t1\t幽纹梦魇坐骑激活：全属性+1105
22429\t22429\t9\t1\tCJSH_Monster_touxiang_21_7\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t幽纹梦魇坐骑激活：全属性+1105\t1\t幽纹梦魇坐骑激活：全属性+1105
22430\t22430\t9\t1\tCJSH_Monster_touxiang_19_13\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t塔布羊坐骑激活：全属性+1118\t1\t塔布羊坐骑激活：全属性+1118
22431\t22431\t9\t1\tCJSH_Monster_touxiang_19_13\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t塔布羊坐骑激活：全属性+1118\t1\t塔布羊坐骑激活：全属性+1118
22432\t22432\t9\t1\tCJSH_Monster_touxiang_19_13\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你塔布羊坐骑激活：全属性+1131\t1\t迷你塔布羊坐骑激活：全属性+1131
22433\t22433\t9\t1\tCJSH_Monster_touxiang_19_13\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你塔布羊坐骑激活：全属性+1131\t1\t迷你塔布羊坐骑激活：全属性+1131
22434\t22434\t9\t1\tCJSH_Monster_touxiang_21_8\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你独角兽(黄)坐骑激活：全属性+1144\t1\t迷你独角兽(黄)坐骑激活：全属性+1144
22435\t22435\t9\t1\tCJSH_Monster_touxiang_21_8\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你独角兽(黄)坐骑激活：全属性+1144\t1\t迷你独角兽(黄)坐骑激活：全属性+1144
22436\t22436\t9\t1\tCJSH_Monster_touxiang_21_8\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你独角兽(蓝)坐骑激活：全属性+1157\t1\t迷你独角兽(蓝)坐骑激活：全属性+1157
22437\t22437\t9\t1\tCJSH_Monster_touxiang_21_8\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你独角兽(蓝)坐骑激活：全属性+1157\t1\t迷你独角兽(蓝)坐骑激活：全属性+1157
22438\t22438\t9\t1\tHAN2_Ride_touxiang_3_10\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你黄金麒麟(黄)坐骑激活：全属性+1170\t1\t迷你黄金麒麟(黄)坐骑激活：全属性+1170
22439\t22439\t9\t1\tHAN2_Ride_touxiang_3_10\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你黄金麒麟(黄)坐骑激活：全属性+1170\t1\t迷你黄金麒麟(黄)坐骑激活：全属性+1170
22440\t22440\t9\t1\tHAN2_Ride_touxiang_3_11\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你黄金麒麟(蓝)坐骑激活：全属性+1183\t1\t迷你黄金麒麟(蓝)坐骑激活：全属性+1183
22441\t22441\t9\t1\tHAN2_Ride_touxiang_3_11\t\t\t人物身体前置点\t\t\t人物身体受击点\t1\t0\t0\t0\t\t\t\t\t\t迷你黄金麒麟(蓝)坐骑激活：全属性+1183\t1\t迷你黄金麒麟(蓝)坐骑激活：全属性+1183
`


let arr = [];
str.split('\n').forEach(line => {
    let obj = line.split('\t')
    if (obj.length > 5 && obj[0] != "") {
        arr.push(obj)
    }
})

let res = ``;
let index = 1;
let buffID = 6780;
let count = 91
if (arr.length !== count * 2) {
    throw new Error("数量不对")
}
for (let i = 0; i < count; i++) {
    let v = (i+1)*13
    let item1 = arr[i*2]
    let item2 = arr[i*2+1]

    let probability = 1000-i*10;
    if (probability <= 1) {
        probability = 1;
    }
    let buffid = item1[0]
    let name = item1[20]
    let ss = `{buff={${buffid},${buffID+i}},name="${name}",probability = ${probability}},`+"\n"
    ss += `{buff={${item2[0]},${buffID+i}},name="${name}",probability = ${probability}},`
    res += ss+"\n"
}
console.log(res)

// 如果想保存结果到文件，请取消注释以下行：
fs.writeFileSync('gen_up_bufflua.txt', res, 'utf8');
