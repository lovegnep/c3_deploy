

x350007_var_FileId 					= 350007

--如果背包内有特殊道具时的倍率
x350007_var_beilu = 4

x350007_var_OrdinarySeedTable         = {
                                        { useCount = 1,  deplete = 3, scoreDown = 400, scoreUp = 600 },
                                        { useCount = 2,  deplete = 3, scoreDown = 400, scoreUp = 600 },
                                        { useCount = 3,  deplete = 3, scoreDown = 400, scoreUp = 600 },
                                        { useCount = 4,  deplete = 3, scoreDown = 400, scoreUp = 600 },
                                        { useCount = 5,  deplete = 3, scoreDown = 400, scoreUp = 600 },
                                        { useCount = 6,  deplete = 3, scoreDown = 400, scoreUp = 600 },
                                        { useCount = 7,  deplete = 3, scoreDown = 400, scoreUp = 600 },
                                        { useCount = 8,  deplete = 3, scoreDown = 400, scoreUp = 600 },
                                        { useCount = 9,  deplete = 3, scoreDown = 400, scoreUp = 600 },
                                        { useCount = 10, deplete = 3, scoreDown = 400, scoreUp = 600 },
                                        { useCount = 11, deplete = 3, scoreDown = 400, scoreUp = 800 },
                                        { useCount = 12, deplete = 3, scoreDown = 400, scoreUp = 800 },
                                        { useCount = 13, deplete = 3, scoreDown = 400, scoreUp = 800 },
                                        { useCount = 14, deplete = 3, scoreDown = 400, scoreUp = 800 },
                                        { useCount = 15, deplete = 3, scoreDown = 400, scoreUp = 800 },
                                        { useCount = 16, deplete = 3, scoreDown = 400, scoreUp = 800 },
}

x350007_var_SeedTable					= {
                                        { varItem = 11010015, buttonId = 1, maxTimes = 16, useMode = 0, tableid = x350007_var_OrdinarySeedTable, actName = "许愿",
                                          dayMD = MD_HOPESEED_DAY,     timesMD = MD_GOLDHOPESEED_TIMES, varName = "【活动】节日许愿" },
                                        { varItem = 11010017, buttonId = 2, maxTimes = 1, useMode = 1, tableid = x350007_var_OrdinarySeedTable, actName = "祈福", 
                                         dayMD = MD_LUCKSEED_DAY,     timesMD = MD_LUCKSEED_TIMES,     varName = "【活动】节日祈福" },
}

x350007_var_LuckySeedTable            = {
                                        {varItem=	11030502	,probability=	10000	, price=	1	,varName="黑曜石", num = 10},
                                        {varItem=	11030406	,probability=	10000	, price=	1	,varName="七步封喉", num = 10},
                                        {varItem=	11020502	,probability=	10000	, price=	1	,varName="水木精华", num = 10},
                                        { varItem = 11000552, probability = 500, price = 1, varName = "完美星辰",          num = 1},
                                        { varItem = 11000304, probability = 500, price = 1, varName = "残破的神兵之魂",     num = 1     },
                                        { varItem = 11000317, probability = 1500, price = 1, varName = "星魄碎片",    num = 1      },
                                        --{ varItem = 11000334, probability = 5000, price = 45, varName = "战神令",     num = 1       },
                                        { varItem = 11000325, probability = 5000,  price = 1,    varName = "龙之谷晶石",    num = 1     },
                                        { varItem = 11000328, probability = 5000,  price = 1,    varName = "四彩护身符碎片",    num = 1     },
                                        { varItem = 11000339, probability = 5000,  price = 1,    varName = "红心A",     num = 1  },
                                        { varItem = 11000380, probability = 100,  price = 45,    varName = "稀世奇珍兑换卷",     num = 1 , doubleID=12274051 },
                                        { varItem = 11000381, probability = 500,  price = 1,    varName = "暗影四彩护身符碎片",       num = 1   , doubleID=12274051 },
                                        --{ varItem = 11000333, probability = 500,  price = 45,    varName = "战神王牌兑换券",       num = 1   },
                                        { varItem = 12271412, probability = 500,  price = 1,    varName = "迷你坐骑碎片",    num = 1      },
                                        { varItem = 11970023, probability = 600,  price = 1,    varName = "黄金乱士符",     num = 1    },
                                        { varItem = 11000151, probability = 100,  price = 45,    varName = "龙骨解玉钻",    num = 1   , doubleID=12274052  },
                                        { varItem = 11000159, probability = 100,  price = 45,    varName = "天权镶玉钻",    num = 1   , doubleID=12274052   },
                                        { varItem = 11000166, probability = 100,  price = 45,    varName = "绿龙镂玉钻",    num = 1   , doubleID=12274052   },
                                        {varItem=       0        ,probability=   10     , price=        45       ,varName="时装", num = 1, doubleID=12274050},

}
x350007_var_shizhuang            = {

                                        {varItem=       10300000        ,probability=   60     , price=        45       ,varName="练舞服", num = 1, doubleID=12274050},
                                        {varItem=       10300001        ,probability=   60     , price=        45       ,varName="狂舞服", num = 1, doubleID=12274050},
                                        {varItem=       10300010        ,probability=   60     , price=        45       ,varName="天舞服", num = 1, doubleID=12274050},
                                        {varItem=       10300011        ,probability=   60     , price=        45       ,varName="威武2装", num = 1, doubleID=12274050},
                                        {varItem=       10300100        ,probability=   60     , price=        45       ,varName="王者套装", num = 1, doubleID=12274050},
                                        {varItem=       10300101        ,probability=   60     , price=        45       ,varName="剑龙超炫外装", num = 1, doubleID=12274050},
                                        {varItem=       10300102        ,probability=   60     , price=        45       ,varName="绝版成吉思汗套装", num = 1, doubleID=12274050},
                                        {varItem=       10300103        ,probability=   60     , price=        45       ,varName="屠龙外装", num = 1, doubleID=12274050},
                                        {varItem=       10300104        ,probability=   60     , price=        45       ,varName="突厥时装", num = 1, doubleID=12274050},
                                        {varItem=       10300105        ,probability=   60     , price=        45       ,varName="成吉思汗公测纪念装", num = 1, doubleID=12274050},
                                        {varItem=       10300106        ,probability=   60     , price=        45       ,varName="黄金外装", num = 1, doubleID=12274050},
                                        {varItem=       10300107        ,probability=   60     , price=        45       ,varName="七夕时装", num = 1, doubleID=12274050},
                                        {varItem=       10300108        ,probability=   60     , price=        45       ,varName="1天初级攻装", num = 1, doubleID=12274050},
                                        {varItem=       10300109        ,probability=   60     , price=        45       ,varName="7天初级攻装", num = 1, doubleID=12274050},
                                        {varItem=       10300110        ,probability=   60     , price=        45       ,varName="30天初级攻装", num = 1, doubleID=12274050},
                                        {varItem=       10300111        ,probability=   60     , price=        45       ,varName="苗疆时装(1天)", num = 1, doubleID=12274050},
                                        {varItem=       10300112        ,probability=   60     , price=        45       ,varName="苗疆时装(7天)", num = 1, doubleID=12274050},
                                        {varItem=       10300113        ,probability=   60     , price=        45       ,varName="苗疆时装(30天)", num = 1, doubleID=12274050},
                                        {varItem=       10300114        ,probability=   60     , price=        45       ,varName="刺陵时装(1天)", num = 1, doubleID=12274050},
                                        {varItem=       10300115        ,probability=   60     , price=        45       ,varName="刺陵时装(7天)", num = 1, doubleID=12274050},
}


x350007_var_DailyTable            = {
    { varItem = 12041099, probability = 500, price = 45, varName = "生命神水", deplete = 1,        },
    { varItem = 12010204, probability = 500, price = 45, varName = "百花玉露丹", deplete = 1,           },
    { varItem = 12041043, probability = 500,  price = 45,    varName = "乾阳护甲丸", deplete = 1,        },
    { varItem = 12020002, probability = 500,  price = 45,    varName = "小疾风丹", deplete = 1,        },
    { varItem = 12041013, probability = 500,  price = 45,    varName = "大神力丸", deplete = 1,        },
    { varItem = 12020036, probability = 500,  price = 45,    varName = "神农理气丹", deplete = 1,        },

    { varItem = 11000905, probability = 500,  price = 45,    varName = "宗师级洗石剂", deplete = 1,        },
    { varItem = 11041003, probability = 500,  price = 45,    varName = "四级装饰部件", deplete = 1,        },
    { varItem = 14040004, probability = 500,  price = 45,    varName = "圣徒级蓝玛瑙", deplete = 1,        },

    { varItem = 12050000, probability = 500,  price = 45,    varName = "常乐草", deplete = 1,        },
    { varItem = 12052471, probability = 500,  price = 45,    varName = "一级狂攻", deplete = 1,        },
    { varItem = 12052111, probability = 500,  price = 45,    varName = "一级魔灭", deplete = 1,        },
    { varItem = 12050210, probability = 500,  price = 45,    varName = "良品龙骧马降世符", deplete = 1,        },
    { varItem = 12041223, probability = 500,  price = 45,    varName = "骑术强化符：二级追影", deplete = 1,        },

    { varItem = 11041030, probability = 500,  price = 45,    varName = "一级锻金部件", deplete = 1,        },
    { varItem = 11041033, probability = 500,  price = 45,    varName = "四级锻金部件", deplete = 1,        },
    { varItem = 10211108, probability = 500,  price = 45,    varName = "五级锻造徽章", deplete = 1,        },
    { varItem = 12041110, probability = 500,  price = 45,    varName = "一级碎甲丸", deplete = 1,        },

    { varItem = 11041050, probability = 500,  price = 45,    varName = "一级工艺部件", deplete = 1,        },
    { varItem = 11041053, probability = 500,  price = 45,    varName = "四级工艺部件", deplete = 1,        },
    { varItem = 10222207, probability = 500,  price = 45,    varName = "五级工艺披风", deplete = 1,        },
    { varItem = 11970023, probability = 500,  price = 45,    varName = "黄金乱世符", deplete = 1,        },

    { varItem = 11041040, probability = 500,  price = 45,    varName = "一级铁甲部件", deplete = 1,        },
    { varItem = 11041043, probability = 500,  price = 45,    varName = "四级铁甲部件", deplete = 1,        },
    { varItem = 11000130, probability = 500,  price = 45,    varName = "淬银钻", deplete = 1,        },
    { varItem = 12041118, probability = 500,  price = 45,    varName = "二级熔甲丸", deplete = 1,        },
}

--40级以下的
x350007_var_DailyTable40            = {
      {varItem=       12400600        ,probability=   500     , price=        1       ,varName="鸣镝狼牙镞", deplete = 1,},
      {varItem=       12400601        ,probability=   500     , price=        1       ,varName="苏鲁锭护心镜", deplete = 1,},
      {varItem=       12400602        ,probability=   500     , price=        1       ,varName="黄金家族玺印", deplete = 1,},
      {varItem=       12400603        ,probability=   500     , price=        1       ,varName="长生天之眼", deplete = 1,},
      {varItem=       12400604        ,probability=   500     , price=        1       ,varName="腾格里神油", deplete = 1,},
      {varItem=       12400605        ,probability=   500     , price=        1       ,varName="汗血宝马蹬", deplete = 1,},


      {varItem=       11000100        ,probability=   500     , price=        1       ,varName="赤铜钻", deplete = 1,},
    {varItem=       11000101        ,probability=   500     , price=        1       ,varName="生铁钻", deplete = 1,},
    {varItem=       11000110        ,probability=   500     , price=        1       ,varName="青铜钻", deplete = 1,},
    {varItem=       11000111        ,probability=   500     , price=        1       ,varName="铸铁钻", deplete = 1,},

    {varItem=       11041000        ,probability=   500     , price=        1       ,varName="一级装饰部件", deplete = 1,},
    {varItem=       11041010        ,probability=   500     , price=        1       ,varName="一级藤甲部件", deplete = 1,},
    {varItem=       11041011        ,probability=   500     , price=        1       ,varName="二级藤甲部件", deplete = 1,},
    {varItem=       11041020        ,probability=   500     , price=        1       ,varName="一级皮革部件", deplete = 1,},
    {varItem=       11041021        ,probability=   500     , price=        1       ,varName="二级皮革部件", deplete = 1,},
    {varItem=       11041030        ,probability=   500     , price=        1       ,varName="一级锻金部件", deplete = 1,},
    {varItem=       11041031        ,probability=   500     , price=        1       ,varName="二级锻金部件", deplete = 1,},
    {varItem=       11041040        ,probability=   500     , price=        1       ,varName="一级铁甲部件", deplete = 1,},
    {varItem=       11041041        ,probability=   500     , price=        1       ,varName="二级铁甲部件", deplete = 1,},
    {varItem=       11041050        ,probability=   500     , price=        1       ,varName="一级工艺部件", deplete = 1,},
    {varItem=       11041051        ,probability=   500     , price=        1       ,varName="二级工艺部件", deplete = 1,},
    {varItem=       12010101        ,probability=   500     , price=        1       ,varName="甘醇马奶酒", deplete = 1,},

    {varItem=       12020001        ,probability=   500     , price=        1       ,varName="小怒气丹", deplete = 1,},
    {varItem=       12020002        ,probability=   500     , price=        1       ,varName="小疾风丹", deplete = 1,},
    {varItem=       12020003        ,probability=   500     , price=        1       ,varName="小通络丹", deplete = 1,},
    {varItem=       12020004        ,probability=   500     , price=        1       ,varName="小威灵丹", deplete = 1,},
    {varItem=       12020005        ,probability=   500     , price=        1       ,varName="小玄冥丹", deplete = 1,},
    {varItem=       12020006        ,probability=   500     , price=        1       ,varName="小理气丹", deplete = 1,},

    {varItem=       12041011        ,probability=   500     , price=        1       ,varName="小神力丸", deplete = 1,},
    {varItem=       12041021        ,probability=   500     , price=        1       ,varName="小魔道丸", deplete = 1,},
    {varItem=       12041031        ,probability=   500     , price=        1       ,varName="小仙火丸", deplete = 1,},
    {varItem=       12041041        ,probability=   500     , price=        1       ,varName="回阳救逆丸", deplete = 1,},
    {varItem=       12041060        ,probability=   500     , price=        1       ,varName="小神甲丸", deplete = 1,},
    {varItem=       12041061        ,probability=   500     , price=        1       ,varName="中神甲丸", deplete = 1,},
    {varItem=       12041070        ,probability=   500     , price=        1       ,varName="小神护丹", deplete = 1,},
    {varItem=       12041071        ,probability=   500     , price=        1       ,varName="中神护丸", deplete = 1,},
    {varItem=       12041080        ,probability=   500     , price=        1       ,varName="小神运丸", deplete = 1,},
    {varItem=       12041081        ,probability=   500     , price=        1       ,varName="中神运丸", deplete = 1,},
    {varItem=       12050000        ,probability=   500     , price=        1       ,varName="常乐草", deplete = 1,},
    {varItem=       12050009        ,probability=   500     , price=        1       ,varName="极乐草", deplete = 1,},
    {varItem=       12050090        ,probability=   500     , price=        1       ,varName="一级融雪丹", deplete = 1,},
    {varItem=       12050201        ,probability=   500     , price=        1       ,varName="良品蒙古马降世符", deplete = 1,},

    {varItem=       12052121        ,probability=   500     , price=        1       ,varName="一级猛击", deplete = 1,},
    {varItem=       12052131        ,probability=   500     , price=        1       ,varName="一级连环", deplete = 1,},

    {varItem=       14010001        ,probability=   500     , price=        1       ,varName="初级红变石", deplete = 1,},
    {varItem=       14010006        ,probability=   500     , price=        1       ,varName="初级红琥珀", deplete = 1,},
    {varItem=       14010011        ,probability=   500     , price=        1       ,varName="初级红锆石", deplete = 1,},
    {varItem=       14020001        ,probability=   500     , price=        1       ,varName="初级绿柱石", deplete = 1,},

    {varItem=       14040001        ,probability=   500     , price=        1       ,varName="初级蓝玛瑙", deplete = 1,},
    {varItem=       14040002        ,probability=   500     , price=        1       ,varName="中级蓝玛瑙", deplete = 1,},
    {varItem=       14040006        ,probability=   500     , price=        1       ,varName="中级蓝辉石", deplete = 1,},
    {varItem=       19010001        ,probability=   500     , price=        1       ,varName="6格包", deplete = 1,},
}

--50级以下的
x350007_var_DailyTable50            = {
    {varItem=       12400600        ,probability=   500     , price=        1       ,varName="鸣镝狼牙镞", deplete = 1,},
    {varItem=       12400601        ,probability=   500     , price=        1       ,varName="苏鲁锭护心镜", deplete = 1,},
    {varItem=       12400602        ,probability=   500     , price=        1       ,varName="黄金家族玺印", deplete = 1,},
    {varItem=       12400603        ,probability=   500     , price=        1       ,varName="长生天之眼", deplete = 1,},
    {varItem=       12400604        ,probability=   500     , price=        1       ,varName="腾格里神油", deplete = 1,},
    {varItem=       12400605        ,probability=   500     , price=        1       ,varName="汗血宝马蹬", deplete = 1,},
    {varItem=       10211104        ,probability=   500     , price=        1       ,varName="一级锻造徽章", deplete = 1,},
    {varItem=       10222203        ,probability=   500     , price=        1       ,varName="一级工艺披风", deplete = 1,},
    {varItem=       10222204        ,probability=   500     , price=        1       ,varName="二级工艺披风", deplete = 1,},

    {varItem=       11000100        ,probability=   500     , price=        1       ,varName="赤铜钻", deplete = 1,},
    {varItem=       11000101        ,probability=   500     , price=        1       ,varName="生铁钻", deplete = 1,},
    {varItem=       11000110        ,probability=   500     , price=        1       ,varName="青铜钻", deplete = 1,},
    {varItem=       11000111        ,probability=   500     , price=        1       ,varName="铸铁钻", deplete = 1,},

    {varItem=       11041000        ,probability=   500     , price=        1       ,varName="一级装饰部件", deplete = 1,},
    {varItem=       11041001        ,probability=   500     , price=        1       ,varName="二级装饰部件", deplete = 1,},
    {varItem=       11041010        ,probability=   500     , price=        1       ,varName="一级藤甲部件", deplete = 1,},
    {varItem=       11041011        ,probability=   500     , price=        1       ,varName="二级藤甲部件", deplete = 1,},
    {varItem=       11041020        ,probability=   500     , price=        1       ,varName="一级皮革部件", deplete = 1,},
    {varItem=       11041021        ,probability=   500     , price=        1       ,varName="二级皮革部件", deplete = 1,},
    {varItem=       11041030        ,probability=   500     , price=        1       ,varName="一级锻金部件", deplete = 1,},
    {varItem=       11041031        ,probability=   500     , price=        1       ,varName="二级锻金部件", deplete = 1,},
    {varItem=       11041040        ,probability=   500     , price=        1       ,varName="一级铁甲部件", deplete = 1,},
    {varItem=       11041041        ,probability=   500     , price=        1       ,varName="二级铁甲部件", deplete = 1,},
    {varItem=       11041050        ,probability=   500     , price=        1       ,varName="一级工艺部件", deplete = 1,},
    {varItem=       11041051        ,probability=   500     , price=        1       ,varName="二级工艺部件", deplete = 1,},
    {varItem=       12010101        ,probability=   500     , price=        1       ,varName="甘醇马奶酒", deplete = 1,},
    {varItem=       12010200        ,probability=   500     , price=        1       ,varName="天罡止血散", deplete = 1,},
    {varItem=       12010201        ,probability=   500     , price=        1       ,varName="天王补心丹", deplete = 1,},
    {varItem=       12010300        ,probability=   500     , price=        1       ,varName="伸筋活血酒", deplete = 1,},
    {varItem=       12010301        ,probability=   500     , price=        1       ,varName="龟鹿二仙胶", deplete = 1,},
    {varItem=       12020001        ,probability=   500     , price=        1       ,varName="小怒气丹", deplete = 1,},
    {varItem=       12020002        ,probability=   500     , price=        1       ,varName="小疾风丹", deplete = 1,},
    {varItem=       12020003        ,probability=   500     , price=        1       ,varName="小通络丹", deplete = 1,},
    {varItem=       12020004        ,probability=   500     , price=        1       ,varName="小威灵丹", deplete = 1,},
    {varItem=       12020005        ,probability=   500     , price=        1       ,varName="小玄冥丹", deplete = 1,},
    {varItem=       12020006        ,probability=   500     , price=        1       ,varName="小理气丹", deplete = 1,},
    {varItem=       12020011        ,probability=   500     , price=        1       ,varName="中怒气丹", deplete = 1,},
    {varItem=       12020012        ,probability=   500     , price=        1       ,varName="中疾风丹", deplete = 1,},
    {varItem=       12020013        ,probability=   500     , price=        1       ,varName="中通络丹", deplete = 1,},
    {varItem=       12020014        ,probability=   500     , price=        1       ,varName="中威灵丹", deplete = 1,},
    {varItem=       12020015        ,probability=   500     , price=        1       ,varName="中玄冥丹", deplete = 1,},
    {varItem=       12020016        ,probability=   500     , price=        1       ,varName="中理气丹", deplete = 1,},
    {varItem=       12041011        ,probability=   500     , price=        1       ,varName="小神力丸", deplete = 1,},
    {varItem=       12041012        ,probability=   500     , price=        1       ,varName="中神力丸", deplete = 1,},
    {varItem=       12041021        ,probability=   500     , price=        1       ,varName="小魔道丸", deplete = 1,},
    {varItem=       12041022        ,probability=   500     , price=        1       ,varName="中魔道丸", deplete = 1,},
    {varItem=       12041031        ,probability=   500     , price=        1       ,varName="小仙火丸", deplete = 1,},
    {varItem=       12041032        ,probability=   500     , price=        1       ,varName="中仙火丸", deplete = 1,},
    {varItem=       12041041        ,probability=   500     , price=        1       ,varName="回阳救逆丸", deplete = 1,},
    {varItem=       12041060        ,probability=   500     , price=        1       ,varName="小神甲丸", deplete = 1,},
    {varItem=       12041061        ,probability=   500     , price=        1       ,varName="中神甲丸", deplete = 1,},
    {varItem=       12041070        ,probability=   500     , price=        1       ,varName="小神护丹", deplete = 1,},
    {varItem=       12041071        ,probability=   500     , price=        1       ,varName="中神护丸", deplete = 1,},
    {varItem=       12041080        ,probability=   500     , price=        1       ,varName="小神运丸", deplete = 1,},
    {varItem=       12041081        ,probability=   500     , price=        1       ,varName="中神运丸", deplete = 1,},
    {varItem=       12050000        ,probability=   500     , price=        1       ,varName="常乐草", deplete = 1,},
    {varItem=       12050009        ,probability=   500     , price=        1       ,varName="极乐草", deplete = 1,},
    {varItem=       12050090        ,probability=   500     , price=        1       ,varName="一级融雪丹", deplete = 1,},
    {varItem=       12050201        ,probability=   500     , price=        1       ,varName="良品蒙古马降世符", deplete = 1,},
    {varItem=       12050202        ,probability=   500     , price=        1       ,varName="良品三河马降世符", deplete = 1,},
    {varItem=       12050203        ,probability=   500     , price=        1       ,varName="良品伊犁马降世符", deplete = 1,},
    {varItem=       12050204        ,probability=   500     , price=        1       ,varName="良品波斯马降世符", deplete = 1,},
    {varItem=       12052121        ,probability=   500     , price=        1       ,varName="一级猛击", deplete = 1,},
    {varItem=       12052131        ,probability=   500     , price=        1       ,varName="一级连环", deplete = 1,},
    {varItem=       12052141        ,probability=   500     , price=        1       ,varName="一级偷袭", deplete = 1,},
    {varItem=       12052161        ,probability=   500     , price=        1       ,varName="一级回复", deplete = 1,},
    {varItem=       12052471        ,probability=   500     , price=        1       ,varName="一级狂攻", deplete = 1,},
    --{varItem=       12052472        ,probability=   500     , price=        1       ,varName="二级狂攻", deplete = 1,},
    {varItem=       12052481        ,probability=   500     , price=        1       ,varName="一级精确", deplete = 1,},
    --{varItem=       12052482        ,probability=   500     , price=        1       ,varName="二级精确", deplete = 1,},
    {varItem=       12052491        ,probability=   500     , price=        1       ,varName="一级精研", deplete = 1,},
    {varItem=       12052501        ,probability=   500     , price=        1       ,varName="一级狂暴", deplete = 1,},
    {varItem=       12052531        ,probability=   500     , price=        1       ,varName="一级热血", deplete = 1,},
    {varItem=       12052541        ,probability=   500     , price=        1       ,varName="一级淬毒", deplete = 1,},
    {varItem=       12052601        ,probability=   500     , price=        1       ,varName="一级裂甲", deplete = 1,},
    {varItem=       12052621        ,probability=   500     , price=        1       ,varName="一级破兵", deplete = 1,},
    {varItem=       12052631        ,probability=   500     , price=        1       ,varName="一级集中", deplete = 1,},
    {varItem=       12052651        ,probability=   500     , price=        1       ,varName="一级冷静", deplete = 1,},
    {varItem=       12052661        ,probability=   500     , price=        1       ,varName="一级怒气", deplete = 1,},
    {varItem=       12052671        ,probability=   500     , price=        1       ,varName="一级精力", deplete = 1,},
    {varItem=       12052681        ,probability=   500     , price=        1       ,varName="一级箭囊", deplete = 1,},
    {varItem=       12052691        ,probability=   500     , price=        1       ,varName="一级弹药", deplete = 1,},
    {varItem=       12052701        ,probability=   500     , price=        1       ,varName="一级法力", deplete = 1,},
    {varItem=       12052711        ,probability=   500     , price=        1       ,varName="一级圣力", deplete = 1,},
    {varItem=       14010001        ,probability=   500     , price=        1       ,varName="初级红变石", deplete = 1,},
    {varItem=       14010002        ,probability=   500     , price=        1       ,varName="中级红变石", deplete = 1,},
    {varItem=       14010006        ,probability=   500     , price=        1       ,varName="初级红琥珀", deplete = 1,},
    {varItem=       14010007        ,probability=   500     , price=        1       ,varName="中级红琥珀", deplete = 1,},
    {varItem=       14010011        ,probability=   500     , price=        1       ,varName="初级红锆石", deplete = 1,},
    {varItem=       14010012        ,probability=   500     , price=        1       ,varName="中级红锆石", deplete = 1,},
    {varItem=       14020001        ,probability=   500     , price=        1       ,varName="初级绿柱石", deplete = 1,},
    {varItem=       14020002        ,probability=   500     , price=        1       ,varName="中级绿柱石", deplete = 1,},
    {varItem=       14020006        ,probability=   500     , price=        1       ,varName="初级绿晶石", deplete = 1,},
    {varItem=       14020007        ,probability=   500     , price=        1       ,varName="中级绿晶石", deplete = 1,},
    {varItem=       14020011        ,probability=   500     , price=        1       ,varName="初级绿碧玺", deplete = 1,},
    {varItem=       14020012        ,probability=   500     , price=        1       ,varName="中级绿碧玺", deplete = 1,},
    {varItem=       14030001        ,probability=   500     , price=        1       ,varName="初级黄刚玉", deplete = 1,},
    {varItem=       14030002        ,probability=   500     , price=        1       ,varName="中级黄刚玉", deplete = 1,},
    {varItem=       14030006        ,probability=   500     , price=        1       ,varName="初级黄锆石", deplete = 1,},
    {varItem=       14030007        ,probability=   500     , price=        1       ,varName="中级黄锆石", deplete = 1,},
    {varItem=       14030011        ,probability=   500     , price=        1       ,varName="初级黄琉璃", deplete = 1,},
    {varItem=       14030012        ,probability=   500     , price=        1       ,varName="中级黄琉璃", deplete = 1,},
    {varItem=       14040001        ,probability=   500     , price=        1       ,varName="初级蓝玛瑙", deplete = 1,},
    {varItem=       14040002        ,probability=   500     , price=        1       ,varName="中级蓝玛瑙", deplete = 1,},
    {varItem=       14040006        ,probability=   500     , price=        1       ,varName="中级蓝辉石", deplete = 1,},
    {varItem=       19010001        ,probability=   500     , price=        1       ,varName="6格包", deplete = 1,},
    {varItem=       19010002        ,probability=   500     , price=        1       ,varName="12格包", deplete = 1,},
}

