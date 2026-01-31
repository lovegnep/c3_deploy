
--DECLARE_QUEST_INFO_START--

x930127_var_FileId = 930127   

x930127_var_SelectIndex = {}

-- 兑换目标道具名称
x930127_var_TargetName = "王牌"

-- 兑换目标道具ID
x930127_var_ExcObjID = {
    {index = 1,useyuan=1, dai=5 ,targetID = 108, targetName = "五代蒙古马·黑", buffID = 22710, buffDesc = "五代蒙古马·黑图鉴激活：全攻击+100全防御+100"},
    {index = 2,useyuan=1, dai=5 ,targetID = 208, targetName = "五代三河马·黑", buffID = 22711, buffDesc = "五代三河马·黑图鉴激活：全攻击+200全防御+200"},
    {index = 3,useyuan=1, dai=5 ,targetID = 308, targetName = "五代伊犁马·黑", buffID = 22712, buffDesc = "五代伊犁马·黑图鉴激活：全攻击+300全防御+300"},
    {index = 4,useyuan=0, dai=3 ,targetID = 2306, targetName = "三代变异凶豹", buffID = 22713, buffDesc = "三代变异凶豹图鉴激活：全攻击+400全防御+400"},
    {index = 5,useyuan=0, dai=3 ,targetID = 2316, targetName = "三代变异奔羚", buffID = 22714, buffDesc = "三代变异奔羚图鉴激活：全攻击+500全防御+500"},
    {index = 6,useyuan=0, dai=3 ,targetID = 2326, targetName = "三代变异天鹅", buffID = 22715, buffDesc = "三代变异天鹅图鉴激活：全攻击+600全防御+600"},
    {index = 7,useyuan=0, dai=3 ,targetID = 2336, targetName = "三代变异河马", buffID = 22716, buffDesc = "三代变异河马图鉴激活：全攻击+700全防御+700"},
    {index = 8,useyuan=0, dai=3 ,targetID = 2346, targetName = "三代变异蜘蛛", buffID = 22717, buffDesc = "三代变异蜘蛛图鉴激活：全攻击+800全防御+800"},
    {index = 9,useyuan=1, dai=5 ,targetID = 408, targetName = "五代波斯马·黑", buffID = 22718, buffDesc = "五代波斯马·黑图鉴激活：全攻击+900全防御+900"},
    {index = 10,useyuan=0, dai=5 ,targetID = 508, targetName = "五代天方马·黑", buffID = 22719, buffDesc = "五代天方马·黑图鉴激活：全攻击+1000全防御+1000"},
    {index = 11,useyuan=0, dai=3 ,targetID = 2506, targetName = "三代变异烈狮", buffID = 22720, buffDesc = "三代变异烈狮图鉴激活：全攻击+1100全防御+1100"},
    {index = 12,useyuan=0, dai=3 ,targetID = 2516, targetName = "三代变异驯鹿", buffID = 22721, buffDesc = "三代变异驯鹿图鉴激活：全攻击+1200全防御+1200"},
    {index = 13,useyuan=0, dai=3 ,targetID = 2526, targetName = "三代变异瑞鹤", buffID = 22722, buffDesc = "三代变异瑞鹤图鉴激活：全攻击+1300全防御+1300"},
    {index = 14,useyuan=0, dai=3 ,targetID = 2536, targetName = "三代变异铁犀", buffID = 22723, buffDesc = "三代变异铁犀图鉴激活：全攻击+1400全防御+1400"},
    {index = 15,useyuan=0, dai=3 ,targetID = 2546, targetName = "三代变异蝎子", buffID = 22724, buffDesc = "三代变异蝎子图鉴激活：全攻击+1500全防御+1500"},
    {index = 16,useyuan=1, dai=5 ,targetID = 608, targetName = "五代大宛马·黑", buffID = 22725, buffDesc = "五代大宛马·黑图鉴激活：全攻击+1600全防御+1600"},
    {index = 17,useyuan=1, dai=5 ,targetID = 708, targetName = "五代纯血马·黑", buffID = 22726, buffDesc = "五代纯血马·黑图鉴激活：全攻击+1700全防御+1700"},
    {index = 18,useyuan=0, dai=3 ,targetID = 2706, targetName = "三代变异剑齿虎", buffID = 22727, buffDesc = "三代变异剑齿虎图鉴激活：全攻击+1800全防御+1800"},
    {index = 19,useyuan=0, dai=3 ,targetID = 2716, targetName = "三代变异蛮牛", buffID = 22728, buffDesc = "三代变异蛮牛图鉴激活：全攻击+1900全防御+1900"},
    {index = 20,useyuan=0, dai=3 ,targetID = 2726, targetName = "三代变异凤凰", buffID = 22729, buffDesc = "三代变异凤凰图鉴激活：全攻击+2000全防御+2000"},
    {index = 21,useyuan=0, dai=3 ,targetID = 2736, targetName = "三代变异猛犸", buffID = 22730, buffDesc = "三代变异猛犸图鉴激活：全攻击+2100全防御+2100"},
    {index = 22,useyuan=0, dai=3 ,targetID = 2746, targetName = "三代变异螳螂", buffID = 22731, buffDesc = "三代变异螳螂图鉴激活：全攻击+2200全防御+2200"},
    {index = 23,useyuan=0, dai=5 ,targetID = 808, targetName = "五代汗血马·黑", buffID = 22732, buffDesc = "五代汗血马·黑图鉴激活：全攻击+2300全防御+2300"},
    {index = 24,useyuan=0, dai=3 ,targetID = 3706, targetName = "三代变异赤磷奎龙", buffID = 22733, buffDesc = "三代变异赤磷奎龙图鉴激活：全攻击+2400全防御+2400"},
    {index = 25,useyuan=0, dai=3 ,targetID = 3716, targetName = "三代变异蛟尾虬龙", buffID = 22734, buffDesc = "三代变异蛟尾虬龙图鉴激活：全攻击+2500全防御+2500"},
    {index = 26,useyuan=0, dai=3 ,targetID = 3726, targetName = "三代变异钢髯应龙", buffID = 22735, buffDesc = "三代变异钢髯应龙图鉴激活：全攻击+2600全防御+2600"},
    {index = 27,useyuan=0, dai=3 ,targetID = 3736, targetName = "三代变异钢齿暴龙", buffID = 22736, buffDesc = "三代变异钢齿暴龙图鉴激活：全攻击+2700全防御+2700"},
    {index = 28,useyuan=0, dai=3 ,targetID = 3746, targetName = "三代变异利爪翼龙", buffID = 22737, buffDesc = "三代变异利爪翼龙图鉴激活：全攻击+2800全防御+2800"},
    {index = 29,useyuan=0, dai=5 ,targetID = 908, targetName = "五代?云马·黑", buffID = 22738, buffDesc = "五代?云马·黑图鉴激活：全攻击+2900全防御+2900"},
    {index = 30,useyuan=0, dai=3 ,targetID = 4006, targetName = "三代变异赤鳞饕餮", buffID = 22739, buffDesc = "三代变异赤鳞饕餮图鉴激活：全攻击+3000全防御+3000"},
    {index = 31,useyuan=0, dai=3 ,targetID = 4026, targetName = "三代变异九色毕方", buffID = 22740, buffDesc = "三代变异九色毕方图鉴激活：全攻击+3100全防御+3100"},
    {index = 32,useyuan=0, dai=3 ,targetID = 4036, targetName = "三代变异银脊?杌", buffID = 22741, buffDesc = "三代变异银脊?杌图鉴激活：全攻击+3200全防御+3200"},
    {index = 33,useyuan=0, dai=3 ,targetID = 4046, targetName = "三代变异吞天烛龙", buffID = 22742, buffDesc = "三代变异吞天烛龙图鉴激活：全攻击+3300全防御+3300"},
    {index = 34,useyuan=1, dai=5 ,targetID = 1008, targetName = "五代龙骧马·黑", buffID = 22743, buffDesc = "五代龙骧马·黑图鉴激活：全攻击+3400全防御+3400"},
    {index = 35,useyuan=1, dai=2 ,targetID = 3604, targetName = "二代老虎", buffID = 22744, buffDesc = "二代老虎图鉴激活：全攻击+3500全防御+3500"},
    {index = 36,useyuan=1, dai=2 ,targetID = 3614, targetName = "二代公牛", buffID = 22745, buffDesc = "二代公牛图鉴激活：全攻击+3600全防御+3600"},
    {index = 37,useyuan=1, dai=2 ,targetID = 3624, targetName = "二代白驼", buffID = 22746, buffDesc = "二代白驼图鉴激活：全攻击+3700全防御+3700"},
    {index = 38,useyuan=1, dai=2 ,targetID = 3755, targetName = "二代变异冰魄冥虎", buffID = 22747, buffDesc = "二代变异冰魄冥虎图鉴激活：全攻击+3800全防御+3800"},
    {index = 39,useyuan=1, dai=2 ,targetID = 3805, targetName = "二代变异玉兔", buffID = 22748, buffDesc = "二代变异玉兔图鉴激活：全攻击+3900全防御+3900"},
    {index = 40,useyuan=0, dai=2 ,targetID = 3905, targetName = "二代变异圣诞熊", buffID = 22749, buffDesc = "二代变异圣诞熊图鉴激活：全攻击+4000全防御+4000",loc="图鉴boss"},
    {index = 41,useyuan=1, dai=2 ,targetID = 3915, targetName = "二代变异红虎", buffID = 22750, buffDesc = "二代变异红虎图鉴激活：全攻击+4100全防御+4100"},
    {index = 42,useyuan=1, dai=2 ,targetID = 3925, targetName = "二代变异年兽", buffID = 22751, buffDesc = "二代变异年兽图鉴激活：全攻击+4200全防御+4200"},
    {index = 43,useyuan=1, dai=2 ,targetID = 3945, targetName = "二代变异南非猎豹", buffID = 22752, buffDesc = "二代变异南非猎豹图鉴激活：全攻击+4300全防御+4300"},
    {index = 44,useyuan=1, dai=2 ,targetID = 3965, targetName = "二代变异碧玺大鹏", buffID = 22753, buffDesc = "二代变异碧玺大鹏图鉴激活：全攻击+4400全防御+4400"},
    {index = 45,useyuan=1, dai=2 ,targetID = 3975, targetName = "二代变异离火麒麟", buffID = 22754, buffDesc = "二代变异离火麒麟图鉴激活：全攻击+4500全防御+4500"},
    {index = 46,useyuan=1, dai=2 ,targetID = 3985, targetName = "二代变异神马", buffID = 22755, buffDesc = "二代变异神马图鉴激活：全攻击+4600全防御+4600"},
    {index = 47,useyuan=1, dai=2 ,targetID = 3995, targetName = "二代变异狮王", buffID = 22756, buffDesc = "二代变异狮王图鉴激活：全攻击+4700全防御+4700"},
    {index = 48,useyuan=1, dai=2 ,targetID = 4055, targetName = "二代变异羊驼", buffID = 22757, buffDesc = "二代变异羊驼图鉴激活：全攻击+4800全防御+4800"},
    {index = 49,useyuan=1, dai=2 ,targetID = 4075, targetName = "二代变异垂耳兔", buffID = 22758, buffDesc = "二代变异垂耳兔图鉴激活：全攻击+4900全防御+4900"},
    {index = 50,useyuan=0, dai=2 ,targetID = 4085, targetName = "二代变异YY浣熊", buffID = 22759, buffDesc = "二代变异YY浣熊图鉴激活：全攻击+5000全防御+5000",loc="图鉴boss"},
    {index = 51,useyuan=1, dai=2 ,targetID = 4095, targetName = "二代变异浣熊", buffID = 22760, buffDesc = "二代变异浣熊图鉴激活：全攻击+5100全防御+5100"},
    {index = 52,useyuan=1, dai=2 ,targetID = 4115, targetName = "二代变异独角兽", buffID = 22761, buffDesc = "二代变异独角兽图鉴激活：全攻击+5200全防御+5200"},
    {index = 53,useyuan=1, dai=2 ,targetID = 5015, targetName = "二代变异红蝎", buffID = 22762, buffDesc = "二代变异红蝎图鉴激活：全攻击+5300全防御+5300"},
    {index = 54,useyuan=1, dai=2 ,targetID = 5025, targetName = "二代变异灰熊", buffID = 22763, buffDesc = "二代变异灰熊图鉴激活：全攻击+5400全防御+5400"},
    {index = 55,useyuan=1, dai=2 ,targetID = 5035, targetName = "二代变异巨狼", buffID = 22764, buffDesc = "二代变异巨狼图鉴激活：全攻击+5500全防御+5500"},
    {index = 56,useyuan=1, dai=2 ,targetID = 5045, targetName = "二代变异蓝麒麟", buffID = 22765, buffDesc = "二代变异蓝麒麟图鉴激活：全攻击+5600全防御+5600"},
    {index = 57,useyuan=1, dai=2 ,targetID = 5055, targetName = "二代变异多角地龙", buffID = 22766, buffDesc = "二代变异多角地龙图鉴激活：全攻击+5700全防御+5700"},
    {index = 58,useyuan=1, dai=2 ,targetID = 5065, targetName = "二代变异青螭", buffID = 22767, buffDesc = "二代变异青螭图鉴激活：全攻击+5800全防御+5800"},
    {index = 59,useyuan=1, dai=2 ,targetID = 5075, targetName = "二代变异天龙", buffID = 22768, buffDesc = "二代变异天龙图鉴激活：全攻击+5900全防御+5900"},
    {index = 60,useyuan=0, dai=2 ,targetID = 5085, targetName = "二代变异黄金虎", buffID = 22769, buffDesc = "二代变异黄金虎图鉴激活：全攻击+6000全防御+6000",loc="图鉴boss"},
    {index = 61,useyuan=1, dai=2 ,targetID = 5165, targetName = "二代变异幽灵狼", buffID = 22770, buffDesc = "二代变异幽灵狼图鉴激活：全攻击+6100全防御+6100"},
    {index = 62,useyuan=1, dai=2 ,targetID = 5175, targetName = "二代变异巨齿鳄", buffID = 22771, buffDesc = "二代变异巨齿鳄图鉴激活：全攻击+6200全防御+6200"},
    {index = 63,useyuan=0, dai=2 ,targetID = 5185, targetName = "二代变异双头恶犬", buffID = 22772, buffDesc = "二代变异双头恶犬图鉴激活：全攻击+6300全防御+6300",loc="神秘商店"},
    {index = 64,useyuan=1, dai=2 ,targetID = 5205, targetName = "二代变异至尊炎龙", buffID = 22773, buffDesc = "二代变异至尊炎龙图鉴激活：全攻击+6400全防御+6400"},
    {index = 65,useyuan=1, dai=2 ,targetID = 5225, targetName = "二代变异雪狼", buffID = 22774, buffDesc = "二代变异雪狼图鉴激活：全攻击+6500全防御+6500"},
    {index = 66,useyuan=1, dai=2 ,targetID = 5235, targetName = "二代双峰白驼", buffID = 22775, buffDesc = "二代双峰白驼图鉴激活：全攻击+6600全防御+6600"},
    {index = 67,useyuan=1, dai=2 ,targetID = 5255, targetName = "二代变异多彩豆豆虎", buffID = 22776, buffDesc = "二代变异多彩豆豆虎图鉴激活：全攻击+6700全防御+6700"},
    {index = 68,useyuan=1, dai=2 ,targetID = 5265, targetName = "二代变异多彩豆豆虎", buffID = 22777, buffDesc = "二代变异多彩豆豆虎图鉴激活：全攻击+6800全防御+6800"},
    {index = 69,useyuan=1, dai=2 ,targetID = 5275, targetName = "二代变异多彩豆豆虎", buffID = 22778, buffDesc = "二代变异多彩豆豆虎图鉴激活：全攻击+6900全防御+6900"},
    {index = 70,useyuan=0, dai=2 ,targetID = 5285, targetName = "二代变异多彩豆豆虎", buffID = 22779, buffDesc = "二代变异多彩豆豆虎图鉴激活：全攻击+7000全防御+7000",loc="图鉴boss"},
    {index = 71,useyuan=1, dai=2 ,targetID = 5325, targetName = "二代变异三头凶蛟", buffID = 22780, buffDesc = "二代变异三头凶蛟图鉴激活：全攻击+7100全防御+7100"},
    {index = 72,useyuan=1, dai=2 ,targetID = 5335, targetName = "二代变异梦魇龙王", buffID = 22781, buffDesc = "二代变异梦魇龙王图鉴激活：全攻击+7200全防御+7200"},
    {index = 73,useyuan=1, dai=2 ,targetID = 5355, targetName = "二代变异金鬃狂狮", buffID = 22782, buffDesc = "二代变异金鬃狂狮图鉴激活：全攻击+7300全防御+7300"},
    {index = 74,useyuan=1, dai=2 ,targetID = 5365, targetName = "二代变异武威龙王", buffID = 22783, buffDesc = "二代变异武威龙王图鉴激活：全攻击+7400全防御+7400"},
    {index = 75,useyuan=1, dai=2 ,targetID = 5375, targetName = "二代变异地狱魔龙", buffID = 22784, buffDesc = "二代变异地狱魔龙图鉴激活：全攻击+7500全防御+7500"},
    {index = 76,useyuan=1, dai=2 ,targetID = 5385, targetName = "二代变异开国绝版犀牛", buffID = 22785, buffDesc = "二代变异开国绝版犀牛图鉴激活：全攻击+7600全防御+7600"},
    {index = 77,useyuan=1, dai=2 ,targetID = 5395, targetName = "二代变异烈焰狮鹫", buffID = 22786, buffDesc = "二代变异烈焰狮鹫图鉴激活：全攻击+7700全防御+7700"},
    {index = 78,useyuan=1, dai=2 ,targetID = 5405, targetName = "二代变异千里驹", buffID = 22787, buffDesc = "二代变异千里驹图鉴激活：全攻击+7800全防御+7800"},
    {index = 79,useyuan=1, dai=2 ,targetID = 5415, targetName = "二代变异蚩尤饕餮兽", buffID = 22788, buffDesc = "二代变异蚩尤饕餮兽图鉴激活：全攻击+7900全防御+7900"},
    {index = 80,useyuan=0, dai=2 ,targetID = 5425, targetName = "二代变异烈焱战马", buffID = 22789, buffDesc = "二代变异烈焱战马图鉴激活：全攻击+8000全防御+8000"},
    {index = 81,useyuan=1, dai=2 ,targetID = 5465, targetName = "二代变异比翼双飞", buffID = 22790, buffDesc = "二代变异比翼双飞图鉴激活：全攻击+8100全防御+8100"},
    {index = 82,useyuan=1, dai=2 ,targetID = 5485, targetName = "二代变异金翅飞虎", buffID = 22791, buffDesc = "二代变异金翅飞虎图鉴激活：全攻击+8200全防御+8200"},
    {index = 83,useyuan=1, dai=2 ,targetID = 5495, targetName = "二代变异寒霜魔龙", buffID = 22792, buffDesc = "二代变异寒霜魔龙图鉴激活：全攻击+8300全防御+8300"},
    {index = 84,useyuan=1, dai=2 ,targetID = 5515, targetName = "二代变异剑齿虎", buffID = 22793, buffDesc = "二代变异剑齿虎图鉴激活：全攻击+8400全防御+8400"},
    {index = 85,useyuan=1, dai=2 ,targetID = 5525, targetName = "二代变异贪吃的大潘", buffID = 22794, buffDesc = "二代变异贪吃的大潘图鉴激活：全攻击+8500全防御+8500"},
    {index = 86,useyuan=1, dai=2 ,targetID = 5535, targetName = "二代变异淘气的泡泡", buffID = 22795, buffDesc = "二代变异淘气的泡泡图鉴激活：全攻击+8600全防御+8600"},
    {index = 87,useyuan=1, dai=2 ,targetID = 5545, targetName = "二代变异潘达", buffID = 22796, buffDesc = "二代变异潘达图鉴激活：全攻击+8700全防御+8700"},
    {index = 88,useyuan=1, dai=2 ,targetID = 5555, targetName = "二代变异大角", buffID = 22797, buffDesc = "二代变异大角图鉴激活：全攻击+8800全防御+8800"},
    {index = 89,useyuan=1, dai=2 ,targetID = 5565, targetName = "二代变异炽焰火麟", buffID = 22798, buffDesc = "二代变异炽焰火麟图鉴激活：全攻击+8900全防御+8900"},
    {index = 90,useyuan=0, dai=2 ,targetID = 5575, targetName = "二代变异史前巨蜥", buffID = 22799, buffDesc = "二代变异史前巨蜥图鉴激活：全攻击+9000全防御+9000"},
    {index = 91,useyuan=1, dai=2 ,targetID = 5585, targetName = "二代变异剑齿魔虎", buffID = 22800, buffDesc = "二代变异剑齿魔虎图鉴激活：全攻击+9100全防御+9100"},
    {index = 92,useyuan=1, dai=2 ,targetID = 5595, targetName = "二代变异玉兔", buffID = 22801, buffDesc = "二代变异玉兔图鉴激活：全攻击+9200全防御+9200"},
    {index = 93,useyuan=0, dai=2 ,targetID = 5605, targetName = "二代变异生命源龙", buffID = 22802, buffDesc = "二代变异生命源龙图鉴激活：全攻击+9300全防御+9300"},
    {index = 94,useyuan=0, dai=2 ,targetID = 5615, targetName = "二代变异机械鸟", buffID = 22803, buffDesc = "二代变异机械鸟图鉴激活：全攻击+9400全防御+9400",loc="神秘商店"},
    {index = 95,useyuan=1, dai=2 ,targetID = 5625, targetName = "二代变异寒霜", buffID = 22804, buffDesc = "二代变异寒霜图鉴激活：全攻击+9500全防御+9500"},
    {index = 96,useyuan=1, dai=2 ,targetID = 5635, targetName = "二代变异奎龙", buffID = 22805, buffDesc = "二代变异奎龙图鉴激活：全攻击+9600全防御+9600"},
    {index = 97,useyuan=1, dai=2 ,targetID = 5645, targetName = "二代变异圣诞麋鹿", buffID = 22806, buffDesc = "二代变异圣诞麋鹿图鉴激活：全攻击+9700全防御+9700"},
    {index = 98,useyuan=1, dai=2 ,targetID = 5655, targetName = "二代三国王者坐骑", buffID = 22807, buffDesc = "二代三国王者坐骑图鉴激活：全攻击+9800全防御+9800"},
    {index = 99,useyuan=0, dai=2 ,targetID = 5665, targetName = "二代变异九命狸猫", buffID = 22808, buffDesc = "二代变异九命狸猫图鉴激活：全攻击+9900全防御+9900",loc="神秘商店"},
    {index = 100,useyuan=0, dai=2 ,targetID = 5675, targetName = "二代变异七彩陆行鸟", buffID = 22809, buffDesc = "二代变异七彩陆行鸟图鉴激活：全攻击+10000全防御+10000",loc="图鉴boss"},
    {index = 101,useyuan=1, dai=2 ,targetID = 5685, targetName = "二代变异梦魇机甲", buffID = 22810, buffDesc = "二代变异梦魇机甲图鉴激活：全攻击+10100全防御+10100"},
    {index = 102,useyuan=1, dai=2 ,targetID = 5695, targetName = "二代变异大黄蜂", buffID = 22811, buffDesc = "二代变异大黄蜂图鉴激活：全攻击+10200全防御+10200"},
    {index = 103,useyuan=1, dai=2 ,targetID = 5705, targetName = "二代变异四不像", buffID = 22812, buffDesc = "二代变异四不像图鉴激活：全攻击+10300全防御+10300"},
    {index = 104,useyuan=1, dai=2 ,targetID = 5725, targetName = "二代变异迷你麒麟", buffID = 22813, buffDesc = "二代变异迷你麒麟图鉴激活：全攻击+10400全防御+10400"},
    {index = 105,useyuan=0, dai=2 ,targetID = 5735, targetName = "二代变异白玉雪猫", buffID = 22814, buffDesc = "二代变异白玉雪猫图鉴激活：全攻击+10500全防御+10500",loc="神秘商店"},
    {index = 106,useyuan=1, dai=2 ,targetID = 5745, targetName = "二代变异地狱猪皇", buffID = 22815, buffDesc = "二代变异地狱猪皇图鉴激活：全攻击+10600全防御+10600"},
    {index = 107,useyuan=1, dai=2 ,targetID = 5755, targetName = "二代变异星月天虎", buffID = 22816, buffDesc = "二代变异星月天虎图鉴激活：全攻击+10700全防御+10700"},
    {index = 108,useyuan=1, dai=2 ,targetID = 5765, targetName = "二代变异神行绝影马", buffID = 22817, buffDesc = "二代变异神行绝影马图鉴激活：全攻击+10800全防御+10800"},
    {index = 109,useyuan=1, dai=2 ,targetID = 5785, targetName = "二代变异无双赤兔马", buffID = 22818, buffDesc = "二代变异无双赤兔马图鉴激活：全攻击+10900全防御+10900"},
    {index = 110,useyuan=0, dai=2 ,targetID = 5795, targetName = "二代变异云霄金刚机甲", buffID = 22819, buffDesc = "二代变异云霄金刚机甲图鉴激活：全攻击+11000全防御+11000",loc="图鉴boss"},
    {index = 111,useyuan=1, dai=2 ,targetID = 5805, targetName = "二代变异魔法扫帚", buffID = 22820, buffDesc = "二代变异魔法扫帚图鉴激活：全攻击+11100全防御+11100"},
    {index = 112,useyuan=1, dai=2 ,targetID = 5815, targetName = "二代变异圣诞雪猿", buffID = 22821, buffDesc = "二代变异圣诞雪猿图鉴激活：全攻击+11200全防御+11200"},
    {index = 113,useyuan=1, dai=2 ,targetID = 5825, targetName = "二代变异赤眼金角年兽", buffID = 22822, buffDesc = "二代变异赤眼金角年兽图鉴激活：全攻击+11300全防御+11300"},
    {index = 114,useyuan=1, dai=2 ,targetID = 5835, targetName = "二代变异福瑞金象", buffID = 22823, buffDesc = "二代变异福瑞金象图鉴激活：全攻击+11400全防御+11400"},
    {index = 115,useyuan=1, dai=2 ,targetID = 5845, targetName = "二代变异机关战马", buffID = 22824, buffDesc = "二代变异机关战马图鉴激活：全攻击+11500全防御+11500"},
    {index = 116,useyuan=1, dai=2 ,targetID = 1217, targetName = "二代变异迷你熊猫", buffID = 22825, buffDesc = "二代变异迷你熊猫图鉴激活：全攻击+11600全防御+11600"},
    {index = 117,useyuan=1, dai=2 ,targetID = 1229, targetName = "二代变异迷你毛驴", buffID = 22826, buffDesc = "二代变异迷你毛驴图鉴激活：全攻击+11700全防御+11700"},
    {index = 118,useyuan=1, dai=2 ,targetID = 1241, targetName = "二代变异迷你布老虎", buffID = 22827, buffDesc = "二代变异迷你布老虎图鉴激活：全攻击+11800全防御+11800"},
    {index = 119,useyuan=1, dai=2 ,targetID = 1253, targetName = "二代变异迷你大潘", buffID = 22828, buffDesc = "二代变异迷你大潘图鉴激活：全攻击+11900全防御+11900"},
    {index = 120,useyuan=0, dai=2 ,targetID = 1325, targetName = "二代变异迷你玉兔", buffID = 22829, buffDesc = "二代变异迷你玉兔图鉴激活：全攻击+12000全防御+12000",loc="图鉴boss"},
    {index = 121,useyuan=1, dai=2 ,targetID = 1349, targetName = "二代变异迷你圣诞鹿", buffID = 22830, buffDesc = "二代变异迷你圣诞鹿图鉴激活：全攻击+12100全防御+12100"},
    {index = 122,useyuan=1, dai=2 ,targetID = 1361, targetName = "二代变异迷你疾风鸟", buffID = 22831, buffDesc = "二代变异迷你疾风鸟图鉴激活：全攻击+12200全防御+12200"},
    {index = 123,useyuan=1, dai=2 ,targetID = 1395, targetName = "二代变异迷你赤炎火鸟", buffID = 22832, buffDesc = "二代变异迷你赤炎火鸟图鉴激活：全攻击+12300全防御+12300"},
    {index = 124,useyuan=1, dai=2 ,targetID = 1407, targetName = "二代变异迷你黄金麒麟", buffID = 22833, buffDesc = "二代变异迷你黄金麒麟图鉴激活：全攻击+12400全防御+12400"},
    {index = 125,useyuan=1, dai=2 ,targetID = 1419, targetName = "二代变异迷你咆哮战狼", buffID = 22834, buffDesc = "二代变异迷你咆哮战狼图鉴激活：全攻击+12500全防御+12500"},
    {index = 126,useyuan=1, dai=2 ,targetID = 1431, targetName = "二代变异迷你独角兽", buffID = 22835, buffDesc = "二代变异迷你独角兽图鉴激活：全攻击+12600全防御+12600"},
    {index = 127,useyuan=1, dai=2 ,targetID = 1443, targetName = "二代变异迷你泡泡蟹", buffID = 22836, buffDesc = "二代变异迷你泡泡蟹图鉴激活：全攻击+12700全防御+12700"},
    {index = 128,useyuan=1, dai=2 ,targetID = 1455, targetName = "二代变异迷你冰魄冥虎", buffID = 22837, buffDesc = "二代变异迷你冰魄冥虎图鉴激活：全攻击+12800全防御+12800"},
    {index = 129,useyuan=1, dai=2 ,targetID = 1467, targetName = "二代变异迷你炽焱年兽", buffID = 22838, buffDesc = "二代变异迷你炽焱年兽图鉴激活：全攻击+12900全防御+12900"},
    {index = 130,useyuan=0, dai=2 ,targetID = 1491, targetName = "二代变异迷你四不像", buffID = 22839, buffDesc = "二代变异迷你四不像图鉴激活：全攻击+13000全防御+13000",loc="图鉴boss"},
    {index = 131,useyuan=1, dai=2 ,targetID = 1503, targetName = "二代变异迷你幽灵狼", buffID = 22840, buffDesc = "二代变异迷你幽灵狼图鉴激活：全攻击+13100全防御+13100"},
    {index = 132,useyuan=1, dai=2 ,targetID = 1515, targetName = "二代变异迷你巨齿鳄", buffID = 22841, buffDesc = "二代变异迷你巨齿鳄图鉴激活：全攻击+13200全防御+13200"},
    {index = 133,useyuan=0, dai=2 ,targetID = 1527, targetName = "二代变异迷你双头恶犬", buffID = 22842, buffDesc = "二代变异迷你双头恶犬图鉴激活：全攻击+13300全防御+13300",loc="图鉴boss"},
    {index = 134,useyuan=1, dai=2 ,targetID = 1539, targetName = "二代变异迷你帝王龙龟", buffID = 22843, buffDesc = "二代变异迷你帝王龙龟图鉴激活：全攻击+13400全防御+13400"},
    {index = 135,useyuan=1, dai=2 ,targetID = 1551, targetName = "二代变异迷你雷芒雨工", buffID = 22844, buffDesc = "二代变异迷你雷芒雨工图鉴激活：全攻击+13500全防御+13500"},
    {index = 136,useyuan=1, dai=2 ,targetID = 1575, targetName = "二代变异迷你天命猫妖", buffID = 22845, buffDesc = "二代变异迷你天命猫妖图鉴激活：全攻击+13600全防御+13600"},
    {index = 137,useyuan=1, dai=2 ,targetID = 1587, targetName = "二代变异迷你塔布羊", buffID = 22846, buffDesc = "二代变异迷你塔布羊图鉴激活：全攻击+13700全防御+13700"},

}


