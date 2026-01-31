
--DECLARE_QUEST_INFO_START--

x930128_var_FileId = 930128

x930128_var_SelectIndex = {}

-- 兑换目标道具名称
x930128_var_TargetName = "时装"

x930128_var_jhName = "时装精华"
x930128_var_jhID = 12274000
x930128_var_jhNum = 10
--根据时装等级增加所需要的时装精华数量。 最终需要的数量  level/10*var
x930128_var_jhXs = 2

--回收时返还时装精华数量
x930128_var_jhHsNum = 1

--每隔5个需要时装核心
x930128_var_hexin = {id=12274041,name="时装核心"}

-- 兑换目标道具ID
x930128_var_ExcObjID = {
    {index = 1 , jh = 1, targetID = 10300000, targetName = "练舞服", buffID = 21200, buffDesc = "练舞服时装激活：命中+5闪避+5暴击+5韧性+5暴击伤害+5",hs=1},
    {index = 2 , jh = 1, targetID = 10300001, targetName = "狂舞服", buffID = 21201, buffDesc = "狂舞服时装激活：命中+6闪避+6暴击+6韧性+6暴击伤害+6",hs=1},
    {index = 3 , jh = 1, targetID = 10300010, targetName = "天舞服", buffID = 21202, buffDesc = "天舞服时装激活：命中+7闪避+7暴击+7韧性+7暴击伤害+7",hs=1},
    {index = 4 , jh = 1, targetID = 10300011, targetName = "威武2装", buffID = 21203, buffDesc = "威武2装时装激活：命中+8闪避+8暴击+8韧性+8暴击伤害+8",hs=1},
    {index = 5 , jh = 1, targetID = 10300100, targetName = "王者套装", buffID = 21204, buffDesc = "王者套装时装激活：命中+9闪避+9暴击+9韧性+9暴击伤害+9",hs=0},
    {index = 6 , jh = 1, targetID = 10300101, targetName = "剑龙超炫外装", buffID = 21205, buffDesc = "剑龙超炫外装时装激活：命中+10闪避+10暴击+10韧性+10暴击伤害+10",hs=1},
    {index = 7 , jh = 1, targetID = 10300102, targetName = "绝版成吉思汗套装", buffID = 21206, buffDesc = "绝版成吉思汗套装时装激活：命中+11闪避+11暴击+11韧性+11暴击伤害+11",hs=1},
    {index = 8 , jh = 1, targetID = 10300103, targetName = "屠龙外装", buffID = 21207, buffDesc = "屠龙外装时装激活：命中+12闪避+12暴击+12韧性+12暴击伤害+12",hs=1},
    {index = 9 , jh = 1, targetID = 10300104, targetName = "突厥时装", buffID = 21208, buffDesc = "突厥时装时装激活：命中+13闪避+13暴击+13韧性+13暴击伤害+13",hs=1},
    {index = 10 , jh = 0, targetID = 10300105, targetName = "成吉思汗公测纪念装", buffID = 21209, buffDesc = "成吉思汗公测纪念装时装激活：命中+14闪避+14暴击+14韧性+14暴击伤害+14",hs=1},
    {index = 11 , jh = 1, targetID = 10300106, targetName = "黄金外装", buffID = 21210, buffDesc = "黄金外装时装激活：命中+15闪避+15暴击+15韧性+15暴击伤害+15",hs=1},
    {index = 12 , jh = 1, targetID = 10300107, targetName = "七夕时装", buffID = 21211, buffDesc = "七夕时装时装激活：命中+16闪避+16暴击+16韧性+16暴击伤害+16",hs=1},
    {index = 13 , jh = 1, targetID = 10300108, targetName = "1天初级攻装", buffID = 21212, buffDesc = "1天初级攻装时装激活：命中+17闪避+17暴击+17韧性+17暴击伤害+17",hs=1},
    {index = 14 , jh = 1, targetID = 10300109, targetName = "7天初级攻装", buffID = 21213, buffDesc = "7天初级攻装时装激活：命中+18闪避+18暴击+18韧性+18暴击伤害+18",hs=1},
    {index = 15 , jh = 1, targetID = 10300110, targetName = "30天初级攻装", buffID = 21214, buffDesc = "30天初级攻装时装激活：命中+19闪避+19暴击+19韧性+19暴击伤害+19",hs=1},
    {index = 16 , jh = 1, targetID = 10300111, targetName = "苗疆时装(1天)", buffID = 21215, buffDesc = "苗疆时装(1天)时装激活：命中+20闪避+20暴击+20韧性+20暴击伤害+20",hs=1},
    {index = 17 , jh = 1, targetID = 10300112, targetName = "苗疆时装(7天)", buffID = 21216, buffDesc = "苗疆时装(7天)时装激活：命中+21闪避+21暴击+21韧性+21暴击伤害+21",hs=1},
    {index = 18 , jh = 1, targetID = 10300113, targetName = "苗疆时装(30天)", buffID = 21217, buffDesc = "苗疆时装(30天)时装激活：命中+22闪避+22暴击+22韧性+22暴击伤害+22",hs=1},
    {index = 19 , jh = 1, targetID = 10300114, targetName = "刺陵时装(1天)", buffID = 21218, buffDesc = "刺陵时装(1天)时装激活：命中+23闪避+23暴击+23韧性+23暴击伤害+23",hs=1},
    {index = 20 , jh = 0, targetID = 10300115, targetName = "刺陵时装(7天)", buffID = 21219, buffDesc = "刺陵时装(7天)时装激活：命中+24闪避+24暴击+24韧性+24暴击伤害+24",hs=1},
    {index = 21 , jh = 1, targetID = 10300116, targetName = "刺陵时装(30天)", buffID = 21220, buffDesc = "刺陵时装(30天)时装激活：命中+25闪避+25暴击+25韧性+25暴击伤害+25",hs=1},
    {index = 22 , jh = 1, targetID = 10300117, targetName = "1天初级防装", buffID = 21221, buffDesc = "1天初级防装时装激活：命中+26闪避+26暴击+26韧性+26暴击伤害+26",hs=1},
    {index = 23 , jh = 1, targetID = 10300118, targetName = "7天初级防装", buffID = 21222, buffDesc = "7天初级防装时装激活：命中+27闪避+27暴击+27韧性+27暴击伤害+27",hs=1},
    {index = 24 , jh = 1, targetID = 10300119, targetName = "30天初级防装", buffID = 21223, buffDesc = "30天初级防装时装激活：命中+28闪避+28暴击+28韧性+28暴击伤害+28",hs=1},
    {index = 25 , jh = 1, targetID = 10300120, targetName = "百夷时装(1天)", buffID = 21224, buffDesc = "百夷时装(1天)时装激活：命中+29闪避+29暴击+29韧性+29暴击伤害+29",hs=1},
    {index = 26 , jh = 1, targetID = 10300121, targetName = "百夷时装(7天)", buffID = 21225, buffDesc = "百夷时装(7天)时装激活：命中+30闪避+30暴击+30韧性+30暴击伤害+30",hs=1},
    {index = 27 , jh = 1, targetID = 10300122, targetName = "百夷时装(30天)", buffID = 21226, buffDesc = "百夷时装(30天)时装激活：命中+31闪避+31暴击+31韧性+31暴击伤害+31",hs=1},
    {index = 28 , jh = 1, targetID = 10300123, targetName = "天竺时装(1天)", buffID = 21227, buffDesc = "天竺时装(1天)时装激活：命中+32闪避+32暴击+32韧性+32暴击伤害+32",hs=1},
    {index = 29 , jh = 1, targetID = 10300124, targetName = "天竺时装(7天)", buffID = 21228, buffDesc = "天竺时装(7天)时装激活：命中+33闪避+33暴击+33韧性+33暴击伤害+33",hs=1},
    {index = 30 , jh = 0, targetID = 10300125, targetName = "天竺时装(30天)", buffID = 21229, buffDesc = "天竺时装(30天)时装激活：命中+34闪避+34暴击+34韧性+34暴击伤害+34",hs=1},
    {index = 31 , jh = 1, targetID = 10300126, targetName = "1天初级血装", buffID = 21230, buffDesc = "1天初级血装时装激活：命中+35闪避+35暴击+35韧性+35暴击伤害+35",hs=1},
    {index = 32 , jh = 1, targetID = 10300127, targetName = "7天初级血装", buffID = 21231, buffDesc = "7天初级血装时装激活：命中+36闪避+36暴击+36韧性+36暴击伤害+36",hs=1},
    {index = 33 , jh = 1, targetID = 10300128, targetName = "30天初级血装", buffID = 21232, buffDesc = "30天初级血装时装激活：命中+37闪避+37暴击+37韧性+37暴击伤害+37",hs=1},
    {index = 34 , jh = 1, targetID = 10300129, targetName = "大理时装(1天)", buffID = 21233, buffDesc = "大理时装(1天)时装激活：命中+38闪避+38暴击+38韧性+38暴击伤害+38",hs=1},
    {index = 35 , jh = 1, targetID = 10300130, targetName = "大理时装(7天)", buffID = 21234, buffDesc = "大理时装(7天)时装激活：命中+39闪避+39暴击+39韧性+39暴击伤害+39",hs=1},
    {index = 36 , jh = 1, targetID = 10300131, targetName = "大理时装(30天)", buffID = 21235, buffDesc = "大理时装(30天)时装激活：命中+40闪避+40暴击+40韧性+40暴击伤害+40",hs=1},
    {index = 37 , jh = 1, targetID = 10300132, targetName = "波斯时装(1天)", buffID = 21236, buffDesc = "波斯时装(1天)时装激活：命中+41闪避+41暴击+41韧性+41暴击伤害+41",hs=1},
    {index = 38 , jh = 1, targetID = 10300133, targetName = "波斯时装(7天)", buffID = 21237, buffDesc = "波斯时装(7天)时装激活：命中+42闪避+42暴击+42韧性+42暴击伤害+42",hs=1},
    {index = 39 , jh = 1, targetID = 10300134, targetName = "波斯时装(30天)", buffID = 21238, buffDesc = "波斯时装(30天)时装激活：命中+43闪避+43暴击+43韧性+43暴击伤害+43",hs=1},
    {index = 40 , jh = 0, targetID = 10300135, targetName = "斩龙套装", buffID = 21239, buffDesc = "斩龙套装时装激活：命中+44闪避+44暴击+44韧性+44暴击伤害+44",hs=1},
    {index = 41 , jh = 1, targetID = 10300136, targetName = "刺陵时装", buffID = 21240, buffDesc = "刺陵时装时装激活：命中+45闪避+45暴击+45韧性+45暴击伤害+45",hs=1},
    {index = 42 , jh = 1, targetID = 10300137, targetName = "昆仑战袍", buffID = 21241, buffDesc = "昆仑战袍时装激活：命中+46闪避+46暴击+46韧性+46暴击伤害+46",hs=1},
    {index = 43 , jh = 1, targetID = 10300138, targetName = "楼兰战袍", buffID = 21242, buffDesc = "楼兰战袍时装激活：命中+47闪避+47暴击+47韧性+47暴击伤害+47",hs=1},
    {index = 44 , jh = 1, targetID = 10300139, targetName = "莱茵战袍", buffID = 21243, buffDesc = "莱茵战袍时装激活：命中+48闪避+48暴击+48韧性+48暴击伤害+48",hs=1},
    {index = 45 , jh = 1, targetID = 10300140, targetName = "敦煌战袍", buffID = 21244, buffDesc = "敦煌战袍时装激活：命中+49闪避+49暴击+49韧性+49暴击伤害+49",hs=1},
    {index = 46 , jh = 1, targetID = 10300141, targetName = "圣诞时装", buffID = 21245, buffDesc = "圣诞时装时装激活：命中+50闪避+50暴击+50韧性+50暴击伤害+50",hs=1},
    {index = 47 , jh = 1, targetID = 10300142, targetName = "汗国时装(7天)", buffID = 21246, buffDesc = "汗国时装(7天)时装激活：命中+51闪避+51暴击+51韧性+51暴击伤害+51",hs=1},
    {index = 48 , jh = 1, targetID = 10300143, targetName = "情人节新手时装", buffID = 21247, buffDesc = "情人节新手时装时装激活：命中+52闪避+52暴击+52韧性+52暴击伤害+52",hs=1},
    {index = 49 , jh = 1, targetID = 10300144, targetName = "情人节甜蜜时装", buffID = 21248, buffDesc = "情人节甜蜜时装时装激活：命中+53闪避+53暴击+53韧性+53暴击伤害+53",hs=1},
    {index = 50 , jh = 0, targetID = 10300145, targetName = "节日时装", buffID = 21249, buffDesc = "节日时装时装激活：命中+54闪避+54暴击+54韧性+54暴击伤害+54",hs=1},
    {index = 51 , jh = 1, targetID = 10300146, targetName = "世界杯时装", buffID = 21250, buffDesc = "世界杯时装时装激活：命中+55闪避+55暴击+55韧性+55暴击伤害+55",hs=1},
    {index = 52 , jh = 1, targetID = 10300147, targetName = "宫廷时装(30天)", buffID = 21251, buffDesc = "宫廷时装(30天)时装激活：命中+56闪避+56暴击+56韧性+56暴击伤害+56",hs=1},
    {index = 53 , jh = 1, targetID = 10300148, targetName = "草原之星时装", buffID = 21252, buffDesc = "草原之星时装时装激活：命中+57闪避+57暴击+57韧性+57暴击伤害+57",hs=1},
    {index = 54 , jh = 1, targetID = 10300149, targetName = "黄金甲套装", buffID = 21253, buffDesc = "黄金甲套装时装激活：命中+58闪避+58暴击+58韧性+58暴击伤害+58",hs=1},
    {index = 55 , jh = 1, targetID = 10300150, targetName = "虎啸远征套装", buffID = 21254, buffDesc = "虎啸远征套装时装激活：命中+59闪避+59暴击+59韧性+59暴击伤害+59",hs=1},
    {index = 56 , jh = 1, targetID = 10300151, targetName = "贺喜华服", buffID = 21255, buffDesc = "贺喜华服时装激活：命中+60闪避+60暴击+60韧性+60暴击伤害+60",hs=1},
    {index = 57 , jh = 1, targetID = 10300152, targetName = "玉兔折桂时装（7天）", buffID = 21256, buffDesc = "玉兔折桂时装（7天）时装激活：命中+61闪避+61暴击+61韧性+61暴击伤害+61",hs=1},
    {index = 58 , jh = 1, targetID = 10300153, targetName = "真爱一生礼服", buffID = 21257, buffDesc = "真爱一生礼服时装激活：命中+62闪避+62暴击+62韧性+62暴击伤害+62",hs=1},
    {index = 59 , jh = 1, targetID = 10300154, targetName = "情人时装(30天)", buffID = 21258, buffDesc = "情人时装(30天)时装激活：命中+63闪避+63暴击+63韧性+63暴击伤害+63",hs=1},
    {index = 60 , jh = 0, targetID = 10300155, targetName = "玉兔折桂时装", buffID = 21259, buffDesc = "玉兔折桂时装时装激活：命中+64闪避+64暴击+64韧性+64暴击伤害+64",hs=1},
    {index = 61 , jh = 1, targetID = 10300156, targetName = "真爱一生礼服", buffID = 21260, buffDesc = "真爱一生礼服时装激活：命中+65闪避+65暴击+65韧性+65暴击伤害+65",hs=1},
    {index = 62 , jh = 1, targetID = 10300157, targetName = "皇帝时装", buffID = 21261, buffDesc = "皇帝时装时装激活：命中+66闪避+66暴击+66韧性+66暴击伤害+66",hs=0},
    {index = 63 , jh = 1, targetID = 10300158, targetName = "才子佳人时装", buffID = 21262, buffDesc = "才子佳人时装时装激活：命中+67闪避+67暴击+67韧性+67暴击伤害+67",hs=1},
    {index = 64 , jh = 1, targetID = 10300159, targetName = "漫天缤纷时装", buffID = 21263, buffDesc = "漫天缤纷时装时装激活：命中+68闪避+68暴击+68韧性+68暴击伤害+68",hs=1},
    {index = 65 , jh = 1, targetID = 10300160, targetName = "口若悬河时装", buffID = 21264, buffDesc = "口若悬河时装时装激活：命中+69闪避+69暴击+69韧性+69暴击伤害+69",hs=1},
    {index = 66 , jh = 1, targetID = 10300161, targetName = "精品节日时装", buffID = 21265, buffDesc = "精品节日时装时装激活：命中+70闪避+70暴击+70韧性+70暴击伤害+70",hs=1},
    {index = 67 , jh = 1, targetID = 10300162, targetName = "皇家时装", buffID = 21266, buffDesc = "皇家时装时装激活：命中+71闪避+71暴击+71韧性+71暴击伤害+71",hs=0},
    {index = 68 , jh = 1, targetID = 10300163, targetName = "皇家时装", buffID = 21267, buffDesc = "皇家时装时装激活：命中+72闪避+72暴击+72韧性+72暴击伤害+72",hs=0},
    {index = 69 , jh = 1, targetID = 10300164, targetName = "皇家时装", buffID = 21268, buffDesc = "皇家时装时装激活：命中+73闪避+73暴击+73韧性+73暴击伤害+73",hs=0},
    {index = 70 , jh = 1, targetID = 10300165, targetName = "皇帝时装", buffID = 21269, buffDesc = "皇帝时装时装激活：命中+74闪避+74暴击+74韧性+74暴击伤害+74",hs=0},
    {index = 71 , jh = 1, targetID = 10300166, targetName = "皇帝时装", buffID = 21270, buffDesc = "皇帝时装时装激活：命中+75闪避+75暴击+75韧性+75暴击伤害+75",hs=0},
    {index = 72 , jh = 1, targetID = 10300167, targetName = "皇帝时装", buffID = 21271, buffDesc = "皇帝时装时装激活：命中+76闪避+76暴击+76韧性+76暴击伤害+76",hs=0},
    {index = 73 , jh = 1, targetID = 10300168, targetName = "皇帝时装", buffID = 21272, buffDesc = "皇帝时装时装激活：命中+77闪避+77暴击+77韧性+77暴击伤害+77",hs=0},
    {index = 74 , jh = 1, targetID = 10306010, targetName = "近抗时装", buffID = 21273, buffDesc = "近抗时装时装激活：命中+78闪避+78暴击+78韧性+78暴击伤害+78",hs=1},
    {index = 75 , jh = 1, targetID = 10306011, targetName = "远抗时装", buffID = 21274, buffDesc = "远抗时装时装激活：命中+79闪避+79暴击+79韧性+79暴击伤害+79",hs=1},
    {index = 76 , jh = 1, targetID = 10306012, targetName = "魔抗时装", buffID = 21275, buffDesc = "魔抗时装时装激活：命中+80闪避+80暴击+80韧性+80暴击伤害+80",hs=1},
    {index = 77 , jh = 1, targetID = 10306013, targetName = "均抗时装", buffID = 21276, buffDesc = "均抗时装时装激活：命中+81闪避+81暴击+81韧性+81暴击伤害+81",hs=1},
    {index = 78 , jh = 1, targetID = 10306014, targetName = "疾风时装", buffID = 21277, buffDesc = "疾风时装时装激活：命中+82闪避+82暴击+82韧性+82暴击伤害+82",hs=1},
    {index = 79 , jh = 1, targetID = 10306015, targetName = "五好少年时装", buffID = 21278, buffDesc = "五好少年时装时装激活：命中+83闪避+83暴击+83韧性+83暴击伤害+83",hs=1},
    {index = 80 , jh = 0, targetID = 10306016, targetName = "大秦之风(30天)", buffID = 21279, buffDesc = "大秦之风(30天)时装激活：命中+84闪避+84暴击+84韧性+84暴击伤害+84",hs=1},
    {index = 81 , jh = 1, targetID = 10306017, targetName = "龙之吐息(30天)", buffID = 21280, buffDesc = "龙之吐息(30天)时装激活：命中+85闪避+85暴击+85韧性+85暴击伤害+85",hs=1},
    {index = 82 , jh = 1, targetID = 10306018, targetName = "燕山风情(30天)", buffID = 21281, buffDesc = "燕山风情(30天)时装激活：命中+86闪避+86暴击+86韧性+86暴击伤害+86",hs=1},
    {index = 83 , jh = 1, targetID = 10306019, targetName = "银龙时装", buffID = 21282, buffDesc = "银龙时装时装激活：命中+87闪避+87暴击+87韧性+87暴击伤害+87",hs=1},
    {index = 84 , jh = 1, targetID = 10306020, targetName = "吻风雪翼(30天)", buffID = 21283, buffDesc = "吻风雪翼(30天)时装激活：命中+88闪避+88暴击+88韧性+88暴击伤害+88",hs=1},
    {index = 85 , jh = 1, targetID = 10306021, targetName = "相守偕老(30天)", buffID = 21284, buffDesc = "相守偕老(30天)时装激活：命中+89闪避+89暴击+89韧性+89暴击伤害+89",hs=1},
    {index = 86 , jh = 1, targetID = 10306022, targetName = "乱世蔷薇(30天)", buffID = 21285, buffDesc = "乱世蔷薇(30天)时装激活：命中+90闪避+90暴击+90韧性+90暴击伤害+90",hs=1},
    {index = 87 , jh = 1, targetID = 10306023, targetName = "冰风时装(30天)", buffID = 21286, buffDesc = "冰风时装(30天)时装激活：命中+91闪避+91暴击+91韧性+91暴击伤害+91",hs=1},
    {index = 88 , jh = 1, targetID = 10306024, targetName = "金玉唐风(30天)", buffID = 21287, buffDesc = "金玉唐风(30天)时装激活：命中+92闪避+92暴击+92韧性+92暴击伤害+92",hs=1},
    {index = 89 , jh = 1, targetID = 10306025, targetName = "冷羽无悯(30天)", buffID = 21288, buffDesc = "冷羽无悯(30天)时装激活：命中+93闪避+93暴击+93韧性+93暴击伤害+93",hs=1},
    {index = 90 , jh = 0, targetID = 10306026, targetName = "刺陵时装(7天)", buffID = 21289, buffDesc = "刺陵时装(7天)时装激活：命中+94闪避+94暴击+94韧性+94暴击伤害+94",hs=1},
    {index = 91 , jh = 1, targetID = 10306027, targetName = "刺陵时装(30天)", buffID = 21290, buffDesc = "刺陵时装(30天)时装激活：命中+95闪避+95暴击+95韧性+95暴击伤害+95",hs=1},
    {index = 92 , jh = 1, targetID = 10306028, targetName = "天竺时装(7天)", buffID = 21291, buffDesc = "天竺时装(7天)时装激活：命中+96闪避+96暴击+96韧性+96暴击伤害+96",hs=1},
    {index = 93 , jh = 1, targetID = 10306029, targetName = "天竺时装(30天)", buffID = 21292, buffDesc = "天竺时装(30天)时装激活：命中+97闪避+97暴击+97韧性+97暴击伤害+97",hs=1},
    {index = 94 , jh = 1, targetID = 10306030, targetName = "波斯时装(7天)", buffID = 21293, buffDesc = "波斯时装(7天)时装激活：命中+98闪避+98暴击+98韧性+98暴击伤害+98",hs=1},
    {index = 95 , jh = 0, targetID = 10306031, targetName = "波斯时装(30天)", buffID = 21294, buffDesc = "波斯时装(30天)时装激活：命中+99闪避+99暴击+99韧性+99暴击伤害+99",hs=1},
    {index = 96 , jh = 1, targetID = 10306032, targetName = "苗疆时装(7天)", buffID = 21295, buffDesc = "苗疆时装(7天)时装激活：命中+100闪避+100暴击+100韧性+100暴击伤害+100",hs=1},
    {index = 97 , jh = 1, targetID = 10306033, targetName = "苗疆时装(30天)", buffID = 21296, buffDesc = "苗疆时装(30天)时装激活：命中+101闪避+101暴击+101韧性+101暴击伤害+101",hs=1},
    {index = 98 , jh = 1, targetID = 10306034, targetName = "百夷时装(7天)", buffID = 21297, buffDesc = "百夷时装(7天)时装激活：命中+102闪避+102暴击+102韧性+102暴击伤害+102",hs=1},
    {index = 99 , jh = 1, targetID = 10306035, targetName = "百夷时装(30天)", buffID = 21298, buffDesc = "百夷时装(30天)时装激活：命中+103闪避+103暴击+103韧性+103暴击伤害+103",hs=1},
    {index = 100 , jh = 0, targetID = 10306036, targetName = "大理时装(7天)", buffID = 21299, buffDesc = "大理时装(7天)时装激活：命中+104闪避+104暴击+104韧性+104暴击伤害+104",hs=1},
    {index = 101 , jh = 1, targetID = 10306037, targetName = "大理时装(30天)", buffID = 21300, buffDesc = "大理时装(30天)时装激活：命中+105闪避+105暴击+105韧性+105暴击伤害+105",hs=1},
    {index = 102 , jh = 1, targetID = 10306038, targetName = "宫廷时装(7天)", buffID = 21301, buffDesc = "宫廷时装(7天)时装激活：命中+106闪避+106暴击+106韧性+106暴击伤害+106",hs=1},
    {index = 103 , jh = 1, targetID = 10306039, targetName = "宫廷时装(30天)", buffID = 21302, buffDesc = "宫廷时装(30天)时装激活：命中+107闪避+107暴击+107韧性+107暴击伤害+107",hs=1},
    {index = 104 , jh = 1, targetID = 10306040, targetName = "情人时装(7天)", buffID = 21303, buffDesc = "情人时装(7天)时装激活：命中+108闪避+108暴击+108韧性+108暴击伤害+108",hs=1},
    {index = 105 , jh = 0, targetID = 10306041, targetName = "情人时装(30天)", buffID = 21304, buffDesc = "情人时装(30天)时装激活：命中+109闪避+109暴击+109韧性+109暴击伤害+109",hs=1},
    {index = 106 , jh = 1, targetID = 10306042, targetName = "大秦之风(7天)", buffID = 21305, buffDesc = "大秦之风(7天)时装激活：命中+110闪避+110暴击+110韧性+110暴击伤害+110",hs=1},
    {index = 107 , jh = 1, targetID = 10306043, targetName = "龙之吐息(7天)", buffID = 21306, buffDesc = "龙之吐息(7天)时装激活：命中+111闪避+111暴击+111韧性+111暴击伤害+111",hs=1},
    {index = 108 , jh = 1, targetID = 10306044, targetName = "燕山风情(7天)", buffID = 21307, buffDesc = "燕山风情(7天)时装激活：命中+112闪避+112暴击+112韧性+112暴击伤害+112",hs=1},
    {index = 109 , jh = 1, targetID = 10306045, targetName = "吻风雪翼(7天)", buffID = 21308, buffDesc = "吻风雪翼(7天)时装激活：命中+113闪避+113暴击+113韧性+113暴击伤害+113",hs=1},
    {index = 110 , jh = 0, targetID = 10306046, targetName = "相守偕老(7天)", buffID = 21309, buffDesc = "相守偕老(7天)时装激活：命中+114闪避+114暴击+114韧性+114暴击伤害+114",hs=1},
    {index = 111 , jh = 1, targetID = 10306047, targetName = "乱世蔷薇(7天)", buffID = 21310, buffDesc = "乱世蔷薇(7天)时装激活：命中+115闪避+115暴击+115韧性+115暴击伤害+115",hs=1},
    {index = 112 , jh = 1, targetID = 10306048, targetName = "冰风时装(7天)", buffID = 21311, buffDesc = "冰风时装(7天)时装激活：命中+116闪避+116暴击+116韧性+116暴击伤害+116",hs=1},
    {index = 113 , jh = 1, targetID = 10306049, targetName = "金玉唐风(7天)", buffID = 21312, buffDesc = "金玉唐风(7天)时装激活：命中+117闪避+117暴击+117韧性+117暴击伤害+117",hs=1},
    {index = 114 , jh = 1, targetID = 10306050, targetName = "冷羽无悯(7天)", buffID = 21313, buffDesc = "冷羽无悯(7天)时装激活：命中+118闪避+118暴击+118韧性+118暴击伤害+118",hs=1},
    {index = 115 , jh = 0, targetID = 10306051, targetName = "月焰时装（30天）", buffID = 21314, buffDesc = "月焰时装（30天）时装激活：命中+119闪避+119暴击+119韧性+119暴击伤害+119",hs=1},
    {index = 116 , jh = 1, targetID = 10306052, targetName = "百夷时装", buffID = 21315, buffDesc = "百夷时装时装激活：命中+120闪避+120暴击+120韧性+120暴击伤害+120",hs=1},
    {index = 117 , jh = 1, targetID = 10306053, targetName = "国蕴时装(7天)", buffID = 21316, buffDesc = "国蕴时装(7天)时装激活：命中+121闪避+121暴击+121韧性+121暴击伤害+121",hs=1},
    {index = 118 , jh = 1, targetID = 10306054, targetName = "国蕴时装(30天)", buffID = 21317, buffDesc = "国蕴时装(30天)时装激活：命中+122闪避+122暴击+122韧性+122暴击伤害+122",hs=1},
    {index = 119 , jh = 1, targetID = 10306055, targetName = "红黑之惑(7天)", buffID = 21318, buffDesc = "红黑之惑(7天)时装激活：命中+123闪避+123暴击+123韧性+123暴击伤害+123",hs=1},
    {index = 120 , jh = 0, targetID = 10306056, targetName = "红黑之惑(30天)", buffID = 21319, buffDesc = "红黑之惑(30天)时装激活：命中+124闪避+124暴击+124韧性+124暴击伤害+124",hs=1},
    {index = 121 , jh = 1, targetID = 10306057, targetName = "黑色制服(7天)", buffID = 21320, buffDesc = "黑色制服(7天)时装激活：命中+125闪避+125暴击+125韧性+125暴击伤害+125",hs=1},
    {index = 122 , jh = 1, targetID = 10306058, targetName = "黑色制服(30天)", buffID = 21321, buffDesc = "黑色制服(30天)时装激活：命中+126闪避+126暴击+126韧性+126暴击伤害+126",hs=1},
    {index = 123 , jh = 1, targetID = 10306059, targetName = "云霞时装(7天)", buffID = 21322, buffDesc = "云霞时装(7天)时装激活：命中+127闪避+127暴击+127韧性+127暴击伤害+127",hs=1},
    {index = 124 , jh = 1, targetID = 10306060, targetName = "云霞时装(30天)", buffID = 21323, buffDesc = "云霞时装(30天)时装激活：命中+128闪避+128暴击+128韧性+128暴击伤害+128",hs=1},
    {index = 125 , jh = 1, targetID = 10306061, targetName = "苗族时装(7天)", buffID = 21324, buffDesc = "苗族时装(7天)时装激活：命中+129闪避+129暴击+129韧性+129暴击伤害+129",hs=1},
    {index = 126 , jh = 1, targetID = 10306062, targetName = "苗族时装(30天)", buffID = 21325, buffDesc = "苗族时装(30天)时装激活：命中+130闪避+130暴击+130韧性+130暴击伤害+130",hs=1},
    {index = 127 , jh = 1, targetID = 10306063, targetName = "青莲时装(7天)", buffID = 21326, buffDesc = "青莲时装(7天)时装激活：命中+131闪避+131暴击+131韧性+131暴击伤害+131",hs=1},
    {index = 128 , jh = 1, targetID = 10306064, targetName = "青莲时装(30天)", buffID = 21327, buffDesc = "青莲时装(30天)时装激活：命中+132闪避+132暴击+132韧性+132暴击伤害+132",hs=1},
    {index = 129 , jh = 1, targetID = 10306065, targetName = "经验时装（14天）", buffID = 21328, buffDesc = "经验时装（14天）时装激活：命中+133闪避+133暴击+133韧性+133暴击伤害+133",hs=1},
    {index = 130 , jh = 0, targetID = 10306066, targetName = "经验时装（14天）", buffID = 21329, buffDesc = "经验时装（14天）时装激活：命中+134闪避+134暴击+134韧性+134暴击伤害+134",hs=1},
    {index = 131 , jh = 1, targetID = 10306067, targetName = "燕山风情(永久)", buffID = 21330, buffDesc = "燕山风情(永久)时装激活：命中+135闪避+135暴击+135韧性+135暴击伤害+135",hs=1},
    {index = 132 , jh = 1, targetID = 10306068, targetName = "吻风雪翼(永久)", buffID = 21331, buffDesc = "吻风雪翼(永久)时装激活：命中+136闪避+136暴击+136韧性+136暴击伤害+136",hs=1},
    {index = 133 , jh = 1, targetID = 10306069, targetName = "宫廷时装(7天)", buffID = 21332, buffDesc = "宫廷时装(7天)时装激活：命中+137闪避+137暴击+137韧性+137暴击伤害+137",hs=1},
    {index = 134 , jh = 1, targetID = 10306070, targetName = "月焰时装", buffID = 21333, buffDesc = "月焰时装时装激活：命中+138闪避+138暴击+138韧性+138暴击伤害+138",hs=1},
    {index = 135 , jh = 1, targetID = 10306071, targetName = "好基友时装（7天）", buffID = 21334, buffDesc = "好基友时装（7天）时装激活：命中+139闪避+139暴击+139韧性+139暴击伤害+139",hs=1},
    {index = 136 , jh = 1, targetID = 10306072, targetName = "事业线时装（7天）", buffID = 21335, buffDesc = "事业线时装（7天）时装激活：命中+140闪避+140暴击+140韧性+140暴击伤害+140",hs=1},
    {index = 137 , jh = 1, targetID = 10306073, targetName = "好基友时装（7天）", buffID = 21336, buffDesc = "好基友时装（7天）时装激活：命中+141闪避+141暴击+141韧性+141暴击伤害+141",hs=1},
    {index = 138 , jh = 1, targetID = 10306074, targetName = "冷羽无悯(永久)", buffID = 21337, buffDesc = "冷羽无悯(永久)时装激活：命中+142闪避+142暴击+142韧性+142暴击伤害+142",hs=1},
    {index = 139 , jh = 1, targetID = 10306075, targetName = "草原皇妃(90天)", buffID = 21338, buffDesc = "草原皇妃(90天)时装激活：命中+143闪避+143暴击+143韧性+143暴击伤害+143",hs=1},
    {index = 140 , jh = 0, targetID = 10306076, targetName = "巾帼须眉(7天)", buffID = 21339, buffDesc = "巾帼须眉(7天)时装激活：命中+144闪避+144暴击+144韧性+144暴击伤害+144",hs=1},
    {index = 141 , jh = 1, targetID = 10306077, targetName = "巾帼须眉(15天)", buffID = 21340, buffDesc = "巾帼须眉(15天)时装激活：命中+145闪避+145暴击+145韧性+145暴击伤害+145",hs=1},
    {index = 142 , jh = 1, targetID = 10306078, targetName = "巾帼须眉(30天)", buffID = 21341, buffDesc = "巾帼须眉(30天)时装激活：命中+146闪避+146暴击+146韧性+146暴击伤害+146",hs=1},
    {index = 143 , jh = 1, targetID = 10306079, targetName = "巾帼须眉(60天)", buffID = 21342, buffDesc = "巾帼须眉(60天)时装激活：命中+147闪避+147暴击+147韧性+147暴击伤害+147",hs=1},
    {index = 144 , jh = 1, targetID = 10306080, targetName = "帝国勇士时装（7天）", buffID = 21343, buffDesc = "帝国勇士时装（7天）时装激活：命中+148闪避+148暴击+148韧性+148暴击伤害+148",hs=1},
    {index = 145 , jh = 1, targetID = 10306081, targetName = "皇权贵族时装（7天）", buffID = 21344, buffDesc = "皇权贵族时装（7天）时装激活：命中+149闪避+149暴击+149韧性+149暴击伤害+149",hs=1},
    {index = 146 , jh = 1, targetID = 10306082, targetName = "烈焱时装（14天）", buffID = 21345, buffDesc = "烈焱时装（14天）时装激活：命中+150闪避+150暴击+150韧性+150暴击伤害+150",hs=1},
    {index = 147 , jh = 1, targetID = 10306083, targetName = "钢铁侠时装(永久)", buffID = 21346, buffDesc = "钢铁侠时装(永久)时装激活：命中+151闪避+151暴击+151韧性+151暴击伤害+151",hs=1},
    {index = 148 , jh = 1, targetID = 10306084, targetName = "梦魇战甲（30天）", buffID = 21347, buffDesc = "梦魇战甲（30天）时装激活：命中+152闪避+152暴击+152韧性+152暴击伤害+152",hs=1},
    {index = 149 , jh = 1, targetID = 10306085, targetName = "龙门战甲(30天)", buffID = 21348, buffDesc = "龙门战甲(30天)时装激活：命中+153闪避+153暴击+153韧性+153暴击伤害+153",hs=1},
    {index = 150 , jh = 0, targetID = 10306086, targetName = "云霞时装(永久)", buffID = 21349, buffDesc = "云霞时装(永久)时装激活：命中+154闪避+154暴击+154韧性+154暴击伤害+154",hs=1},
    {index = 151 , jh = 1, targetID = 10306087, targetName = "五好少年时装(永久)", buffID = 21350, buffDesc = "五好少年时装(永久)时装激活：命中+155闪避+155暴击+155韧性+155暴击伤害+155",hs=1},
    {index = 152 , jh = 1, targetID = 10306088, targetName = "开国元勋纪念时装（30天）", buffID = 21351, buffDesc = "开国元勋纪念时装（30天）时装激活：命中+156闪避+156暴击+156韧性+156暴击伤害+156",hs=1},
    {index = 153 , jh = 1, targetID = 10306089, targetName = "开国功臣纪念时装（20天）", buffID = 21352, buffDesc = "开国功臣纪念时装（20天）时装激活：命中+157闪避+157暴击+157韧性+157暴击伤害+157",hs=1},
    {index = 154 , jh = 1, targetID = 10306090, targetName = "开国名将纪念时装（10天）", buffID = 21353, buffDesc = "开国名将纪念时装（10天）时装激活：命中+158闪避+158暴击+158韧性+158暴击伤害+158",hs=1},
    {index = 155 , jh = 1, targetID = 10306091, targetName = "七月流火（永久）", buffID = 21354, buffDesc = "七月流火（永久）时装激活：命中+159闪避+159暴击+159韧性+159暴击伤害+159",hs=1},
    {index = 156 , jh = 1, targetID = 10306092, targetName = "蓝色妖姬（永久）", buffID = 21355, buffDesc = "蓝色妖姬（永久）时装激活：命中+160闪避+160暴击+160韧性+160暴击伤害+160",hs=1},
    {index = 157 , jh = 1, targetID = 10306093, targetName = "海盗时装（永久）", buffID = 21356, buffDesc = "海盗时装（永久）时装激活：命中+161闪避+161暴击+161韧性+161暴击伤害+161",hs=1},
    {index = 158 , jh = 1, targetID = 10306094, targetName = "军演作战服（14天）", buffID = 21357, buffDesc = "军演作战服（14天）时装激活：命中+162闪避+162暴击+162韧性+162暴击伤害+162",hs=1},
    {index = 159 , jh = 1, targetID = 10306095, targetName = "魔术师时装（1小时）", buffID = 21358, buffDesc = "魔术师时装（1小时）时装激活：命中+163闪避+163暴击+163韧性+163暴击伤害+163",hs=1},
    {index = 160 , jh = 0, targetID = 10306096, targetName = "死神时装（3天）", buffID = 21359, buffDesc = "死神时装（3天）时装激活：命中+164闪避+164暴击+164韧性+164暴击伤害+164",hs=1},
    {index = 161 , jh = 1, targetID = 10306097, targetName = "死神时装（5天）", buffID = 21360, buffDesc = "死神时装（5天）时装激活：命中+165闪避+165暴击+165韧性+165暴击伤害+165",hs=1},
    {index = 162 , jh = 1, targetID = 10306098, targetName = "死神时装（7天）", buffID = 21361, buffDesc = "死神时装（7天）时装激活：命中+166闪避+166暴击+166韧性+166暴击伤害+166",hs=1},
    {index = 163 , jh = 1, targetID = 10306099, targetName = "龙胆经验时装（14天）", buffID = 21362, buffDesc = "龙胆经验时装（14天）时装激活：命中+167闪避+167暴击+167韧性+167暴击伤害+167",hs=1},
    {index = 164 , jh = 1, targetID = 10306100, targetName = "血色贵族(永久)", buffID = 21363, buffDesc = "血色贵族(永久)时装激活：命中+168闪避+168暴击+168韧性+168暴击伤害+168",hs=1},
    {index = 165 , jh = 1, targetID = 10306101, targetName = "流金时装(30天)", buffID = 21364, buffDesc = "流金时装(30天)时装激活：命中+169闪避+169暴击+169韧性+169暴击伤害+169",hs=1},
    {index = 166 , jh = 1, targetID = 10306102, targetName = "圣子降临(30天)", buffID = 21365, buffDesc = "圣子降临(30天)时装激活：命中+170闪避+170暴击+170韧性+170暴击伤害+170",hs=1},
    {index = 167 , jh = 1, targetID = 10306103, targetName = "经验时装（7天）", buffID = 21366, buffDesc = "经验时装（7天）时装激活：命中+171闪避+171暴击+171韧性+171暴击伤害+171",hs=1},
    {index = 168 , jh = 1, targetID = 10306104, targetName = "天尊·星河时装", buffID = 21367, buffDesc = "天尊·星河时装时装激活：命中+172闪避+172暴击+172韧性+172暴击伤害+172",hs=1},
    {index = 169 , jh = 1, targetID = 10306105, targetName = "武圣·星河时装", buffID = 21368, buffDesc = "武圣·星河时装时装激活：命中+173闪避+173暴击+173韧性+173暴击伤害+173",hs=1},
    {index = 170 , jh = 0, targetID = 10306106, targetName = "战神·星河时装", buffID = 21369, buffDesc = "战神·星河时装时装激活：命中+174闪避+174暴击+174韧性+174暴击伤害+174",hs=1},
    {index = 171 , jh = 1, targetID = 10306107, targetName = "新年时装（7天）", buffID = 21370, buffDesc = "新年时装（7天）时装激活：命中+175闪避+175暴击+175韧性+175暴击伤害+175",hs=1},
    {index = 172 , jh = 1, targetID = 10306108, targetName = "新春时装（30天）", buffID = 21371, buffDesc = "新春时装（30天）时装激活：命中+176闪避+176暴击+176韧性+176暴击伤害+176",hs=1},
    {index = 173 , jh = 1, targetID = 10306109, targetName = "王牌特工(永久)", buffID = 21372, buffDesc = "王牌特工(永久)时装激活：命中+177闪避+177暴击+177韧性+177暴击伤害+177",hs=1},
    {index = 174 , jh = 1, targetID = 10306110, targetName = "流星蝴蝶(永久)", buffID = 21373, buffDesc = "流星蝴蝶(永久)时装激活：命中+178闪避+178暴击+178韧性+178暴击伤害+178",hs=1},
    {index = 175 , jh = 1, targetID = 10306111, targetName = "皇家贵族(永久)", buffID = 21374, buffDesc = "皇家贵族(永久)时装激活：命中+179闪避+179暴击+179韧性+179暴击伤害+179",hs=1},
    {index = 176 , jh = 1, targetID = 10306112, targetName = "紫色迷情(永久)", buffID = 21375, buffDesc = "紫色迷情(永久)时装激活：命中+180闪避+180暴击+180韧性+180暴击伤害+180",hs=1},
    {index = 177 , jh = 1, targetID = 10306113, targetName = "魔幻紫玉(永久)", buffID = 21376, buffDesc = "魔幻紫玉(永久)时装激活：命中+181闪避+181暴击+181韧性+181暴击伤害+181",hs=1},
    {index = 178 , jh = 1, targetID = 10306114, targetName = "火龙战甲(永久)", buffID = 21377, buffDesc = "火龙战甲(永久)时装激活：命中+182闪避+182暴击+182韧性+182暴击伤害+182",hs=1},
    {index = 179 , jh = 1, targetID = 10306115, targetName = "魔罡至尊(永久)", buffID = 21378, buffDesc = "魔罡至尊(永久)时装激活：命中+183闪避+183暴击+183韧性+183暴击伤害+183",hs=1},
    {index = 180 , jh = 0, targetID = 10306116, targetName = "经验时装（30天）", buffID = 21379, buffDesc = "经验时装（30天）时装激活：命中+184闪避+184暴击+184韧性+184暴击伤害+184",hs=1},
    {index = 181 , jh = 1, targetID = 10306117, targetName = "军演作战服（12天）", buffID = 21380, buffDesc = "军演作战服（12天）时装激活：命中+185闪避+185暴击+185韧性+185暴击伤害+185",hs=1},
    {index = 182 , jh = 1, targetID = 10306118, targetName = "变相怪杰（永久）", buffID = 21381, buffDesc = "变相怪杰（永久）时装激活：命中+186闪避+186暴击+186韧性+186暴击伤害+186",hs=1},
    {index = 183 , jh = 1, targetID = 10306119, targetName = "吻风雪翼(1天)", buffID = 21382, buffDesc = "吻风雪翼(1天)时装激活：命中+187闪避+187暴击+187韧性+187暴击伤害+187",hs=1},
    {index = 184 , jh = 1, targetID = 10306120, targetName = "冷羽无悯(1天)", buffID = 21383, buffDesc = "冷羽无悯(1天)时装激活：命中+188闪避+188暴击+188韧性+188暴击伤害+188",hs=1},
    {index = 185 , jh = 1, targetID = 10306121, targetName = "乱世蔷薇(1天)", buffID = 21384, buffDesc = "乱世蔷薇(1天)时装激活：命中+189闪避+189暴击+189韧性+189暴击伤害+189",hs=1},
    {index = 186 , jh = 1, targetID = 10306122, targetName = "金玉唐风(1天)", buffID = 21385, buffDesc = "金玉唐风(1天)时装激活：命中+190闪避+190暴击+190韧性+190暴击伤害+190",hs=1},
    {index = 187 , jh = 1, targetID = 10306123, targetName = "大秦之风(1天)", buffID = 21386, buffDesc = "大秦之风(1天)时装激活：命中+191闪避+191暴击+191韧性+191暴击伤害+191",hs=1},
    {index = 188 , jh = 1, targetID = 10306124, targetName = "燕山风情(1天)", buffID = 21387, buffDesc = "燕山风情(1天)时装激活：命中+192闪避+192暴击+192韧性+192暴击伤害+192",hs=1},
    {index = 189 , jh = 1, targetID = 10306125, targetName = "宫廷时装(1天)", buffID = 21388, buffDesc = "宫廷时装(1天)时装激活：命中+193闪避+193暴击+193韧性+193暴击伤害+193",hs=1},
    {index = 190 , jh = 0, targetID = 10306126, targetName = "情人时装(1天)", buffID = 21389, buffDesc = "情人时装(1天)时装激活：命中+194闪避+194暴击+194韧性+194暴击伤害+194",hs=1},
    {index = 191 , jh = 1, targetID = 10306127, targetName = "刺陵时装(1天)", buffID = 21390, buffDesc = "刺陵时装(1天)时装激活：命中+195闪避+195暴击+195韧性+195暴击伤害+195",hs=1},
    {index = 192 , jh = 1, targetID = 10306128, targetName = "苗疆时装(1天)", buffID = 21391, buffDesc = "苗疆时装(1天)时装激活：命中+196闪避+196暴击+196韧性+196暴击伤害+196",hs=1},
    {index = 193 , jh = 1, targetID = 10306129, targetName = "大理时装(1天)", buffID = 21392, buffDesc = "大理时装(1天)时装激活：命中+197闪避+197暴击+197韧性+197暴击伤害+197",hs=1},
    {index = 194 , jh = 1, targetID = 10306130, targetName = "百夷时装(1天)", buffID = 21393, buffDesc = "百夷时装(1天)时装激活：命中+198闪避+198暴击+198韧性+198暴击伤害+198",hs=1},
    {index = 195 , jh = 1, targetID = 10306131, targetName = "天竺时装(1天)", buffID = 21394, buffDesc = "天竺时装(1天)时装激活：命中+199闪避+199暴击+199韧性+199暴击伤害+199",hs=1},
    {index = 196 , jh = 1, targetID = 10306132, targetName = "波斯时装(1天)", buffID = 21395, buffDesc = "波斯时装(1天)时装激活：命中+200闪避+200暴击+200韧性+200暴击伤害+200",hs=1},
    {index = 197 , jh = 1, targetID = 10306133, targetName = "圣诞时装（永久）", buffID = 21396, buffDesc = "圣诞时装（永久）时装激活：命中+201闪避+201暴击+201韧性+201暴击伤害+201",hs=1},
    {index = 198 , jh = 1, targetID = 10306134, targetName = "春节时装（永久）", buffID = 21397, buffDesc = "春节时装（永久）时装激活：命中+202闪避+202暴击+202韧性+202暴击伤害+202",hs=1},
    {index = 199 , jh = 1, targetID = 10306135, targetName = "真爱一生礼服（永久）", buffID = 21398, buffDesc = "真爱一生礼服（永久）时装激活：命中+203闪避+203暴击+203韧性+203暴击伤害+203",hs=1},
    {index = 200 , jh = 0, targetID = 10306136, targetName = "齐天大圣（14天）", buffID = 21399, buffDesc = "齐天大圣（14天）时装激活：命中+204闪避+204暴击+204韧性+204暴击伤害+204",hs=1},
    {index = 201 , jh = 1, targetID = 10306137, targetName = "斗战胜佛（14天）", buffID = 21400, buffDesc = "斗战胜佛（14天）时装激活：命中+205闪避+205暴击+205韧性+205暴击伤害+205",hs=1},
    {index = 202 , jh = 1, targetID = 10306138, targetName = "神·上古守护（永久）", buffID = 21401, buffDesc = "神·上古守护（永久）时装激活：命中+206闪避+206暴击+206韧性+206暴击伤害+206",hs=1},
    {index = 203 , jh = 1, targetID = 10306139, targetName = "神·泰坦守护（永久）", buffID = 21402, buffDesc = "神·泰坦守护（永久）时装激活：命中+207闪避+207暴击+207韧性+207暴击伤害+207",hs=1},
    {index = 204 , jh = 1, targetID = 10306140, targetName = "神·破魔守护（永久）", buffID = 21403, buffDesc = "神·破魔守护（永久）时装激活：命中+208闪避+208暴击+208韧性+208暴击伤害+208",hs=1},
    {index = 205 , jh = 1, targetID = 10306141, targetName = "神·不朽守护（永久）", buffID = 21404, buffDesc = "神·不朽守护（永久）时装激活：命中+209闪避+209暴击+209韧性+209暴击伤害+209",hs=1},
    {index = 206 , jh = 1, targetID = 10306142, targetName = "神·无畏战神（永久）", buffID = 21405, buffDesc = "神·无畏战神（永久）时装激活：命中+210闪避+210暴击+210韧性+210暴击伤害+210",hs=1},
    {index = 207 , jh = 1, targetID = 10306143, targetName = "神·英勇卫士（永久）", buffID = 21406, buffDesc = "神·英勇卫士（永久）时装激活：命中+211闪避+211暴击+211韧性+211暴击伤害+211",hs=1},
    {index = 208 , jh = 1, targetID = 10306144, targetName = "夜宴贵族（3天）", buffID = 21407, buffDesc = "夜宴贵族（3天）时装激活：命中+212闪避+212暴击+212韧性+212暴击伤害+212",hs=1},
    {index = 209 , jh = 1, targetID = 10306145, targetName = "狩魔猎人（60天）", buffID = 21408, buffDesc = "狩魔猎人（60天）时装激活：命中+213闪避+213暴击+213韧性+213暴击伤害+213",hs=1},
    {index = 210 , jh = 0, targetID = 10306146, targetName = "狩魔猎人（30天）", buffID = 21409, buffDesc = "狩魔猎人（30天）时装激活：命中+214闪避+214暴击+214韧性+214暴击伤害+214",hs=1},
    {index = 211 , jh = 1, targetID = 10306147, targetName = "决战八方（15天）", buffID = 21410, buffDesc = "决战八方（15天）时装激活：命中+215闪避+215暴击+215韧性+215暴击伤害+215",hs=1},
    {index = 212 , jh = 1, targetID = 10306148, targetName = "决战八方（永久）", buffID = 21411, buffDesc = "决战八方（永久）时装激活：命中+216闪避+216暴击+216韧性+216暴击伤害+216",hs=1},
    {index = 213 , jh = 1, targetID = 10306149, targetName = "狩魔猎人（永久）", buffID = 21412, buffDesc = "狩魔猎人（永久）时装激活：命中+217闪避+217暴击+217韧性+217暴击伤害+217",hs=1},
    {index = 214 , jh = 1, targetID = 10306150, targetName = "狩魔猎人（15天）", buffID = 21413, buffDesc = "狩魔猎人（15天）时装激活：命中+218闪避+218暴击+218韧性+218暴击伤害+218",hs=1},




}

