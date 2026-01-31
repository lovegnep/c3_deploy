




--DECLARE_QUEST_INFO_START--

x300806_var_QuestId 				= 	9417                    
x300806_var_FileId 					= 	300806                  
x300806_var_QuestKind 				= 	1                       
x300806_var_LevelLess					= 	75                      


x300806_var_QuestName				= 	"【个人】军需武备"
x300806_var_QuestTarget				= 	""          
x300806_var_QuestInfo				= 	"\t时下多事之秋，王国中有很多棘手的事情需要得力的人去做，我希望你能助上一臂之力。\n\t你是否要接受任务？"         
x300806_var_ContinueInfo				= 	"\t怎么？你连这些简单的任务都无法完成？看来我们要另外物色人选了。"  
x300806_var_QuestCompleted			= 	"\t你的表现让我很欣慰，希望你以后能够继续为我们的王国多做贡献！"  
x300806_var_QuestHelp				=	"\t军需武备任务每轮为#G30环#W子任务，环数越高，#G经验奖励#W也越高！\n\t军需武备中收集的物品，很多可以通过生活技能制作，或和其他玩家交易得来。"          


x300806_var_ExtTarget					=	{ {type=20,n=1,target="【个人】军需武备"}}



x300806_var_ExpBonus					= 	0;
x300806_var_BonusItem					=	{}	

x300806_var_BonusMoney1               = 	0
x300806_var_BonusMoney2               =   0
x300806_var_BonusMoney3               =   0

x300806_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--

x300806_var_GameId					=	1030
x300806_var_DayCountLimited			=	1


x300806_var_EnterTime					=	{                       
											{min=0*60+0,  max=23*60+59},
										}

x300806_var_MaxStep					=	30
x300806_var_ReplyNpcId				=	129173
x300806_var_ReplyNpcObjId				=	3


x300806_var_BaseBonusRate = {50000,52000,54000,56000,58000,60000,62000,64000,66000,68000}  
x300806_var_ExtraBonusRate = {1,1.6,2.9}  




x300806_var_QuestInfo2				= 	"\t现在世道纷乱，百姓处在水深火热之中，王国中的有识之士准备组织起来保境安民，但目前国中物资匮乏，急需补充。"
x300806_var_ContinueInfo2				= 	"\t这件物品着这么难以找到吗？"
x300806_var_QuestCompleted2			= 	"\t谢谢你的慷慨解囊。"
x300806_var_QuestHelp2					=	"\t军需武备任务每轮为#G30环#W子任务，环数越高，#G经验奖励#W也越高！\n\t军需武备中收集的物品，很多可以通过生活技能制作，或和其他玩家交易得来。"            