--60级以下的
x350007_var_DailyTable60            = {
    {varItem=       12400600        ,probability=   500     , price=        1       ,varName="鸣镝狼牙镞", deplete = 1,},
    {varItem=       12400601        ,probability=   500     , price=        1       ,varName="苏鲁锭护心镜", deplete = 1,},
    {varItem=       12400602        ,probability=   500     , price=        1       ,varName="黄金家族玺印", deplete = 1,},
    {varItem=       12400603        ,probability=   500     , price=        1       ,varName="长生天之眼", deplete = 1,},
    {varItem=       12400604        ,probability=   500     , price=        1       ,varName="腾格里神油", deplete = 1,},
    {varItem=       12400605        ,probability=   500     , price=        1       ,varName="汗血宝马蹬", deplete = 1,},
    {varItem=       10211104        ,probability=   500     , price=        1       ,varName="一级锻造徽章", deplete = 1,},
    {varItem=       10222203        ,probability=   500     , price=        1       ,varName="一级工艺披风", deplete = 1,},
    {varItem=       10222204        ,probability=   500     , price=        1       ,varName="二级工艺披风", deplete = 1,},

    {varItem=       11000100        ,probability=   500     , price=        1       ,varName="赤铜钻", deplete = 1,},
    {varItem=       11000101        ,probability=   500     , price=        1       ,varName="生铁钻", deplete = 1,},
    {varItem=       11000110        ,probability=   500     , price=        1       ,varName="青铜钻", deplete = 1,},
    {varItem=       11000111        ,probability=   500     , price=        1       ,varName="铸铁钻", deplete = 1,},

    {varItem=       11041000        ,probability=   500     , price=        1       ,varName="一级装饰部件", deplete = 1,},
    {varItem=       11041001        ,probability=   500     , price=        1       ,varName="二级装饰部件", deplete = 1,},
    {varItem=       11041010        ,probability=   500     , price=        1       ,varName="一级藤甲部件", deplete = 1,},
    {varItem=       11041011        ,probability=   500     , price=        1       ,varName="二级藤甲部件", deplete = 1,},
    {varItem=       11041020        ,probability=   500     , price=        1       ,varName="一级皮革部件", deplete = 1,},
    {varItem=       11041021        ,probability=   500     , price=        1       ,varName="二级皮革部件", deplete = 1,},
    {varItem=       11041030        ,probability=   500     , price=        1       ,varName="一级锻金部件", deplete = 1,},
    {varItem=       11041031        ,probability=   500     , price=        1       ,varName="二级锻金部件", deplete = 1,},
    {varItem=       11041040        ,probability=   500     , price=        1       ,varName="一级铁甲部件", deplete = 1,},
    {varItem=       11041041        ,probability=   500     , price=        1       ,varName="二级铁甲部件", deplete = 1,},
    {varItem=       11041050        ,probability=   500     , price=        1       ,varName="一级工艺部件", deplete = 1,},
    {varItem=       11041051        ,probability=   500     , price=        1       ,varName="二级工艺部件", deplete = 1,},
    {varItem=       12010101        ,probability=   500     , price=        1       ,varName="甘醇马奶酒", deplete = 1,},
    {varItem=       12010200        ,probability=   500     , price=        1       ,varName="天罡止血散", deplete = 1,},
    {varItem=       12010201        ,probability=   500     , price=        1       ,varName="天王补心丹", deplete = 1,},
    {varItem=       12010300        ,probability=   500     , price=        1       ,varName="伸筋活血酒", deplete = 1,},
    {varItem=       12010301        ,probability=   500     , price=        1       ,varName="龟鹿二仙胶", deplete = 1,},
    {varItem=       12020001        ,probability=   500     , price=        1       ,varName="小怒气丹", deplete = 1,},
    {varItem=       12020002        ,probability=   500     , price=        1       ,varName="小疾风丹", deplete = 1,},
    {varItem=       12020003        ,probability=   500     , price=        1       ,varName="小通络丹", deplete = 1,},
    {varItem=       12020004        ,probability=   500     , price=        1       ,varName="小威灵丹", deplete = 1,},
    {varItem=       12020005        ,probability=   500     , price=        1       ,varName="小玄冥丹", deplete = 1,},
    {varItem=       12020006        ,probability=   500     , price=        1       ,varName="小理气丹", deplete = 1,},
    {varItem=       12020011        ,probability=   500     , price=        1       ,varName="中怒气丹", deplete = 1,},
    {varItem=       12020012        ,probability=   500     , price=        1       ,varName="中疾风丹", deplete = 1,},
    {varItem=       12020013        ,probability=   500     , price=        1       ,varName="中通络丹", deplete = 1,},
    {varItem=       12020014        ,probability=   500     , price=        1       ,varName="中威灵丹", deplete = 1,},
    {varItem=       12020015        ,probability=   500     , price=        1       ,varName="中玄冥丹", deplete = 1,},
    {varItem=       12020016        ,probability=   500     , price=        1       ,varName="中理气丹", deplete = 1,},
    {varItem=       12041011        ,probability=   500     , price=        1       ,varName="小神力丸", deplete = 1,},
    {varItem=       12041012        ,probability=   500     , price=        1       ,varName="中神力丸", deplete = 1,},
    {varItem=       12041021        ,probability=   500     , price=        1       ,varName="小魔道丸", deplete = 1,},
    {varItem=       12041022        ,probability=   500     , price=        1       ,varName="中魔道丸", deplete = 1,},
    {varItem=       12041031        ,probability=   500     , price=        1       ,varName="小仙火丸", deplete = 1,},
    {varItem=       12041032        ,probability=   500     , price=        1       ,varName="中仙火丸", deplete = 1,},
    {varItem=       12041041        ,probability=   500     , price=        1       ,varName="回阳救逆丸", deplete = 1,},
    {varItem=       12041060        ,probability=   500     , price=        1       ,varName="小神甲丸", deplete = 1,},
    {varItem=       12041061        ,probability=   500     , price=        1       ,varName="中神甲丸", deplete = 1,},
    {varItem=       12041070        ,probability=   500     , price=        1       ,varName="小神护丹", deplete = 1,},
    {varItem=       12041071        ,probability=   500     , price=        1       ,varName="中神护丸", deplete = 1,},
    {varItem=       12041080        ,probability=   500     , price=        1       ,varName="小神运丸", deplete = 1,},
    {varItem=       12041081        ,probability=   500     , price=        1       ,varName="中神运丸", deplete = 1,},
    {varItem=       12050000        ,probability=   500     , price=        1       ,varName="常乐草", deplete = 1,},
    {varItem=       12050009        ,probability=   500     , price=        1       ,varName="极乐草", deplete = 1,},
    {varItem=       12050090        ,probability=   500     , price=        1       ,varName="一级融雪丹", deplete = 1,},
    {varItem=       12050201        ,probability=   500     , price=        1       ,varName="良品蒙古马降世符", deplete = 1,},
    {varItem=       12050202        ,probability=   500     , price=        1       ,varName="良品三河马降世符", deplete = 1,},
    {varItem=       12050203        ,probability=   500     , price=        1       ,varName="良品伊犁马降世符", deplete = 1,},
    {varItem=       12050204        ,probability=   500     , price=        1       ,varName="良品波斯马降世符", deplete = 1,},
    {varItem=       12052121        ,probability=   500     , price=        1       ,varName="一级猛击", deplete = 1,},
    {varItem=       12052131        ,probability=   500     , price=        1       ,varName="一级连环", deplete = 1,},
    {varItem=       12052141        ,probability=   500     , price=        1       ,varName="一级偷袭", deplete = 1,},
    {varItem=       12052161        ,probability=   500     , price=        1       ,varName="一级回复", deplete = 1,},
    {varItem=       12052471        ,probability=   500     , price=        1       ,varName="一级狂攻", deplete = 1,},
    --{varItem=       12052472        ,probability=   500     , price=        1       ,varName="二级狂攻", deplete = 1,},
    {varItem=       12052481        ,probability=   500     , price=        1       ,varName="一级精确", deplete = 1,},
    --{varItem=       12052482        ,probability=   500     , price=        1       ,varName="二级精确", deplete = 1,},
    {varItem=       12052491        ,probability=   500     , price=        1       ,varName="一级精研", deplete = 1,},
    --{varItem=       12052492        ,probability=   500     , price=        1       ,varName="二级精研", deplete = 1,},
    {varItem=       12052501        ,probability=   500     , price=        1       ,varName="一级狂暴", deplete = 1,},
    {varItem=       12052531        ,probability=   500     , price=        1       ,varName="一级热血", deplete = 1,},
    --{varItem=       12052532        ,probability=   500     , price=        1       ,varName="二级热血", deplete = 1,},
    {varItem=       12052541        ,probability=   500     , price=        1       ,varName="一级淬毒", deplete = 1,},
    --{varItem=       12052542        ,probability=   500     , price=        1       ,varName="二级淬毒", deplete = 1,},
    {varItem=       12052601        ,probability=   500     , price=        1       ,varName="一级裂甲", deplete = 1,},
    --{varItem=       12052602        ,probability=   500     , price=        1       ,varName="二级裂甲", deplete = 1,},
    {varItem=       12052621        ,probability=   500     , price=        1       ,varName="一级破兵", deplete = 1,},
    --{varItem=       12052622        ,probability=   500     , price=        1       ,varName="二级破兵", deplete = 1,},
    {varItem=       12052631        ,probability=   500     , price=        1       ,varName="一级集中", deplete = 1,},
    --{varItem=       12052632        ,probability=   500     , price=        1       ,varName="二级集中", deplete = 1,},
    {varItem=       12052651        ,probability=   500     , price=        1       ,varName="一级冷静", deplete = 1,},
    {varItem=       12052661        ,probability=   500     , price=        1       ,varName="一级怒气", deplete = 1,},
    {varItem=       12052671        ,probability=   500     , price=        1       ,varName="一级精力", deplete = 1,},
    {varItem=       12052681        ,probability=   500     , price=        1       ,varName="一级箭囊", deplete = 1,},
    {varItem=       12052691        ,probability=   500     , price=        1       ,varName="一级弹药", deplete = 1,},
    {varItem=       12052701        ,probability=   500     , price=        1       ,varName="一级法力", deplete = 1,},
    {varItem=       12052711        ,probability=   500     , price=        1       ,varName="一级圣力", deplete = 1,},
    {varItem=       14010001        ,probability=   500     , price=        1       ,varName="初级红变石", deplete = 1,},
    {varItem=       14010002        ,probability=   500     , price=        1       ,varName="中级红变石", deplete = 1,},
    {varItem=       14010006        ,probability=   500     , price=        1       ,varName="初级红琥珀", deplete = 1,},
    {varItem=       14010007        ,probability=   500     , price=        1       ,varName="中级红琥珀", deplete = 1,},
    {varItem=       14010011        ,probability=   500     , price=        1       ,varName="初级红锆石", deplete = 1,},
    {varItem=       14010012        ,probability=   500     , price=        1       ,varName="中级红锆石", deplete = 1,},
    {varItem=       14020001        ,probability=   500     , price=        1       ,varName="初级绿柱石", deplete = 1,},
    {varItem=       14020002        ,probability=   500     , price=        1       ,varName="中级绿柱石", deplete = 1,},
    {varItem=       14020006        ,probability=   500     , price=        1       ,varName="初级绿晶石", deplete = 1,},
    {varItem=       14020007        ,probability=   500     , price=        1       ,varName="中级绿晶石", deplete = 1,},
    {varItem=       14020011        ,probability=   500     , price=        1       ,varName="初级绿碧玺", deplete = 1,},
    {varItem=       14020012        ,probability=   500     , price=        1       ,varName="中级绿碧玺", deplete = 1,},
    {varItem=       14030001        ,probability=   500     , price=        1       ,varName="初级黄刚玉", deplete = 1,},
    {varItem=       14030002        ,probability=   500     , price=        1       ,varName="中级黄刚玉", deplete = 1,},
    {varItem=       14030006        ,probability=   500     , price=        1       ,varName="初级黄锆石", deplete = 1,},
    {varItem=       14030007        ,probability=   500     , price=        1       ,varName="中级黄锆石", deplete = 1,},
    {varItem=       14030011        ,probability=   500     , price=        1       ,varName="初级黄琉璃", deplete = 1,},
    {varItem=       14030012        ,probability=   500     , price=        1       ,varName="中级黄琉璃", deplete = 1,},
    {varItem=       14040001        ,probability=   500     , price=        1       ,varName="初级蓝玛瑙", deplete = 1,},
    {varItem=       14040002        ,probability=   500     , price=        1       ,varName="中级蓝玛瑙", deplete = 1,},
    {varItem=       14040006        ,probability=   500     , price=        1       ,varName="中级蓝辉石", deplete = 1,},
    {varItem=       19010001        ,probability=   500     , price=        1       ,varName="6格包", deplete = 1,},
    {varItem=       19010002        ,probability=   500     , price=        1       ,varName="12格包", deplete = 1,},
}

