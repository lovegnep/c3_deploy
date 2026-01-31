




x310601_var_FileId 			= 310601                  
x310601_var_Name              ="排行榜奖励"
x310601_var_NotEnouth         ="很遗憾，您在上周挑战赛中没有获得名次！"
x310601_var_RepeatAward       ="您已经领取过该排行榜的奖励了!"
x310601_var_SuccessAward      ="您顺利领取了该排行榜的奖励!"

x310601_var_SeniorLevelRank		=	80	--高低等级的界限,低于这个等级取JuniorAwardTable道具,高于这个等级取SeniorAwardTable道具

x310601_var_TopListItemAward	=		{ --道具奖励信息表
	{
		JuniorAwardTable = { --初级奖励列表
			{ItemId = 12030059, Count = 1}, --金砖
			{ItemId = 12033110, Count = 1}, --掌门牌碰碰胡（7天）
			{ItemId = 12030203, Count = 1}, --朝廷请柬
			{ItemId = 11010003, Count = 1}, --三级皇家秘银
			{ItemId = 12030505, Count = 1}, --节日时装礼包
			{ItemId = 11000903, Count = 1}, --圣徒级洗石剂
			{ItemId = 11990114, Count = 1}, --次生神传钻石矿
			{ItemId = 12250002, Count = 1} 	--精品芝华士
		},
		SeniorAwardTable = { --高级奖列表
			{ItemId = 12030059, Count = 1}, --金砖
			{ItemId = 12033110, Count = 1}, --掌门牌碰碰胡（7天）
			{ItemId = 12030203, Count = 1}, --朝廷请柬
			{ItemId = 11010004, Count = 1}, --四级皇家秘银
			{ItemId = 12030505, Count = 1}, --节日时装礼包
			{ItemId = 11990114, Count = 1}, --次生神传钻石矿
			{ItemId = 12250002, Count = 1}, --精品芝华士
			{ItemId = 12033111, Count = 1}, 	--掌门牌:清一色(7天
			{ItemId = 11010113, Count = 1}, 	--三级平衡之书
			{ItemId = 11000606, Count = 1} 	--四级冥铁
		}
	},
	{
		JuniorAwardTable = { --初级奖励列表
			{ItemId = 12030057, Count = 1}, --金条
			{ItemId = 12030058, Count = 1}, --金元宝
			{ItemId = 11990110, Count = 1}, --募集券
			{ItemId = 11000902, Count = 1}, --高级洗石剂
			{ItemId = 12030031, Count = 1}, --神行符
			{ItemId = 11010002, Count = 1} --二级皇家秘银
		},
		SeniorAwardTable = { --高级奖列表
			{ItemId = 12030057, Count = 1}, --金条
			{ItemId = 12030058, Count = 1}, --金元宝
			{ItemId = 11990110, Count = 1}, --募集券
			{ItemId = 12030031, Count = 1}, --神行符
			{ItemId = 11010003, Count = 1}, --三级皇家秘银
			{ItemId = 12034065, Count = 1}, --固本丹
			{ItemId = 11010111, Count = 1}, --一级平衡之书
			{ItemId = 11000552, Count = 1}, 	--完美星辰
			{ItemId = 12054301, Count = 1} 	--还龙书
		}
	}
}

x310601_var_ToplistInfo       =   {
{ClassName = "祝家庄", ClassIndex = 1,TitleClassID = 57, Desc = "祝家庄排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜。",    
           TitleInfo =
            {
                   {LevelStart=1,LevelEnd=1,TitleID = 71, ItemAwardIndex = 1},
                   {LevelStart=2,LevelEnd=3,TitleID = 72, ItemAwardIndex = 2},
                   {LevelStart=4,LevelEnd=20,TitleID = 73, ItemAwardIndex = 0},
                   {LevelStart=21,LevelEnd=50,TitleID = 74, ItemAwardIndex = 0},
                   {LevelStart=51,LevelEnd=100,TitleID = 75, ItemAwardIndex = 0}
            }
       	} ,
       {ClassName = "战场等级", ClassIndex = 2,TitleClassID = 17, Desc = "战场等级排行榜记录着真正的PK强者。玩家初始战场等级为500，战场等级超过500的玩家才有资格出现在排行榜上。参与阔亦田战场每胜利一场+1，每失败一场-1。战场等级最高的前100名玩家可以登上排行榜。",   
       TitleInfo =
             {
                    {LevelStart=1,LevelEnd=1,TitleID = 51, ItemAwardIndex = 1},
                    {LevelStart=2,LevelEnd=3,TitleID = 52, ItemAwardIndex = 2},
                    {LevelStart=4,LevelEnd=20,TitleID = 53, ItemAwardIndex = 0},
                    {LevelStart=21,LevelEnd=50,TitleID = 54, ItemAwardIndex = 0},
                    {LevelStart=51,LevelEnd=100,TitleID = 55, ItemAwardIndex = 0}
             }
        } ,
        {ClassName = "夏王墓", ClassIndex = 3,TitleClassID = 63, Desc = "夏王墓排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜。",   
       TitleInfo =
             {
                    {LevelStart=1,LevelEnd=1,TitleID = 92, ItemAwardIndex = 1},
                    {LevelStart=2,LevelEnd=3,TitleID = 93, ItemAwardIndex = 2},
                    {LevelStart=4,LevelEnd=20,TitleID = 94, ItemAwardIndex = 0},
                    {LevelStart=21,LevelEnd=50,TitleID = 95, ItemAwardIndex = 0},
                    {LevelStart=51,LevelEnd=100,TitleID = 96, ItemAwardIndex = 0}
             }
        } ,
        {ClassName = "杀敌", ClassIndex = 4,TitleClassID = 15, Desc = "杀敌排行榜记录着异国有效杀敌数最多的勇士们。杀死不低于自己等级20级以上的异国玩家才能增加杀敌数，如果2小时内杀死同一个异国玩家超过10次，则再次杀死该玩家将不再增加杀敌数。有效杀敌数最多的前100名玩家可以登上排行榜。",  
            TitleInfo =
             {
                    {LevelStart=1,LevelEnd=1,TitleID = 21, ItemAwardIndex = 1},
                    {LevelStart=2,LevelEnd=3,TitleID = 22, ItemAwardIndex = 2},
                    {LevelStart=4,LevelEnd=20,TitleID = 23, ItemAwardIndex = 0},
                    {LevelStart=21,LevelEnd=50,TitleID = 24, ItemAwardIndex = 0},
                    {LevelStart=51,LevelEnd=100,TitleID = 25, ItemAwardIndex = 0}
             }
        },
        {ClassName = "印度河", ClassIndex = 5,TitleClassID = 65, Desc = "印度河排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜。",   
           TitleInfo =
            {
                   {LevelStart=1,LevelEnd=1,TitleID = 97, ItemAwardIndex = 1},
                   {LevelStart=2,LevelEnd=3,TitleID = 98, ItemAwardIndex = 2},
                   {LevelStart=4,LevelEnd=20,TitleID = 99, ItemAwardIndex = 0},
                   {LevelStart=21,LevelEnd=50,TitleID = 100, ItemAwardIndex = 0},
                   {LevelStart=51,LevelEnd=100,TitleID = 101, ItemAwardIndex = 0}
            }
       } ,
        {ClassName = "智力竞赛", ClassIndex = 6,TitleClassID = 37, Desc = "智力竞赛排行榜将累计一周每次智力竞赛的总分数，总分最高的前100名玩家可以登上排行榜。",   
                TitleInfo =
                 {
                        {LevelStart=1,LevelEnd=1,TitleID = 31, ItemAwardIndex = 1},
                        {LevelStart=2,LevelEnd=3,TitleID = 32, ItemAwardIndex = 2},
                        {LevelStart=4,LevelEnd=20,TitleID = 33, ItemAwardIndex = 0},
                        {LevelStart=21,LevelEnd=50,TitleID = 34, ItemAwardIndex = 0},
                        {LevelStart=51,LevelEnd=100,TitleID = 35, ItemAwardIndex = 0}
                 }
            } ,
        {ClassName = "轮回台", ClassIndex = 7,TitleClassID = 59, Desc = "轮回台排行榜记录着守卫国家轮回台的勇士。如果完成副本时剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜",  
            TitleInfo =
             {
                    {LevelStart=1,LevelEnd=1,TitleID = 76, ItemAwardIndex = 1},
                    {LevelStart=2,LevelEnd=3,TitleID = 77, ItemAwardIndex = 2},
                    {LevelStart=4,LevelEnd=20,TitleID = 78, ItemAwardIndex = 0},
                    {LevelStart=21,LevelEnd=50,TitleID = 79, ItemAwardIndex = 0},
                    {LevelStart=51,LevelEnd=100,TitleID = 80, ItemAwardIndex = 0}
             }
        } ,
				{ClassName = "屠龙", ClassIndex = 12,TitleClassID = 45, Desc = "屠龙排行榜会记录下真正的屠龙勇士，每杀死一只天龙之魂都将增加你的屠龙数，屠龙数最高的前100名玩家可以登上排行榜。",   
		
           TitleInfo =
            {
                   {LevelStart=1,LevelEnd=1,TitleID = 41, ItemAwardIndex = 1},
                   {LevelStart=2,LevelEnd=3,TitleID = 42, ItemAwardIndex = 2},
                   {LevelStart=4,LevelEnd=20,TitleID = 43, ItemAwardIndex = 0},
                   {LevelStart=21,LevelEnd=50,TitleID = 44, ItemAwardIndex = 0},
                   {LevelStart=51,LevelEnd=100,TitleID = 45, ItemAwardIndex = 0}
            }
       } ,     
		
		{ClassName = "大教堂", ClassIndex = 9,TitleClassID = 61, Desc = "大教堂排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜。",    
           TitleInfo =
            {
                   {LevelStart=1,LevelEnd=1,TitleID = 111, ItemAwardIndex = 1},
                   {LevelStart=2,LevelEnd=3,TitleID = 112, ItemAwardIndex = 2},
                   {LevelStart=4,LevelEnd=20,TitleID = 113, ItemAwardIndex = 0},
                   {LevelStart=21,LevelEnd=50,TitleID = 114, ItemAwardIndex = 0},
                   {LevelStart=51,LevelEnd=100,TitleID = 91, ItemAwardIndex = 0}
            }
		} ,
        {ClassName = "神龙宝藏", ClassIndex = 10,TitleClassID = 43, Desc = "神龙宝藏排行榜会记录下寻宝数量最多的探宝家，每使用一张神龙藏宝图挖掘宝藏都将被记录，挖宝次数最高的前100名玩家可以登上排行榜。",  		

           TitleInfo =
            {
                   {LevelStart=1,LevelEnd=1,TitleID = 36, ItemAwardIndex = 1},
                   {LevelStart=2,LevelEnd=3,TitleID = 37, ItemAwardIndex = 2},
                   {LevelStart=4,LevelEnd=20,TitleID = 38, ItemAwardIndex = 0},
                   {LevelStart=21,LevelEnd=50,TitleID = 39, ItemAwardIndex = 0},
                   {LevelStart=51,LevelEnd=100,TitleID = 40, ItemAwardIndex = 0}
            }
       } ,
       
	    {ClassName = "囚龙岛", ClassIndex = 11,TitleClassID = 51, Desc = "囚龙岛排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜。", 
                TitleInfo =
                 {
                        {LevelStart=1,LevelEnd=1,TitleID = 56, ItemAwardIndex = 1},
                        {LevelStart=2,LevelEnd=3,TitleID = 57, ItemAwardIndex = 2},
                        {LevelStart=4,LevelEnd=20,TitleID = 58, ItemAwardIndex = 0},
                        {LevelStart=21,LevelEnd=50,TitleID = 59, ItemAwardIndex = 0},
                        {LevelStart=51,LevelEnd=100,TitleID = 60, ItemAwardIndex = 0}
                 }
            } ,

	{ClassName = "玫瑰", ClassIndex = 8,TitleClassID = 31, Desc = "收到过玫瑰花的男女玩家将入驻玫瑰排行榜，任何玫瑰花都会增加1点恋爱指数，恋爱指数最高的前100名玩家可以登上排行榜。",    
           TitleInfo =
            {
                   {LevelStart=1,LevelEnd=1,TitleID = 26, ItemAwardIndex = 1},
                   {LevelStart=2,LevelEnd=3,TitleID = 27, ItemAwardIndex = 2},
                   {LevelStart=4,LevelEnd=20,TitleID = 28, ItemAwardIndex = 0},
                   {LevelStart=21,LevelEnd=50,TitleID = 29, ItemAwardIndex = 0},
                   {LevelStart=51,LevelEnd=100,TitleID = 30, ItemAwardIndex = 0}
            }
		} ,
       {ClassName = "和氏璧", ClassIndex = 13,TitleClassID = 53, Desc = "和氏璧排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名玩家可以登上排行榜。",   
           TitleInfo =
            {
                   {LevelStart=1,LevelEnd=1,TitleID = 61, ItemAwardIndex = 1},
                   {LevelStart=2,LevelEnd=3,TitleID = 62, ItemAwardIndex = 2},
                   {LevelStart=4,LevelEnd=20,TitleID = 63, ItemAwardIndex = 0},
                   {LevelStart=21,LevelEnd=50,TitleID = 64, ItemAwardIndex = 0},
                   {LevelStart=51,LevelEnd=100,TitleID = 65, ItemAwardIndex = 0}
            }
       } ,
       {ClassName = "小喇叭", ClassIndex = 14,TitleClassID = 47,  
                TitleInfo =
                 {
                        {LevelStart=1,LevelEnd=1,TitleID = 102, ItemAwardIndex = 1},
                        {LevelStart=2,LevelEnd=3,TitleID = 103, ItemAwardIndex = 2},
                        {LevelStart=4,LevelEnd=20,TitleID = 104, ItemAwardIndex = 0},
                        {LevelStart=21,LevelEnd=50,TitleID = 105, ItemAwardIndex = 0},
                        {LevelStart=51,LevelEnd=100,TitleID = 106, ItemAwardIndex = 0}
                 }
            } ,
       {ClassName = "赤血号", ClassIndex = 15,TitleClassID = 55, Desc = "赤血号排行榜只有三番模式下才能入榜。请注意，如果副本中每环剩余怪物数过多，其成绩将不会被记入排行榜。完成此副本时间最短的前100名的玩家可以登上排行榜。",   

           TitleInfo =
            {
                   {LevelStart=1,LevelEnd=1,TitleID = 66, ItemAwardIndex = 1},
                   {LevelStart=2,LevelEnd=3,TitleID = 67, ItemAwardIndex = 2},
                   {LevelStart=4,LevelEnd=20,TitleID = 68, ItemAwardIndex = 0},
                   {LevelStart=21,LevelEnd=50,TitleID = 69, ItemAwardIndex = 0},
                   {LevelStart=51,LevelEnd=100,TitleID = 70, ItemAwardIndex = 0}
            }
       } ,
        {ClassName = "放烟花", ClassIndex = 16,TitleClassID = 49, Desc = "燃放任何种类的烟花都将增长你在烟花排行榜内的分数，烂漫烟花分数最高的前100名玩家可以登上排行榜。",   
           TitleInfo =
            {
                   {LevelStart=1,LevelEnd=1,TitleID = 46, ItemAwardIndex = 1},
                   {LevelStart=2,LevelEnd=3,TitleID = 47, ItemAwardIndex = 2},
                   {LevelStart=4,LevelEnd=20,TitleID = 48, ItemAwardIndex = 0},
                   {LevelStart=21,LevelEnd=50,TitleID = 49, ItemAwardIndex = 0},
                   {LevelStart=51,LevelEnd=100,TitleID = 50, ItemAwardIndex = 0}
            }
       } ,
	 }

                
function x310601_ProcEnumEvent(varMap, varPlayer, varTalknpc)

    local WeekDay = GetWeek()
    local Min = GetMinOfDay()
    if(WeekDay < 1 or WeekDay > 6) then
        return
    end
    if(WeekDay == 1 and Min < 60 ) then
        return
    end
    if(WeekDay == 6 and Min > 60*23 ) then
        return
    end

	if GetUpdateDBBeforeToggle()==1 or GetUpdateDBAfterToggle()==1 then
		return
	end	
    	
  local nTitleIndex = x310601_GetTitleIndex()
        
	TalkAppendButton(varMap,x310601_var_FileId,"领取上周挑战赛奖励\r",3,100)
end


function x310601_IsMultiChampion(nTitleIndex)
	
	if(nTitleIndex == 1 or nTitleIndex == 3 or nTitleIndex == 5 or nTitleIndex == 7 or nTitleIndex == 9 or nTitleIndex == 11 or nTitleIndex == 13 or nTitleIndex == 15) then
		return 1
	end
	return 0
end

--获取称号Id和对应的x310601_var_TopListItemAward表中的索引位置
function x310601_GetTitleIDAndItemKey(varMap, varPlayer)	
	local nTitleIndex = x310601_GetTitleIndex()
    local nTitleType = x310601_var_ToplistInfo[nTitleIndex].TitleClassID
    
	local nTitleRank = 1
	if x310601_IsMultiChampion(nTitleIndex) == 1 then
		nTitleRank = GetToplistRankEx(varMap,varPlayer,nTitleType) + 1
	else	
		nTitleRank = GetToplistRank(varMap,varPlayer,nTitleType) + 1
	end
    local TitleInfo = x310601_var_ToplistInfo[nTitleIndex].TitleInfo
    for varI, s in TitleInfo do
        if nTitleRank >= s.LevelStart and nTitleRank <= s.LevelEnd then
            return s.TitleID, s.ItemAwardIndex
        end
    end
    return -1, 0
end

function x310601_GetTitleIndex()	
	local nWeekIndex = GetWeekIndex() 
	local nTitleIndex = mod(nWeekIndex,16)
    if nTitleIndex == 0 then
        nTitleIndex = 16
    end
	nTitleIndex = nTitleIndex -1	
	if nTitleIndex == 0 then
		nTitleIndex = 16
	end

    return nTitleIndex
end

function x310601_ProcEventEntry(varMap, varPlayer, varTalknpc, varScript, varIndex)	
	local titleIndex = x310601_GetTitleIndex()
	
    local titleID = x310601_GetTitleIDAndItemKey(varMap, varPlayer, varTalknpc)

    StartTalkTask(varMap)
    
    local TitleDesc;
	local nLevel = GetLevel(varMap, varPlayer)
	local nExp = nLevel * 240000
    local sex = GetSex(varMap,varPlayer)
    local nTitleClassID = x310601_var_ToplistInfo[titleIndex].TitleClassID
	local TitleInfo = x310601_var_ToplistInfo[titleIndex].TitleInfo
	local TitleID = TitleInfo[1].TitleID
    local TitleBuffName = GetImpactNameByTitleID(TitleID)
	local TitleName = GetTitleNameByTitleID(TitleID, sex)
	local nTitleIndex = x310601_GetTitleIndex()
    local nTitleType = x310601_var_ToplistInfo[nTitleIndex].TitleClassID

	local nTitleRank = 1
	if x310601_IsMultiChampion(nTitleIndex) == 1 then
		nTitleRank = GetToplistRankEx(varMap,varPlayer,nTitleType) + 1
	else	
		nTitleRank = GetToplistRank(varMap,varPlayer,nTitleType) + 1
	end

   if nTitleRank <= 100 and nTitleRank > 0 then
    TitleDesc = "#Y领取上周赛事奖励\r\n\r\n#W上周进行的是#G"..x310601_var_ToplistInfo[titleIndex].ClassName.."挑战赛#W，目前正在颁奖。\r\n#W你在上周的比赛中获得了第#G"..nTitleRank.."#W名。\n您将会获得#G"..nExp.."#W点经验奖励，和以下额外奖励：\n\r\n"
   else
    TitleDesc = "#Y领取上周赛事奖励\r\n\r\n#W上周进行的是#G"..x310601_var_ToplistInfo[titleIndex].ClassName.."挑战赛#W，目前正在颁奖。\r\n#W你在上周的比赛中#G没有获得名次#W。\n如果您在上周比赛中取得名次将会获得#G"..nExp.."#W点经验奖励，和以下额外奖励：\n\r\n"
   end
    TitleDesc = TitleDesc.."#Y".."名次".."称号及属性".."\n"
    TitleDesc = TitleDesc.."#W".."1       #G"..TitleName.."#W："..TitleBuffName.."\r\n"

	TitleID = TitleInfo[2].TitleID
    TitleBuffName = GetImpactNameByTitleID(TitleID)
	TitleName = GetTitleNameByTitleID(TitleID, sex)
    TitleDesc = TitleDesc.."2~3     #G"..TitleName.."#W："..TitleBuffName.."\r\n"

	TitleID = TitleInfo[3].TitleID
    TitleBuffName = GetImpactNameByTitleID(TitleID)
	TitleName = GetTitleNameByTitleID(TitleID, sex)
    TitleDesc = TitleDesc.."4~20    #G"..TitleName.."#W："..TitleBuffName.."\r\n"

    TitleID = TitleInfo[4].TitleID
    TitleBuffName = GetImpactNameByTitleID(TitleID)
	TitleName = GetTitleNameByTitleID(TitleID, sex)
    TitleDesc = TitleDesc.."21~50   #G"..TitleName.."#W："..TitleBuffName.."\r\n"
    
    TitleID = TitleInfo[5].TitleID
    TitleBuffName = GetImpactNameByTitleID(TitleID)
	TitleName = GetTitleNameByTitleID(TitleID, sex)
    TitleDesc = TitleDesc.."51~100  #G"..TitleName.."#W："..TitleBuffName
    
    TalkAppendString(varMap,"#Y"..TitleDesc)
     
    StopTalkTask()
    DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310601_var_FileId,-1);