x300806_var_QuestTable2 =	{ 
							
 { varId=1, ncount=6,needitem={{varItem=11020080,varCount=5},{varItem=11020070,varCount=5},{varItem=11020050,varCount=5},{varItem=11020060,varCount=5},{varItem=11020030,varCount=5},{varItem=11020040,varCount=5}}},
 { varId=2, ncount=6,needitem={{varItem=11041010,varCount=5},{varItem=11041000,varCount=5},{varItem=11041020,varCount=5},{varItem=11041030,varCount=5},{varItem=11041040,varCount=5},{varItem=11041050,varCount=5}}},
 { varId=3, ncount=10,needitem={{varItem=12240003,varCount=1},{varItem=12240004,varCount=1},{varItem=12240005,varCount=1},{varItem=12240007,varCount=1},{varItem=12240008,varCount=1},{varItem=12240009,varCount=1},{varItem=12240010,varCount=1},{varItem=12240011,varCount=1},{varItem=12240012,varCount=1},{varItem=12240012,varCount=1}}},
 { varId=4, ncount=6,needitem={{varItem=11020080,varCount=5},{varItem=11020070,varCount=5},{varItem=11020050,varCount=5},{varItem=11020060,varCount=5},{varItem=11020030,varCount=5},{varItem=11020040,varCount=5}}},
 { varId=5, ncount=8,needitem={{varItem=12200600,varCount=1},{varItem=12200601,varCount=1},{varItem=12200602,varCount=1},{varItem=12200603,varCount=1},{varItem=12200604,varCount=1},{varItem=12200605,varCount=1},{varItem=12200606,varCount=1},{varItem=12200607,varCount=1}}},
 { varId=6, ncount=4,needitem={{varItem=11020071,varCount=5},{varItem=11020081,varCount=5},{varItem=11020051,varCount=5},{varItem=11020061,varCount=5}}},
 { varId=7, ncount=9,needitem={{varItem=12240003,varCount=1},{varItem=12240004,varCount=1},{varItem=12240005,varCount=1},{varItem=12240007,varCount=1},{varItem=12240008,varCount=1},{varItem=12240009,varCount=1},{varItem=12240010,varCount=1},{varItem=12240011,varCount=1},{varItem=12240012,varCount=1}}},
 { varId=8, ncount=5,needitem={{varItem=12052013,varCount=1},{varItem=12052023,varCount=1},{varItem=12052033,varCount=1},{varItem=12052043,varCount=1},{varItem=12052053,varCount=1}}},
 { varId=9, ncount=7,needitem={{varItem=11041032,varCount=2},{varItem=11041051,varCount=4},{varItem=11041052,varCount=2},{varItem=11041021,varCount=4},{varItem=11041022,varCount=4},{varItem=11041041,varCount=4},{varItem=11041042,varCount=2}}},
 { varId=10, ncount=9,needitem={{varItem=12240003,varCount=1},{varItem=12240004,varCount=1},{varItem=12240005,varCount=1},{varItem=12240007,varCount=1},{varItem=12240008,varCount=1},{varItem=12240009,varCount=1},{varItem=12240010,varCount=1},{varItem=12240011,varCount=1},{varItem=12240012,varCount=1}}},
 { varId=11, ncount=6,needitem={{varItem=11020071,varCount=12},{varItem=11020081,varCount=12},{varItem=11020051,varCount=12},{varItem=11020061,varCount=12},{varItem=11020031,varCount=12},{varItem=11020041,varCount=12}}},
 { varId=12, ncount=5,needitem={{varItem=12240002,varCount=2},{varItem=11000902,varCount=1},{varItem=12050091,varCount=2},{varItem=12050092,varCount=1},{varItem=12054300,varCount=1}}},
 { varId=13, ncount=7,needitem={{varItem=12200705,varCount=1},{varItem=12200704,varCount=1},{varItem=12200706,varCount=1},{varItem=12221812,varCount=1},{varItem=12223802,varCount=1},{varItem=12223800,varCount=1},{varItem=12223801,varCount=1}}},
 { varId=14, ncount=9,needitem={{varItem=12240003,varCount=5},{varItem=12240004,varCount=5},{varItem=12240005,varCount=5},{varItem=12240007,varCount=5},{varItem=12240008,varCount=5},{varItem=12240009,varCount=5},{varItem=12240010,varCount=5},{varItem=12240011,varCount=5},{varItem=12240012,varCount=5}}},
 { varId=15, ncount=11,needitem={{varItem=12221800,varCount=1},{varItem=12221801,varCount=1},{varItem=12221802,varCount=1},{varItem=12221803,varCount=1},{varItem=12221804,varCount=1},{varItem=12221805,varCount=1},{varItem=12222800,varCount=1},{varItem=12222801,varCount=1},{varItem=12222802,varCount=1},{varItem=12222803,varCount=1},{varItem=12222804,varCount=1}}},
 { varId=16, ncount=6,needitem={{varItem=11020082,varCount=20},{varItem=11020072,varCount=20},{varItem=11020052,varCount=20},{varItem=11020062,varCount=20},{varItem=11020032,varCount=20},{varItem=11020042,varCount=20}}},
 { varId=17, ncount=7,needitem={{varItem=14040003,varCount=1},{varItem=14010008,varCount=1},{varItem=14010003,varCount=1},{varItem=14010013,varCount=1},{varItem=14020003,varCount=1},{varItem=14020008,varCount=1},{varItem=14020013,varCount=1}}},
 { varId=18, ncount=6,needitem={{varItem=11041012,varCount=10},{varItem=11041002,varCount=10},{varItem=11041022,varCount=10},{varItem=11041032,varCount=10},{varItem=11041042,varCount=10},{varItem=11041052,varCount=10}}},
 { varId=19, ncount=7,needitem={{varItem=12200800,varCount=1},{varItem=12200808,varCount=1},{varItem=12200809,varCount=1},{varItem=12200810,varCount=1},{varItem=12210805,varCount=1},{varItem=12221816,varCount=1},{varItem=12223804,varCount=1}}},
 { varId=20, ncount=9,needitem={{varItem=12240003,varCount=5},{varItem=12240004,varCount=5},{varItem=12240005,varCount=5},{varItem=12240007,varCount=5},{varItem=12240008,varCount=5},{varItem=12240009,varCount=5},{varItem=12240010,varCount=5},{varItem=12240011,varCount=5},{varItem=12240012,varCount=5}}},
 { varId=21, ncount=7,needitem={{varItem=12200800,varCount=1},{varItem=12200808,varCount=1},{varItem=12200809,varCount=1},{varItem=12200810,varCount=1},{varItem=12210805,varCount=1},{varItem=12221816,varCount=1},{varItem=12223804,varCount=1}}},
 { varId=22, ncount=9,needitem={{varItem=12240007,varCount=7},{varItem=12240008,varCount=7},{varItem=12240009,varCount=7},{varItem=12240010,varCount=7},{varItem=12240011,varCount=7},{varItem=12240003,varCount=7},{varItem=12240004,varCount=7},{varItem=12240005,varCount=7},{varItem=12240010,varCount=7}}},
 { varId=23, ncount=8,needitem={{varItem=12240003,varCount=7},{varItem=12240004,varCount=7},{varItem=12240005,varCount=7},{varItem=12240007,varCount=7},{varItem=12240008,varCount=7},{varItem=12240009,varCount=7},{varItem=12240010,varCount=7},{varItem=12240011,varCount=7}}},
 { varId=24, ncount=6,needitem={{varItem=11020073,varCount=20},{varItem=11020083,varCount=20},{varItem=11020053,varCount=20},{varItem=11020063,varCount=20},{varItem=11020032,varCount=20},{varItem=11020042,varCount=20}}},
 { varId=25, ncount=3,needitem={{varItem=12041110,varCount=5},{varItem=12041111,varCount=5},{varItem=12041112,varCount=5}}},
 { varId=26, ncount=6,needitem={{varItem=11041003,varCount=10},{varItem=11041043,varCount=10},{varItem=11041013,varCount=10},{varItem=11041033,varCount=10},{varItem=11041023,varCount=10},{varItem=11041053,varCount=10}}},
 { varId=27, ncount=6,needitem={{varItem=11020073,varCount=20},{varItem=11020083,varCount=20},{varItem=11020053,varCount=20},{varItem=11020063,varCount=20},{varItem=11020032,varCount=20},{varItem=11020042,varCount=20}}},
 { varId=28, ncount=7,needitem={{varItem=14040003,varCount=1},{varItem=14010008,varCount=1},{varItem=14010003,varCount=1},{varItem=14010013,varCount=1},{varItem=14020003,varCount=1},{varItem=14020008,varCount=1},{varItem=14020013,varCount=1}}},
 { varId=29, ncount=8,needitem={{varItem=12240003,varCount=7},{varItem=12240004,varCount=7},{varItem=12240005,varCount=7},{varItem=12240007,varCount=7},{varItem=12240008,varCount=7},{varItem=12240009,varCount=7},{varItem=12240010,varCount=7},{varItem=12240011,varCount=7}}},
 { varId=30, ncount=4,needitem={{varItem=11020073,varCount=20},{varItem=11020083,varCount=20},{varItem=11020053,varCount=20},{varItem=11020063,varCount=20}}},
							}