--70级以下的
x350007_var_DailyTable70            = {
    {varItem=       12400600        ,probability=   500     , price=        1       ,varName="鸣镝狼牙镞", deplete = 1,},
    {varItem=       12400601        ,probability=   500     , price=        1       ,varName="苏鲁锭护心镜", deplete = 1,},
    {varItem=       12400602        ,probability=   500     , price=        1       ,varName="黄金家族玺印", deplete = 1,},
    {varItem=       12400603        ,probability=   500     , price=        1       ,varName="长生天之眼", deplete = 1,},
    {varItem=       12400604        ,probability=   500     , price=        1       ,varName="腾格里神油", deplete = 1,},
    {varItem=       12400605        ,probability=   500     , price=        1       ,varName="汗血宝马蹬", deplete = 1,},
    {varItem=       10211104        ,probability=   500     , price=        1       ,varName="一级锻造徽章", deplete = 1,},
    {varItem=       10211105        ,probability=   500     , price=        1       ,varName="二级锻造徽章", deplete = 1,},
    {varItem=       10211106        ,probability=   500     , price=        1       ,varName="三级锻造徽章", deplete = 1,},
    {varItem=       10222203        ,probability=   500     , price=        1       ,varName="一级工艺披风", deplete = 1,},
    {varItem=       10222204        ,probability=   500     , price=        1       ,varName="二级工艺披风", deplete = 1,},
    {varItem=       10222205        ,probability=   500     , price=        1       ,varName="三级工艺披风", deplete = 1,},

    {varItem=       11000100        ,probability=   500     , price=        1       ,varName="赤铜钻", deplete = 1,},
    {varItem=       11000101        ,probability=   500     , price=        1       ,varName="生铁钻", deplete = 1,},
    {varItem=       11000102        ,probability=   500     , price=        1       ,varName="白玉钻", deplete = 1,},
    {varItem=       11000103        ,probability=   500     , price=        1       ,varName="白玉", deplete = 1,},
    {varItem=       11000104        ,probability=   500     , price=        1       ,varName="血玉髓", deplete = 1,},
    {varItem=       11000110        ,probability=   500     , price=        1       ,varName="青铜钻", deplete = 1,},
    {varItem=       11000111        ,probability=   500     , price=        1       ,varName="铸铁钻", deplete = 1,},
    {varItem=       11000124        ,probability=   500     , price=        1       ,varName="血玉钻", deplete = 1,},

    {varItem=       11000811        ,probability=   500     , price=        1       ,varName="完整的粗布包图样", deplete = 1,},
    {varItem=       11000812        ,probability=   500     , price=        1       ,varName="完整的棉布包图样", deplete = 1,},
    {varItem=       11000813        ,probability=   500     , price=        1       ,varName="完整的硝制皮包图样", deplete = 1,},
    {varItem=       11000814        ,probability=   500     , price=        1       ,varName="完整的翻毛皮包图样", deplete = 1,},
    {varItem=       11000815        ,probability=   500     , price=        1       ,varName="完整的绒面皮包图样", deplete = 1,},
    {varItem=       11000816        ,probability=   500     , price=        1       ,varName="完整的素色绸包图样", deplete = 1,},

    {varItem=       11020030        ,probability=   500     , price=        1       ,varName="世传水晶精华", deplete = 1,},
    {varItem=       11020031        ,probability=   500     , price=        1       ,varName="国传水晶精华", deplete = 1,},
    {varItem=       11020032        ,probability=   500     , price=        1       ,varName="神传水晶精华", deplete = 1,},
    {varItem=       11020040        ,probability=   500     , price=        1       ,varName="初级龙眼石精华", deplete = 1,},
    {varItem=       11020041        ,probability=   500     , price=        1       ,varName="中级龙眼石精华", deplete = 1,},
    {varItem=       11020042        ,probability=   500     , price=        1       ,varName="高级龙眼石精华", deplete = 1,},
    {varItem=       11020050        ,probability=   500     , price=        1       ,varName="马蜂精华", deplete = 1,},
    {varItem=       11020051        ,probability=   500     , price=        1       ,varName="牛虻精华", deplete = 1,},
    {varItem=       11020052        ,probability=   500     , price=        1       ,varName="吸血蝙蝠精华", deplete = 1,},
    {varItem=       11020060        ,probability=   500     , price=        1       ,varName="初级矿石精华", deplete = 1,},
    {varItem=       11020061        ,probability=   500     , price=        1       ,varName="中级矿石精华", deplete = 1,},
    {varItem=       11020062        ,probability=   500     , price=        1       ,varName="高级矿石精华", deplete = 1,},
    {varItem=       11020070        ,probability=   500     , price=        1       ,varName="甘草精华", deplete = 1,},
    {varItem=       11020071        ,probability=   500     , price=        1       ,varName="茯苓精华", deplete = 1,},
    {varItem=       11020072        ,probability=   500     , price=        1       ,varName="天麻精华", deplete = 1,},
    {varItem=       11020080        ,probability=   500     , price=        1       ,varName="红花精华", deplete = 1,},
    {varItem=       11020081        ,probability=   500     , price=        1       ,varName="伸筋藤精华", deplete = 1,},
    {varItem=       11020082        ,probability=   500     , price=        1       ,varName="朱砂精华", deplete = 1,},
    {varItem=       11020502        ,probability=   500     , price=        1       ,varName="水木精华", deplete = 1,},
    {varItem=       11030406        ,probability=   500     , price=        1       ,varName="七步封喉", deplete = 1,},
    {varItem=       11030502        ,probability=   500     , price=        1       ,varName="黑曜石", deplete = 1,},
    {varItem=       11041000        ,probability=   500     , price=        1       ,varName="一级装饰部件", deplete = 1,},
    {varItem=       11041001        ,probability=   500     , price=        1       ,varName="二级装饰部件", deplete = 1,},
    {varItem=       11041002        ,probability=   500     , price=        1       ,varName="三级装饰部件", deplete = 1,},
    {varItem=       11041003        ,probability=   500     , price=        1       ,varName="四级装饰部件", deplete = 1,},
    {varItem=       11041010        ,probability=   500     , price=        1       ,varName="一级藤甲部件", deplete = 1,},
    {varItem=       11041011        ,probability=   500     , price=        1       ,varName="二级藤甲部件", deplete = 1,},
    {varItem=       11041012        ,probability=   500     , price=        1       ,varName="三级藤甲部件", deplete = 1,},
    {varItem=       11041013        ,probability=   500     , price=        1       ,varName="四级藤甲部件", deplete = 1,},
    {varItem=       11041020        ,probability=   500     , price=        1       ,varName="一级皮革部件", deplete = 1,},
    {varItem=       11041021        ,probability=   500     , price=        1       ,varName="二级皮革部件", deplete = 1,},
    {varItem=       11041022        ,probability=   500     , price=        1       ,varName="三级皮革部件", deplete = 1,},
    {varItem=       11041023        ,probability=   500     , price=        1       ,varName="四级皮革部件", deplete = 1,},
    {varItem=       11041030        ,probability=   500     , price=        1       ,varName="一级锻金部件", deplete = 1,},
    {varItem=       11041031        ,probability=   500     , price=        1       ,varName="二级锻金部件", deplete = 1,},
    {varItem=       11041032        ,probability=   500     , price=        1       ,varName="三级锻金部件", deplete = 1,},
    {varItem=       11041033        ,probability=   500     , price=        1       ,varName="四级锻金部件", deplete = 1,},
    {varItem=       11041040        ,probability=   500     , price=        1       ,varName="一级铁甲部件", deplete = 1,},
    {varItem=       11041041        ,probability=   500     , price=        1       ,varName="二级铁甲部件", deplete = 1,},
    {varItem=       11041042        ,probability=   500     , price=        1       ,varName="三级铁甲部件", deplete = 1,},
    {varItem=       11041043        ,probability=   500     , price=        1       ,varName="四级铁甲部件", deplete = 1,},
    {varItem=       11041050        ,probability=   500     , price=        1       ,varName="一级工艺部件", deplete = 1,},
    {varItem=       11041051        ,probability=   500     , price=        1       ,varName="二级工艺部件", deplete = 1,},
    {varItem=       11041052        ,probability=   500     , price=        1       ,varName="三级工艺部件", deplete = 1,},
    {varItem=       11041053        ,probability=   500     , price=        1       ,varName="四级工艺部件", deplete = 1,},
    {varItem=       12010101        ,probability=   500     , price=        1       ,varName="甘醇马奶酒", deplete = 1,},
    {varItem=       12010200        ,probability=   500     , price=        1       ,varName="天罡止血散", deplete = 1,},
    {varItem=       12010201        ,probability=   500     , price=        1       ,varName="天王补心丹", deplete = 1,},
    {varItem=       12010202        ,probability=   500     , price=        1       ,varName="桂苓甘露散", deplete = 1,},
    {varItem=       12010203        ,probability=   500     , price=        1       ,varName="仙方活命饮", deplete = 1,},
    {varItem=       12010300        ,probability=   500     , price=        1       ,varName="伸筋活血酒", deplete = 1,},
    {varItem=       12010301        ,probability=   500     , price=        1       ,varName="龟鹿二仙胶", deplete = 1,},
    {varItem=       12010302        ,probability=   500     , price=        1       ,varName="云灵五菌汤", deplete = 1,},
    {varItem=       12010303        ,probability=   500     , price=        1       ,varName="参茸还魂膏", deplete = 1,},
    {varItem=       12020001        ,probability=   500     , price=        1       ,varName="小怒气丹", deplete = 1,},
    {varItem=       12020002        ,probability=   500     , price=        1       ,varName="小疾风丹", deplete = 1,},
    {varItem=       12020003        ,probability=   500     , price=        1       ,varName="小通络丹", deplete = 1,},
    {varItem=       12020004        ,probability=   500     , price=        1       ,varName="小威灵丹", deplete = 1,},
    {varItem=       12020005        ,probability=   500     , price=        1       ,varName="小玄冥丹", deplete = 1,},
    {varItem=       12020006        ,probability=   500     , price=        1       ,varName="小理气丹", deplete = 1,},
    {varItem=       12020011        ,probability=   500     , price=        1       ,varName="中怒气丹", deplete = 1,},
    {varItem=       12020012        ,probability=   500     , price=        1       ,varName="中疾风丹", deplete = 1,},
    {varItem=       12020013        ,probability=   500     , price=        1       ,varName="中通络丹", deplete = 1,},
    {varItem=       12020014        ,probability=   500     , price=        1       ,varName="中威灵丹", deplete = 1,},
    {varItem=       12020015        ,probability=   500     , price=        1       ,varName="中玄冥丹", deplete = 1,},
    {varItem=       12020016        ,probability=   500     , price=        1       ,varName="中理气丹", deplete = 1,},
    {varItem=       12020021        ,probability=   500     , price=        1       ,varName="大怒气丹", deplete = 1,},
    {varItem=       12020022        ,probability=   500     , price=        1       ,varName="大疾风丹", deplete = 1,},
    {varItem=       12020023        ,probability=   500     , price=        1       ,varName="大通络丹", deplete = 1,},
    {varItem=       12020024        ,probability=   500     , price=        1       ,varName="大威灵丹", deplete = 1,},
    {varItem=       12020025        ,probability=   500     , price=        1       ,varName="大玄冥丹", deplete = 1,},
    {varItem=       12020026        ,probability=   500     , price=        1       ,varName="大理气丹", deplete = 1,},
    {varItem=       12020031        ,probability=   500     , price=        1       ,varName="玄参怒气丹", deplete = 1,},
    {varItem=       12020032        ,probability=   500     , price=        1       ,varName="水玉疾风丹", deplete = 1,},
    {varItem=       12020033        ,probability=   500     , price=        1       ,varName="麝香通络丹", deplete = 1,},
    {varItem=       12020034        ,probability=   500     , price=        1       ,varName="遂火威灵丹", deplete = 1,},
    {varItem=       12020035        ,probability=   500     , price=        1       ,varName="昊天玄冥丹", deplete = 1,},
    {varItem=       12020036        ,probability=   500     , price=        1       ,varName="神农理气丹", deplete = 1,},
    {varItem=       12041011        ,probability=   500     , price=        1       ,varName="小神力丸", deplete = 1,},
    {varItem=       12041012        ,probability=   500     , price=        1       ,varName="中神力丸", deplete = 1,},
    {varItem=       12041013        ,probability=   500     , price=        1       ,varName="大神力丸", deplete = 1,},
    {varItem=       12041021        ,probability=   500     , price=        1       ,varName="小魔道丸", deplete = 1,},
    {varItem=       12041022        ,probability=   500     , price=        1       ,varName="中魔道丸", deplete = 1,},
    {varItem=       12041023        ,probability=   500     , price=        1       ,varName="大魔道丸", deplete = 1,},
    {varItem=       12041031        ,probability=   500     , price=        1       ,varName="小仙火丸", deplete = 1,},
    {varItem=       12041032        ,probability=   500     , price=        1       ,varName="中仙火丸", deplete = 1,},
    {varItem=       12041033        ,probability=   500     , price=        1       ,varName="大仙火丸", deplete = 1,},
    {varItem=       12041041        ,probability=   500     , price=        1       ,varName="回阳救逆丸", deplete = 1,},
    {varItem=       12041042        ,probability=   500     , price=        1       ,varName="参灵正气丸", deplete = 1,},
    {varItem=       12041060        ,probability=   500     , price=        1       ,varName="小神甲丸", deplete = 1,},
    {varItem=       12041061        ,probability=   500     , price=        1       ,varName="中神甲丸", deplete = 1,},
    {varItem=       12041062        ,probability=   500     , price=        1       ,varName="大神甲丸", deplete = 1,},
    {varItem=       12041070        ,probability=   500     , price=        1       ,varName="小神护丹", deplete = 1,},
    {varItem=       12041071        ,probability=   500     , price=        1       ,varName="中神护丸", deplete = 1,},
    {varItem=       12041072        ,probability=   500     , price=        1       ,varName="大神护丸", deplete = 1,},
    {varItem=       12041080        ,probability=   500     , price=        1       ,varName="小神运丸", deplete = 1,},
    {varItem=       12041081        ,probability=   500     , price=        1       ,varName="中神运丸", deplete = 1,},
    {varItem=       12041082        ,probability=   500     , price=        1       ,varName="大神运丸", deplete = 1,},
    {varItem=       12050000        ,probability=   500     , price=        1       ,varName="常乐草", deplete = 1,},
    {varItem=       12050009        ,probability=   500     , price=        1       ,varName="极乐草", deplete = 1,},
    {varItem=       12050009        ,probability=   500     , price=        1       ,varName="极乐草", deplete = 1,},
    {varItem=       12050090        ,probability=   500     , price=        1       ,varName="一级融雪丹", deplete = 1,},
    {varItem=       12050091        ,probability=   500     , price=        1       ,varName="二级融雪丹", deplete = 1,},
    {varItem=       12050092        ,probability=   500     , price=        1       ,varName="三级融雪丹", deplete = 1,},
    {varItem=       12050201        ,probability=   500     , price=        1       ,varName="良品蒙古马降世符", deplete = 1,},
    {varItem=       12050202        ,probability=   500     , price=        1       ,varName="良品三河马降世符", deplete = 1,},
    {varItem=       12050203        ,probability=   500     , price=        1       ,varName="良品伊犁马降世符", deplete = 1,},
    {varItem=       12050204        ,probability=   500     , price=        1       ,varName="良品波斯马降世符", deplete = 1,},
    {varItem=       12050205        ,probability=   500     , price=        1       ,varName="良品天方马降世符", deplete = 1,},
    {varItem=       12050206        ,probability=   500     , price=        1       ,varName="良品大宛马降世符", deplete = 1,},
    {varItem=       12050207        ,probability=   500     , price=        1       ,varName="良品纯血马降世符", deplete = 1,},
    {varItem=       12052091        ,probability=   500     , price=        1       ,varName="一级乱战", deplete = 1,},
    {varItem=       12052101        ,probability=   500     , price=        1       ,varName="一级破军", deplete = 1,},
    {varItem=       12052111        ,probability=   500     , price=        1       ,varName="一级魔灭", deplete = 1,},
    {varItem=       12052121        ,probability=   500     , price=        1       ,varName="一级猛击", deplete = 1,},
    {varItem=       12052131        ,probability=   500     , price=        1       ,varName="一级连环", deplete = 1,},
    {varItem=       12052141        ,probability=   500     , price=        1       ,varName="一级偷袭", deplete = 1,},
    {varItem=       12052161        ,probability=   500     , price=        1       ,varName="一级回复", deplete = 1,},
    {varItem=       12052471        ,probability=   500     , price=        1       ,varName="一级狂攻", deplete = 1,},
    --{varItem=       12052472        ,probability=   500     , price=        1       ,varName="二级狂攻", deplete = 1,},
    --{varItem=       12052473        ,probability=   500     , price=        1       ,varName="三级狂攻", deplete = 1,},
    --{varItem=       12052474        ,probability=   500     , price=        1       ,varName="四级狂攻", deplete = 1,},
    {varItem=       12052481        ,probability=   500     , price=        1       ,varName="一级精确", deplete = 1,},
    --{varItem=       12052482        ,probability=   500     , price=        1       ,varName="二级精确", deplete = 1,},
    --{varItem=       12052483        ,probability=   500     , price=        1       ,varName="三级精确", deplete = 1,},
    --{varItem=       12052484        ,probability=   500     , price=        1       ,varName="四级精确", deplete = 1,},
    {varItem=       12052491        ,probability=   500     , price=        1       ,varName="一级精研", deplete = 1,},
    --{varItem=       12052492        ,probability=   500     , price=        1       ,varName="二级精研", deplete = 1,},
    --{varItem=       12052493        ,probability=   500     , price=        1       ,varName="三级精研", deplete = 1,},
    --{varItem=       12052494        ,probability=   500     , price=        1       ,varName="四级精研", deplete = 1,},
    {varItem=       12052501        ,probability=   500     , price=        1       ,varName="一级狂暴", deplete = 1,},
    --{varItem=       12052502        ,probability=   500     , price=        1       ,varName="二级狂暴", deplete = 1,},
    --{varItem=       12052503        ,probability=   500     , price=        1       ,varName="三级狂暴", deplete = 1,},
    {varItem=       12052511        ,probability=   500     , price=        1       ,varName="一级免伤", deplete = 1,},
    --{varItem=       12052512        ,probability=   500     , price=        1       ,varName="二级免伤", deplete = 1,},
    {varItem=       12052521        ,probability=   500     , price=        1       ,varName="一级灵巧", deplete = 1,},
    --{varItem=       12052522        ,probability=   500     , price=        1       ,varName="二级灵巧", deplete = 1,},
    {varItem=       12052531        ,probability=   500     , price=        1       ,varName="一级热血", deplete = 1,},
    --{varItem=       12052532        ,probability=   500     , price=        1       ,varName="二级热血", deplete = 1,},
    --{varItem=       12052533        ,probability=   500     , price=        1       ,varName="三级热血", deplete = 1,},
    --{varItem=       12052534        ,probability=   500     , price=        1       ,varName="四级热血", deplete = 1,},
    {varItem=       12052541        ,probability=   500     , price=        1       ,varName="一级淬毒", deplete = 1,},
    --{varItem=       12052542        ,probability=   500     , price=        1       ,varName="二级淬毒", deplete = 1,},
    --{varItem=       12052543        ,probability=   500     , price=        1       ,varName="三级淬毒", deplete = 1,},
    {varItem=       12052551        ,probability=   500     , price=        1       ,varName="一级伤筋", deplete = 1,},
    {varItem=       12052561        ,probability=   500     , price=        1       ,varName="一级击晕", deplete = 1,},
    {varItem=       12052571        ,probability=   500     , price=        1       ,varName="一级狂吼", deplete = 1,},
    {varItem=       12052581        ,probability=   500     , price=        1       ,varName="一级沉寂", deplete = 1,},
    {varItem=       12052591        ,probability=   500     , price=        1       ,varName="一级定身", deplete = 1,},
    {varItem=       12052601        ,probability=   500     , price=        1       ,varName="一级裂甲", deplete = 1,},
    --{varItem=       12052602        ,probability=   500     , price=        1       ,varName="二级裂甲", deplete = 1,},
    --{varItem=       12052603        ,probability=   500     , price=        1       ,varName="三级裂甲", deplete = 1,},
    {varItem=       12052611        ,probability=   500     , price=        1       ,varName="一级盲目", deplete = 1,},
    {varItem=       12052621        ,probability=   500     , price=        1       ,varName="一级破兵", deplete = 1,},
    --{varItem=       12052622        ,probability=   500     , price=        1       ,varName="二级破兵", deplete = 1,},
    --{varItem=       12052623        ,probability=   500     , price=        1       ,varName="三级破兵", deplete = 1,},
    {varItem=       12052631        ,probability=   500     , price=        1       ,varName="一级集中", deplete = 1,},
    --{varItem=       12052632        ,probability=   500     , price=        1       ,varName="二级集中", deplete = 1,},
    --{varItem=       12052633        ,probability=   500     , price=        1       ,varName="三级集中", deplete = 1,},
    {varItem=       12052641        ,probability=   500     , price=        1       ,varName="一级无视", deplete = 1,},
    {varItem=       12052651        ,probability=   500     , price=        1       ,varName="一级冷静", deplete = 1,},
    --{varItem=       12052652        ,probability=   500     , price=        1       ,varName="二级冷静", deplete = 1,},
    {varItem=       12052661        ,probability=   500     , price=        1       ,varName="一级怒气", deplete = 1,},
    {varItem=       12052671        ,probability=   500     , price=        1       ,varName="一级精力", deplete = 1,},
    {varItem=       12052681        ,probability=   500     , price=        1       ,varName="一级箭囊", deplete = 1,},
    {varItem=       12052691        ,probability=   500     , price=        1       ,varName="一级弹药", deplete = 1,},
    {varItem=       12052701        ,probability=   500     , price=        1       ,varName="一级法力", deplete = 1,},
    {varItem=       12052711        ,probability=   500     , price=        1       ,varName="一级圣力", deplete = 1,},

    {varItem=       14010001        ,probability=   500     , price=        1       ,varName="初级红变石", deplete = 1,},
    {varItem=       14010002        ,probability=   500     , price=        1       ,varName="中级红变石", deplete = 1,},
    {varItem=       14010003        ,probability=   500     , price=        1       ,varName="高级红变石", deplete = 1,},
    {varItem=       14010004        ,probability=   500     , price=        1       ,varName="圣徒级红变石", deplete = 1,},
    {varItem=       14010006        ,probability=   500     , price=        1       ,varName="初级红琥珀", deplete = 1,},
    {varItem=       14010007        ,probability=   500     , price=        1       ,varName="中级红琥珀", deplete = 1,},
    {varItem=       14010008        ,probability=   500     , price=        1       ,varName="高级红琥珀", deplete = 1,},
    {varItem=       14010009        ,probability=   500     , price=        1       ,varName="圣徒级红琥珀", deplete = 1,},
    {varItem=       14010011        ,probability=   500     , price=        1       ,varName="初级红锆石", deplete = 1,},
    {varItem=       14010012        ,probability=   500     , price=        1       ,varName="中级红锆石", deplete = 1,},
    {varItem=       14010013        ,probability=   500     , price=        1       ,varName="高级红锆石", deplete = 1,},
    {varItem=       14010014        ,probability=   500     , price=        1       ,varName="圣徒级红锆石", deplete = 1,},
    {varItem=       14010016        ,probability=   500     , price=        1       ,varName="高级红龙晶", deplete = 1,},
    {varItem=       14010021        ,probability=   500     , price=        1       ,varName="高级红玉髓", deplete = 1,},
    {varItem=       14010026        ,probability=   500     , price=        1       ,varName="高级红猫眼", deplete = 1,},
    {varItem=       14020001        ,probability=   500     , price=        1       ,varName="初级绿柱石", deplete = 1,},
    {varItem=       14020002        ,probability=   500     , price=        1       ,varName="中级绿柱石", deplete = 1,},
    {varItem=       14020003        ,probability=   500     , price=        1       ,varName="高级绿柱石", deplete = 1,},
    {varItem=       14020004        ,probability=   500     , price=        1       ,varName="圣徒级绿柱石", deplete = 1,},
    {varItem=       14020006        ,probability=   500     , price=        1       ,varName="初级绿晶石", deplete = 1,},
    {varItem=       14020007        ,probability=   500     , price=        1       ,varName="中级绿晶石", deplete = 1,},
    {varItem=       14020008        ,probability=   500     , price=        1       ,varName="高级绿晶石", deplete = 1,},
    {varItem=       14020009        ,probability=   500     , price=        1       ,varName="圣徒级绿晶石", deplete = 1,},
    {varItem=       14020011        ,probability=   500     , price=        1       ,varName="初级绿碧玺", deplete = 1,},
    {varItem=       14020012        ,probability=   500     , price=        1       ,varName="中级绿碧玺", deplete = 1,},
    {varItem=       14020013        ,probability=   500     , price=        1       ,varName="高级绿碧玺", deplete = 1,},
    {varItem=       14020014        ,probability=   500     , price=        1       ,varName="圣徒级绿碧玺", deplete = 1,},
    {varItem=       14020016        ,probability=   500     , price=        1       ,varName="高级绿龙晶", deplete = 1,},
    {varItem=       14020021        ,probability=   500     , price=        1       ,varName="高级绿玉髓", deplete = 1,},
    {varItem=       14020026        ,probability=   500     , price=        1       ,varName="高级绿猫眼", deplete = 1,},
    {varItem=       14030001        ,probability=   500     , price=        1       ,varName="初级黄刚玉", deplete = 1,},
    {varItem=       14030002        ,probability=   500     , price=        1       ,varName="中级黄刚玉", deplete = 1,},
    {varItem=       14030003        ,probability=   500     , price=        1       ,varName="高级黄刚玉", deplete = 1,},
    {varItem=       14030004        ,probability=   500     , price=        1       ,varName="圣徒级黄刚玉", deplete = 1,},
    {varItem=       14030006        ,probability=   500     , price=        1       ,varName="初级黄锆石", deplete = 1,},
    {varItem=       14030007        ,probability=   500     , price=        1       ,varName="中级黄锆石", deplete = 1,},
    {varItem=       14030008        ,probability=   500     , price=        1       ,varName="高级黄锆石", deplete = 1,},
    {varItem=       14030009        ,probability=   500     , price=        1       ,varName="圣徒级黄锆石", deplete = 1,},
    {varItem=       14030011        ,probability=   500     , price=        1       ,varName="初级黄琉璃", deplete = 1,},
    {varItem=       14030012        ,probability=   500     , price=        1       ,varName="中级黄琉璃", deplete = 1,},
    {varItem=       14030013        ,probability=   500     , price=        1       ,varName="高级黄琉璃", deplete = 1,},
    {varItem=       14030014        ,probability=   500     , price=        1       ,varName="圣徒级黄琉璃", deplete = 1,},
    {varItem=       14030016        ,probability=   500     , price=        1       ,varName="高级黄龙晶", deplete = 1,},
    {varItem=       14030021        ,probability=   500     , price=        1       ,varName="高级黄玉髓", deplete = 1,},
    {varItem=       14030026        ,probability=   500     , price=        1       ,varName="高级黄猫眼", deplete = 1,},
    {varItem=       14040001        ,probability=   500     , price=        1       ,varName="初级蓝玛瑙", deplete = 1,},
    {varItem=       14040002        ,probability=   500     , price=        1       ,varName="中级蓝玛瑙", deplete = 1,},
    {varItem=       14040003        ,probability=   500     , price=        1       ,varName="高级蓝玛瑙", deplete = 1,},
    {varItem=       14040004        ,probability=   500     , price=        1       ,varName="圣徒级蓝玛瑙", deplete = 1,},
    {varItem=       14040006        ,probability=   500     , price=        1       ,varName="中级蓝辉石", deplete = 1,},
    {varItem=       14040007        ,probability=   500     , price=        1       ,varName="圣徒级蓝辉石", deplete = 1,},
    {varItem=       14040011        ,probability=   500     , price=        1       ,varName="高级金光石", deplete = 1,},
    {varItem=       14040011        ,probability=   500     , price=        1       ,varName="圣徒级金光石", deplete = 1,},
    {varItem=       14040016        ,probability=   500     , price=        1       ,varName="高级蓝龙晶", deplete = 1,},
    {varItem=       14040021        ,probability=   500     , price=        1       ,varName="高级蓝玉髓", deplete = 1,},
    {varItem=       14040026        ,probability=   500     , price=        1       ,varName="高级蓝猫眼", deplete = 1,},
    {varItem=       19010001        ,probability=   500     , price=        1       ,varName="6格包", deplete = 1,},
    {varItem=       19010002        ,probability=   500     , price=        1       ,varName="12格包", deplete = 1,},

}