end


function x310601_ProcAccept( varMap, varPlayer, varTalknpc, varQuest, varIndex )
    local titleIndex = x310601_GetTitleIndex()
    local titleID, itemAwardKey = x310601_GetTitleIDAndItemKey(varMap, varPlayer)
    
    local varLevel = GetLevel(varMap, varPlayer)
    
    if titleID < 0 then
        
		Msg2Player(varMap,varPlayer,x310601_var_NotEnouth,8,2)
		StartTalkTask(varMap);
		TalkAppendString(varMap,x310601_var_NotEnouth);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
    elseif IsTitleActive(varMap, varPlayer, titleID) > 0 then
        
        Msg2Player(varMap,varPlayer,x310601_var_RepeatAward,8,2)
		StartTalkTask(varMap);
		TalkAppendString(varMap,x310601_var_RepeatAward);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
	else
         
    AwardTitle(varMap, varPlayer, titleID)
    
    local varExp = varLevel * 240000
    AddExp(varMap, varPlayer, varExp)  
        
		Msg2Player(varMap,varPlayer,x310601_var_SuccessAward,8,2)

		local sex = GetSex(varMap,varPlayer)
		local TitleName = GetTitleNameByTitleID(titleID, sex)
		local varMsg = "您获得了"..TitleName.."称号。"
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		varMsg = "您获得了"..varExp.."点经验。"
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		   
		StartTalkTask(varMap);
		TalkAppendString(varMap,x310601_var_SuccessAward);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		
		if (itemAwardKey ~= 0) then
    	local itemAwardTable
    	local itemAwards = x310601_var_TopListItemAward[itemAwardKey]	
    	if ( varLevel >= x310601_var_SeniorLevelRank ) then -- 高级玩家,获取高级道具
    		itemAwardTable = itemAwards.SeniorAwardTable
    	else
    		itemAwardTable = itemAwards.JuniorAwardTable
    	end
    	
    	local size = getn(itemAwardTable)
    	local itemIndex = random(1, size)
    	local item = itemAwardTable[itemIndex]
    	
    	StartItemTask(varMap)
			ItemAppendBind(varMap, item.ItemId, item.Count)
			if StopItemTask(varMap, varPlayer) <= 0 then
				Msg2Player(varMap, varPlayer, "背包已满", 8, 2)
				Msg2Player(varMap, varPlayer, "背包已满", 8, 3)
			else
		  	DeliverItemListSendToPlayer(varMap, varPlayer)
		  	local str =format("您获得了%d个@item_%d",item.Count, item.ItemId)
		  	Msg2Player(varMap, varPlayer, str, 8, 2)
				Msg2Player(varMap, varPlayer, str, 8, 3)
			end
    end
		
    end

    return 1
end
function x310601_ProcAcceptCheck( varMap, varPlayer, varTalknpc, varQuest, varIndex )
    return 1
end
function x310601_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest, varIndex )
    
end

	