x300806_ChangleToggleWorld = { } --哪几个World开放经验奖励双倍

function x300806_GetQuestId( varMap, varPlayer )
	return x300806_var_QuestId
end

function x300806_GetQuestStep(varMap, varPlayer)


    
	local nLastFlag = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3])
	if nLastFlag>=x300806_GetMaxStep(varMap,varPlayer) then
		nLastFlag = 0
	end
	return nLastFlag+1
	
end

function x300806_SaveQuestStep(varMap, varPlayer)

	local nLastFlag = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3])



	if nLastFlag<(x300806_GetMaxStep(varMap,varPlayer)-1) then
		
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3],nLastFlag+1)
		local varMyQuest = x300806_GetQuestId( varMap, varPlayer )	
		x300806_DispatchQuestInfo( varMap, varPlayer, x300806_var_ReplyNpcObjId, varMyQuest, 0 )
	else
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3],0)
		x300806_SetDayCount(varMap, varPlayer)
		
		if random( 1, 40000) <= 1 then
            StartItemTask( varMap)
            ItemAppend( varMap, 10310003, 1)
            local varRet = StopItemTask( varMap, varPlayer)
            if varRet > 0 then
                DeliverItemListSendToPlayer( varMap, varPlayer)
                local varMsg = format( "恭喜#R%s#cffcc00完成军需武备任务，幸运的获得了一个#G掌门牌：大三元(永不磨损)！", GetName( varMap, varPlayer) )
                LuaAllScenceM2Wrold (varMap, varMsg, 5, 1)
                Msg2Player( varMap, varPlayer, varMsg, 2, 0)
            else
                Msg2Player( varMap, varPlayer, "物品栏已满，无法得到物品", 8, 3)
            end
        end
		
	end
	
  