--80级以下的
x350007_var_DailyTable80            = {
    {varItem=       12400600        ,probability=   500     , price=        1       ,varName="鸣镝狼牙镞", deplete = 1,},
    {varItem=       12400601        ,probability=   500     , price=        1       ,varName="苏鲁锭护心镜", deplete = 1,},
    {varItem=       12400602        ,probability=   500     , price=        1       ,varName="黄金家族玺印", deplete = 1,},
    {varItem=       12400603        ,probability=   500     , price=        1       ,varName="长生天之眼", deplete = 1,},
    {varItem=       12400604        ,probability=   500     , price=        1       ,varName="腾格里神油", deplete = 1,},
    {varItem=       12400605        ,probability=   500     , price=        1       ,varName="汗血宝马蹬", deplete = 1,},
    {varItem=       10211104        ,probability=   500     , price=        1       ,varName="一级锻造徽章", deplete = 1,},
    {varItem=       10211105        ,probability=   500     , price=        1       ,varName="二级锻造徽章", deplete = 1,},
    {varItem=       10211106        ,probability=   500     , price=        1       ,varName="三级锻造徽章", deplete = 1,},
    {varItem=       10211107        ,probability=   500     , price=        1       ,varName="四级锻造徽章", deplete = 1,},
    {varItem=       10222203        ,probability=   500     , price=        1       ,varName="一级工艺披风", deplete = 1,},
    {varItem=       10222204        ,probability=   500     , price=        1       ,varName="二级工艺披风", deplete = 1,},
    {varItem=       10222205        ,probability=   500     , price=        1       ,varName="三级工艺披风", deplete = 1,},
    {varItem=       10222206        ,probability=   500     , price=        1       ,varName="四级工艺披风", deplete = 1,},

    {varItem=       11000100        ,probability=   500     , price=        1       ,varName="赤铜钻", deplete = 1,},
    {varItem=       11000101        ,probability=   500     , price=        1       ,varName="生铁钻", deplete = 1,},
    {varItem=       11000102        ,probability=   500     , price=        1       ,varName="白玉钻", deplete = 1,},
    {varItem=       11000103        ,probability=   500     , price=        1       ,varName="白玉", deplete = 1,},
    {varItem=       11000104        ,probability=   500     , price=        1       ,varName="血玉髓", deplete = 1,},
    {varItem=       11000110        ,probability=   500     , price=        1       ,varName="青铜钻", deplete = 1,},
    {varItem=       11000111        ,probability=   500     , price=        1       ,varName="铸铁钻", deplete = 1,},
    {varItem=       11000124        ,probability=   500     , price=        1       ,varName="血玉钻", deplete = 1,},

    {varItem=       11000811        ,probability=   500     , price=        1       ,varName="完整的粗布包图样", deplete = 1,},
    {varItem=       11000812        ,probability=   500     , price=        1       ,varName="完整的棉布包图样", deplete = 1,},
    {varItem=       11000813        ,probability=   500     , price=        1       ,varName="完整的硝制皮包图样", deplete = 1,},
    {varItem=       11000814        ,probability=   500     , price=        1       ,varName="完整的翻毛皮包图样", deplete = 1,},
    {varItem=       11000815        ,probability=   500     , price=        1       ,varName="完整的绒面皮包图样", deplete = 1,},
    {varItem=       11000816        ,probability=   500     , price=        1       ,varName="完整的素色绸包图样", deplete = 1,},

    {varItem=       11020030        ,probability=   500     , price=        1       ,varName="世传水晶精华", deplete = 1,},
    {varItem=       11020031        ,probability=   500     , price=        1       ,varName="国传水晶精华", deplete = 1,},
    {varItem=       11020032        ,probability=   500     , price=        1       ,varName="神传水晶精华", deplete = 1,},
    {varItem=       11020033        ,probability=   500     , price=        1       ,varName="天传水晶精华", deplete = 1,},
    {varItem=       11020040        ,probability=   500     , price=        1       ,varName="初级龙眼石精华", deplete = 1,},
    {varItem=       11020041        ,probability=   500     , price=        1       ,varName="中级龙眼石精华", deplete = 1,},
    {varItem=       11020042        ,probability=   500     , price=        1       ,varName="高级龙眼石精华", deplete = 1,},
    {varItem=       11020043        ,probability=   500     , price=        1       ,varName="天之龙眼石精华", deplete = 1,},
    {varItem=       11020050        ,probability=   500     , price=        1       ,varName="马蜂精华", deplete = 1,},
    {varItem=       11020051        ,probability=   500     , price=        1       ,varName="牛虻精华", deplete = 1,},
    {varItem=       11020052        ,probability=   500     , price=        1       ,varName="吸血蝙蝠精华", deplete = 1,},
    {varItem=       11020053        ,probability=   500     , price=        1       ,varName="碧血蟾蜍精华", deplete = 1,},
    {varItem=       11020060        ,probability=   500     , price=        1       ,varName="初级矿石精华", deplete = 1,},
    {varItem=       11020061        ,probability=   500     , price=        1       ,varName="中级矿石精华", deplete = 1,},
    {varItem=       11020062        ,probability=   500     , price=        1       ,varName="高级矿石精华", deplete = 1,},
    {varItem=       11020063        ,probability=   500     , price=        1       ,varName="圣徒级矿石精华", deplete = 1,},
    {varItem=       11020070        ,probability=   500     , price=        1       ,varName="甘草精华", deplete = 1,},
    {varItem=       11020071        ,probability=   500     , price=        1       ,varName="茯苓精华", deplete = 1,},
    {varItem=       11020072        ,probability=   500     , price=        1       ,varName="天麻精华", deplete = 1,},
    {varItem=       11020073        ,probability=   500     , price=        1       ,varName="防风精华", deplete = 1,},
    {varItem=       11020080        ,probability=   500     , price=        1       ,varName="红花精华", deplete = 1,},
    {varItem=       11020081        ,probability=   500     , price=        1       ,varName="伸筋藤精华", deplete = 1,},
    {varItem=       11020082        ,probability=   500     , price=        1       ,varName="朱砂精华", deplete = 1,},
    {varItem=       11020083        ,probability=   500     , price=        1       ,varName="桂枝精华", deplete = 1,},
    {varItem=       11020502        ,probability=   500     , price=        1       ,varName="水木精华", deplete = 1,},
    {varItem=       11030406        ,probability=   500     , price=        1       ,varName="七步封喉", deplete = 1,},
    {varItem=       11030502        ,probability=   500     , price=        1       ,varName="黑曜石", deplete = 1,},
    {varItem=       11041000        ,probability=   500     , price=        1       ,varName="一级装饰部件", deplete = 1,},
    {varItem=       11041001        ,probability=   500     , price=        1       ,varName="二级装饰部件", deplete = 1,},
    {varItem=       11041002        ,probability=   500     , price=        1       ,varName="三级装饰部件", deplete = 1,},
    {varItem=       11041003        ,probability=   500     , price=        1       ,varName="四级装饰部件", deplete = 1,},
    {varItem=       11041010        ,probability=   500     , price=        1       ,varName="一级藤甲部件", deplete = 1,},
    {varItem=       11041011        ,probability=   500     , price=        1       ,varName="二级藤甲部件", deplete = 1,},
    {varItem=       11041012        ,probability=   500     , price=        1       ,varName="三级藤甲部件", deplete = 1,},
    {varItem=       11041013        ,probability=   500     , price=        1       ,varName="四级藤甲部件", deplete = 1,},
    {varItem=       11041020        ,probability=   500     , price=        1       ,varName="一级皮革部件", deplete = 1,},
    {varItem=       11041021        ,probability=   500     , price=        1       ,varName="二级皮革部件", deplete = 1,},
    {varItem=       11041022        ,probability=   500     , price=        1       ,varName="三级皮革部件", deplete = 1,},
    {varItem=       11041023        ,probability=   500     , price=        1       ,varName="四级皮革部件", deplete = 1,},
    {varItem=       11041030        ,probability=   500     , price=        1       ,varName="一级锻金部件", deplete = 1,},
    {varItem=       11041031        ,probability=   500     , price=        1       ,varName="二级锻金部件", deplete = 1,},
    {varItem=       11041032        ,probability=   500     , price=        1       ,varName="三级锻金部件", deplete = 1,},
    {varItem=       11041033        ,probability=   500     , price=        1       ,varName="四级锻金部件", deplete = 1,},
    {varItem=       11041040        ,probability=   500     , price=        1       ,varName="一级铁甲部件", deplete = 1,},
    {varItem=       11041041        ,probability=   500     , price=        1       ,varName="二级铁甲部件", deplete = 1,},
    {varItem=       11041042        ,probability=   500     , price=        1       ,varName="三级铁甲部件", deplete = 1,},
    {varItem=       11041043        ,probability=   500     , price=        1       ,varName="四级铁甲部件", deplete = 1,},
    {varItem=       11041050        ,probability=   500     , price=        1       ,varName="一级工艺部件", deplete = 1,},
    {varItem=       11041051        ,probability=   500     , price=        1       ,varName="二级工艺部件", deplete = 1,},
    {varItem=       11041052        ,probability=   500     , price=        1       ,varName="三级工艺部件", deplete = 1,},
    {varItem=       11041053        ,probability=   500     , price=        1       ,varName="四级工艺部件", deplete = 1,},
    --{varItem=       11990120        ,probability=   500     , price=        1       ,varName="帮贡符", deplete = 1,},
    --{varItem=       11990121        ,probability=   500     , price=        1       ,varName="荣誉符", deplete = 1,},
    {varItem=       12010101        ,probability=   500     , price=        1       ,varName="甘醇马奶酒", deplete = 1,},
    {varItem=       12010200        ,probability=   500     , price=        1       ,varName="天罡止血散", deplete = 1,},
    {varItem=       12010201        ,probability=   500     , price=        1       ,varName="天王补心丹", deplete = 1,},
    {varItem=       12010202        ,probability=   500     , price=        1       ,varName="桂苓甘露散", deplete = 1,},
    {varItem=       12010203        ,probability=   500     , price=        1       ,varName="仙方活命饮", deplete = 1,},
    {varItem=       12010300        ,probability=   500     , price=        1       ,varName="伸筋活血酒", deplete = 1,},
    {varItem=       12010301        ,probability=   500     , price=        1       ,varName="龟鹿二仙胶", deplete = 1,},
    {varItem=       12010302        ,probability=   500     , price=        1       ,varName="云灵五菌汤", deplete = 1,},
    {varItem=       12010303        ,probability=   500     , price=        1       ,varName="参茸还魂膏", deplete = 1,},
    {varItem=       12020001        ,probability=   500     , price=        1       ,varName="小怒气丹", deplete = 1,},
    {varItem=       12020002        ,probability=   500     , price=        1       ,varName="小疾风丹", deplete = 1,},
    {varItem=       12020003        ,probability=   500     , price=        1       ,varName="小通络丹", deplete = 1,},
    {varItem=       12020004        ,probability=   500     , price=        1       ,varName="小威灵丹", deplete = 1,},
    {varItem=       12020005        ,probability=   500     , price=        1       ,varName="小玄冥丹", deplete = 1,},
    {varItem=       12020006        ,probability=   500     , price=        1       ,varName="小理气丹", deplete = 1,},
    {varItem=       12020011        ,probability=   500     , price=        1       ,varName="中怒气丹", deplete = 1,},
    {varItem=       12020012        ,probability=   500     , price=        1       ,varName="中疾风丹", deplete = 1,},
    {varItem=       12020013        ,probability=   500     , price=        1       ,varName="中通络丹", deplete = 1,},
    {varItem=       12020014        ,probability=   500     , price=        1       ,varName="中威灵丹", deplete = 1,},
    {varItem=       12020015        ,probability=   500     , price=        1       ,varName="中玄冥丹", deplete = 1,},
    {varItem=       12020016        ,probability=   500     , price=        1       ,varName="中理气丹", deplete = 1,},
    {varItem=       12020021        ,probability=   500     , price=        1       ,varName="大怒气丹", deplete = 1,},
    {varItem=       12020022        ,probability=   500     , price=        1       ,varName="大疾风丹", deplete = 1,},
    {varItem=       12020023        ,probability=   500     , price=        1       ,varName="大通络丹", deplete = 1,},
    {varItem=       12020024        ,probability=   500     , price=        1       ,varName="大威灵丹", deplete = 1,},
    {varItem=       12020025        ,probability=   500     , price=        1       ,varName="大玄冥丹", deplete = 1,},
    {varItem=       12020026        ,probability=   500     , price=        1       ,varName="大理气丹", deplete = 1,},
    {varItem=       12020031        ,probability=   500     , price=        1       ,varName="玄参怒气丹", deplete = 1,},
    {varItem=       12020032        ,probability=   500     , price=        1       ,varName="水玉疾风丹", deplete = 1,},
    {varItem=       12020033        ,probability=   500     , price=        1       ,varName="麝香通络丹", deplete = 1,},
    {varItem=       12020034        ,probability=   500     , price=        1       ,varName="遂火威灵丹", deplete = 1,},
    {varItem=       12020035        ,probability=   500     , price=        1       ,varName="昊天玄冥丹", deplete = 1,},
    {varItem=       12020036        ,probability=   500     , price=        1       ,varName="神农理气丹", deplete = 1,},
    {varItem=       12041011        ,probability=   500     , price=        1       ,varName="小神力丸", deplete = 1,},
    {varItem=       12041012        ,probability=   500     , price=        1       ,varName="中神力丸", deplete = 1,},
    {varItem=       12041013        ,probability=   500     , price=        1       ,varName="大神力丸", deplete = 1,},
    {varItem=       12041014        ,probability=   500     , price=        1       ,varName="四象神力丸", deplete = 1,},
    {varItem=       12041021        ,probability=   500     , price=        1       ,varName="小魔道丸", deplete = 1,},
    {varItem=       12041022        ,probability=   500     , price=        1       ,varName="中魔道丸", deplete = 1,},
    {varItem=       12041023        ,probability=   500     , price=        1       ,varName="大魔道丸", deplete = 1,},
    {varItem=       12041024        ,probability=   500     , price=        1       ,varName="四象魔道丸", deplete = 1,},
    {varItem=       12041031        ,probability=   500     , price=        1       ,varName="小仙火丸", deplete = 1,},
    {varItem=       12041032        ,probability=   500     , price=        1       ,varName="中仙火丸", deplete = 1,},
    {varItem=       12041033        ,probability=   500     , price=        1       ,varName="大仙火丸", deplete = 1,},
    {varItem=       12041034        ,probability=   500     , price=        1       ,varName="四象仙火丸", deplete = 1,},
    {varItem=       12041041        ,probability=   500     , price=        1       ,varName="回阳救逆丸", deplete = 1,},
    {varItem=       12041042        ,probability=   500     , price=        1       ,varName="参灵正气丸", deplete = 1,},
    {varItem=       12041043        ,probability=   500     , price=        1       ,varName="乾阳护甲丸", deplete = 1,},
    {varItem=       12041060        ,probability=   500     , price=        1       ,varName="小神甲丸", deplete = 1,},
    {varItem=       12041061        ,probability=   500     , price=        1       ,varName="中神甲丸", deplete = 1,},
    {varItem=       12041062        ,probability=   500     , price=        1       ,varName="大神甲丸", deplete = 1,},
    {varItem=       12041063        ,probability=   500     , price=        1       ,varName="四象器甲丸", deplete = 1,},
    {varItem=       12041070        ,probability=   500     , price=        1       ,varName="小神护丹", deplete = 1,},
    {varItem=       12041071        ,probability=   500     , price=        1       ,varName="中神护丸", deplete = 1,},
    {varItem=       12041072        ,probability=   500     , price=        1       ,varName="大神护丸", deplete = 1,},
    {varItem=       12041073        ,probability=   500     , price=        1       ,varName="四象神护丸", deplete = 1,},
    {varItem=       12041080        ,probability=   500     , price=        1       ,varName="小神运丸", deplete = 1,},
    {varItem=       12041081        ,probability=   500     , price=        1       ,varName="中神运丸", deplete = 1,},
    {varItem=       12041082        ,probability=   500     , price=        1       ,varName="大神运丸", deplete = 1,},
    {varItem=       12041083        ,probability=   500     , price=        1       ,varName="四象气运丸", deplete = 1,},
    {varItem=       12050000        ,probability=   500     , price=        1       ,varName="常乐草", deplete = 1,},
    {varItem=       12050009        ,probability=   500     , price=        1       ,varName="极乐草", deplete = 1,},
    {varItem=       12050009        ,probability=   500     , price=        1       ,varName="极乐草", deplete = 1,},
    {varItem=       12050090        ,probability=   500     , price=        1       ,varName="一级融雪丹", deplete = 1,},
    {varItem=       12050091        ,probability=   500     , price=        1       ,varName="二级融雪丹", deplete = 1,},
    {varItem=       12050092        ,probability=   500     , price=        1       ,varName="三级融雪丹", deplete = 1,},
    {varItem=       12050093        ,probability=   500     , price=        1       ,varName="四级融雪丹", deplete = 1,},
    {varItem=       12050201        ,probability=   500     , price=        1       ,varName="良品蒙古马降世符", deplete = 1,},
    {varItem=       12050202        ,probability=   500     , price=        1       ,varName="良品三河马降世符", deplete = 1,},
    {varItem=       12050203        ,probability=   500     , price=        1       ,varName="良品伊犁马降世符", deplete = 1,},
    {varItem=       12050204        ,probability=   500     , price=        1       ,varName="良品波斯马降世符", deplete = 1,},
    {varItem=       12050205        ,probability=   500     , price=        1       ,varName="良品天方马降世符", deplete = 1,},
    {varItem=       12050206        ,probability=   500     , price=        1       ,varName="良品大宛马降世符", deplete = 1,},
    {varItem=       12050207        ,probability=   500     , price=        1       ,varName="良品纯血马降世符", deplete = 1,},
    {varItem=       12050208        ,probability=   500     , price=        1       ,varName="良品汗血马降世符", deplete = 1,},
    {varItem=       12052091        ,probability=   500     , price=        1       ,varName="一级乱战", deplete = 1,},
    {varItem=       12052101        ,probability=   500     , price=        1       ,varName="一级破军", deplete = 1,},
    {varItem=       12052111        ,probability=   500     , price=        1       ,varName="一级魔灭", deplete = 1,},
    {varItem=       12052121        ,probability=   500     , price=        1       ,varName="一级猛击", deplete = 1,},
    {varItem=       12052131        ,probability=   500     , price=        1       ,varName="一级连环", deplete = 1,},
    {varItem=       12052141        ,probability=   500     , price=        1       ,varName="一级偷袭", deplete = 1,},
    {varItem=       12052161        ,probability=   500     , price=        1       ,varName="一级回复", deplete = 1,},
    {varItem=       12052471        ,probability=   500     , price=        1       ,varName="一级狂攻", deplete = 1,},
    --{varItem=       12052472        ,probability=   500     , price=        1       ,varName="二级狂攻", deplete = 1,},
    --{varItem=       12052473        ,probability=   500     , price=        1       ,varName="三级狂攻", deplete = 1,},
    --{varItem=       12052474        ,probability=   500     , price=        1       ,varName="四级狂攻", deplete = 1,},
    {varItem=       12052481        ,probability=   500     , price=        1       ,varName="一级精确", deplete = 1,},
    --{varItem=       12052482        ,probability=   500     , price=        1       ,varName="二级精确", deplete = 1,},
    --{varItem=       12052483        ,probability=   500     , price=        1       ,varName="三级精确", deplete = 1,},
    --{varItem=       12052484        ,probability=   500     , price=        1       ,varName="四级精确", deplete = 1,},
    {varItem=       12052491        ,probability=   500     , price=        1       ,varName="一级精研", deplete = 1,},
    --{varItem=       12052492        ,probability=   500     , price=        1       ,varName="二级精研", deplete = 1,},
    --{varItem=       12052493        ,probability=   500     , price=        1       ,varName="三级精研", deplete = 1,},
    --{varItem=       12052494        ,probability=   500     , price=        1       ,varName="四级精研", deplete = 1,},
    {varItem=       12052501        ,probability=   500     , price=        1       ,varName="一级狂暴", deplete = 1,},
    --{varItem=       12052502        ,probability=   500     , price=        1       ,varName="二级狂暴", deplete = 1,},
    --{varItem=       12052503        ,probability=   500     , price=        1       ,varName="三级狂暴", deplete = 1,},
    {varItem=       12052511        ,probability=   500     , price=        1       ,varName="一级免伤", deplete = 1,},
    --{varItem=       12052512        ,probability=   500     , price=        1       ,varName="二级免伤", deplete = 1,},
    {varItem=       12052521        ,probability=   500     , price=        1       ,varName="一级灵巧", deplete = 1,},
    --{varItem=       12052522        ,probability=   500     , price=        1       ,varName="二级灵巧", deplete = 1,},
    {varItem=       12052531        ,probability=   500     , price=        1       ,varName="一级热血", deplete = 1,},
    --{varItem=       12052532        ,probability=   500     , price=        1       ,varName="二级热血", deplete = 1,},
    --{varItem=       12052533        ,probability=   500     , price=        1       ,varName="三级热血", deplete = 1,},
    --{varItem=       12052534        ,probability=   500     , price=        1       ,varName="四级热血", deplete = 1,},
    {varItem=       12052541        ,probability=   500     , price=        1       ,varName="一级淬毒", deplete = 1,},
    --{varItem=       12052542        ,probability=   500     , price=        1       ,varName="二级淬毒", deplete = 1,},
    --{varItem=       12052543        ,probability=   500     , price=        1       ,varName="三级淬毒", deplete = 1,},
    {varItem=       12052551        ,probability=   500     , price=        1       ,varName="一级伤筋", deplete = 1,},
    {varItem=       12052561        ,probability=   500     , price=        1       ,varName="一级击晕", deplete = 1,},
    {varItem=       12052571        ,probability=   500     , price=        1       ,varName="一级狂吼", deplete = 1,},
    {varItem=       12052581        ,probability=   500     , price=        1       ,varName="一级沉寂", deplete = 1,},
    {varItem=       12052591        ,probability=   500     , price=        1       ,varName="一级定身", deplete = 1,},
    {varItem=       12052601        ,probability=   500     , price=        1       ,varName="一级裂甲", deplete = 1,},
    --{varItem=       12052602        ,probability=   500     , price=        1       ,varName="二级裂甲", deplete = 1,},
    --{varItem=       12052603        ,probability=   500     , price=        1       ,varName="三级裂甲", deplete = 1,},
    {varItem=       12052611        ,probability=   500     , price=        1       ,varName="一级盲目", deplete = 1,},
    {varItem=       12052621        ,probability=   500     , price=        1       ,varName="一级破兵", deplete = 1,},
    --{varItem=       12052622        ,probability=   500     , price=        1       ,varName="二级破兵", deplete = 1,},
    --{varItem=       12052623        ,probability=   500     , price=        1       ,varName="三级破兵", deplete = 1,},
    {varItem=       12052631        ,probability=   500     , price=        1       ,varName="一级集中", deplete = 1,},
    --{varItem=       12052632        ,probability=   500     , price=        1       ,varName="二级集中", deplete = 1,},
    --{varItem=       12052633        ,probability=   500     , price=        1       ,varName="三级集中", deplete = 1,},
    {varItem=       12052641        ,probability=   500     , price=        1       ,varName="一级无视", deplete = 1,},
    {varItem=       12052651        ,probability=   500     , price=        1       ,varName="一级冷静", deplete = 1,},
    --{varItem=       12052652        ,probability=   500     , price=        1       ,varName="二级冷静", deplete = 1,},
    {varItem=       12052661        ,probability=   500     , price=        1       ,varName="一级怒气", deplete = 1,},
    {varItem=       12052671        ,probability=   500     , price=        1       ,varName="一级精力", deplete = 1,},
    {varItem=       12052681        ,probability=   500     , price=        1       ,varName="一级箭囊", deplete = 1,},
    {varItem=       12052691        ,probability=   500     , price=        1       ,varName="一级弹药", deplete = 1,},
    {varItem=       12052701        ,probability=   500     , price=        1       ,varName="一级法力", deplete = 1,},
    {varItem=       12052711        ,probability=   500     , price=        1       ,varName="一级圣力", deplete = 1,},

    --{varItem=       12266796        ,probability=   500     , price=        1       ,varName="炮弹", deplete = 1,},
    --{varItem=       12266898        ,probability=   500     , price=        1       ,varName="龙击炮组件", deplete = 1,},
    --{varItem=       12266899        ,probability=   500     , price=        1       ,varName="御行甲组件", deplete = 1,},
    --{varItem=       12266900        ,probability=   500     , price=        1       ,varName="机枢组件", deplete = 1,},
    --{varItem=       12266901        ,probability=   500     , price=        1       ,varName="底座组件", deplete = 1,},
    --{varItem=       12266902        ,probability=   500     , price=        1       ,varName="疾风辕组件", deplete = 1,},
    --{varItem=       12266903        ,probability=   500     , price=        1       ,varName="重击器组件", deplete = 1,},
    --{varItem=       12266904        ,probability=   500     , price=        1       ,varName="精准仪组件", deplete = 1,},
    --{varItem=       12266905        ,probability=   500     , price=        1       ,varName="?望窗组件", deplete = 1,},
    --{varItem=       12267000        ,probability=   500     , price=        1       ,varName="赤铁铸件", deplete = 1,},
    --{varItem=       12267001        ,probability=   500     , price=        1       ,varName="青铜铸件", deplete = 1,},
    --{varItem=       12267002        ,probability=   500     , price=        1       ,varName="墨钢铸件", deplete = 1,},
    --{varItem=       12269000        ,probability=   500     , price=        1       ,varName="青铜扳手", deplete = 1,},
    --{varItem=       12269002        ,probability=   500     , price=        1       ,varName="精炼剂", deplete = 1,},
    --{varItem=       12269004        ,probability=   500     , price=        1       ,varName="维修包I型", deplete = 1,},
    --{varItem=       12269005        ,probability=   500     , price=        1       ,varName="冷却剂", deplete = 1,},
    --{varItem=       12269006        ,probability=   500     , price=        1       ,varName="黄火药", deplete = 1,},
    --{varItem=       12269008        ,probability=   500     , price=        1       ,varName="青铜护甲片", deplete = 1,},
    --{varItem=       12269010        ,probability=   500     , price=        1       ,varName="青铜挡板", deplete = 1,},
    --{varItem=       12269013        ,probability=   500     , price=        1       ,varName="普通爆破火药", deplete = 1,},
    --{varItem=       12269015        ,probability=   500     , price=        1       ,varName="青铜支架", deplete = 1,},
    --{varItem=       12269017        ,probability=   500     , price=        1       ,varName="普通爆伤火药", deplete = 1,},
    --{varItem=       12269019        ,probability=   500     , price=        1       ,varName="青铜弧形板", deplete = 1,},
    --{varItem=       12269021        ,probability=   500     , price=        1       ,varName="青铜瞄准器", deplete = 1,},
    --{varItem=       12269023        ,probability=   500     , price=        1       ,varName="单色涂料", deplete = 1,},
    --{varItem=       12270000        ,probability=   500     , price=        1       ,varName="赤铜锤 龙击炮Ⅰ", deplete = 1,},
    --{varItem=       12270001        ,probability=   500     , price=        1       ,varName="赤铁锤 重击器Ⅰ", deplete = 1,},
    --{varItem=       12270002        ,probability=   500     , price=        1       ,varName="精钢锤 嘹望窗Ⅰ", deplete = 1,},
    --{varItem=       12270003        ,probability=   500     , price=        1       ,varName="血银锤 精准仪Ⅰ", deplete = 1,},
    --{varItem=       12270004        ,probability=   500     , price=        1       ,varName="炼银锤 御行甲Ⅰ", deplete = 1,},
    --{varItem=       12270005        ,probability=   500     , price=        1       ,varName="蓝玉锤 底盘Ⅰ", deplete = 1,},
    --{varItem=       12270006        ,probability=   500     , price=        1       ,varName="黄玉锤 机枢Ⅰ", deplete = 1,},
    --{varItem=       12270007        ,probability=   500     , price=        1       ,varName="红玉锤?疾风辕Ⅰ", deplete = 1,},
    --{varItem=       12270008        ,probability=   500     , price=        1       ,varName="青铜锤?龙击炮Ⅱ", deplete = 1,},
    --{varItem=       12270009        ,probability=   500     , price=        1       ,varName="生铁锤?重击器Ⅱ", deplete = 1,},
    --{varItem=       12270010        ,probability=   500     , price=        1       ,varName="墨钢锤?嘹望窗Ⅱ", deplete = 1,},
    --{varItem=       12270011        ,probability=   500     , price=        1       ,varName="淬银锤?精准仪Ⅱ", deplete = 1,},
    --{varItem=       12270012        ,probability=   500     , price=        1       ,varName="秘银锤?御行甲Ⅱ", deplete = 1,},
    --{varItem=       12270013        ,probability=   500     , price=        1       ,varName="刚玉锤?底盘Ⅱ", deplete = 1,},
    --{varItem=       12270014        ,probability=   500     , price=        1       ,varName="珀玉锤?机枢Ⅱ", deplete = 1,},
    --{varItem=       12270015        ,probability=   500     , price=        1       ,varName="血玉锤?疾风辕Ⅱ", deplete = 1,},
    {varItem=       14010001        ,probability=   500     , price=        1       ,varName="初级红变石", deplete = 1,},
    {varItem=       14010002        ,probability=   500     , price=        1       ,varName="中级红变石", deplete = 1,},
    {varItem=       14010003        ,probability=   500     , price=        1       ,varName="高级红变石", deplete = 1,},
    {varItem=       14010004        ,probability=   500     , price=        1       ,varName="圣徒级红变石", deplete = 1,},
    {varItem=       14010006        ,probability=   500     , price=        1       ,varName="初级红琥珀", deplete = 1,},
    {varItem=       14010007        ,probability=   500     , price=        1       ,varName="中级红琥珀", deplete = 1,},
    {varItem=       14010008        ,probability=   500     , price=        1       ,varName="高级红琥珀", deplete = 1,},
    {varItem=       14010009        ,probability=   500     , price=        1       ,varName="圣徒级红琥珀", deplete = 1,},
    {varItem=       14010011        ,probability=   500     , price=        1       ,varName="初级红锆石", deplete = 1,},
    {varItem=       14010012        ,probability=   500     , price=        1       ,varName="中级红锆石", deplete = 1,},
    {varItem=       14010013        ,probability=   500     , price=        1       ,varName="高级红锆石", deplete = 1,},
    {varItem=       14010014        ,probability=   500     , price=        1       ,varName="圣徒级红锆石", deplete = 1,},
    {varItem=       14010016        ,probability=   500     , price=        1       ,varName="高级红龙晶", deplete = 1,},
    {varItem=       14010017        ,probability=   500     , price=        1       ,varName="圣徒级红龙晶", deplete = 1,},
    {varItem=       14010021        ,probability=   500     , price=        1       ,varName="高级红玉髓", deplete = 1,},
    {varItem=       14010022        ,probability=   500     , price=        1       ,varName="圣徒级红玉髓", deplete = 1,},
    {varItem=       14010026        ,probability=   500     , price=        1       ,varName="高级红猫眼", deplete = 1,},
    {varItem=       14020001        ,probability=   500     , price=        1       ,varName="初级绿柱石", deplete = 1,},
    {varItem=       14020002        ,probability=   500     , price=        1       ,varName="中级绿柱石", deplete = 1,},
    {varItem=       14020003        ,probability=   500     , price=        1       ,varName="高级绿柱石", deplete = 1,},
    {varItem=       14020004        ,probability=   500     , price=        1       ,varName="圣徒级绿柱石", deplete = 1,},
    {varItem=       14020006        ,probability=   500     , price=        1       ,varName="初级绿晶石", deplete = 1,},
    {varItem=       14020007        ,probability=   500     , price=        1       ,varName="中级绿晶石", deplete = 1,},
    {varItem=       14020008        ,probability=   500     , price=        1       ,varName="高级绿晶石", deplete = 1,},
    {varItem=       14020009        ,probability=   500     , price=        1       ,varName="圣徒级绿晶石", deplete = 1,},
    {varItem=       14020011        ,probability=   500     , price=        1       ,varName="初级绿碧玺", deplete = 1,},
    {varItem=       14020012        ,probability=   500     , price=        1       ,varName="中级绿碧玺", deplete = 1,},
    {varItem=       14020013        ,probability=   500     , price=        1       ,varName="高级绿碧玺", deplete = 1,},
    {varItem=       14020014        ,probability=   500     , price=        1       ,varName="圣徒级绿碧玺", deplete = 1,},
    {varItem=       14020016        ,probability=   500     , price=        1       ,varName="高级绿龙晶", deplete = 1,},
    {varItem=       14020017        ,probability=   500     , price=        1       ,varName="圣徒级绿龙晶", deplete = 1,},
    {varItem=       14020021        ,probability=   500     , price=        1       ,varName="高级绿玉髓", deplete = 1,},
    {varItem=       14020022        ,probability=   500     , price=        1       ,varName="圣徒级绿玉髓", deplete = 1,},
    {varItem=       14020026        ,probability=   500     , price=        1       ,varName="高级绿猫眼", deplete = 1,},
    {varItem=       14030001        ,probability=   500     , price=        1       ,varName="初级黄刚玉", deplete = 1,},
    {varItem=       14030002        ,probability=   500     , price=        1       ,varName="中级黄刚玉", deplete = 1,},
    {varItem=       14030003        ,probability=   500     , price=        1       ,varName="高级黄刚玉", deplete = 1,},
    {varItem=       14030004        ,probability=   500     , price=        1       ,varName="圣徒级黄刚玉", deplete = 1,},
    {varItem=       14030006        ,probability=   500     , price=        1       ,varName="初级黄锆石", deplete = 1,},
    {varItem=       14030007        ,probability=   500     , price=        1       ,varName="中级黄锆石", deplete = 1,},
    {varItem=       14030008        ,probability=   500     , price=        1       ,varName="高级黄锆石", deplete = 1,},
    {varItem=       14030009        ,probability=   500     , price=        1       ,varName="圣徒级黄锆石", deplete = 1,},
    {varItem=       14030011        ,probability=   500     , price=        1       ,varName="初级黄琉璃", deplete = 1,},
    {varItem=       14030012        ,probability=   500     , price=        1       ,varName="中级黄琉璃", deplete = 1,},
    {varItem=       14030013        ,probability=   500     , price=        1       ,varName="高级黄琉璃", deplete = 1,},
    {varItem=       14030014        ,probability=   500     , price=        1       ,varName="圣徒级黄琉璃", deplete = 1,},
    {varItem=       14030016        ,probability=   500     , price=        1       ,varName="高级黄龙晶", deplete = 1,},
    {varItem=       14030017        ,probability=   500     , price=        1       ,varName="圣徒级黄龙晶", deplete = 1,},
    {varItem=       14030021        ,probability=   500     , price=        1       ,varName="高级黄玉髓", deplete = 1,},
    {varItem=       14030022        ,probability=   500     , price=        1       ,varName="圣徒级黄玉髓", deplete = 1,},
    {varItem=       14030026        ,probability=   500     , price=        1       ,varName="高级黄猫眼", deplete = 1,},
    {varItem=       14040001        ,probability=   500     , price=        1       ,varName="初级蓝玛瑙", deplete = 1,},
    {varItem=       14040002        ,probability=   500     , price=        1       ,varName="中级蓝玛瑙", deplete = 1,},
    {varItem=       14040003        ,probability=   500     , price=        1       ,varName="高级蓝玛瑙", deplete = 1,},
    {varItem=       14040004        ,probability=   500     , price=        1       ,varName="圣徒级蓝玛瑙", deplete = 1,},
    {varItem=       14040006        ,probability=   500     , price=        1       ,varName="中级蓝辉石", deplete = 1,},
    {varItem=       14040007        ,probability=   500     , price=        1       ,varName="圣徒级蓝辉石", deplete = 1,},
    {varItem=       14040011        ,probability=   500     , price=        1       ,varName="高级金光石", deplete = 1,},
    {varItem=       14040011        ,probability=   500     , price=        1       ,varName="圣徒级金光石", deplete = 1,},
    {varItem=       14040016        ,probability=   500     , price=        1       ,varName="高级蓝龙晶", deplete = 1,},
    {varItem=       14040017        ,probability=   500     , price=        1       ,varName="圣徒级蓝龙晶", deplete = 1,},
    {varItem=       14040021        ,probability=   500     , price=        1       ,varName="高级蓝玉髓", deplete = 1,},
    {varItem=       14040022        ,probability=   500     , price=        1       ,varName="圣徒级蓝玉髓", deplete = 1,},
    {varItem=       14040026        ,probability=   500     , price=        1       ,varName="高级蓝猫眼", deplete = 1,},
    {varItem=       19010001        ,probability=   500     , price=        1       ,varName="6格包", deplete = 1,},
    {varItem=       19010002        ,probability=   500     , price=        1       ,varName="12格包", deplete = 1,},


}