x930128_var_QuestName  = "【升级】#R时装"
x930128_var_QuestName2  = "【回收】#R时装"
x930128_var_QuestName1 = "【兑换】#R王牌"
x930128_var_Questintro =  "\t你可以用珍贵的#G战神王牌兑换券#W在我这里兑换王牌：#G天·荆轲#W，王牌：#G冥·李师师#W和王牌：#G玄·芙蓉#W。"
x930128_var_Questintro1 =  "\t你可以用珍贵的#G战神王牌兑换券#W在我这里兑换王牌：#G圣·美美#W，王牌：#G星·苍老师#W，王牌：#G魔·陈老师#W。"
x930128_var_QuestInfo ="\t您确定要使用#G%s#W兑换#G%s#W吗？\n\t将需要#R%d个#W#G%s#W。"
x930128_var_QuestError = "\t您没有足够数量的#R%s#cffcf00，无法兑换#R%s#cffcf00。"


--DECLARE_QUEST_INFO_STOP--



function x930128_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)
    local level = GetLevel(varMap, varPlayer)
    if level < 70 then
        Msg2Player(varMap, varPlayer,"等级不足70！",8,3)
        Msg2Player(varMap, varPlayer,"等级不足70！",8,2)
        return
    end
    if seleteId == 881 then
        SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, 881)
        --查询当前buffid
        local curIndex = 0
        for varI, item in x930128_var_ExcObjID do
            local haveImpact  = IsHaveSpecificImpact(varMap, varPlayer, item.buffID)
            if haveImpact > 0 then
                curIndex = varI
            end
        end

        local nextIndex = curIndex + 1
        if nextIndex > getn(x930128_var_ExcObjID) then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y您已经达到最大效果了")
            TalkAppendString(varMap,"\n")
            TalkAppendString(varMap,format("当前buff效果：#R%s#W",x930128_var_ExcObjID[curIndex].buffDesc))
            StopTalkTask()
            DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930128_var_FileId, -1);
            return
        end

        local droppos = "#Y所需材料掉落位置："
        if nextIndex >=1 and nextIndex <= 20 then
            droppos = "#Y所需材料掉落位置：#R许愿池#W"
        elseif nextIndex >20 and nextIndex <= 40 then
            droppos = "#Y所需材料掉落位置：#R圣诞树#W"
        else
            droppos = "#Y所需材料掉落位置：#R暂无#W"
        end

        --需要的精华数量
        local jhNum = x930128_var_jhNum + floor(curIndex/10 * x930128_var_jhXs)

        --需要的时装核心数量
        local hxNum = 0
        if curIndex == 1 then
            hxNum = 1
        elseif mod(curIndex,5)==0 then
            hxNum = curIndex/5+1
        end

        if curIndex > 0 then
            StartTalkTask(varMap)
            TalkAppendString(varMap,format("您当前是#R#W级\n当前buff效果：#R%s#W\n",curIndex,x930128_var_ExcObjID[curIndex].buffDesc))
            if x930128_var_ExcObjID[nextIndex].jh == 1 then
                TalkAppendString(varMap,format("升级到下级需要#R%s#W或者#R%d#W个#R%s#W，会优先扣除对应时装",x930128_var_ExcObjID[nextIndex].targetName,jhNum,x930128_var_jhName))
            else
                TalkAppendString(varMap,format("升级到下级需要#R%s#W",x930128_var_ExcObjID[nextIndex].targetName))

            end
            if hxNum > 0 then
                TalkAppendString(varMap,format("\n还需要#R%d#W个#R%s#W\n",hxNum,x930128_var_hexin.name))
            end
            TalkAppendString(varMap,format("下一级效果是：#R%s#W\n%s\n\n接下来的10级需要的道具如下：\n",x930128_var_ExcObjID[nextIndex].buffDesc,droppos))

            local ss = x930128_getnext10desc(varMap, varPlayer,nextIndex)
            local sss = ""
            for varI, s1 in ss do
                sss = sss .. s1
            end
            TalkAppendString(varMap,sss)

            StopTalkTask()
            DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930128_var_FileId, -1);
        else
            StartTalkTask(varMap)
            if x930128_var_ExcObjID[nextIndex].jh == 1 then
                TalkAppendString(varMap,format("#Y您当前是#R0#W级\n升级到下级需要#R%s#W或者#R%d#W个#R%s#W，会优先扣除对应时装",x930128_var_ExcObjID[nextIndex].targetName,jhNum,x930128_var_jhName))
            else
                TalkAppendString(varMap,format("#Y您当前是#R0#W级\n升级到下级需要#R%s#W",x930128_var_ExcObjID[nextIndex].targetName))

            end

            TalkAppendString(varMap,format("下一级效果是：#R%s#W\n%s\n\n",x930128_var_ExcObjID[nextIndex].buffDesc,droppos))
            TalkAppendString(varMap,"接下来的10级需要的道具如下：\n")

            local ss = x930128_getnext10desc(varMap, varPlayer,nextIndex)
            local sss = ""
            for varI, s1 in ss do
                sss = sss .. s1
            end
            TalkAppendString(varMap,sss)

            StopTalkTask()
            DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930128_var_FileId, -1);
        end

    end

    if seleteId == 882 then
        SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, 882)
        StartTalkTask(varMap)
        TalkAppendString(varMap,"#Y你确定回收掉包裹内所有的时装吗？")
        TalkAppendString(varMap,"\n")
        TalkAppendString(varMap,"点击确定，将回收你包裹内所有的时装。请把不需要回收的时装放到仓库")
        TalkAppendString(varMap,"\n")
        TalkAppendString(varMap,format("每件时装回收返还#R%d#W个#R%s#W",x930128_var_jhHsNum,x930128_var_jhName))
        TalkAppendString(varMap,"\n")
        StopTalkTask()
        DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930128_var_FileId, -1);
    end