end

function x300806_ResetQuestStep(varMap, varPlayer)
	SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3],0)
end

function x300806_GetQuestTypeById(varStep)
	
	local varIndex =0
	for varI,item in x300806_var_QuestTable2 do
		varIndex = varIndex+1;
		if item.varId == varStep then
			return varIndex
		end
	end
end

function x300806_GetMaxStep(varMap,varPlayer)
	return x300806_var_MaxStep
end

function x300806_GetData(varMap, varPlayer)
	local varStep = x300806_GetQuestStep(varMap, varPlayer)
	local varIndex = x300806_GetQuestTypeById(varStep)
	local n1 = mod(varStep,10)
	local Toggle = x300806_CheckMissonToggle( varMap, varPlayer )
	

	local n2 = (varStep - mod(varStep,10))/10+1
	if n1==0 then
		n1 = 10
		
		n2 = (varStep - mod(varStep,10))/10
	end
	
	local nBaseBonusRate = x300806_var_BaseBonusRate[n1]  
	local nExtraBonusRate = x300806_var_ExtraBonusRate[n2] 
	local nLevel = GetLevel(varMap, varPlayer)
	local varExpBonus = nLevel*nBaseBonusRate*nExtraBonusRate

	varExpBonus = tonumber(format("%d",varExpBonus))
	if nLevel >= 80 and nLevel < 90 then
		if Toggle == 1 then 
			varExpBonus = varExpBonus*2
		else 
			varExpBonus = varExpBonus*1
		end
	elseif nLevel >= 90 and nLevel < 160 then 
		if Toggle == 1 then
	 		varExpBonus = varExpBonus*2.6
	 	else 	
	 	 	varExpBonus = varExpBonus*1.3
	 	end
	end
	return varStep,varIndex,varExpBonus
end

function x300806_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
--SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3],28)

	if GetGameOpenById(x300806_var_GameId)<=0 then
		return
	end

	if IsPlayerStateNormal(varMap,varPlayer ) <= 0 then
		return
	end

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x300806_var_LevelLess then
       return
    end

	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		TalkAppendButton(varMap, varMyQuest, x300806_var_QuestName,8,1);
		
	else
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varMyQuest);

		TalkAppendButton(varMap, varMyQuest, x300806_var_QuestName,varState,varState);

	end


	DeliverTalkMenu(varMap, varPlayer, varTalknpc)


	