--100级以下的
x350007_var_DailyTable100            = {
    {varItem=       12400600        ,probability=   500     , price=        1       ,varName="鸣镝狼牙镞", deplete = 1,},
    {varItem=       12400601        ,probability=   500     , price=        1       ,varName="苏鲁锭护心镜", deplete = 1,},
    {varItem=       12400602        ,probability=   500     , price=        1       ,varName="黄金家族玺印", deplete = 1,},
    {varItem=       12400603        ,probability=   500     , price=        1       ,varName="长生天之眼", deplete = 1,},
    {varItem=       12400604        ,probability=   500     , price=        1       ,varName="腾格里神油", deplete = 1,},
    {varItem=       12400605        ,probability=   500     , price=        1       ,varName="汗血宝马蹬", deplete = 1,},
    {varItem=       10211104        ,probability=   500     , price=        1       ,varName="一级锻造徽章", deplete = 1,},
    {varItem=       10211105        ,probability=   500     , price=        1       ,varName="二级锻造徽章", deplete = 1,},
    {varItem=       10211106        ,probability=   500     , price=        1       ,varName="三级锻造徽章", deplete = 1,},
    {varItem=       10211107        ,probability=   500     , price=        1       ,varName="四级锻造徽章", deplete = 1,},
    {varItem=       10211108        ,probability=   500     , price=        1       ,varName="五级锻造徽章", deplete = 1,},
    {varItem=       10222203        ,probability=   500     , price=        1       ,varName="一级工艺披风", deplete = 1,},
    {varItem=       10222204        ,probability=   500     , price=        1       ,varName="二级工艺披风", deplete = 1,},
    {varItem=       10222205        ,probability=   500     , price=        1       ,varName="三级工艺披风", deplete = 1,},
    {varItem=       10222206        ,probability=   500     , price=        1       ,varName="四级工艺披风", deplete = 1,},
    {varItem=       10222207        ,probability=   500     , price=        1       ,varName="五级工艺披风", deplete = 1,},

    {varItem=       11000100        ,probability=   500     , price=        1       ,varName="赤铜钻", deplete = 1,},
    {varItem=       11000101        ,probability=   500     , price=        1       ,varName="生铁钻", deplete = 1,},
    {varItem=       11000102        ,probability=   500     , price=        1       ,varName="白玉钻", deplete = 1,},
    {varItem=       11000103        ,probability=   500     , price=        1       ,varName="白玉", deplete = 1,},
    {varItem=       11000103        ,probability=   500     , price=        1       ,varName="炼银钻", deplete = 1,},
    {varItem=       11000104        ,probability=   500     , price=        1       ,varName="血玉髓", deplete = 1,},
    {varItem=       11000110        ,probability=   500     , price=        1       ,varName="青铜钻", deplete = 1,},
    {varItem=       11000111        ,probability=   500     , price=        1       ,varName="铸铁钻", deplete = 1,},
    {varItem=       11000124        ,probability=   500     , price=        1       ,varName="血玉钻", deplete = 1,},
    {varItem=       11000130        ,probability=   500     , price=        1       ,varName="淬银钻", deplete = 1,},
    {varItem=       11000131        ,probability=   500     , price=        1       ,varName="血银钻", deplete = 1,},
    {varItem=       11000132        ,probability=   500     , price=        1       ,varName="玄银钻", deplete = 1,},
    {varItem=       11000300        ,probability=   500     , price=        1       ,varName="灵魂印", deplete = 1,},
    {varItem=       11000500        ,probability=   500     , price=        1       ,varName="黄紫海蓝水银", deplete = 1,},
    {varItem=       11000502        ,probability=   500     , price=        1       ,varName="黄紫水火水银", deplete = 1,},
    {varItem=       11000503        ,probability=   500     , price=        1       ,varName="黄紫晕光水银", deplete = 1,},
    {varItem=       11000504        ,probability=   500     , price=        1       ,varName="黄紫炫彩水银", deplete = 1,},

    {varItem=       11000551        ,probability=   500     , price=        1       ,varName="无暇星辰", deplete = 1,},
    {varItem=       11000603        ,probability=   500     , price=        1       ,varName="一级冥铁", deplete = 1,},
    --{varItem=       11000603        ,probability=   500     , price=        1       ,varName="一级冥铁x4", deplete = 1,},
    --{varItem=       11000604        ,probability=   500     , price=        1       ,varName="二级冥铁", deplete = 1,},
    --{varItem=       11000604        ,probability=   500     , price=        1       ,varName="二级冥铁x4", deplete = 1,},
    --{varItem=       11000605        ,probability=   500     , price=        1       ,varName="三级冥铁", deplete = 1,},
    --{varItem=       11000605        ,probability=   500     , price=        1       ,varName="三级冥铁x4", deplete = 1,},
    --{varItem=       11000612        ,probability=   500     , price=        1       ,varName="一级冥银", deplete = 1,},
    --{varItem=       11000613        ,probability=   500     , price=        1       ,varName="二级冥银", deplete = 1,},
    --{varItem=       11000614        ,probability=   500     , price=        1       ,varName="三级冥银", deplete = 1,},
    --{varItem=       11000621        ,probability=   500     , price=        1       ,varName="一级冥金", deplete = 1,},
    --{varItem=       11000622        ,probability=   500     , price=        1       ,varName="二级冥金", deplete = 1,},
    --{varItem=       11000623        ,probability=   500     , price=        1       ,varName="三级冥金", deplete = 1,},
    {varItem=       11000811        ,probability=   500     , price=        1       ,varName="完整的粗布包图样", deplete = 1,},
    {varItem=       11000812        ,probability=   500     , price=        1       ,varName="完整的棉布包图样", deplete = 1,},
    {varItem=       11000813        ,probability=   500     , price=        1       ,varName="完整的硝制皮包图样", deplete = 1,},
    {varItem=       11000814        ,probability=   500     , price=        1       ,varName="完整的翻毛皮包图样", deplete = 1,},
    {varItem=       11000815        ,probability=   500     , price=        1       ,varName="完整的绒面皮包图样", deplete = 1,},
    {varItem=       11000816        ,probability=   500     , price=        1       ,varName="完整的素色绸包图样", deplete = 1,},
    {varItem=       11000905        ,probability=   500     , price=        1       ,varName="宗师级洗石剂", deplete = 1,},
    --{varItem=       11000908        ,probability=   500     , price=        1       ,varName="蓝光珐琅", deplete = 1,},
    --{varItem=       11000908        ,probability=   500     , price=        1       ,varName="蓝光珐琅x4", deplete = 1,},
    --{varItem=       11000932        ,probability=   500     , price=        1       ,varName="二级蓝光珐琅", deplete = 1,},
    --{varItem=       11000933        ,probability=   500     , price=        1       ,varName="三级蓝光珐琅", deplete = 1,},
    {varItem=       11000948        ,probability=   500     , price=        1       ,varName="普通地中海尖凿", deplete = 1,},
    --{varItem=       11010001        ,probability=   500     , price=        1       ,varName="铜矿石", deplete = 1,},
    --{varItem=       11010002        ,probability=   500     , price=        1       ,varName="莹石矿石", deplete = 1,},
    --{varItem=       11010003        ,probability=   500     , price=        1       ,varName="锡矿石", deplete = 1,},
    {varItem=       11010120        ,probability=   500     , price=        1       ,varName="金丝线（3个）", deplete = 1,},
    {varItem=       11020030        ,probability=   500     , price=        1       ,varName="世传水晶精华", deplete = 1,},
    {varItem=       11020031        ,probability=   500     , price=        1       ,varName="国传水晶精华", deplete = 1,},
    {varItem=       11020032        ,probability=   500     , price=        1       ,varName="神传水晶精华", deplete = 1,},
    {varItem=       11020033        ,probability=   500     , price=        1       ,varName="天传水晶精华", deplete = 1,},
    {varItem=       11020040        ,probability=   500     , price=        1       ,varName="初级龙眼石精华", deplete = 1,},
    {varItem=       11020041        ,probability=   500     , price=        1       ,varName="中级龙眼石精华", deplete = 1,},
    {varItem=       11020042        ,probability=   500     , price=        1       ,varName="高级龙眼石精华", deplete = 1,},
    {varItem=       11020043        ,probability=   500     , price=        1       ,varName="天之龙眼石精华", deplete = 1,},
    {varItem=       11020050        ,probability=   500     , price=        1       ,varName="马蜂精华", deplete = 1,},
    {varItem=       11020051        ,probability=   500     , price=        1       ,varName="牛虻精华", deplete = 1,},
    {varItem=       11020052        ,probability=   500     , price=        1       ,varName="吸血蝙蝠精华", deplete = 1,},
    {varItem=       11020053        ,probability=   500     , price=        1       ,varName="碧血蟾蜍精华", deplete = 1,},
    {varItem=       11020060        ,probability=   500     , price=        1       ,varName="初级矿石精华", deplete = 1,},
    {varItem=       11020061        ,probability=   500     , price=        1       ,varName="中级矿石精华", deplete = 1,},
    {varItem=       11020062        ,probability=   500     , price=        1       ,varName="高级矿石精华", deplete = 1,},
    {varItem=       11020063        ,probability=   500     , price=        1       ,varName="圣徒级矿石精华", deplete = 1,},
    {varItem=       11020070        ,probability=   500     , price=        1       ,varName="甘草精华", deplete = 1,},
    {varItem=       11020071        ,probability=   500     , price=        1       ,varName="茯苓精华", deplete = 1,},
    {varItem=       11020072        ,probability=   500     , price=        1       ,varName="天麻精华", deplete = 1,},
    {varItem=       11020073        ,probability=   500     , price=        1       ,varName="防风精华", deplete = 1,},
    {varItem=       11020080        ,probability=   500     , price=        1       ,varName="红花精华", deplete = 1,},
    {varItem=       11020081        ,probability=   500     , price=        1       ,varName="伸筋藤精华", deplete = 1,},
    {varItem=       11020082        ,probability=   500     , price=        1       ,varName="朱砂精华", deplete = 1,},
    {varItem=       11020083        ,probability=   500     , price=        1       ,varName="桂枝精华", deplete = 1,},
    {varItem=       11020502        ,probability=   500     , price=        1       ,varName="水木精华", deplete = 1,},
    {varItem=       11030406        ,probability=   500     , price=        1       ,varName="七步封喉", deplete = 1,},
    {varItem=       11030502        ,probability=   500     , price=        1       ,varName="黑曜石", deplete = 1,},
    {varItem=       11041000        ,probability=   500     , price=        1       ,varName="一级装饰部件", deplete = 1,},
    {varItem=       11041001        ,probability=   500     , price=        1       ,varName="二级装饰部件", deplete = 1,},
    {varItem=       11041002        ,probability=   500     , price=        1       ,varName="三级装饰部件", deplete = 1,},
    {varItem=       11041003        ,probability=   500     , price=        1       ,varName="四级装饰部件", deplete = 1,},
    {varItem=       11041010        ,probability=   500     , price=        1       ,varName="一级藤甲部件", deplete = 1,},
    {varItem=       11041011        ,probability=   500     , price=        1       ,varName="二级藤甲部件", deplete = 1,},
    {varItem=       11041012        ,probability=   500     , price=        1       ,varName="三级藤甲部件", deplete = 1,},
    {varItem=       11041013        ,probability=   500     , price=        1       ,varName="四级藤甲部件", deplete = 1,},
    {varItem=       11041020        ,probability=   500     , price=        1       ,varName="一级皮革部件", deplete = 1,},
    {varItem=       11041021        ,probability=   500     , price=        1       ,varName="二级皮革部件", deplete = 1,},
    {varItem=       11041022        ,probability=   500     , price=        1       ,varName="三级皮革部件", deplete = 1,},
    {varItem=       11041023        ,probability=   500     , price=        1       ,varName="四级皮革部件", deplete = 1,},
    {varItem=       11041030        ,probability=   500     , price=        1       ,varName="一级锻金部件", deplete = 1,},
    {varItem=       11041031        ,probability=   500     , price=        1       ,varName="二级锻金部件", deplete = 1,},
    {varItem=       11041032        ,probability=   500     , price=        1       ,varName="三级锻金部件", deplete = 1,},
    {varItem=       11041033        ,probability=   500     , price=        1       ,varName="四级锻金部件", deplete = 1,},
    {varItem=       11041040        ,probability=   500     , price=        1       ,varName="一级铁甲部件", deplete = 1,},
    {varItem=       11041041        ,probability=   500     , price=        1       ,varName="二级铁甲部件", deplete = 1,},
    {varItem=       11041042        ,probability=   500     , price=        1       ,varName="三级铁甲部件", deplete = 1,},
    {varItem=       11041043        ,probability=   500     , price=        1       ,varName="四级铁甲部件", deplete = 1,},
    {varItem=       11041050        ,probability=   500     , price=        1       ,varName="一级工艺部件", deplete = 1,},
    {varItem=       11041051        ,probability=   500     , price=        1       ,varName="二级工艺部件", deplete = 1,},
    {varItem=       11041052        ,probability=   500     , price=        1       ,varName="三级工艺部件", deplete = 1,},
    {varItem=       11041053        ,probability=   500     , price=        1       ,varName="四级工艺部件", deplete = 1,},
    {varItem=       11970021        ,probability=   500     , price=        1       ,varName="乱士符（5个）", deplete = 1,},
    {varItem=       11970022        ,probability=   500     , price=        1       ,varName="强效乱士符", deplete = 1,},
    {varItem=       11970023        ,probability=   500     , price=        1       ,varName="黄金乱世符", deplete = 1,},
    --{varItem=       11990120        ,probability=   500     , price=        1       ,varName="帮贡符", deplete = 1,},
    --{varItem=       11990121        ,probability=   500     , price=        1       ,varName="荣誉符", deplete = 1,},
    {varItem=       12010101        ,probability=   500     , price=        1       ,varName="甘醇马奶酒", deplete = 1,},
    {varItem=       12010200        ,probability=   500     , price=        1       ,varName="天罡止血散", deplete = 1,},
    {varItem=       12010201        ,probability=   500     , price=        1       ,varName="天王补心丹", deplete = 1,},
    {varItem=       12010202        ,probability=   500     , price=        1       ,varName="桂苓甘露散", deplete = 1,},
    {varItem=       12010203        ,probability=   500     , price=        1       ,varName="仙方活命饮", deplete = 1,},
    {varItem=       12010204        ,probability=   500     , price=        1       ,varName="百花玉露丹（5个）", deplete = 1,},
    {varItem=       12010300        ,probability=   500     , price=        1       ,varName="伸筋活血酒", deplete = 1,},
    {varItem=       12010301        ,probability=   500     , price=        1       ,varName="龟鹿二仙胶", deplete = 1,},
    {varItem=       12010302        ,probability=   500     , price=        1       ,varName="云灵五菌汤", deplete = 1,},
    {varItem=       12010303        ,probability=   500     , price=        1       ,varName="参茸还魂膏", deplete = 1,},
    {varItem=       12010304        ,probability=   500     , price=        1       ,varName="芝草断续丹", deplete = 1,},
    {varItem=       12020001        ,probability=   500     , price=        1       ,varName="小怒气丹", deplete = 1,},
    {varItem=       12020002        ,probability=   500     , price=        1       ,varName="小疾风丹", deplete = 1,},
    {varItem=       12020003        ,probability=   500     , price=        1       ,varName="小通络丹", deplete = 1,},
    {varItem=       12020004        ,probability=   500     , price=        1       ,varName="小威灵丹", deplete = 1,},
    {varItem=       12020005        ,probability=   500     , price=        1       ,varName="小玄冥丹", deplete = 1,},
    {varItem=       12020006        ,probability=   500     , price=        1       ,varName="小理气丹", deplete = 1,},
    {varItem=       12020011        ,probability=   500     , price=        1       ,varName="中怒气丹", deplete = 1,},
    {varItem=       12020012        ,probability=   500     , price=        1       ,varName="中疾风丹", deplete = 1,},
    {varItem=       12020013        ,probability=   500     , price=        1       ,varName="中通络丹", deplete = 1,},
    {varItem=       12020014        ,probability=   500     , price=        1       ,varName="中威灵丹", deplete = 1,},
    {varItem=       12020015        ,probability=   500     , price=        1       ,varName="中玄冥丹", deplete = 1,},
    {varItem=       12020016        ,probability=   500     , price=        1       ,varName="中理气丹", deplete = 1,},
    {varItem=       12020021        ,probability=   500     , price=        1       ,varName="大怒气丹", deplete = 1,},
    {varItem=       12020022        ,probability=   500     , price=        1       ,varName="大疾风丹", deplete = 1,},
    {varItem=       12020023        ,probability=   500     , price=        1       ,varName="大通络丹", deplete = 1,},
    {varItem=       12020024        ,probability=   500     , price=        1       ,varName="大威灵丹", deplete = 1,},
    {varItem=       12020025        ,probability=   500     , price=        1       ,varName="大玄冥丹", deplete = 1,},
    {varItem=       12020026        ,probability=   500     , price=        1       ,varName="大理气丹", deplete = 1,},
    {varItem=       12020031        ,probability=   500     , price=        1       ,varName="玄参怒气丹", deplete = 1,},
    {varItem=       12020032        ,probability=   500     , price=        1       ,varName="水玉疾风丹", deplete = 1,},
    {varItem=       12020033        ,probability=   500     , price=        1       ,varName="麝香通络丹", deplete = 1,},
    {varItem=       12020034        ,probability=   500     , price=        1       ,varName="遂火威灵丹", deplete = 1,},
    {varItem=       12020035        ,probability=   500     , price=        1       ,varName="昊天玄冥丹", deplete = 1,},
    {varItem=       12020036        ,probability=   500     , price=        1       ,varName="神农理气丹", deplete = 1,},
    {varItem=       12020041        ,probability=   500     , price=        1       ,varName="神芝怒气丹", deplete = 1,},
    {varItem=       12020042        ,probability=   500     , price=        1       ,varName="琥珀疾风丹", deplete = 1,},
    {varItem=       12020043        ,probability=   500     , price=        1       ,varName="鲛珠通络丹", deplete = 1,},
    {varItem=       12020044        ,probability=   500     , price=        1       ,varName="烈焰威灵丹", deplete = 1,},
    {varItem=       12020045        ,probability=   500     , price=        1       ,varName="万灵玄冥丹", deplete = 1,},
    {varItem=       12020046        ,probability=   500     , price=        1       ,varName="龙涎理气丹", deplete = 1,},
    {varItem=       12041011        ,probability=   500     , price=        1       ,varName="小神力丸", deplete = 1,},
    {varItem=       12041012        ,probability=   500     , price=        1       ,varName="中神力丸", deplete = 1,},
    {varItem=       12041013        ,probability=   500     , price=        1       ,varName="大神力丸", deplete = 1,},
    {varItem=       12041014        ,probability=   500     , price=        1       ,varName="四象神力丸", deplete = 1,},
    {varItem=       12041015        ,probability=   500     , price=        1       ,varName="五行神力丸（3个）", deplete = 1,},
    {varItem=       12041021        ,probability=   500     , price=        1       ,varName="小魔道丸", deplete = 1,},
    {varItem=       12041022        ,probability=   500     , price=        1       ,varName="中魔道丸", deplete = 1,},
    {varItem=       12041023        ,probability=   500     , price=        1       ,varName="大魔道丸", deplete = 1,},
    {varItem=       12041024        ,probability=   500     , price=        1       ,varName="四象魔道丸", deplete = 1,},
    {varItem=       12041025        ,probability=   500     , price=        1       ,varName="五行魔道丸（3个）", deplete = 1,},
    {varItem=       12041031        ,probability=   500     , price=        1       ,varName="小仙火丸", deplete = 1,},
    {varItem=       12041032        ,probability=   500     , price=        1       ,varName="中仙火丸", deplete = 1,},
    {varItem=       12041033        ,probability=   500     , price=        1       ,varName="大仙火丸", deplete = 1,},
    {varItem=       12041034        ,probability=   500     , price=        1       ,varName="四象仙火丸", deplete = 1,},
    {varItem=       12041035        ,probability=   500     , price=        1       ,varName="五行仙火丸（3个）", deplete = 1,},
    {varItem=       12041041        ,probability=   500     , price=        1       ,varName="回阳救逆丸", deplete = 1,},
    {varItem=       12041042        ,probability=   500     , price=        1       ,varName="参灵正气丸", deplete = 1,},
    {varItem=       12041043        ,probability=   500     , price=        1       ,varName="乾阳护甲丸", deplete = 1,},
    {varItem=       12041044        ,probability=   500     , price=        1       ,varName="混沌不灭丸（5个）", deplete = 1,},
    {varItem=       12041060        ,probability=   500     , price=        1       ,varName="小神甲丸", deplete = 1,},
    {varItem=       12041061        ,probability=   500     , price=        1       ,varName="中神甲丸", deplete = 1,},
    {varItem=       12041062        ,probability=   500     , price=        1       ,varName="大神甲丸", deplete = 1,},
    {varItem=       12041063        ,probability=   500     , price=        1       ,varName="四象器甲丸", deplete = 1,},
    {varItem=       12041070        ,probability=   500     , price=        1       ,varName="小神护丹", deplete = 1,},
    {varItem=       12041071        ,probability=   500     , price=        1       ,varName="中神护丸", deplete = 1,},
    {varItem=       12041072        ,probability=   500     , price=        1       ,varName="大神护丸", deplete = 1,},
    {varItem=       12041073        ,probability=   500     , price=        1       ,varName="四象神护丸", deplete = 1,},
    {varItem=       12041080        ,probability=   500     , price=        1       ,varName="小神运丸", deplete = 1,},
    {varItem=       12041081        ,probability=   500     , price=        1       ,varName="中神运丸", deplete = 1,},
    {varItem=       12041082        ,probability=   500     , price=        1       ,varName="大神运丸", deplete = 1,},
    {varItem=       12041083        ,probability=   500     , price=        1       ,varName="四象气运丸", deplete = 1,},
    {varItem=       12041085        ,probability=   500     , price=        1       ,varName="命中平衡神水", deplete = 1,},
    {varItem=       12041086        ,probability=   500     , price=        1       ,varName="闪避平衡神水", deplete = 1,},
    {varItem=       12041087        ,probability=   500     , price=        1       ,varName="暴击平衡神水", deplete = 1,},
    {varItem=       12041088        ,probability=   500     , price=        1       ,varName="韧性平衡神水", deplete = 1,},
    {varItem=       12041092        ,probability=   500     , price=        1       ,varName="暴击神水（3个）", deplete = 1,},
    {varItem=       12041098        ,probability=   500     , price=        1       ,varName="暴韧神水", deplete = 1,},
    {varItem=       12041099        ,probability=   500     , price=        1       ,varName="生命神水", deplete = 1,},
    {varItem=       12041110        ,probability=   500     , price=        1       ,varName="一级碎甲丸（3个）", deplete = 1,},
    {varItem=       12041110        ,probability=   500     , price=        1       ,varName="一级碎甲丸（3个）", deplete = 1,},
    {varItem=       12041111        ,probability=   500     , price=        1       ,varName="一级穿甲丸（3个）", deplete = 1,},
    {varItem=       12041111        ,probability=   500     , price=        1       ,varName="一级穿甲丸（3个）", deplete = 1,},
    {varItem=       12041112        ,probability=   500     , price=        1       ,varName="一级熔甲丸（3个）", deplete = 1,},
    {varItem=       12041112        ,probability=   500     , price=        1       ,varName="一级熔甲丸（3个）", deplete = 1,},
    {varItem=       12041116        ,probability=   500     , price=        1       ,varName="二级碎甲丸", deplete = 1,},
    {varItem=       12041117        ,probability=   500     , price=        1       ,varName="二级穿甲丸", deplete = 1,},
    {varItem=       12041118        ,probability=   500     , price=        1       ,varName="二级熔甲丸", deplete = 1,},
    {varItem=       12041210        ,probability=   500     , price=        1       ,varName="骑术强化符：一级健体（3个）", deplete = 1,},
    {varItem=       12041211        ,probability=   500     , price=        1       ,varName="骑术强化符：一级蛮力（3个）", deplete = 1,},
    {varItem=       12041212        ,probability=   500     , price=        1       ,varName="骑术强化符：一级聪慧（3个）", deplete = 1,},
    {varItem=       12041213        ,probability=   500     , price=        1       ,varName="骑术强化符：一级追影（3个）", deplete = 1,},
    {varItem=       12041214        ,probability=   500     , price=        1       ,varName="骑术强化符：一级全能（3个）", deplete = 1,},
    {varItem=       12041220        ,probability=   500     , price=        1       ,varName="骑术强化符：二级健体", deplete = 1,},
    {varItem=       12041221        ,probability=   500     , price=        1       ,varName="骑术强化符：二级蛮力", deplete = 1,},
    {varItem=       12041222        ,probability=   500     , price=        1       ,varName="骑术强化符：二级聪慧", deplete = 1,},
    {varItem=       12041223        ,probability=   500     , price=        1       ,varName="骑术强化符：二级追影", deplete = 1,},
    {varItem=       12041224        ,probability=   500     , price=        1       ,varName="骑术强化符：二级全能", deplete = 1,},
    {varItem=       12050000        ,probability=   500     , price=        1       ,varName="常乐草", deplete = 1,},
    {varItem=       12050009        ,probability=   500     , price=        1       ,varName="极乐草", deplete = 1,},
    {varItem=       12050009        ,probability=   500     , price=        1       ,varName="极乐草", deplete = 1,},
    {varItem=       12050090        ,probability=   500     , price=        1       ,varName="一级融雪丹", deplete = 1,},
    {varItem=       12050091        ,probability=   500     , price=        1       ,varName="二级融雪丹", deplete = 1,},
    {varItem=       12050092        ,probability=   500     , price=        1       ,varName="三级融雪丹", deplete = 1,},
    {varItem=       12050093        ,probability=   500     , price=        1       ,varName="四级融雪丹", deplete = 1,},
    {varItem=       12050094        ,probability=   500     , price=        1       ,varName="五级融雪丹", deplete = 1,},
    {varItem=       12050201        ,probability=   500     , price=        1       ,varName="良品蒙古马降世符", deplete = 1,},
    {varItem=       12050202        ,probability=   500     , price=        1       ,varName="良品三河马降世符", deplete = 1,},
    {varItem=       12050203        ,probability=   500     , price=        1       ,varName="良品伊犁马降世符", deplete = 1,},
    {varItem=       12050204        ,probability=   500     , price=        1       ,varName="良品波斯马降世符", deplete = 1,},
    {varItem=       12050205        ,probability=   500     , price=        1       ,varName="良品天方马降世符", deplete = 1,},
    {varItem=       12050206        ,probability=   500     , price=        1       ,varName="良品大宛马降世符", deplete = 1,},
    {varItem=       12050207        ,probability=   500     , price=        1       ,varName="良品纯血马降世符", deplete = 1,},
    {varItem=       12050208        ,probability=   500     , price=        1       ,varName="良品汗血马降世符", deplete = 1,},
    {varItem=       12050209        ,probability=   500     , price=        1       ,varName="良品?云马降世符", deplete = 1,},
    {varItem=       12050210        ,probability=   500     , price=        1       ,varName="良品龙骧马降世符", deplete = 1,},
    {varItem=       12052091        ,probability=   500     , price=        1       ,varName="一级乱战", deplete = 1,},
    {varItem=       12052101        ,probability=   500     , price=        1       ,varName="一级破军", deplete = 1,},
    {varItem=       12052111        ,probability=   500     , price=        1       ,varName="一级魔灭", deplete = 1,},
    {varItem=       12052121        ,probability=   500     , price=        1       ,varName="一级猛击", deplete = 1,},
    {varItem=       12052131        ,probability=   500     , price=        1       ,varName="一级连环", deplete = 1,},
    {varItem=       12052141        ,probability=   500     , price=        1       ,varName="一级偷袭", deplete = 1,},
    {varItem=       12052161        ,probability=   500     , price=        1       ,varName="一级回复", deplete = 1,},
    {varItem=       12052471        ,probability=   500     , price=        1       ,varName="一级狂攻", deplete = 1,},
    --{varItem=       12052472        ,probability=   500     , price=        1       ,varName="二级狂攻", deplete = 1,},
    --{varItem=       12052473        ,probability=   500     , price=        1       ,varName="三级狂攻", deplete = 1,},
    --{varItem=       12052474        ,probability=   500     , price=        1       ,varName="四级狂攻", deplete = 1,},
    {varItem=       12052481        ,probability=   500     , price=        1       ,varName="一级精确", deplete = 1,},
    --{varItem=       12052482        ,probability=   500     , price=        1       ,varName="二级精确", deplete = 1,},
    --{varItem=       12052483        ,probability=   500     , price=        1       ,varName="三级精确", deplete = 1,},
    --{varItem=       12052484        ,probability=   500     , price=        1       ,varName="四级精确", deplete = 1,},
    {varItem=       12052491        ,probability=   500     , price=        1       ,varName="一级精研", deplete = 1,},
    --{varItem=       12052492        ,probability=   500     , price=        1       ,varName="二级精研", deplete = 1,},
    --{varItem=       12052493        ,probability=   500     , price=        1       ,varName="三级精研", deplete = 1,},
    --{varItem=       12052494        ,probability=   500     , price=        1       ,varName="四级精研", deplete = 1,},
    {varItem=       12052501        ,probability=   500     , price=        1       ,varName="一级狂暴", deplete = 1,},
    --{varItem=       12052502        ,probability=   500     , price=        1       ,varName="二级狂暴", deplete = 1,},
    --{varItem=       12052503        ,probability=   500     , price=        1       ,varName="三级狂暴", deplete = 1,},
    {varItem=       12052511        ,probability=   500     , price=        1       ,varName="一级免伤", deplete = 1,},
    --{varItem=       12052512        ,probability=   500     , price=        1       ,varName="二级免伤", deplete = 1,},
    {varItem=       12052521        ,probability=   500     , price=        1       ,varName="一级灵巧", deplete = 1,},
    --{varItem=       12052522        ,probability=   500     , price=        1       ,varName="二级灵巧", deplete = 1,},
    {varItem=       12052531        ,probability=   500     , price=        1       ,varName="一级热血", deplete = 1,},
    --{varItem=       12052532        ,probability=   500     , price=        1       ,varName="二级热血", deplete = 1,},
    --{varItem=       12052533        ,probability=   500     , price=        1       ,varName="三级热血", deplete = 1,},
    --{varItem=       12052534        ,probability=   500     , price=        1       ,varName="四级热血", deplete = 1,},
    {varItem=       12052541        ,probability=   500     , price=        1       ,varName="一级淬毒", deplete = 1,},
    --{varItem=       12052542        ,probability=   500     , price=        1       ,varName="二级淬毒", deplete = 1,},
    --{varItem=       12052543        ,probability=   500     , price=        1       ,varName="三级淬毒", deplete = 1,},
    {varItem=       12052551        ,probability=   500     , price=        1       ,varName="一级伤筋", deplete = 1,},
    {varItem=       12052561        ,probability=   500     , price=        1       ,varName="一级击晕", deplete = 1,},
    {varItem=       12052571        ,probability=   500     , price=        1       ,varName="一级狂吼", deplete = 1,},
    {varItem=       12052581        ,probability=   500     , price=        1       ,varName="一级沉寂", deplete = 1,},
    {varItem=       12052591        ,probability=   500     , price=        1       ,varName="一级定身", deplete = 1,},
    {varItem=       12052601        ,probability=   500     , price=        1       ,varName="一级裂甲", deplete = 1,},
    --{varItem=       12052602        ,probability=   500     , price=        1       ,varName="二级裂甲", deplete = 1,},
    --{varItem=       12052603        ,probability=   500     , price=        1       ,varName="三级裂甲", deplete = 1,},
    {varItem=       12052611        ,probability=   500     , price=        1       ,varName="一级盲目", deplete = 1,},
    {varItem=       12052621        ,probability=   500     , price=        1       ,varName="一级破兵", deplete = 1,},
    --{varItem=       12052622        ,probability=   500     , price=        1       ,varName="二级破兵", deplete = 1,},
    --{varItem=       12052623        ,probability=   500     , price=        1       ,varName="三级破兵", deplete = 1,},
    {varItem=       12052631        ,probability=   500     , price=        1       ,varName="一级集中", deplete = 1,},
    --{varItem=       12052632        ,probability=   500     , price=        1       ,varName="二级集中", deplete = 1,},
    --{varItem=       12052633        ,probability=   500     , price=        1       ,varName="三级集中", deplete = 1,},
    {varItem=       12052641        ,probability=   500     , price=        1       ,varName="一级无视", deplete = 1,},
    {varItem=       12052651        ,probability=   500     , price=        1       ,varName="一级冷静", deplete = 1,},
    --{varItem=       12052652        ,probability=   500     , price=        1       ,varName="二级冷静", deplete = 1,},
    {varItem=       12052661        ,probability=   500     , price=        1       ,varName="一级怒气", deplete = 1,},
    {varItem=       12052671        ,probability=   500     , price=        1       ,varName="一级精力", deplete = 1,},
    {varItem=       12052681        ,probability=   500     , price=        1       ,varName="一级箭囊", deplete = 1,},
    {varItem=       12052691        ,probability=   500     , price=        1       ,varName="一级弹药", deplete = 1,},
    {varItem=       12052701        ,probability=   500     , price=        1       ,varName="一级法力", deplete = 1,},
    {varItem=       12052711        ,probability=   500     , price=        1       ,varName="一级圣力", deplete = 1,},
    --{varItem=       12110202        ,probability=   500     , price=        1       ,varName="鲜花", deplete = 1,},
    --{varItem=       12110205        ,probability=   500     , price=        1       ,varName="金叶子", deplete = 1,},
    --{varItem=       12225000        ,probability=   500     , price=        1       ,varName="中原草药术测试用配方", deplete = 1,},
    --{varItem=       12225001        ,probability=   500     , price=        1       ,varName="印度珠宝术测试用配方", deplete = 1,},
    --{varItem=       12225002        ,probability=   500     , price=        1       ,varName="蒙古驯马术测试用配方", deplete = 1,},
    --{varItem=       12225003        ,probability=   500     , price=        1       ,varName="突厥锻造术测试用配方", deplete = 1,},
    --{varItem=       12225004        ,probability=   500     , price=        1       ,varName="罗马铸甲术测试用配方", deplete = 1,},
    --{varItem=       12225005        ,probability=   500     , price=        1       ,varName="波斯工艺术测试用配方", deplete = 1,},
    --{varItem=       12240002        ,probability=   500     , price=        1       ,varName="优质符文布（10个）", deplete = 1,},
    --{varItem=       12266796        ,probability=   500     , price=        1       ,varName="炮弹", deplete = 1,},
    --{varItem=       12266898        ,probability=   500     , price=        1       ,varName="龙击炮组件", deplete = 1,},
    --{varItem=       12266899        ,probability=   500     , price=        1       ,varName="御行甲组件", deplete = 1,},
    --{varItem=       12266900        ,probability=   500     , price=        1       ,varName="机枢组件", deplete = 1,},
    --{varItem=       12266901        ,probability=   500     , price=        1       ,varName="底座组件", deplete = 1,},
    --{varItem=       12266902        ,probability=   500     , price=        1       ,varName="疾风辕组件", deplete = 1,},
    --{varItem=       12266903        ,probability=   500     , price=        1       ,varName="重击器组件", deplete = 1,},
    --{varItem=       12266904        ,probability=   500     , price=        1       ,varName="精准仪组件", deplete = 1,},
    --{varItem=       12266905        ,probability=   500     , price=        1       ,varName="?望窗组件", deplete = 1,},
    --{varItem=       12267000        ,probability=   500     , price=        1       ,varName="赤铁铸件", deplete = 1,},
    --{varItem=       12267001        ,probability=   500     , price=        1       ,varName="青铜铸件", deplete = 1,},
    --{varItem=       12267002        ,probability=   500     , price=        1       ,varName="墨钢铸件", deplete = 1,},
    --{varItem=       12269000        ,probability=   500     , price=        1       ,varName="青铜扳手", deplete = 1,},
    --{varItem=       12269002        ,probability=   500     , price=        1       ,varName="精炼剂", deplete = 1,},
    --{varItem=       12269004        ,probability=   500     , price=        1       ,varName="维修包I型", deplete = 1,},
    --{varItem=       12269005        ,probability=   500     , price=        1       ,varName="冷却剂", deplete = 1,},
    --{varItem=       12269006        ,probability=   500     , price=        1       ,varName="黄火药", deplete = 1,},
    --{varItem=       12269008        ,probability=   500     , price=        1       ,varName="青铜护甲片", deplete = 1,},
    --{varItem=       12269010        ,probability=   500     , price=        1       ,varName="青铜挡板", deplete = 1,},
    --{varItem=       12269013        ,probability=   500     , price=        1       ,varName="普通爆破火药", deplete = 1,},
    --{varItem=       12269015        ,probability=   500     , price=        1       ,varName="青铜支架", deplete = 1,},
    --{varItem=       12269017        ,probability=   500     , price=        1       ,varName="普通爆伤火药", deplete = 1,},
    --{varItem=       12269019        ,probability=   500     , price=        1       ,varName="青铜弧形板", deplete = 1,},
    --{varItem=       12269021        ,probability=   500     , price=        1       ,varName="青铜瞄准器", deplete = 1,},
    --{varItem=       12269023        ,probability=   500     , price=        1       ,varName="单色涂料", deplete = 1,},
    --{varItem=       12270000        ,probability=   500     , price=        1       ,varName="赤铜锤?龙击炮Ⅰ", deplete = 1,},
    --{varItem=       12270001        ,probability=   500     , price=        1       ,varName="赤铁锤?重击器Ⅰ", deplete = 1,},
    --{varItem=       12270002        ,probability=   500     , price=        1       ,varName="精钢锤?嘹望窗Ⅰ", deplete = 1,},
    --{varItem=       12270003        ,probability=   500     , price=        1       ,varName="血银锤?精准仪Ⅰ", deplete = 1,},
    --{varItem=       12270004        ,probability=   500     , price=        1       ,varName="炼银锤?御行甲Ⅰ", deplete = 1,},
    --{varItem=       12270005        ,probability=   500     , price=        1       ,varName="蓝玉锤?底盘Ⅰ", deplete = 1,},
    --{varItem=       12270006        ,probability=   500     , price=        1       ,varName="黄玉锤?机枢Ⅰ", deplete = 1,},
    --{varItem=       12270007        ,probability=   500     , price=        1       ,varName="红玉锤?疾风辕Ⅰ", deplete = 1,},
    --{varItem=       12270008        ,probability=   500     , price=        1       ,varName="青铜锤?龙击炮Ⅱ", deplete = 1,},
    --{varItem=       12270009        ,probability=   500     , price=        1       ,varName="生铁锤?重击器Ⅱ", deplete = 1,},
    --{varItem=       12270010        ,probability=   500     , price=        1       ,varName="墨钢锤?嘹望窗Ⅱ", deplete = 1,},
    --{varItem=       12270011        ,probability=   500     , price=        1       ,varName="淬银锤?精准仪Ⅱ", deplete = 1,},
    --{varItem=       12270012        ,probability=   500     , price=        1       ,varName="秘银锤?御行甲Ⅱ", deplete = 1,},
    --{varItem=       12270013        ,probability=   500     , price=        1       ,varName="刚玉锤?底盘Ⅱ", deplete = 1,},
    --{varItem=       12270014        ,probability=   500     , price=        1       ,varName="珀玉锤?机枢Ⅱ", deplete = 1,},
    --{varItem=       12270015        ,probability=   500     , price=        1       ,varName="血玉锤?疾风辕Ⅱ", deplete = 1,},
    {varItem=       14010001        ,probability=   500     , price=        1       ,varName="初级红变石", deplete = 1,},
    {varItem=       14010002        ,probability=   500     , price=        1       ,varName="中级红变石", deplete = 1,},
    {varItem=       14010003        ,probability=   500     , price=        1       ,varName="高级红变石", deplete = 1,},
    {varItem=       14010004        ,probability=   500     , price=        1       ,varName="圣徒级红变石", deplete = 1,},
    {varItem=       14010006        ,probability=   500     , price=        1       ,varName="初级红琥珀", deplete = 1,},
    {varItem=       14010007        ,probability=   500     , price=        1       ,varName="中级红琥珀", deplete = 1,},
    {varItem=       14010008        ,probability=   500     , price=        1       ,varName="高级红琥珀", deplete = 1,},
    {varItem=       14010009        ,probability=   500     , price=        1       ,varName="圣徒级红琥珀", deplete = 1,},
    {varItem=       14010011        ,probability=   500     , price=        1       ,varName="初级红锆石", deplete = 1,},
    {varItem=       14010012        ,probability=   500     , price=        1       ,varName="中级红锆石", deplete = 1,},
    {varItem=       14010013        ,probability=   500     , price=        1       ,varName="高级红锆石", deplete = 1,},
    {varItem=       14010014        ,probability=   500     , price=        1       ,varName="圣徒级红锆石", deplete = 1,},
    {varItem=       14010016        ,probability=   500     , price=        1       ,varName="高级红龙晶", deplete = 1,},
    {varItem=       14010017        ,probability=   500     , price=        1       ,varName="圣徒级红龙晶", deplete = 1,},
    {varItem=       14010018        ,probability=   500     , price=        1       ,varName="大师级红龙晶", deplete = 1,},
    {varItem=       14010019        ,probability=   500     , price=        1       ,varName="宗师级红龙晶", deplete = 1,},
    {varItem=       14010021        ,probability=   500     , price=        1       ,varName="高级红玉髓", deplete = 1,},
    {varItem=       14010022        ,probability=   500     , price=        1       ,varName="圣徒级红玉髓", deplete = 1,},
    {varItem=       14010026        ,probability=   500     , price=        1       ,varName="高级红猫眼", deplete = 1,},
    {varItem=       14020001        ,probability=   500     , price=        1       ,varName="初级绿柱石", deplete = 1,},
    {varItem=       14020002        ,probability=   500     , price=        1       ,varName="中级绿柱石", deplete = 1,},
    {varItem=       14020003        ,probability=   500     , price=        1       ,varName="高级绿柱石", deplete = 1,},
    {varItem=       14020004        ,probability=   500     , price=        1       ,varName="圣徒级绿柱石", deplete = 1,},
    {varItem=       14020006        ,probability=   500     , price=        1       ,varName="初级绿晶石", deplete = 1,},
    {varItem=       14020007        ,probability=   500     , price=        1       ,varName="中级绿晶石", deplete = 1,},
    {varItem=       14020008        ,probability=   500     , price=        1       ,varName="高级绿晶石", deplete = 1,},
    {varItem=       14020009        ,probability=   500     , price=        1       ,varName="圣徒级绿晶石", deplete = 1,},
    {varItem=       14020011        ,probability=   500     , price=        1       ,varName="初级绿碧玺", deplete = 1,},
    {varItem=       14020012        ,probability=   500     , price=        1       ,varName="中级绿碧玺", deplete = 1,},
    {varItem=       14020013        ,probability=   500     , price=        1       ,varName="高级绿碧玺", deplete = 1,},
    {varItem=       14020014        ,probability=   500     , price=        1       ,varName="圣徒级绿碧玺", deplete = 1,},
    {varItem=       14020016        ,probability=   500     , price=        1       ,varName="高级绿龙晶", deplete = 1,},
    {varItem=       14020017        ,probability=   500     , price=        1       ,varName="圣徒级绿龙晶", deplete = 1,},
    {varItem=       14020018        ,probability=   500     , price=        1       ,varName="大师级绿龙晶", deplete = 1,},
    {varItem=       14020019        ,probability=   500     , price=        1       ,varName="宗师级绿龙晶", deplete = 1,},
    {varItem=       14020021        ,probability=   500     , price=        1       ,varName="高级绿玉髓", deplete = 1,},
    {varItem=       14020022        ,probability=   500     , price=        1       ,varName="圣徒级绿玉髓", deplete = 1,},
    {varItem=       14020026        ,probability=   500     , price=        1       ,varName="高级绿猫眼", deplete = 1,},
    {varItem=       14030001        ,probability=   500     , price=        1       ,varName="初级黄刚玉", deplete = 1,},
    {varItem=       14030002        ,probability=   500     , price=        1       ,varName="中级黄刚玉", deplete = 1,},
    {varItem=       14030003        ,probability=   500     , price=        1       ,varName="高级黄刚玉", deplete = 1,},
    {varItem=       14030004        ,probability=   500     , price=        1       ,varName="圣徒级黄刚玉", deplete = 1,},
    {varItem=       14030006        ,probability=   500     , price=        1       ,varName="初级黄锆石", deplete = 1,},
    {varItem=       14030007        ,probability=   500     , price=        1       ,varName="中级黄锆石", deplete = 1,},
    {varItem=       14030008        ,probability=   500     , price=        1       ,varName="高级黄锆石", deplete = 1,},
    {varItem=       14030009        ,probability=   500     , price=        1       ,varName="圣徒级黄锆石", deplete = 1,},
    {varItem=       14030011        ,probability=   500     , price=        1       ,varName="初级黄琉璃", deplete = 1,},
    {varItem=       14030012        ,probability=   500     , price=        1       ,varName="中级黄琉璃", deplete = 1,},
    {varItem=       14030013        ,probability=   500     , price=        1       ,varName="高级黄琉璃", deplete = 1,},
    {varItem=       14030014        ,probability=   500     , price=        1       ,varName="圣徒级黄琉璃", deplete = 1,},
    {varItem=       14030016        ,probability=   500     , price=        1       ,varName="高级黄龙晶", deplete = 1,},
    {varItem=       14030017        ,probability=   500     , price=        1       ,varName="圣徒级黄龙晶", deplete = 1,},
    {varItem=       14030018        ,probability=   500     , price=        1       ,varName="大师级黄龙晶", deplete = 1,},
    {varItem=       14030019        ,probability=   500     , price=        1       ,varName="宗师级黄龙晶", deplete = 1,},
    {varItem=       14030021        ,probability=   500     , price=        1       ,varName="高级黄玉髓", deplete = 1,},
    {varItem=       14030022        ,probability=   500     , price=        1       ,varName="圣徒级黄玉髓", deplete = 1,},
    {varItem=       14030026        ,probability=   500     , price=        1       ,varName="高级黄猫眼", deplete = 1,},
    {varItem=       14040001        ,probability=   500     , price=        1       ,varName="初级蓝玛瑙", deplete = 1,},
    {varItem=       14040002        ,probability=   500     , price=        1       ,varName="中级蓝玛瑙", deplete = 1,},
    {varItem=       14040003        ,probability=   500     , price=        1       ,varName="高级蓝玛瑙", deplete = 1,},
    {varItem=       14040004        ,probability=   500     , price=        1       ,varName="圣徒级蓝玛瑙", deplete = 1,},
    {varItem=       14040006        ,probability=   500     , price=        1       ,varName="中级蓝辉石", deplete = 1,},
    {varItem=       14040007        ,probability=   500     , price=        1       ,varName="圣徒级蓝辉石", deplete = 1,},
    {varItem=       14040011        ,probability=   500     , price=        1       ,varName="高级金光石", deplete = 1,},
    {varItem=       14040011        ,probability=   500     , price=        1       ,varName="圣徒级金光石", deplete = 1,},
    {varItem=       14040012        ,probability=   500     , price=        1       ,varName="大师级金光石", deplete = 1,},
    {varItem=       14040016        ,probability=   500     , price=        1       ,varName="高级蓝龙晶", deplete = 1,},
    {varItem=       14040017        ,probability=   500     , price=        1       ,varName="圣徒级蓝龙晶", deplete = 1,},
    {varItem=       14040018        ,probability=   500     , price=        1       ,varName="大师级蓝龙晶", deplete = 1,},
    {varItem=       14040019        ,probability=   500     , price=        1       ,varName="宗师级蓝龙晶", deplete = 1,},
    {varItem=       14040021        ,probability=   500     , price=        1       ,varName="高级蓝玉髓", deplete = 1,},
    {varItem=       14040022        ,probability=   500     , price=        1       ,varName="圣徒级蓝玉髓", deplete = 1,},
    {varItem=       14040026        ,probability=   500     , price=        1       ,varName="高级蓝猫眼", deplete = 1,},
    {varItem=       19010001        ,probability=   500     , price=        1       ,varName="6格包", deplete = 1,},
    {varItem=       19010002        ,probability=   500     , price=        1       ,varName="12格包", deplete = 1,},



}

