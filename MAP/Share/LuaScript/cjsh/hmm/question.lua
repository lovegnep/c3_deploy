
--DECLARE_QUEST_INFO_START--

x930152_var_FileId = 930152

--记录用户选择的是初级还中级索引
x930152_var_SelectIndex = {}
x930152_var_SelectbonusIDs = {}
x930152_var_Selectqs = {}
x930152_var_title = "肝帝的证明"
x930152_var_questions = {

    --===============================
    -- 掉落问题
    --===============================
    { id=1,  question="祈福玉佩可以通过boss掉落吗？", options={"是","否"}, correct="是" },
    { id=2,  question="80级神器碎片都可以通过boss掉落吗", options={"是","否"}, correct="否" },
    { id=3,  question="所有部将掉落内容一致吗", options={"是","否"}, correct="是" },
    { id=4,  question="所有18魔君掉落内容一致吗", options={"是","否"}, correct="是" },
    { id=5,  question="地宫狂魔掉落的最有价值的道具是", options={"灵魂印","马书","各种打星水晶","战车宝石"}, correct="灵魂印" },
    { id=6,  question="地宫狂魔掉落灵魂印的概率是", options={"低于10%","低于5%","低于15%"}, correct="低于5%" },
    { id=7,  question="哪些不是部将掉落", options={"苍月神泪","高级宝石图谱","10级融雪丹","银锭"}, correct="苍月神泪" },
    { id=8,  question="哪些不是18魔君掉落", options={"星魄碎片","黑曜石","许愿种子"}, correct="星魄碎片" },
    { id=9,  question="哪个地图的boss可以掉落祈福玉佩", options={"边塞暗道","中兴府","后花园","粮仓"}, correct="边塞暗道" },
    { id=10, question="祈福玉佩每次掉落多少", options={"20","5","30","10"}, correct="30" },
    { id=11, question="祈福玉佩是100%掉落吗", options={"是","否"}, correct="是" },
    { id=12, question="哪些地图不产出初级肝帝之证", options={"王国草原","马场","迷宫","野外领地"}, correct="野外领地" },
    { id=13, question="哪些地图产出高级肝帝之证", options={"高等级领地","边塞","迷宫","中兴府"}, correct="高等级领地" },

    --===============================
    -- 地图问题
    --===============================
    { id=14, question="哪个地图可以挂机刷现金", options={"大乱斗场景","蓬莱岛","印度河","野外领地"}, correct="大乱斗场景" },
    { id=15, question="挂机刷现金数量和哪个没关联", options={"队伍人数","背包物品","贵族等级"}, correct="贵族等级" },
    { id=16, question="大乱斗场景可以杀人刷现金吗", options={"是","否"}, correct="是" },
    { id=17, question="大乱斗场景杀人刷现金最大次数", options={"5","10","15","20"}, correct="10" },
    { id=18, question="印度河的小怪数量有蓬莱岛多吗", options={"有","没有"}, correct="没有" },
    { id=19, question="能出圣诞熊的地图数量", options={"1","2","3","5"}, correct="3" },
    { id=20, question="哪些地图会刷新出圣诞熊", options={"大都东","大都中心城","王城","边塞"}, correct="大都东" },
    { id=21, question="现金boss每天刷新几次", options={"1","2","3","5"}, correct="2" },
    { id=22, question="泰山和太行山会刷新部将吗", options={"会","不会"}, correct="不会" },

    --===============================
    -- 活动 timer
    --===============================
    { id=23, question="部将每次刷新间隔", options={"半小时","1小时","随机"}, correct="1小时" },
    { id=24, question="18魔君刷新间隔", options={"半小时","1小时","随机"}, correct="1小时" },
    { id=25, question="每天有年兽活动吗", options={"有","没有"}, correct="有" },
    { id=26, question="年兽活动有几次", options={"1","2","3","5"}, correct="2" },
    { id=27, question="周5有皇帝战吗", options={"有","没有"}, correct="没有" },
    { id=28, question="现在还有公车活动吗", options={"有","没有"}, correct="没有" },
    { id=29, question="部将和18是一块儿刷新吗", options={"是","否"}, correct="是" },
    { id=30, question="草原精英刷新间隔", options={"3","4","5","6"}, correct="3" },
    { id=31, question="领地精英怪刷新间隔", options={"5","6","7","8"}, correct="6" },
    { id=32, question="堕落奥拓刷新间隔", options={"6","7","8","10"}, correct="8" },
    { id=33, question="现金boss刷新时间", options={"每1小时刷新","每8小时刷新","21点","23点"}, correct="21点" },
    { id=34, question="印度河刷新boss间隔", options={"每1小时","每半小时","每2小时"}, correct="每1小时" },
    { id=35, question="印度河刷新boss种类数量", options={"2个左右","5个左右","10个左右","15个左右"}, correct="10个左右" },

    --===============================
    -- 各种代币
    --===============================
    { id=36, question="马币可以用来", options={"兑换坐骑","升级马装","换钱","兑换马装"}, correct="兑换坐骑" },
    { id=37, question="马币获取方式", options={"赛马","大乱斗boss","中兴府boss"}, correct="赛马" },
    { id=38, question="以下哪个boss掉落马币", options={"代币","战神","海都大王","金卡"}, correct="代币" },
    { id=39, question="如何获取征服点", options={"做任务","刷精英怪","刷中兴府boss","刷大乱斗boss"}, correct="做任务" },
    { id=40, question="哪些怪掉落威望包", options={"部将","大乱斗boss","中兴府boss"}, correct="部将" },

    --===============================
    -- 圣诞树
    --===============================
    { id=41, question="使用哪种道具可以在圣诞树抽奖", options={"祈福玉佩","黄金玉佩","流光结晶","黄金徽章"}, correct="祈福玉佩" },
    { id=42, question="圣诞树可以抽到哪些珍贵道具", options={"时装","时装精华","星魄碎片","都可以"}, correct="都可以" },
    { id=43, question="圣诞树可以给积分吗", options={"可以","不可以"}, correct="不可以" },
    { id=44, question="圣诞树有限制次数吗", options={"100次","20次","无限"}, correct="无限" },
    { id=45, question="圣诞树和许愿树抽到的时装一样吗", options={"相同","不相同"}, correct="不相同" },

    --===============================
    -- 许愿池
    --===============================
    { id=46, question="哪些道具可以在许愿池获得积分", options={"许愿种子","祈福种子","黄金祈福种子","都可以"}, correct="许愿种子" },
    { id=47, question="许愿池可以获得哪些道具", options={"星魄碎片","残破的神兵之魂","都可以"}, correct="残破的神兵之魂" },
    { id=48, question="贵族等级可以提高每日许愿次数吗", options={"可以","不可以"}, correct="可以" },
    { id=49, question="贵族等级每一级增加多少许愿次数", options={"1","2","5","6"}, correct="5" },
    { id=50, question="黄金祈福种子可以增加积分吗", options={"可以","不可以"}, correct="不可以" },
    { id=51, question="黄金许愿种子和普通有什么区别", options={"积分更高","次数更多","都是"}, correct="都是" },
    { id=52, question="积分有上限吗", options={"有","没有"}, correct="有" },
    { id=53, question="积分上限多少", options={"8万","9万","10万","12万"}, correct="10万" },
    { id=54, question="积分可以购买宝石吗", options={"可以","不可以"}, correct="不可以" },

    --===============================
    -- 时装与坐骑图鉴
    --===============================
    { id=55, question="每天时装图鉴有升级次数吗", options={"有","没有"}, correct="没有" },
    { id=56, question="时装最高多少级", options={"100","超过150","200","超过200"}, correct="超过200" },
    { id=57, question="坐骑图鉴最高多少级", options={"50","100","超过100"}, correct="超过100" },
    { id=58, question="只要有足够的时装和坐骑就能很快把图鉴升级", options={"错误","正确"}, correct="错误" },
    { id=59, question="幻兽内丹有啥用", options={"升级坐骑图鉴", "培养坐骑图鉴","没啥用"}, correct="培养坐骑图鉴" },
    { id=60, question="挖图可以得到幻兽内丹吗", options={"可以","不可以"}, correct="可以" },
    { id=61, question="有多少种藏宝图", options={"1","3","4","5"}, correct="4" },
    { id=62, question="福星下凡间隔", options={"1小时","半小时","5分钟","10分钟"}, correct="1小时" },
    { id=63, question="福星下凡多久", options={"1小时","半小时","5分钟","10分钟"}, correct="5分钟" },
    { id=64, question="福星下凡有哪地图", options={"王城","草原","迷宫","大都中心城"}, correct="大都中心城" },
    { id=65, question="福星下凡地图位置是随机的吗？", options={"是","和地图有关","否"}, correct="是" },
    { id=66, question="福星下凡地图有边塞吗？", options={"有","没有"}, correct="有" },
    { id=67, question="福星下凡有哪些能力", options={"兑换","购买","我要","全都有"}, correct="全都有" },
    { id=68, question="通过福星下凡可以获得荣誉吗", options={"不可能","看情况","可以"}, correct="可以" },
    { id=69, question="通过福星下凡可以获得现金吗", options={"不可能","看情况","可以"}, correct="可以" },
    { id=70, question="通过福星下凡可以获得银卡吗", options={"不可能","看情况","可以"}, correct="可以" },
    { id=71, question="通过福星下凡可以获得金卡吗", options={"不可能","看情况","可以"}, correct="可以" },
    { id=72, question="哪个npc可以兑换将星王牌", options={"将星大师","活动大使","都可以"}, correct="将星大师" },
    { id=73, question="挖图可以获得战神王牌兑换券吗", options={"可以","不可以"}, correct="可以" },
    { id=74, question="战神寻宝图获得方式有哪些", options={"祈福","许愿","答题"}, correct="答题" },
    { id=75, question="哪种方式不可以获得战神寻宝图", options={"祈福","碎片合成","答题","圣诞树"}, correct="祈福" },
    { id=76, question="战神寻宝图有几种碎片", options={"2","3","4","5"}, correct="3" },

    --战场
    { id=77, question="死亡后多久可以再次进入战场", options={"2小时","1小时","看死亡次数"}, correct="1小时" },
    { id=78, question="战场可以获得战场积分吗", options={"不可以","可以"}, correct="可以" },
    { id=79, question="战场可以获得马币吗", options={"不可以","可以"}, correct="可以" },
    { id=80, question="战场可以获得声望吗", options={"不可以","可以"}, correct="可以" },
    { id=81, question="战场可以获得经验吗", options={"不可以","可以"}, correct="可以" },
    { id=82, question="战场可以获得珍稀道具吗", options={"不可以","可以"}, correct="可以" },
    { id=83, question="战场可以获得征服点吗", options={"不可以","可以"}, correct="可以" },
    { id=84, question="战场每隔多久可以获得经验", options={"5秒","10秒","随机时间"}, correct="10秒" },
    { id=85, question="战场最多可以同时存在几个boss", options={"1","2","3","4"}, correct="3" },
    { id=86, question="战场可以组队进入吗", options={"不可以","可以"}, correct="不可以" },
    { id=87, question="战场死亡后会被传送到哪个地图", options={"王国","大都","轮回"}, correct="大都" },
    { id=88, question="战场有多少种boss", options={"10","20","少于30","超过30"}, correct="超过30" },
    { id=89, question="战场boss刷新间隔", options={"10分钟","20分钟","看星期几"}, correct="看星期几" },
    { id=90, question="周末战场boss刷新间隔", options={"10分钟","20分钟","看星期几"}, correct="10分钟" },
    { id=91, question="周内战场boss刷新间隔", options={"10分钟","20分钟","看星期几"}, correct="20分钟" },

}