end








function x300806_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	
	
	
	if GetGameOpenById(x300806_var_GameId)<=0 then
		x300806_ShowTips(varMap, varPlayer, "此活动未开启")
		return
	end

	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )	
	
	

	
	
	
		
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		if varExt~=30 then
		if x300806_GetDayCount(varMap, varPlayer) > 0 then
			x300806_ShowTips(varMap, varPlayer, "您已经完成本周军需武备任务，请下周再来接取本任务！")
			x300806_ResetQuestStep(varMap, varPlayer)
			return 0
		else
		x300806_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
		end
		else
			x300806_ShowTips(varMap, varPlayer, "你没有任务"..x300806_var_QuestName)
			return
		end
		
		
	else
		if varExt==7 then 
			x300806_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
			
		elseif varExt==30 then
			x300806_DispatchSongxinInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		else
			
			x300806_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		end
	end
	
end



function x300806_DispatchSongxinInfo( varMap, varPlayer, varTalknpc,varQuest )

end




function x300806_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )
	

	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300806_var_QuestName)
		
			
		TalkAppendString(varMap,x300806_var_QuestInfo)
		TalkAppendString(varMap," ")
			
		
					
		TalkAppendString( varMap,x300806_var_QuestTarget)
		

		
		if varExpBonus > 0 then
			AddQuestExpBonus( varMap, varExpBonus)
		end

		TalkAppendString( varMap,"#G小提示：#W\n\t军需武备任务每轮为#G30环#W子任务，环数越高，#G经验奖励#W也越高！\n\t军需武备中收集的物品，很多可以通过生活技能制作，或和其他玩家交易得来。")
	

	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300806_var_FileId, varQuest,0);
end





function x300806_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300806_var_QuestName)
		TalkAppendString(varMap," ")
		TalkAppendString(varMap,"\t您还没有完成本次任务，请赶快去完成吧！")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300806_var_FileId, varQuest,0);
	


end










function x300806_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)
	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300806_var_QuestName)
		TalkAppendString(varMap,"\t#Y@myname#W，感谢你所做出的贡献，相信在大家的共同努力下，我们的王国一定会更加强盛。")
	

	
	if varExpBonus > 0 then
		AddQuestExpBonus( varMap, varExpBonus)
	end

	
		
	StopTalkTask()
	
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300806_var_FileId, varQuest);

end


function x300806_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x300806_var_GameId)<=0 then
		
		return 0;
	end
	return 1;

end

function x300806_CheckRequest(varMap, varPlayer)
	if GetGameOpenById(x300806_var_GameId)<=0 then
		x300806_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0
	end


	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x300806_var_LevelLess then
		x300806_ShowTips(varMap, varPlayer, "您的等级不足，无法接取此任务")
		return 0
	end

	
	
	
	

	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x300806_ShowTips(varMap, varPlayer, "您已经接取了该任务，请先完成当前任务")
		return 0;
	end


	if x300806_var_DayCountLimited >0 then
		

		
		
		

		

		
		
		
		if x300806_GetDayCount(varMap, varPlayer) > 0 then
			x300806_ShowTips(varMap, varPlayer, "很抱歉，请下周再来接取本任务！")
			x300806_ResetQuestStep(varMap, varPlayer)
			return 0
		end
	end

	

	return 1;

end



function x300806_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	
	if x300806_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )
	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x300806_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
		return 0
	end
	
	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x300806_var_FileId, 1, 0, 1,1)
		
	if varRet > 0 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


		local nRandom = random(1,x300806_var_QuestTable2[varIndex].ncount)
		if nRandom < 1 then
			nRandom = 1
		elseif nRandom > x300806_var_QuestTable2[varIndex].ncount then
			nRandom = x300806_var_QuestTable2[varIndex].ncount
		end
		
		local varStr = "您接受了任务："..x300806_var_QuestName;
		x300806_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)
		
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, nRandom )
		

		x300806_ShowSubQuest( varMap, varPlayer, varTalknpc,varQuest,nRandom )

		x300806_CheckShoujiHaveAll(varMap, varPlayer, nRandom)

		GamePlayScriptLog(varMap, varPlayer, 1331)
		return 1
	else
		
		x300806_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end