end

function x930128_getnext10desc( varMap, varPlayer, nextIndex )



    local str = {}
    local ii = 1
    for varI, item in x930128_var_ExcObjID do
        if varI >= nextIndex and varI - nextIndex <= 10 then
            --需要的精华数量
            local jhNum = x930128_var_jhNum + floor(varI/10 * x930128_var_jhXs)

            --需要的时装核心数量
            local hxNum = 0
            if varI == 1 then
                hxNum = 1
            elseif mod(varI,5)==0 then
                hxNum = varI/5+1
            end

            local s1 = ""
            if x930128_var_ExcObjID[varI].jh == 1 then
                s1 = format("#R%d#W级\t需要#R%s#W或者#R%d#W个#R%s#W",varI,item.targetName,jhNum,x930128_var_jhName)
            else
                s1 = format("#R%d#W级\t需要#R%s#W",varI,item.targetName)
            end
            if hxNum > 0 then
                s1 = s1..format("\t#R%d#W个#R%s#W",hxNum,x930128_var_hexin.name)
            end
            str[ii] =s1.."\n"
            ii = ii +1
        end
    end

    return str
end

function x930128_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
		TalkAppendButton(varMap,x930128_var_FileId,x930128_var_QuestName,3,881);
		TalkAppendButton(varMap,x930128_var_FileId,x930128_var_QuestName2,3,882);