--index   1-9
x930152_var_leveldesc = {
    {index = 1, minlevel = 1, name="初级[1道题]", num = 1, jlnum = 1, bonus={
        12031190, --魔法月饼
        12274000, --时装精华
        12274025, --五品幻兽内丹
        12030733,--紫檀木炭包
        12030801,--小钱包	沉甸甸的小钱包。右键点击打开获得100两银卡
    }},
    {index = 2, minlevel = 2, name="中级[5道题]", num = 5, jlnum = 2, bonus={
        12031190, --魔法月饼
        12274000, --时装精华
        12274025, --五品幻兽内丹
        12274041, --时装核心
        12030099,--现金500两
        12030813,--完美星辰大礼包
        12030733,--紫檀木炭包
    }},
    {index = 3, minlevel = 3, name="高级[10道题]", num = 10, jlnum = 3, bonus={
        12031190, --魔法月饼
        12274000, --时装精华
        12274025, --五品幻兽内丹
        11000907, --神话级洗石剂
        12274041, --时装核心
        12030099,--现金500两
        12030100,--现金1锭
        12030854,--玉麒麟龙威大礼包
        12030813,--完美星辰大礼包
        12030733,--紫檀木炭包
        12274039,--肝帝的证明大礼包
    }},
    {index = 4, minlevel = 5, name="传说[20道题]", num = 20, jlnum = 4, bonus={
        12031190, --魔法月饼
        12274000, --时装精华
        12274025, --五品幻兽内丹
        11000907, --神话级洗石剂
        12274041, --时装核心
        12030099,--现金500两
        12030100,--现金1锭
        12030854,--玉麒麟龙威大礼包
        12030813,--完美星辰大礼包
        12030733,--紫檀木炭包
        12274039,--肝帝的证明大礼包
        12271328,--祈福玉佩大礼包
        12271329,--绝世时装大礼包
    }},
    {index = 5, minlevel = 7, name="神话[30道题]", num = 30, jlnum = 5, bonus={
        12031190, --魔法月饼
        12274000, --时装精华
        12274025, --五品幻兽内丹
        11000907, --神话级洗石剂
        12274041, --时装核心
        12030099,--现金500两
        12030100,--现金1锭
        12030854,--玉麒麟龙威大礼包
        12030813,--完美星辰大礼包
        12030733,--紫檀木炭包
        12274039,--肝帝的证明大礼包
        12271328,--祈福玉佩大礼包
        11000906,--传说级洗石剂·莲华
        11000934,--传说级洗石剂·雪魂
        11000935,--传说级洗石剂·冰魄
        12271329,--绝世时装大礼包
    }},
    {index = 6, minlevel = 9, name="变态[50道题]", num = 50, jlnum = 8, bonus={
        12031190, --魔法月饼
        12274000, --时装精华
        12274025, --五品幻兽内丹
        11000907, --神话级洗石剂
        12274041, --时装核心
        12030099,--现金500两
        12030100,--现金1锭
        12030854,--玉麒麟龙威大礼包
        12030813,--完美星辰大礼包
        12030733,--紫檀木炭包
        12274039,--肝帝的证明大礼包
        12271328,--祈福玉佩大礼包
        11000906,--传说级洗石剂·莲华
        11000934,--传说级洗石剂·雪魂
        11000935,--传说级洗石剂·冰魄
        12271329,--绝世时装大礼包
        12274096,--战神寻宝图大礼包
        12274095,--坐骑图鉴大礼包
        11000330,--马书残页
        --12274103,--初级将星勋章
        --12274104,--初级将星勋章
        --12274105,--初级将星勋章
        --12274106,--初级将星勋章
    }},
}
x930152_var_desc = "\t在这里证明你的学识吧，全部答对，奖励丰厚。#R神话级洗石剂#W\t#R现金#W\#R肝帝大礼包#W\t#R五品幻兽内丹#W\t#R绝世时装#W"
x930152_var_desc2 = "\t\n记得留够足够的包裹空间，每道题答对也有可能获得随机奖励"