function x300806_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x300806_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

    local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	

	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )
	if varRet>0 then

		local varStr = "您放弃了任务:"..x300806_var_QuestName;
	    x300806_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)

		x300806_SetDayCount(varMap, varPlayer)
		x300806_ResetQuestStep(varMap, varPlayer)
		GamePlayScriptLog(varMap, varPlayer,1333)
	else
		x300806_ShowTips(varMap, varPlayer, "放弃任务失败")
	end
end


function x300806_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest )
	
local nLastFlag = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3])
	
	if GetGameOpenById(x300806_var_GameId)<=0 then
		x300806_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end
	
	if nLastFlag >= (x300806_GetMaxStep(varMap,varPlayer)-1) then
		if GetBagSpace(varMap, varPlayer) < 1 then
			Msg2Player(varMap,varPlayer, "至少需要一个背包空间,才能完成此轮任务",8,3)
			return 0
		end	
	end

	
	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)
	
	if x300806_CheckSubmit(varMap, varPlayer )>0 then
		if x300806_SubmitShouji(varMap, varPlayer,varTalknpc)<=0 then
				return 0
			end
		
		local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then

			local varStr = "您完成了任务:"..x300806_var_QuestName;
			x300806_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

			
			
			x300806_GiveReward(varMap,varPlayer)

			x300806_SaveQuestStep(varMap, varPlayer)

			LuaCallNoclosure( 300806, "ProcEventEntry", varMap, varPlayer, varTalknpc, x300806_var_QuestId )	
			GamePlayScriptLog(varMap, varPlayer, 1332)
			
		else
			x300806_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end
end


function x300806_SubmitShouji(varMap, varPlayer,varTalknpc)
	
	
	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )



	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)
	
	
	local itemid_t = x300806_var_QuestTable2[varIndex].needitem[nRandom].varItem
	local count_t = x300806_var_QuestTable2[varIndex].needitem[nRandom].varCount

	
	if GetItemClass(itemid_t)~=10 then

		local varRet = DelItem(varMap, varPlayer,itemid_t,count_t)
		
		if varRet<=0 then
			x300806_ShowTips(varMap, varPlayer, "删除物品失败")
			
			return 0
		else
		
		end
	
	else
		
		
		
		local varItemCount = GetItemCount( varMap, varPlayer, itemid_t )
		
		StartGCDTask( varMap)
			GCDAppendInt( varMap, x300806_var_FileId)
			GCDAppendInt( varMap, varMyQuest)
			GCDAppendInt( varMap, varTalknpc)
			GCDAppendInt( varMap, itemid_t)
			
			
			DeliverGCDInfo( varMap, varPlayer, 106)  
		StopGCDTask( varMap)

		StartTalkTask( varMap)
		TalkAppendString( varMap, "#Y"..x300806_var_QuestName)
			TalkAppendString( varMap, "\t你需要选择上交一件完成本轮任务的所需物品" )
		StopTalkTask( varMap)
		DeliverTalkMenu( varMap, varPlayer, varTalknpc)

		

		return 0
	end

	return 1
end

function x300806_ProcComitSubmitItem(varMap, varPlayer,varBagIdx)

	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )

	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)
	
	if x300806_CheckSubmit(varMap, varPlayer )>0 then
		
		if EraseItem(varMap, varPlayer,varBagIdx)>0 then
			local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

			if varRet>0 then

				local varStr = "您完成了任务:"..x300806_var_QuestName;
				x300806_ShowTips(varMap, varPlayer, varStr)
				Msg2Player(varMap,varPlayer,varStr,8,2)

				
				
				x300806_GiveReward(varMap,varPlayer)

				x300806_SaveQuestStep(varMap, varPlayer)


				GamePlayScriptLog(varMap, varPlayer, 1332)
				
			else
				x300806_ShowTips(varMap, varPlayer, "交任务失败")
			end
		else
			x300806_ShowTips(varMap, varPlayer, "删除物品失败")
		end
		
	end