end

function x930128_ProcAccept( varMap, varPlayer )

	x930128_Accept( varMap, varPlayer )
	
end

function x930128_Accept( varMap, varPlayer )

    if GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE) == 882 then
        --时装回收
        if GetBagSpace(varMap, varPlayer) < 1 then
            Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能回收！",8,2)
            Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能回收！",8,3)
            return 0
        end
        for varI, item in x930128_var_ExcObjID do

            if item.hs == 1 then
                local Num = GetItemCount( varMap, varPlayer, item.targetID )
                for i=1 , Num  do
                    if DelItem(varMap,varPlayer,item.targetID,1) == 1 then
                        Msg2Player(varMap, varPlayer,format("回收时装成功返还#R%d#W个#R%s#W",x930128_var_jhHsNum,x930128_var_jhName),8,3)
                        Msg2Player(varMap, varPlayer,format("回收时装成功返还#R%d#W个#R%s#W",x930128_var_jhHsNum,x930128_var_jhName),8,2)

                        StartItemTask(varMap)
                        ItemAppendBind( varMap, x930128_var_jhID, 1)
                        local varRet = StopItemTask(varMap,varPlayer)

                        if varRet > 0 then
                            DeliverItemListSendToPlayer(varMap,varPlayer)
                            Msg2Player(varMap, varPlayer,format("回收时装成功返还#R%d#W个#R%s#W",x930128_var_jhHsNum,x930128_var_jhName),8,3)
                            Msg2Player(varMap, varPlayer,format("回收时装成功返还#R%d#W个#R%s#W",x930128_var_jhHsNum,x930128_var_jhName),8,2)
                            GamePlayScriptLog( varMap, varPlayer, 2670)
                        else
                            StartTalkTask(varMap)
                            TalkAppendString(varMap,"物品栏已满，无法获得物品！")
                            StopTalkTask(varMap)
                            DeliverTalkTips(varMap,varPlayer)
                        end
                    else
                        Msg2Player(varMap, varPlayer,"回收道具失败",8,3)
                        Msg2Player(varMap, varPlayer,"回收道具失败",8,2)
                    end
                end
            end

        end

        return
    end

    --查询当前buffid
    local curIndex = 0
    for varI, item in x930128_var_ExcObjID do
        local haveImpact  = IsHaveSpecificImpact(varMap, varPlayer, item.buffID)
        if haveImpact > 0 then
            curIndex = varI
        end
    end

    local nextIndex = curIndex + 1
    if nextIndex > getn(x930128_var_ExcObjID) then
        Msg2Player(varMap, varPlayer,"您已经达到最大效果了！",8,3)
        return
    end


    --需要的时装核心数量
    local hxNum = 0
    if curIndex == 1 then
        hxNum = 1
    elseif mod(curIndex,5)==0 then
        hxNum = curIndex/5+1
    end

    local curHxNum = GetItemCount( varMap, varPlayer, x930128_var_hexin.id)
    if curHxNum < hxNum then
        Msg2Player(varMap, varPlayer,format("道具数量不足，需要#R%d#W个#R%s#W，您当前只有#R%d#W个",hxNum,x930128_var_hexin.name,curHxNum),8,3)
        Msg2Player(varMap, varPlayer,format("道具数量不足，需要#R%d#W个#R%s#W，您当前只有#R%d#W个",hxNum,x930128_var_hexin.name,curHxNum),8,2)
        return
    end

    local Num = GetItemCount( varMap, varPlayer, x930128_var_ExcObjID[nextIndex].targetID )

    if Num < 1 then -- 道具数量不足
        if x930128_var_ExcObjID[nextIndex].jh == 1 then
            --再判断时装精华

            --需要的精华数量
            local jhNum = x930128_var_jhNum + floor(curIndex/10 * x930128_var_jhXs)
            Num = GetItemCount( varMap, varPlayer, x930128_var_jhID )
            if Num < jhNum then
                Msg2Player(varMap, varPlayer,format("时装精华道具数量不足%d/%d", Num, jhNum),8,3)
                Msg2Player(varMap, varPlayer,format("时装精华道具数量不足%d/%d", Num, jhNum),8,2)
                return
            else
                if DelItem(varMap,varPlayer,x930128_var_jhID,jhNum) ~= 1 then
                    Msg2Player(varMap, varPlayer,"扣除时装精华道具发生错误",8,3)
                    Msg2Player(varMap, varPlayer,"扣除时装精华道具发生错误",8,2)
                    return
                end

                if hxNum > 0 and DelItem(varMap,varPlayer,x930128_var_hexin.id,hxNum) ~= 1 then
                    Msg2Player(varMap, varPlayer,format("回收道具%s发生错误",x930128_var_hexin.name),8,3)
                    Msg2Player(varMap, varPlayer,format("回收道具%s发生错误",x930128_var_hexin.name),8,2)
                    return
                end

                Msg2Player(varMap, varPlayer,format("扣除道具#R%d#W个#R%s#W成功",jhNum,x930128_var_jhName),8,3)
                Msg2Player(varMap, varPlayer,format("扣除道具#R%d#W个#R%s#W成功",jhNum,x930128_var_jhName),8,2)
            end

        else
            Msg2Player(varMap, varPlayer,format("道具数量%s不足",x930128_var_ExcObjID[nextIndex].targetName),8,3)
            Msg2Player(varMap, varPlayer,format("道具数量%s不足",x930128_var_ExcObjID[nextIndex].targetName),8,2)
            return
        end


    else

        if DelItem(varMap,varPlayer,x930128_var_ExcObjID[nextIndex].targetID,1) ~= 1 then
            Msg2Player(varMap, varPlayer,format("回收道具%s发生错误",x930128_var_ExcObjID[nextIndex].targetName),8,3)
            Msg2Player(varMap, varPlayer,format("回收道具%s发生错误",x930128_var_ExcObjID[nextIndex].targetName),8,2)
            return
        end
        if hxNum > 0 and DelItem(varMap,varPlayer,x930128_var_hexin.id,hxNum) ~= 1 then
            Msg2Player(varMap, varPlayer,format("回收道具%s发生错误",x930128_var_hexin.name),8,3)
            Msg2Player(varMap, varPlayer,format("回收道具%s发生错误",x930128_var_hexin.name),8,2)
            return
        end

        Msg2Player(varMap, varPlayer,format("扣除道具#R%d#W个#R%s#W成功",1,x930128_var_ExcObjID[nextIndex].targetName),8,3)
        Msg2Player(varMap, varPlayer,format("扣除道具#R%d#W个#R%s#W成功",1,x930128_var_ExcObjID[nextIndex].targetName),8,2)
    end


    if curIndex > 0 then
        local varRet = CancelSpecificImpact( varMap, varPlayer, x930128_var_ExcObjID[curIndex].buffID)
        if varRet <= 0 then
            Msg2Player(varMap, varPlayer,"删除效果"..x930128_var_ExcObjID[curIndex].buffID.."失败",8,3)
            Msg2Player(varMap, varPlayer,"删除效果"..x930128_var_ExcObjID[curIndex].buffID.."失败",8,2)
        else
            Msg2Player(varMap, varPlayer,"删除效果"..x930128_var_ExcObjID[curIndex].buffID.."成功",8,3)
            Msg2Player(varMap, varPlayer,"删除效果"..x930128_var_ExcObjID[curIndex].buffID.."成功",8,2)
        end
    end
    SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x930128_var_ExcObjID[nextIndex].buffID, 0);
    Msg2Player(varMap, varPlayer,"添加效果"..x930128_var_ExcObjID[nextIndex].buffID.."成功",8,3)
    Msg2Player(varMap, varPlayer,"添加效果"..x930128_var_ExcObjID[nextIndex].buffID.."成功",8,2)


end
		
function x930128_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x930128_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x930128_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x930128_CheckSubmit( varMap, varPlayer )

end




function x930128_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x930128_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x930128_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x930128_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )

end