--每道题随机给的奖励
x930152_var_prob = 30--概率
x930152_var_items = {
    {id = 12031190, num = 1, name = "魔法月饼"},
    {id = 12274021, num = 1, name = "一品幻兽内丹"},
    {id = 12274022, num = 1, name = "二品幻兽内丹"},
    {id = 12274023, num = 1, name = "三品幻兽内丹"},
    {id = 12274024, num = 1, name = "四品幻兽内丹"},
    {id = 12274025, num = 1, name = "五品幻兽内丹"},
    {id = 12274091, num = 1, name = "战神寻宝图"},
}


function x930152_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)
    local currentday = GetDayOfYear()
    local playerday = GetPlayerGameData( varMap, varPlayer, MD_DUANWUJIE_DATE[ 1], MD_DUANWUJIE_DATE[ 2], MD_DUANWUJIE_DATE[ 3] )

	if seleteId == getn(x930152_var_leveldesc)+1 then
		--答题介绍
        x930152_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x930152_var_title)
		TalkAppendString(varMap,x930152_var_desc)
		TalkAppendString(varMap,x930152_var_desc2)
		TalkAppendString(varMap,"以下是可能的奖励")

        local bonusIDs = x930152_var_leveldesc[getn(x930152_var_leveldesc)].bonus
        for varI, item in bonusIDs  do
            AddQuestItemBonus(varMap, item, 1)
        end

		StopTalkTask()
        DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930152_var_FileId, -1);
	end
	if seleteId == -1 then
		--说明用户点击的是1级菜单，需要展示2级菜单
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x930152_var_title)
		TalkAppendString(varMap,x930152_var_desc)
		TalkAppendString(varMap,x930152_var_desc2)

        if currentday == playerday then
            TalkAppendString(varMap,"\n你今天已经答过了！")
        else
            for varI, item in x930152_var_leveldesc  do
                TalkAppendButton( varMap, x930152_var_FileId, item.name, 3, item.index )
            end
            TalkAppendButton( varMap, x930152_var_FileId, "答题介绍", 0, getn(x930152_var_leveldesc)+1 )
        end


		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 1 and seleteId <= getn(x930152_var_leveldesc) then
		--说明用户点击的是2级菜单，需要展示3级菜单 具体的题目了

        local nItemID, nItemNum, nLevelPre = GetPeerVipInfo(varMap, varPlayer, 1);


        --先判断包裹空间
        local emptyNum = x930152_var_leveldesc[seleteId].jlnum
        if GetBagSpace(varMap, varPlayer) < emptyNum then
            Msg2Player(varMap, varPlayer,format("需要至少%d格空余背包位置才能答题！", emptyNum),8,2)
            Msg2Player(varMap, varPlayer,format("需要至少%d格空余背包位置才能答题！", emptyNum),8,3)
            return 0
        end

        if nLevelPre < x930152_var_leveldesc[seleteId].minlevel then
            local minlevel = x930152_var_leveldesc[seleteId].minlevel
            Msg2Player(varMap, varPlayer,format("该难度需要至少vip%d才能答题！", minlevel),8,2)
            Msg2Player(varMap, varPlayer,format("该难度需要至少vip%d才能答题！", minlevel),8,3)
            return 0
        end

        -- 说明用户已经开始答题了，记录时间
        x930152_var_SelectIndex[GetGUID(varMap, varPlayer)] = seleteId
        SetPlayerGameData( varMap, varPlayer, MD_DUANWUJIE_DATE[ 1], MD_DUANWUJIE_DATE[ 2], MD_DUANWUJIE_DATE[ 3], currentday)

        --生成题目
        local tinum = x930152_var_leveldesc[seleteId].num
        local tis = x930152_random_pick(x930152_var_questions, tinum)
        --拿到这些题的索引
        local tiids = {}
        for i = 1, tinum do
            tiids[i] = tis[i].id
        end
        x930152_var_Selectqs[GetGUID(varMap, varPlayer)] = tiids

        local firstti = tis[1]

		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x930152_var_title)
		TalkAppendString(varMap,firstti.question)
		for varI, item in firstti.options  do
			local index =10 + varI
			TalkAppendButton( varMap, x930152_var_FileId, item, 3, index )
		end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
	end

	if seleteId >= 11 then
		--说明用户点击的是3级菜单，已经答题了
        local optionID = mod(seleteId,10)
        local tiindex = floor((seleteId-optionID)/10)
        local tiids = x930152_var_Selectqs[GetGUID(varMap, varPlayer)]
        if getn(tiids) <= 0 then
            --题目丢了
            Msg2Player(varMap, varPlayer,"找不到题目！",8,2)
            Msg2Player(varMap, varPlayer,"找不到题目！",8,3)
            return
        end
        --上一个题目
        local lasttiid = tiids[tiindex]
        local right = x930152_var_questions[lasttiid].correct
        local playeranswer = x930152_var_questions[lasttiid].options[optionID]
        if right ~= playeranswer then
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x930152_var_title)
            TalkAppendString(varMap,format("[%d]%s", lasttiid, x930152_var_questions[lasttiid].question))
            TalkAppendString(varMap,"\n\n\n答错了，接着肝吧！！！")
            StopTalkTask()
            DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930152_var_FileId, -1);
            return
        end

        --再次检查包裹空间
        if GetBagSpace(varMap, varPlayer) <= 5 then
            Msg2Player(varMap, varPlayer,format("包裹空间较少，有可能发放奖励失败，需要至少%d格空余背包位置！", 5),8,2)
            Msg2Player(varMap, varPlayer,format("包裹空间较少，有可能发放奖励失败，需要至少%d格空余背包位置！", 5),8,3)
        end




        if tiindex < getn(tiids) then
            --答对，随机给奖励
            if random(1,100) <= x930152_var_prob then
                local jlitem = x930152_var_items[random(1,getn(x930152_var_items))]

                StartItemTask(varMap)
                ItemAppendBind( varMap, jlitem.id, jlitem.num)

                local varRet = StopItemTask(varMap,varPlayer)
                if varRet > 0 then
                    DeliverItemListSendToPlayer(varMap,varPlayer)
                    Msg2Player(varMap, varPlayer,format("题目答对，奖励%d个%s", jlitem.num, jlitem.name),8,3)
                    Msg2Player(varMap, varPlayer,format("题目答对，奖励%d个%s", jlitem.num, jlitem.name),8,2)
                    GamePlayScriptLog( varMap, varPlayer, 2670)
                else
                    Msg2Player(varMap, varPlayer,"题目答对，但物品栏已满，无法获得奖励",8,3)
                    Msg2Player(varMap, varPlayer,"题目答对，但物品栏已满，无法获得奖励",8,2)
                end

            end

            --展示下一题
            local dijiti = tiindex+1
            local ti = x930152_var_questions[tiids[dijiti]]
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x930152_var_title)
            TalkAppendString(varMap,format("\n\t当前第%d题/总%d\n",dijiti, getn(tiids)  ))
            TalkAppendString(varMap,format("[%d]%s", ti.id, ti.question))
            for varI, item in ti.options  do
                local index =dijiti*10 + varI
                TalkAppendButton( varMap, x930152_var_FileId, item, 3, index )
            end
            StopTalkTask()
            DeliverTalkMenu(varMap, varPlayer, varTalknpc)
        else
            --答题结束，发放奖励
            StartTalkTask(varMap)
            TalkAppendString(varMap,"#Y"..x930152_var_title)
            TalkAppendString(varMap,"恭喜你，全部回答正确，以下是你的奖励")

            local nandu = x930152_var_SelectIndex[GetGUID(varMap, varPlayer)]
            local bonusIDs = x930152_random_pick(x930152_var_leveldesc[nandu].bonus, x930152_var_leveldesc[nandu].jlnum)
            for varI, item in bonusIDs  do
                AddQuestItemBonus(varMap, item, 1)
            end

            x930152_var_SelectbonusIDs[GetGUID(varMap, varPlayer)] = bonusIDs

            StopTalkTask()
            DeliverTalkInfo(varMap, varPlayer, varTalknpc, x930152_var_FileId, -1);
            return
        end
	end