x350007_var_MaxScore                  = 999000
--每日领奖低保金额、
x350007_var_dibao = 1000000
x350007_var_jemin = 1000000
x350007_var_jemax = 3000000

--每日领奖给的道具
x350007_var_Dailyitems = {
    {id=12274091,name="战神寻宝图",num=10},
    {id=12274041,name="时装核心",num=1},
    {id=12274000,name="时装精华",num=1},
    {id=12274025,name="五品幻兽内丹",num=2},
    {id=12272432,name="马币包",num=10},
    {id=12272433,name="征服包",num=10},
}


--许愿受贵族等级影响系数
x350007_var_VIPNUM = 5


function x350007_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
    if GetLevel( varMap, varPlayer) < 40 then
        return
    end


    local day = GetDayOfYear()
    if day >= 1 then
	    for varI, iter in x350007_var_SeedTable do
	        TalkAppendButton( varMap, x350007_var_FileId, iter.varName, 3, iter.buttonId)
	    end
	    TalkAppendButton( varMap, x350007_var_FileId, "【活动】每日领奖", 3, 4)
	    TalkAppendButton( varMap, x350007_var_FileId, "【活动】积分查询", 3, 5)
        TalkAppendButton( varMap, x350007_var_FileId, "节日积分商店", 10, 6)
        TalkAppendButton( varMap, x350007_var_FileId, "种子玉佩商店", 10, 7)
    end
    