--生命源龙
x930127_var_yuanlong = {
    {id=5605,name="二代变异生命源龙",dai=2},
    {id=5606,name="三代变异生命源龙",dai=3},
    {id=5607,name="四代变异生命源龙",dai=4},
    {id=5608,name="五代变异生命源龙",dai=5},
    {id=5609,name="六代变异生命源龙",dai=6},
    {id=5610,name="七代变异生命源龙",dai=7},
}
--如果用的话需要加几代
x930127_var_yuanlongadd=3

--每级需要的培养经验
x930127_var_pyexp = 20
--内丹的表
x930127_var_neidan = {
    {id=12274021,name="一品幻兽内丹",add=1},
    {id=12274022,name="二品幻兽内丹",add=2},
    {id=12274023,name="三品幻兽内丹",add=4},
    {id=12274024,name="四品幻兽内丹",add=10},
    {id=12274025,name="五品幻兽内丹",add=20},
}

x930127_var_QuestName  = "【升级】#R图鉴"
x930127_var_QuestName1 = "【兑换】#R王牌"
x930127_var_Questintro =  "\t你可以用珍贵的#G战神王牌兑换券#W在我这里兑换王牌：#G天·荆轲#W，王牌：#G冥·李师师#W和王牌：#G玄·芙蓉#W。"
x930127_var_Questintro1 =  "\t你可以用珍贵的#G战神王牌兑换券#W在我这里兑换王牌：#G圣·美美#W，王牌：#G星·苍老师#W，王牌：#G魔·陈老师#W。"
x930127_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x930127_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--最小等级限制
x930127_var_minlevel = 40