end



function x300806_GiveReward(varMap,varPlayer)
	
	if GetGameOpenById(x300806_var_GameId)<=0 then
		x300806_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end

	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)
	
	AddExp(varMap,varPlayer,varExpBonus)
	StartTalkTask(varMap);
	TalkAppendString(varMap, "#o您获得了#R经验"..varExpBonus.."点#o的奖励");
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap,varPlayer,"#o您完成了【个人】军需武备任务，获得了#R经验"..varExpBonus.."点#o的奖励",4,2)
	
	
end



function x300806_CheckSubmit(varMap, varPlayer )
	
	if GetGameOpenById(x300806_var_GameId)<=0 then
		x300806_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end

	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )


	

	if (varCompleted)<=0 then
		return 0
	end

	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)

		local itemid_t = x300806_var_QuestTable2[varIndex].needitem[nRandom].varItem
		local count_t = x300806_var_QuestTable2[varIndex].needitem[nRandom].varCount
		local varItemCount = GetItemCount( varMap, varPlayer, itemid_t )
		if varItemCount<count_t then
			return 0
		end
		

	return 1;
end









function x300806_ShowSubQuest( varMap, varPlayer, varTalknpc,varQuest, nRandom )


	
	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)

	

	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y"..x300806_var_QuestName)
	
		local str1 = "  收集"..x300806_var_QuestTable2[varIndex].needitem[nRandom].varCount.."个#G@itemid_"..x300806_var_QuestTable2[varIndex].needitem[nRandom].varItem.."\n"
		
		TalkAppendString(varMap,x300806_var_QuestInfo2)
		TalkAppendString( varMap,"\n#Y任务目标:")
		TalkAppendString(varMap,"#W"..str1)
	

	
	if varExpBonus > 0 then
		AddQuestExpBonus( varMap, varExpBonus)
	end

	

	StopTalkTask()

	DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end










function x300806_QuestLogRefresh( varMap, varPlayer, varQuest)
	
	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							x300806_GetQuestName(varMap,varPlayer),        
							x300806_GetQuestTask(varMap,varPlayer),		
							"@npc_"..x300806_GetReplyNpcId(varMap,varPlayer),			
							x300806_GetQuestMethod(varMap,varPlayer),               
							x300806_GetQuestText(varMap,varPlayer),	
							x300806_GetQuestHelp(varMap,varPlayer)					
							)

	
	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)

	if varExpBonus > 0 then
		AddQuestExpBonus( varMap, varExpBonus)
	end

	
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	

end

function x300806_GetQuestName(varMap,varPlayer)
	
	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)

	return x300806_var_QuestName..format("(%d/%d)",varStep,x300806_GetMaxStep(varMap,varPlayer));
end

function x300806_GetQuestTask(varMap,varPlayer)
	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	
	local value0 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local value7 = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)

	local str1=""

	

		local varId = x300806_var_QuestTable2[varIndex].needitem[nRandom].varItem
		local count_t = x300806_var_QuestTable2[varIndex].needitem[nRandom].varCount
		
		local strTail = format("(%d/%d)",value0,count_t)
		if value0>=count_t then
			strTail = "#G"..strTail
		else
			strTail = "#W"..strTail
		end
		str1 = str1.."  #W收集"..count_t.."个#G@itemid_"..varId..strTail
		

		return str1
	

	

	
end

function x300806_GetReplyNpcId(varMap,varPlayer)
	return x300806_var_ReplyNpcId;
end

function x300806_GetQuestMethod(varMap,varPlayer)
	

	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	local str1=""

		
		local varId = x300806_var_QuestTable2[varIndex].needitem[nRandom].varItem
		local count_t = x300806_var_QuestTable2[varIndex].needitem[nRandom].varCount
		
		str1 = str1.."  #W收集"..count_t.."个#G@itemid_"..varId
		

	return str1