end


function x930152_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x930152_var_FileId,x930152_var_title,3,-1);

end

function x930152_ProcAccept( varMap, varPlayer )

	x930152_Accept( varMap, varPlayer )

end

function x930152_Accept( varMap, varPlayer )

    local bonusIDs = x930152_var_SelectbonusIDs[GetGUID(varMap, varPlayer)]

	local seleteId = x930152_var_SelectIndex[GetGUID(varMap, varPlayer)]
    if seleteId == getn(x930152_var_leveldesc)+1 then
        return 0
    end
	if GetBagSpace(varMap, varPlayer) < getn(bonusIDs) then
		Msg2Player(varMap, varPlayer,format("需要至少%d格空余背包位置才能兑换！", getn(bonusIDs)),8,2)
		Msg2Player(varMap, varPlayer,format("需要至少%d格空余背包位置才能兑换！", getn(bonusIDs)),8,3)
		return 0
	end




	StartItemTask(varMap)
    for varI, item in bonusIDs  do
        ItemAppendBind( varMap, item, 1)
    end

	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		Msg2Player(varMap, varPlayer,"发放奖励完成",8,3)
		GamePlayScriptLog( varMap, varPlayer, 2670)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"物品栏已满，无法获得物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
end


-- 随机从列表中取 n 个不重复元素
function x930152_random_pick(t, n)
    local len = getn(t)
    if n >= len then
        return t  -- 要的数量超过列表大小，直接返回全部
    end

    -- 拷贝一份，避免修改原 table
    local tmp = {}
    for i = 1, len do tmp[i] = t[i] end

    -- 洗牌
    for i = len, 2, -1 do
        local j = random(i)
        tmp[i], tmp[j] = tmp[j], tmp[i]
    end

    -- 截取前 n 个
    local res = {}
    for i = 1, n do
        res[i] = tmp[i]
    end
    return res
end

-- 将列表元素打散
function x930152_randomtab(t)
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

function x930152_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x930152_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x930152_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x930152_CheckSubmit( varMap, varPlayer )

end




function x930152_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x930152_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x930152_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x930152_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