--DECLARE_QUEST_INFO_STOP--



function x930127_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)
    local level = GetLevel(varMap, varPlayer)
    if level < x930127_var_minlevel then
        Msg2Player(varMap, varPlayer,format("等级不足%d！",x930127_var_minlevel),8,3)
        Msg2Player(varMap, varPlayer,format("等级不足%d！",x930127_var_minlevel),8,2)
        return
    end
    if seleteId == 880 then

        --查询当前buffid
        local curIndex = 0
        for varI, item in x930127_var_ExcObjID do
            local haveImpact  = IsHaveSpecificImpact(varMap, varPlayer, item.buffID)
            if haveImpact > 0 then
                curIndex = varI
            end
        end

        local nextIndex = curIndex + 1
        if nextIndex > getn(x930127_var_ExcObjID) then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y您已经达到最大效果了")
            TalkAppendString(varMap,"\n")
            TalkAppendString(varMap,format("当前buff效果：#R%s#W",x930127_var_ExcObjID[curIndex].buffDesc))
            StopTalkTask()
            DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930127_var_FileId, -1);
            return
        end

        --判断培养的经验值
        local jinyan = GetPlayerGameData(varMap, varPlayer, MD_JIERIQINGDIAN_DATE[1], MD_JIERIQINGDIAN_DATE[2], MD_JIERIQINGDIAN_DATE[3])

        if curIndex > 0 then
            if jinyan < x930127_var_pyexp*curIndex then
                --经验不够，需要培养
                StartTalkTask(varMap)
                TalkAppendString(varMap,format("您当前是#R%d#W级\n当前buff效果：#R%s#W\n当前经验：#G%d#W/%d！",curIndex,x930127_var_ExcObjID[curIndex].buffDesc,jinyan, x930127_var_pyexp*curIndex))
                TalkAppendString(varMap,"点击确定将优先扣除背包内低阶#R幻兽内丹#W，并增加相应经验\n\n下10级需要的道具如下\n")

                local strs = x930127_getnext10desc(varMap, varPlayer,nextIndex)
                local sss = ""
                for varI, ss in strs do
                    sss = sss .. ss
                end
                TalkAppendString(varMap,sss)

                StopTalkTask()
                DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930127_var_FileId, -1);
            else

                --判断需要哪个生命源龙
                local yldai = x930127_var_ExcObjID[nextIndex].dai + x930127_var_yuanlongadd
                if yldai > 7 then
                    yldai = 7
                end
                local curYl = x930127_var_yuanlong[1]
                for varI, item in x930127_var_yuanlong do
                    if item.dai == yldai then
                        curYl = item
                        break
                    end
                end

                StartTalkTask(varMap)
                TalkAppendString(varMap,format("您当前是#R%d#W级\n当前buff效果：#R%s#W\n",curIndex,x930127_var_ExcObjID[curIndex].buffDesc))
                if x930127_var_ExcObjID[nextIndex].useyuan == 1 then
                    TalkAppendString(varMap,format("升级到下级需要#G%s#W或者#G%s#W！\n下一级效果是：#R%s#W\n\n",x930127_var_ExcObjID[nextIndex].targetName,curYl.name,x930127_var_ExcObjID[nextIndex].buffDesc))
                else
                    TalkAppendString(varMap,format("升级到下级需要#G%s#W！\n下一级效果是：#R%s#W\n\n",x930127_var_ExcObjID[nextIndex].targetName,x930127_var_ExcObjID[nextIndex].buffDesc))
                end

                if x930127_var_ExcObjID[nextIndex].loc then
                    TalkAppendString(varMap,format("掉落位置：#R%s#W\n下10级需要的道具如下\n",x930127_var_ExcObjID[nextIndex].loc))
                else
                    TalkAppendString(varMap,"下10级需要的道具如下\n")
                end
                local strs = x930127_getnext10desc(varMap, varPlayer,nextIndex)
                local sss = ""
                for varI, ss in strs do
                    sss = sss .. ss
                end
                TalkAppendString(varMap,sss)
                StopTalkTask()
                DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930127_var_FileId, -1);

                StartGCDTask( varMap);
                GCDAppendInt( varMap, x930127_var_FileId);
                GCDAppendInt( varMap, 0);
                GCDAppendInt( varMap, varTalknpc);
                DeliverGCDInfo( varMap, varPlayer, 101);
                StopGCDTask( varMap)
            end

        else
            --判断需要哪个生命源龙
            local yldai = x930127_var_ExcObjID[nextIndex].dai + x930127_var_yuanlongadd
            if yldai > 7 then
                yldai = 7
            end
            local curYl = x930127_var_yuanlong[1]
            for varI, item in x930127_var_yuanlong do
                if item.dai == yldai then
                    curYl = item
                    break
                end
            end


            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y您当前是0级\n")
            if x930127_var_ExcObjID[nextIndex].useyuan == 1 then
                TalkAppendString(varMap,format("升级到下级需要#G%s#W或者#G%s#W！\n下一级效果是：#R%s#W\n\n",x930127_var_ExcObjID[nextIndex].targetName,curYl.name,x930127_var_ExcObjID[nextIndex].buffDesc))
            else
                TalkAppendString(varMap,format("升级到下级需要#G%s#W！\n下一级效果是：#R%s#W\n\n",x930127_var_ExcObjID[nextIndex].targetName,x930127_var_ExcObjID[nextIndex].buffDesc))
            end
            if x930127_var_ExcObjID[nextIndex].loc then
                TalkAppendString(varMap,format("掉落位置：#R%s#W\n下10级需要的道具如下\n",x930127_var_ExcObjID[nextIndex].loc))
            else
                TalkAppendString(varMap,"下10级需要的道具如下\n")
            end

            local strs = x930127_getnext10desc(varMap, varPlayer,nextIndex)
            local sss = ""
            for varI, ss in strs do
                sss = sss .. ss
            end
            TalkAppendString(varMap,sss)

            StopTalkTask()
            DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930127_var_FileId, -1);

            StartGCDTask( varMap);
            GCDAppendInt( varMap, x930127_var_FileId);
            GCDAppendInt( varMap, 0);
            GCDAppendInt( varMap, varTalknpc);
            DeliverGCDInfo( varMap, varPlayer, 101);
            StopGCDTask( varMap)
        end

    end