end




function x350007_ProcEventEntry( varMap, varPlayer, varTalknpc, varState, varIndex)
    local jltable = x350007_randomtab(x350007_var_LuckySeedTable)
    if varIndex >= 1 and varIndex <= getn( x350007_var_SeedTable) then  
        local strInfo = ""
        local strInfo1 = ""
        local strInfo2 = ""
        local strInfo3 = ""
        local strTitle = "#Y"..x350007_var_SeedTable[ varIndex].varName

        if GetDayOfYear() ~= GetPlayerGameData( varMap, varPlayer, x350007_var_SeedTable[ varIndex].dayMD[ 1], x350007_var_SeedTable[ varIndex].dayMD[ 2], x350007_var_SeedTable[ varIndex].dayMD[ 3] ) then
            SetPlayerGameData( varMap, varPlayer, x350007_var_SeedTable[ varIndex].timesMD[ 1], x350007_var_SeedTable[ varIndex].timesMD[ 2], x350007_var_SeedTable[ varIndex].timesMD[ 3], 0)
            SetPlayerGameData( varMap, varPlayer, x350007_var_SeedTable[ varIndex].dayMD[ 1],   x350007_var_SeedTable[ varIndex].dayMD[ 2],   x350007_var_SeedTable[ varIndex].dayMD[ 3], GetDayOfYear() )
        end
        if x350007_var_SeedTable[ varIndex].useMode == 0 then
            --贵族等级
            local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);
            local maxCount = nLevelPre * x350007_var_VIPNUM + x350007_var_SeedTable[ varIndex].maxTimes
            local oldCount = x350007_var_SeedTable[ varIndex].maxTimes;
            local addCount = nLevelPre * x350007_var_VIPNUM

            local needSeed = GetPlayerGameData( varMap, varPlayer, x350007_var_SeedTable[ varIndex].timesMD[ 1], x350007_var_SeedTable[ varIndex].timesMD[ 2], x350007_var_SeedTable[ varIndex].timesMD[ 3] ) + 1
            if  needSeed > maxCount then
                StartTalkTask( varMap)
                TalkAppendString( varMap, "#Y许愿种子" )
                TalkAppendString( varMap, "\n\t许愿种子，代表着真诚的许诺和美好的愿望，使用许愿种子后，可以让好运一直伴随在你的身边。" )
                TalkAppendString( varMap, format("\n\t许愿种子每天最多可以许愿#R%d#W+#R%d(vip%d级)#W次。#r", oldCount,addCount,nLevelPre ) )
                TalkAppendString( varMap, format("\t您今日已经许愿#R%d#W次了，请明日再来。",maxCount) )
                StopTalkTask()
                DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                return
            end
            strInfo = "\t许愿种子，代表着真诚的许诺和美好的愿望，使用许愿种子后，可以让好运一直伴随在你的身边。"
            strInfo1 = format( "#G小提示:#G\n\t节日许愿每天可进行#R%d#W+#R%d(vip%d级)#W次许愿，每次需要三个许愿种子。\t\n\t#W您现在是第#R%d#W次使用，需要#R3#W个@item_%d#W。", oldCount,addCount,nLevelPre,needSeed, x350007_var_SeedTable[ varIndex].varItem)
            strInfo2 = "#Y奖励内容:#W\n\t活动积分"

            StartTalkTask( varMap)
            TalkAppendString( varMap, strTitle)
            TalkAppendString( varMap, " " )
            TalkAppendString( varMap, strInfo)
            TalkAppendString( varMap, " " )
            TalkAppendString( varMap, strInfo1)
            TalkAppendString( varMap, " " )
            TalkAppendString( varMap, strInfo2)
            TalkAppendString( varMap, " " )
            TalkAppendString( varMap, strInfo3)
            SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, varIndex)
            StopTalkTask()
            DeliverTalkInfo( varMap, varPlayer, varTalknpc, x350007_var_FileId, -1)
        else
            x350007_showqifumenu(varMap, varPlayer, varTalknpc, varIndex)
        end

    end

    if varIndex == 5 then
        StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y【活动】积分查询" )
        TalkAppendString( varMap, format( "\n\t您目前的节日积分为#G%d#W。", GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] ) ) )
        TalkAppendString( varMap, format( "\n\t您目前的肝帝活跃积分为#G%d#W。", GetPlayerGameData( varMap, varPlayer, MD_SHANXIN_TIME2[ 1], MD_SHANXIN_TIME2[ 2], MD_SHANXIN_TIME2[ 3] ) or 0 ) )
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    end
    if varIndex == 4 then--每日领奖

        if GetLevel(varMap,varPlayer) < 40 then
            Msg2Player( varMap, varPlayer, "您等级过低，无法领取奖励", 8, 3)
            return
        end

        local curTime = GetMinOfDay()

        local vi = 0
        if curTime >= 21*60 and curTime < 22*60 then --21点~22点
            vi = 1
        end

        if vi == 0 then
            SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, varIndex)
            StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y每日领奖" )
            TalkAppendString( varMap, "\n\t现在还不是领取时间，无法领取。#r" )
            TalkAppendString( varMap, "\t每天的#G21：00 ~ 22：00，#W各位玩家可以在这里领取金卡奖励，以及下方道具：" )
            for varI, aitem in x350007_var_Dailyitems  do
                AddQuestItemBonus(varMap, aitem.id, aitem.num)
            end
            StopTalkTask()
            DeliverTalkInfo( varMap, varPlayer, varTalknpc, x350007_var_FileId, -1)
            return
        end

        local level = GetLevel(varMap,varPlayer)
        local tb = x350007_var_DailyTable
        if level <= 40 then
            tb = x350007_var_DailyTable40
        elseif level <= 50 then
            tb = x350007_var_DailyTable50
        elseif level <= 60 then
            tb = x350007_var_DailyTable60
        elseif level <= 70 then
            tb = x350007_var_DailyTable70
        elseif level <= 80 then
            tb = x350007_var_DailyTable80
        else
            tb = x350007_var_DailyTable100
        end
        --if GetLevel(varMap,varPlayer) >= GetTopListInfo_MaxLevel( GetWorldID( varMap, varPlayer) )-3 then
        --    Msg2Player( varMap, varPlayer, "您等级过高，无法领取奖励", 8, 3)
        --    return
        --end
        local day = GetDayOfYear()
        local rday = GetPlayerGameData(varMap,varPlayer,MD_GETGIFT_DAY[1],MD_GETGIFT_DAY[2],MD_GETGIFT_DAY[3])
        if day ~= rday then
            SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, varIndex)

            local dailyId = GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX)
            if dailyId >= 1 then
                --do nothing
                if dailyId > getn(tb) then
                    --需要重置
                    dailyId = random(1, getn(tb))
                    SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, dailyId)
                end
                Msg2Player( varMap, varPlayer, "已经有生成随机物品"..tb[dailyId].varName, 8, 3)
            else
                dailyId = random(1, getn(tb))
                SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, dailyId)
            end

            local item = tb[dailyId]
            local needID = item.varItem
            local strTitle = "每日领奖"
            local strInfo = format("\t你需要提交一个#R%s#W才能进行每日领奖。",item.varName)


            local varCount = GetItemCountInBag( varMap, varPlayer, item.varItem)


            StartTalkTask( varMap)
            TalkAppendString( varMap, strTitle)
            TalkAppendString( varMap, " " )
            TalkAppendString( varMap, strInfo)
            TalkAppendString( varMap, " " )
            if varCount == 0 then
                str2 = format( "您没有@item_%d", item.varItem)
                TalkAppendString( varMap, str2 )
                TalkAppendString( varMap, "#R如果你继续点击确定将只能获得最低金额，且没有以下额外道具#W" )
            else
                TalkAppendString( varMap, "#R您还可以获得以下额外道具#W" )
            end
            for varI, aitem in x350007_var_Dailyitems  do
                AddQuestItemBonus(varMap, aitem.id, aitem.num)
            end
            StopTalkTask()
            DeliverTalkInfo( varMap, varPlayer, varTalknpc, x350007_var_FileId, -1)
        else
            Msg2Player( varMap, varPlayer, "今天已经领过了", 8, 3)
            StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【活动】每日领奖" )
            TalkAppendString( varMap, "\n\t今天已经领过了。" )
            StopTalkTask()
            DeliverTalkMenu( varMap, varPlayer, varTalknpc)
            return
        end
    end

    if varIndex == 6 then
        DispatchShopItem( varMap, varPlayer, varTalknpc, 1104)
    end
    if varIndex == 7 then
        DispatchShopItem( varMap, varPlayer, varTalknpc, 1105)
    end