end

function x300806_GetQuestText(varMap,varPlayer)
	
	

	return x300806_var_QuestInfo
end

function x300806_GetQuestHelp(varMap,varPlayer)
	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)
	
		return x300806_var_QuestHelp2
	
end



function x300806_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300806_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x300806_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)
	
end




function x300806_GetDayCount(varMap, varPlayer)

	local varToday = GetWeekIndex()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DATE_NV[1], MD_GUILD_CIRCLE_MISSION_DATE_NV[2],MD_GUILD_CIRCLE_MISSION_DATE_NV[3] )
	local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DAYCOUNT[1], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[2],MD_GUILD_CIRCLE_MISSION_DAYCOUNT[3] );

	if varToday == varLastday then
		return varDaycount 
	end
	
	return 0

end




function x300806_SetDayCount(varMap, varPlayer)

	local varToday = GetWeekIndex()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DATE_NV[1], MD_GUILD_CIRCLE_MISSION_DATE_NV[2],MD_GUILD_CIRCLE_MISSION_DATE_NV[3] );
	
	if varToday == varLastday then
			local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DAYCOUNT[1], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[2], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[3])
			SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DAYCOUNT[1], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[2], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[3], varDaycount+1)
		else
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DATE_NV[1], MD_GUILD_CIRCLE_MISSION_DATE_NV[2], MD_GUILD_CIRCLE_MISSION_DATE_NV[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DAYCOUNT[1], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[2], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[3], 1)
		end
end


	



function x300806_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return 1
end









function x300806_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest, nChangeType, varCount)

    local varMyQuest = x300806_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)


	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	local itemid_t	= x300806_var_QuestTable2[varIndex].needitem[nRandom].varItem
	local count_t	= x300806_var_QuestTable2[varIndex].needitem[nRandom].varCount
	if itemid_t==varItemData then
		local Num = GetItemCount( varMap, varPlayer, varItemData )

		if Num<count_t then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, Num )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
		else
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, count_t )
			
			local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )

			if varCompleted<=0 then
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
				
				
				
			end
		end
		
	end


	x300806_QuestLogRefresh( varMap, varPlayer, varMyQuest );

    
	
end

function x300806_CheckShoujiHaveAll(varMap, varPlayer, nRandom)
	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)


	local itemid_t = x300806_var_QuestTable2[varIndex].needitem[nRandom].varItem
	x300806_ProcQuestItemChanged( varMap, varPlayer,itemid_t, -1, -1, -1)
	
end

function x300806_ProcSelectSubmitItem( varMap, varPlayer , varBagIdx, nGuid_Serial, nGuid_Server, nGuid_World)

	if x300806_CheckSubmit(varMap, varPlayer )<=0 then
		return 0
	end

	local varMyQuest = x300806_GetQuestId( varMap, varPlayer )
	
	if IsHaveQuest( varMap, varPlayer, varMyQuest) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest)

	local varStep,varIndex,varExpBonus = x300806_GetData(varMap, varPlayer)
	


	

	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	local itemid_t = x300806_var_QuestTable2[varIndex].needitem[nRandom].varItem
	local count_t = x300806_var_QuestTable2[varIndex].needitem[nRandom].varCount

	if (CheckItemMatchInBag( varMap, varPlayer , varBagIdx, itemid_t,nGuid_Serial, nGuid_Server, nGuid_World))>0 then  
		x300806_ProcComitSubmitItem(varMap, varPlayer,varBagIdx)
	end
end



function x300806_ProcLeaveGuild(varMap, varPlayer, varQuest)

	
	
	
	
	
	
	
	
end

function x300806_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


--------------------------------------------------------------
-- 检测当前服务器是否开放
--------------------------------------------------------------
function x300806_CheckMissonToggle( varMap, varPlayer )
	local nToggle = 0		
		for i, item in x300806_ChangleToggleWorld do 
			if GetWorldIdEx() == item then
				nToggle = 1
				break
			end
		end
	return nToggle
end