end

function x930127_getnext10desc( varMap, varPlayer, nextIndex )



    local str = {}
    local ii = 1
    for varI, item in x930127_var_ExcObjID do
        if varI >= nextIndex and varI - nextIndex <= 10 then
            --判断需要哪个生命源龙
            local yldai = x930127_var_ExcObjID[varI].dai + x930127_var_yuanlongadd
            if yldai > 7 then
                yldai = 7
            end
            local curYl = x930127_var_yuanlong[1]
            for varIi, itemi in x930127_var_yuanlong do
                if itemi.dai == yldai then
                    curYl = itemi
                    break
                end
            end

            --判断需要多少培养经验
            local jy = x930127_var_pyexp*varI


            if x930127_var_ExcObjID[varI].useyuan == 1 then
                str[ii] = format("#G%d#W级需要#G%s#W或者#G%s#W\t需要#G%d#W经验\n",varI, item.targetName,curYl.name,jy)
            else
                str[ii] = format("#G%d#W级需要#G%s#W\t需要#G%d#W经验\n", varI, item.targetName,jy)
            end
            ii = ii+1

        end
    end



    return str
end

function x930127_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_HIGH, 0)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_LOW, 0)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, 0)

    TalkAppendButton(varMap,x930127_var_FileId,x930127_var_QuestName,3,880);

    StartGCDTask( varMap)
    DeliverGCDInfo( varMap, varPlayer, 102)
    StopGCDTask( varMap)