end
function x350007_showqifumenu( varMap, varPlayer, varTalknpc, varIndex)
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE, varIndex)
    local jltable = x350007_randomtab(x350007_var_LuckySeedTable)
    local strInfo = ""
    local strInfo1 = ""
    local strInfo2 = ""
    local strInfo3 = ""
    local strTitle = "#Y"..x350007_var_SeedTable[ varIndex].varName

    strInfo = "\t祈福种子，代表着衷心的祈祷和善意的祝福，使用祈福种子之后，有可能会获得神秘的礼物哦。"
    strInfo1 = format( "#G小提示:\n\t#G每天都可以进行祈福，每次祈福需要一个祈福种子，祈福种子可以从活动大使处购得。\t\n\t\n\t#W您是否要使用#R1#W个@item_%d#W?", x350007_var_SeedTable[ varIndex].varItem)
    strInfo2 = "#Y奖励内容:\n\t#W\神秘道具"

    -- 先求总概率
    local totalProb = 0
    for i, iter in jltable do
        local prob = iter.probability
        if iter.price >= 45 then
            if iter.doubleID and iter.doubleID > 0 then
                local varCount = GetItemCountInBag( varMap, varPlayer, iter.doubleID)
                if varCount > 0 then
                    prob = prob *x350007_var_beilu
                end
            end
        end
        totalProb = totalProb + prob
    end


    local str = ""
    local num = 0



    StartTalkTask( varMap)
    TalkAppendString( varMap, strTitle)
    TalkAppendString( varMap, " " )
    TalkAppendString( varMap, strInfo)
    TalkAppendString( varMap, strInfo1)


    for i, iter in jltable do
        if iter.price >= 45 then
            local prob = iter.probability
            if iter.doubleID and iter.doubleID > 0 then
                local varCount = GetItemCountInBag( varMap, varPlayer, iter.doubleID)
                if varCount > 0 then
                    prob = prob *x350007_var_beilu
                end
            end
            str = str..format("#R%d#W个#G%s#W，概率%d/10000\n", iter.num, iter.varName,floor(prob*10000/totalProb))
            num = num+1
            if mod(num,15)==0 then
                TalkAppendString( varMap, str )
                str = ""
            end
        end
    end
    if str ~= "" then
        TalkAppendString( varMap, str )
    end

    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x350007_var_FileId, -1)

end


function x350007_CheckUseTimes( varMap, varPlayer, dayMD, timesMD, maxTimes)
    local result = 1

    if GetDayOfYear() == GetPlayerGameData( varMap, varPlayer, dayMD[ 1], dayMD[ 2], dayMD[ 3] ) then
        if GetPlayerGameData( varMap, varPlayer, timesMD[ 1], timesMD[ 2], timesMD[ 3] ) >= maxTimes then
            result = 0
        end
    else
        SetPlayerGameData( varMap, varPlayer, timesMD[ 1], timesMD[ 2], timesMD[ 3], 0)
    end

    return result
end




function x350007_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    local varIndex = GetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE)

    if varIndex == 4 then--每日领奖

        if GetLevel(varMap,varPlayer) < 40 then
            Msg2Player( varMap, varPlayer, "您等级过低，无法领取奖励", 8, 3)
            return
        end

        local curTime = GetMinOfDay()

        local vi = 0
        if curTime >= 21*60 and curTime < 22*60 then --21点~22点
            vi = 1
        end

        if vi == 0 then
            StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y每日领奖" )
            TalkAppendString( varMap, "\n\t现在还不是领取时间，无法领取。#r" )
            TalkAppendString( varMap, "\t每天的#G21：00 ~ 22：00，#W各位玩家可以在这里领取金卡奖励。" )
            StopTalkTask()
            DeliverTalkMenu( varMap, varPlayer, varTalknpc)
            return
        end


        local level = GetLevel(varMap,varPlayer)
        local tb = x350007_var_DailyTable
        if level <= 40 then
            tb = x350007_var_DailyTable40
        elseif level <= 50 then
            tb = x350007_var_DailyTable50
        elseif level <= 60 then
            tb = x350007_var_DailyTable60
        elseif level <= 70 then
            tb = x350007_var_DailyTable70
        elseif level <= 80 then
            tb = x350007_var_DailyTable80
        else
            tb = x350007_var_DailyTable100
        end


        local day = GetDayOfYear()
        local rday = GetPlayerGameData(varMap,varPlayer,MD_GETGIFT_DAY[1],MD_GETGIFT_DAY[2],MD_GETGIFT_DAY[3])
        if day ~= rday then
            local dailyId = GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX)

            if dailyId >= 1 then
                --do nothing
                if dailyId > getn(tb) then
                    --需要重置
                    dailyId = random(1, getn(tb))
                    SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, dailyId)
                end
                Msg2Player( varMap, varPlayer, "已经有生成随机物品"..tb[dailyId].varName, 8, 3)
            else
                dailyId = random(1, getn(tb))
                SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, dailyId)
            end

            local item = tb[dailyId]
            local varCount = GetItemCountInBag( varMap, varPlayer, item.varItem)
            if varCount == 0 then
                Msg2Player( varMap, varPlayer, format( "您没有@item_%d 只能获得最低金额", item.varItem), 8, 3)
                --重置
                SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, 0)
                local gd= x350007_var_dibao
                AddMoney( varMap, varPlayer, 3, gd )--1d金卡
                SetPlayerGameData(varMap,varPlayer,MD_GETGIFT_DAY[1],MD_GETGIFT_DAY[2],MD_GETGIFT_DAY[3],day)
                Msg2Player( varMap, varPlayer, "领取奖励成功", 8, 3)

                StartTalkTask( varMap)
                TalkAppendString( varMap, "#Y【活动】每日领奖" )
                TalkAppendString( varMap, format( "\n\t恭喜您获得金卡#G%d#W两。", gd/1000 ) )
                StopTalkTask()
                DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                return
            end
            if DelItem( varMap, varPlayer, item.varItem, item.deplete) == 0 then
                Msg2Player( varMap, varPlayer, format( "提交@item_%d#cffcc00失败", item.varItem), 8, 3)
                return
            end
            Msg2Player( varMap, varPlayer, format( "扣除@item_%d成功", item.varItem), 8, 3)

            --重置
            SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_CURR_AWARD_INDEX, 0)

            local gd = random(x350007_var_jemin, x350007_var_jemax)
            AddMoney( varMap, varPlayer, 3, gd )--1d金卡
            if gd >= x350007_var_jemax-1000000 then
                local killerName = GetName(varMap,varPlayer)
                local countryId = GetCurCountry(varMap, varPlayer)
                local countryName = GetCountryName(countryId)
                local varMsg = "恭喜"..countryName.."的"..killerName.."获得了"..format( "金卡#G%d#W两。", gd/1000 )
                LuaAllScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
                LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 1)
                LuaAllScenceM2Wrold(varMap, varMsg, CHAT_MAIN_RIGHTDOWN, 1)
            elseif gd <= x350007_var_jemin+500000 then
                local killerName = GetName(varMap,varPlayer)
                local countryId = GetCurCountry(varMap, varPlayer)
                local countryName = GetCountryName(countryId)
                local varMsg = "哭！"..countryName.."的"..killerName.."仅获得了"..format( "金卡#G%d#W两。", gd/1000 )
                LuaAllScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
                LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 1)
                LuaAllScenceM2Wrold(varMap, varMsg, CHAT_MAIN_RIGHTDOWN, 1)
            end

            SetPlayerGameData(varMap,varPlayer,MD_GETGIFT_DAY[1],MD_GETGIFT_DAY[2],MD_GETGIFT_DAY[3],day)
            Msg2Player( varMap, varPlayer, "领取奖励成功", 8, 3)
            Msg2Player( varMap, varPlayer, "领取奖励成功", 8, 2)

            --发放物品
            StartItemTask(varMap)

            for varI, aitem in x350007_var_Dailyitems  do
                ItemAppendBind( varMap, aitem.id, aitem.num)
            end
            local varRet = StopItemTask(varMap,varPlayer)

            if varRet > 0 then
                DeliverItemListSendToPlayer(varMap,varPlayer)
                Msg2Player(varMap, varPlayer,"发放道具完成",8,3)
                Msg2Player(varMap, varPlayer,"发放道具完成",8,2)
            else
                Msg2Player(varMap, varPlayer,"物品栏已满，无法发放其它物品",8,3)
                Msg2Player(varMap, varPlayer,"物品栏已满，无法发放其它物品",8,2)
            end

            StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【活动】每日领奖" )
            TalkAppendString( varMap, format( "\n\t恭喜您获得金卡#G%d#W两。", gd/1000 ) )
            StopTalkTask()
            DeliverTalkMenu( varMap, varPlayer, varTalknpc)
        else
            Msg2Player( varMap, varPlayer, "今天已经领过了", 8, 3)
            StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y【活动】每日领奖" )
            TalkAppendString( varMap, "\n\t今天已经领过了。" )
            StopTalkTask()
            DeliverTalkMenu( varMap, varPlayer, varTalknpc)
            return
        end
        return
    end


    --贵族等级
    local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);
    local maxCount = nLevelPre * x350007_var_VIPNUM

    for varI, iter in x350007_var_SeedTable do
        if varIndex == iter.buttonId then
            




            if iter.useMode == 1 then
                -- 祈福获取道具
				for varI = 0, 0 do
                    local jltable = x350007_randomtab(x350007_var_LuckySeedTable)
                    local varCount = GetItemCountInBag( varMap, varPlayer, iter.varItem)
                    if varCount == 0 then
                        Msg2Player( varMap, varPlayer, format( "您没有@item_%d", iter.varItem), 8, 3)
                        return
                    end

					-- 先求总概率
					local totalProb = 0
					for i, iter in jltable do
                        local prob = iter.probability
                        if iter.price >= 45 then
                            if iter.doubleID and iter.doubleID > 0 then
                                local varCount1 = GetItemCountInBag( varMap, varPlayer, iter.doubleID)
                                if varCount1 > 0 then
                                    prob = prob *x350007_var_beilu
                                end
                            end
                        end
						totalProb = totalProb + prob
					end
					local result = random( 1, totalProb)
					
					local top = 1
					local bottom = 1
					local itemIndex = 1
					for varI, item in jltable do
                        local prob = item.probability
                        if item.price >= 45 then
                            if item.doubleID and item.doubleID > 0 then
                                local varCount2 = GetItemCountInBag( varMap, varPlayer, item.doubleID)
                                if varCount2 > 0 then
                                    prob = prob *x350007_var_beilu
                                end
                            end
                        end

						top = top + prob
						if result >= bottom and result < top then
							itemIndex = varI
							break
						end
						bottom = bottom + prob
					end
                    local itemInfo = jltable[ itemIndex]
                    if itemInfo.varItem == 0 then
                        --时装
                        itemInfo = x350007_var_shizhuang[random(1,getn(x350007_var_shizhuang))]
                    end
					local varItem = itemInfo.varItem
					local isBind = 0
					local bagPos = 0
					for varI = 0, 108 do
						local varId = GetItemIDByIndexInBag( varMap, varPlayer, varI)
						if varId == iter.varItem then
							if IsItemBind( varMap, varPlayer, varI) > 0 then
								isBind = 1
								bagPos = varI
								break
							end
						end
					end
					local broadcast = 0
					local itemname = ""
					if itemInfo.price >= 45 then
						broadcast = 1
						itemname = itemInfo.varName
					end
					StartItemTask( varMap)
                    local count = itemInfo.num
					if isBind == 1 then
						ItemAppendBind( varMap, varItem, count)
					else
						ItemAppend( varMap, varItem, count)
					end
					if GetBagSpace( varMap, varPlayer) > 0 and StopItemTask( varMap, varPlayer) > 0 then
						if isBind == 1 then
						    if DelItemByIndexInBag( varMap, varPlayer, bagPos, 1) == 0 then
                                Msg2Player( varMap, varPlayer, format( "提交@item_%d#cffcc00失败", iter.varItem), 8, 3)
                                return
							end
						else
							if DelItem( varMap, varPlayer, iter.varItem, 1) == 0 then
								Msg2Player( varMap, varPlayer, format( "提交@item_%d#cffcc00失败", iter.varItem), 8, 3)
								return
							end
						end
						DeliverItemListSendToPlayer( varMap, varPlayer)
						Msg2Player( varMap, varPlayer, format( "您获得了%d个@item_%d#cffcc00。", count,varItem), 8, 3)
						Msg2Player( varMap, varPlayer, format( "您获得了%d个@item_%d#cffcc00。", count,varItem), 8, 2)

						if broadcast == 1 then
							LuaAllScenceM2Wrold( varMap, format( "恭喜%s使用祈福种子获得了%s", GetName( varMap, varPlayer), itemname), 5, 1)
						end

                        x350007_showqifumenu(varMap, varPlayer, varTalknpc, varIndex)
						return
					else
						Msg2Player( varMap, varPlayer, "无法获得物品，请整理您的背包", 8, 3)
						return
					end
                end
            else
                -- 许愿获取积分

                maxCount = maxCount+iter.maxTimes
                for varI = 0, 100 do
                    local varCount = GetItemCountInBag( varMap, varPlayer, iter.varItem)
                    if varCount == 0 then
                        Msg2Player( varMap, varPlayer, format( "您没有@item_%d", iter.varItem), 8, 3)
                        return
                    end


                    if iter.useMode == 0 and x350007_CheckUseTimes( varMap, varPlayer, iter.dayMD, iter.timesMD, maxCount) == 0 then
                        Msg2Player( varMap, varPlayer, format( "您今天%s次数已达%d次，不能继续%s", iter.maxTimes,iter.actName, iter.actName), 8, 3)
                        return
                    end
                    local needSeed = GetPlayerGameData( varMap, varPlayer, iter.timesMD[ 1], iter.timesMD[ 2], iter.timesMD[ 3] ) + 1
                    if needSeed > 16 then
                        needSeed = 1
                    end
                    if iter.useMode == 0 and varCount < iter.tableid[ needSeed].deplete then
                        Msg2Player( varMap, varPlayer, format( "您的@item_%d#cffcc00不足#R%d#cffcc00颗，无法%s", iter.varItem, iter.tableid[ needSeed].deplete, iter.actName), 8, 3)
                        return
                    end
                    local score = GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] )


                    if iter.useMode == 0 and score >= x350007_var_MaxScore then
                        Msg2Player( varMap, varPlayer, format( "您的积分已达最大值，不能再使用@item_%d", iter.varItem), 8, 3)
                        return
                    end
                    if DelItem( varMap, varPlayer, iter.varItem, iter.tableid[ needSeed].deplete) == 0 then
                        Msg2Player( varMap, varPlayer, format( "提交@item_%d#cffcc00失败", iter.varItem), 8, 3)
                        return
                    end

                    local add = random( iter.tableid[ needSeed].scoreDown, iter.tableid[ needSeed].scoreUp)
                    score = score + add
                    if score > x350007_var_MaxScore then
                        score = x350007_var_MaxScore
                    end
                    SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], score)
                    SetFeastScore( varMap, varPlayer, GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] ) )
                    Msg2Player( varMap, varPlayer, format( "您获得#R%d#cffcc00点积分，总积分#G%d", add, score), 8, 3)
                    StartTalkTask( varMap)
                    TalkAppendString( varMap, "#Y"..iter.varName)
                    TalkAppendString( varMap, format( "\n\t恭喜您获得#R%d#W点积分，总积分为#G%d#W分。", add, score) )
                    StopTalkTask()
                    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
                    GamePlayScriptLog( varMap, varPlayer, 1382)

                    local times = GetPlayerGameData( varMap, varPlayer, iter.timesMD[ 1], iter.timesMD[ 2], iter.timesMD[ 3] )
                    SetPlayerGameData( varMap, varPlayer, iter.timesMD[ 1], iter.timesMD[ 2], iter.timesMD[ 3], times + 1)
                end


            end
            break

        end
    end
end




function x350007_ProcAccept( varMap, varPlayer)
end




function x350007_ProcQuestAbandon( varMap, varPlayer, varQuest)

end




function x350007_ProcContinue( varMap, varPlayer, varTalknpc)

end




function x350007_CheckSubmit( varMap, varPlayer)

end




function x350007_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varIndex, varQuest)

end




function x350007_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest)

end




function x350007_ProcAreaEntered( varMap, varPlayer, varArea, varQuest)
end




function x350007_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest)
end


function x350007_UpdateFeastScore( varMap, varPlayer, newScore)
    SetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3], newScore)
    SetFeastScore( varMap, varPlayer, GetPlayerGameData( varMap, varPlayer, MD_SEED_SCORE[ 1], MD_SEED_SCORE[ 2], MD_SEED_SCORE[ 3] ) )
end

-- 将列表元素打散
function x350007_randomtab(t)
    local len = getn(t)

    -- 拷贝一份，避免修改原 table
    local tmp = {}
    for i = 1, len do tmp[i] = t[i] end

    -- 洗牌
    for i = len, 2, -1 do
        local j = random(i)
        tmp[i], tmp[j] = tmp[j], tmp[i]
    end

    return tmp
end