end

function x930127_ProcAccept( varMap, varPlayer )

	x930127_Accept( varMap, varPlayer )
	
end

function x930127_Accept( varMap, varPlayer )


    --查询当前buffid
    local curIndex = 0
    for varI, item in x930127_var_ExcObjID do
        local haveImpact  = IsHaveSpecificImpact(varMap, varPlayer, item.buffID)
        if haveImpact > 0 then
            curIndex = varI
        end
    end

    local nextIndex = curIndex + 1
    if nextIndex > getn(x930127_var_ExcObjID) then
        Msg2Player(varMap, varPlayer,"您已经达到最大效果了！",8,3)
        return
    end

    if curIndex >= 1 then
        --判断培养的经验值
        local jinyan = GetPlayerGameData(varMap, varPlayer, MD_JIERIQINGDIAN_DATE[1], MD_JIERIQINGDIAN_DATE[2], MD_JIERIQINGDIAN_DATE[3])

        Msg2Player(varMap, varPlayer,format("当前经验%d", jinyan),8,3)
        Msg2Player(varMap, varPlayer,format("当前经验%d", jinyan),8,2)

        local add = 0
        if jinyan < x930127_var_pyexp*curIndex then
            --经验不够，需要培养
            for varI, item in x930127_var_neidan do
                local Num = GetItemCount( varMap, varPlayer, item.id )
                if Num > 0 then
                    for i=1 , Num  do
                        if add + jinyan >= x930127_var_pyexp*curIndex then
                            break
                        end
                        if DelItem(varMap,varPlayer,item.id,1) ~= 1 then
                            return
                        else
                            add = add + item.add
                        end
                    end

                    if add + jinyan >= x930127_var_pyexp*curIndex then
                        break
                    end
                end
            end
            if add  > 0 then
                --经验加够了，设置用户数据
                local after = add+jinyan
                if after >= x930127_var_pyexp*curIndex then
                    after = x930127_var_pyexp*curIndex
                end
                SetPlayerGameData(varMap, varPlayer, MD_JIERIQINGDIAN_DATE[1], MD_JIERIQINGDIAN_DATE[2], MD_JIERIQINGDIAN_DATE[3], after)
                Msg2Player(varMap, varPlayer,format("培养成功，增加了%d经验，当前总经验%d", add, after),8,3)
                Msg2Player(varMap, varPlayer,format("培养成功，增加了%d经验，当前总经验%d", add, after),8,2)
                return
            else
                Msg2Player(varMap, varPlayer,"背包中无幻兽内丹",8,3)
                Msg2Player(varMap, varPlayer,"背包中无幻兽内丹",8,2)
            end
            return
        end
    end


    --判断需要哪个生命源龙
    local yldai = x930127_var_ExcObjID[nextIndex].dai + x930127_var_yuanlongadd
    if yldai > 7 then
        yldai = 7
    end
    local curYl = x930127_var_yuanlong[1]
    for varI, item in x930127_var_yuanlong do
        if item.dai == yldai then
            curYl = item
            break
        end
    end

    local high = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_HIGH)
    local low = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_LOW)
    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE)
    local PetID = GetHorseDataID( varMap, varPlayer, varIndex)

    if IsHaveHorse( varMap, varPlayer, PetID) == 0 then
        Msg2Player(varMap, varPlayer,"找不到升级图鉴所需要的马！",8,3)
        Msg2Player(varMap, varPlayer,"找不到升级图鉴所需要的马！",8,2)
        return
    end

    if FreeHorse( varMap, varPlayer, high, low) ~= 1 then
        Msg2Player( varMap, varPlayer, "回收战马失败", 8, 3)
        Msg2Player( varMap, varPlayer, "回收战马失败", 8, 2)
        return
    end

    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_HIGH, -1)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_LOW, -1)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, -1)

    --if x930127_var_ExcObjID[nextIndex].useyuan == 1 then
    --    --可以使用生命源龙
    --    if IsHaveHorse( varMap, varPlayer, x930127_var_ExcObjID[nextIndex].targetID) == 0 and IsHaveHorse( varMap, varPlayer, curYl.id) == 0 then
    --        Msg2Player(varMap, varPlayer,"找不到升级图鉴所需要的马！",8,3)
    --        Msg2Player(varMap, varPlayer,"找不到升级图鉴所需要的马！",8,2)
    --        return
    --    end
    --
    --    if IsHaveHorse( varMap, varPlayer, x930127_var_ExcObjID[nextIndex].targetID) ~= 0 then
    --        FreeHorseByType(varMap, varPlayer,x930127_var_ExcObjID[nextIndex].targetID)
    --        Msg2Player(varMap, varPlayer,"删除马"..x930127_var_ExcObjID[nextIndex].targetID.."成功",8,3)
    --        Msg2Player(varMap, varPlayer,"删除马"..x930127_var_ExcObjID[nextIndex].targetID.."成功",8,2)
    --    elseif IsHaveHorse( varMap, varPlayer, curYl.id) ~= 0 then
    --        FreeHorseByType(varMap, varPlayer,curYl.id)
    --        Msg2Player(varMap, varPlayer,"删除生命源龙"..curYl.id.."成功",8,3)
    --        Msg2Player(varMap, varPlayer,"删除生命源龙"..curYl.id.."成功",8,2)
    --    end
    --else
    --    if IsHaveHorse( varMap, varPlayer, x930127_var_ExcObjID[nextIndex].targetID) == 0  then
    --        Msg2Player(varMap, varPlayer,"找不到升级图鉴所需要的马！",8,3)
    --        Msg2Player(varMap, varPlayer,"找不到升级图鉴所需要的马！",8,2)
    --        return
    --    end
    --
    --    FreeHorseByType(varMap, varPlayer,x930127_var_ExcObjID[nextIndex].targetID)
    --    Msg2Player(varMap, varPlayer,"删除马"..x930127_var_ExcObjID[nextIndex].targetID.."成功",8,3)
    --    Msg2Player(varMap, varPlayer,"删除马"..x930127_var_ExcObjID[nextIndex].targetID.."成功",8,2)
    --end





    if curIndex > 0 then
        local varRet = CancelSpecificImpact( varMap, varPlayer, x930127_var_ExcObjID[curIndex].buffID)
        if varRet <= 0 then
            Msg2Player(varMap, varPlayer,"删除效果"..x930127_var_ExcObjID[curIndex].buffID.."失败",8,3)
            Msg2Player(varMap, varPlayer,"删除效果"..x930127_var_ExcObjID[curIndex].buffID.."失败",8,2)
        else
            Msg2Player(varMap, varPlayer,"删除效果"..x930127_var_ExcObjID[curIndex].buffID.."成功",8,3)
            Msg2Player(varMap, varPlayer,"删除效果"..x930127_var_ExcObjID[curIndex].buffID.."成功",8,2)
        end
    end
    SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x930127_var_ExcObjID[nextIndex].buffID, 0);
    Msg2Player(varMap, varPlayer,"添加效果"..x930127_var_ExcObjID[nextIndex].buffID.."成功",8,3)
    Msg2Player(varMap, varPlayer,"添加效果"..x930127_var_ExcObjID[nextIndex].buffID.."成功",8,2)

    --清除当前经验
    SetPlayerGameData(varMap, varPlayer, MD_JIERIQINGDIAN_DATE[1], MD_JIERIQINGDIAN_DATE[2], MD_JIERIQINGDIAN_DATE[3], 0)
    Msg2Player(varMap, varPlayer,"清除当前经验成功",8,3)
    Msg2Player(varMap, varPlayer,"清除当前经验成功",8,2)
end
		
function x930127_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end



function x930127_ProcCommitPet( varMap, varPlayer, varQuest, varTalknpc, horseGUID_high, horseGUID_low, varIndex)

    --查询当前buffid
    local curIndex = 0
    for varI, item in x930127_var_ExcObjID do
        local haveImpact  = IsHaveSpecificImpact(varMap, varPlayer, item.buffID)
        if haveImpact > 0 then
            curIndex = varI
        end
    end

    local nextIndex = curIndex + 1
    if nextIndex > getn(x930127_var_ExcObjID) then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y您已经达到最大效果了")
        TalkAppendString(varMap,"\n")
        TalkAppendString(varMap,format("当前buff效果：#R%s#W",x930127_var_ExcObjID[curIndex].buffDesc))
        StopTalkTask()
        DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930127_var_FileId, -1);
        return
    end

    --判断需要哪个生命源龙
    local yldai = x930127_var_ExcObjID[nextIndex].dai + x930127_var_yuanlongadd
    if yldai > 7 then
        yldai = 7
    end
    local curYl = x930127_var_yuanlong[1]
    for varI, item in x930127_var_yuanlong do
        if item.dai == yldai then
            curYl = item
            break
        end
    end



    local ylid = -100
    local commonid = x930127_var_ExcObjID[nextIndex].targetID
    if x930127_var_ExcObjID[nextIndex].useyuan == 1 then
        ylid = curYl.id
    end



    local PetID = GetHorseDataID( varMap, varPlayer, varIndex)
    local takeLevel = GetPet_TakeLevel( varMap, varPlayer, varIndex)


    if PetID == ylid or PetID == commonid then

        StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y【个人】图鉴升级" )
        TalkAppendString( varMap, "\t想将这匹战马交给我吗？放心，我不会亏待你的。" )
        StopTalkTask()

        DeliverTalkInfo( varMap, varPlayer, varTalknpc, x930127_var_FileId, -1)

        SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_HIGH, horseGUID_high)
        SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_LOW, horseGUID_low)
        SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, varIndex)


        StartGCDTask( varMap)
        DeliverGCDInfo( varMap, varPlayer, 102)
        StopGCDTask( varMap)
    else

        StartTalkTask( varMap)
        TalkAppendString( varMap, "你提交的骑乘不符合需求" )
        StopTalkTask()
        DeliverTalkTips( varMap, varPlayer)

        Msg2Player( varMap, varPlayer, "你提交的骑乘不符合需求", 4, 2)
    end
end


function x930127_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x930127_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x930127_CheckSubmit( varMap, varPlayer )

end




function x930127_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x930127_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x930127_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x930127_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
