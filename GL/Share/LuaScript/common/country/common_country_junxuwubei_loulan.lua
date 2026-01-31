




--DECLARE_QUEST_INFO_START--

x300797_var_QuestId 				= 	9415                    
x300797_var_FileId 					= 	300797                  
x300797_var_QuestKind 				= 	1                       
x300797_var_LevelLess					= 	75                      


x300797_var_QuestName				= 	"【个人】军需武备"
x300797_var_QuestTarget				= 	""          
x300797_var_QuestInfo				= 	"\t时下多事之秋，王国中有很多棘手的事情需要得力的人去做，我希望你能助上一臂之力。\n\t你是否要接受任务？"         
x300797_var_ContinueInfo				= 	"\t怎么？你连这些简单的任务都无法完成？看来我们要另外物色人选了。"  
x300797_var_QuestCompleted			= 	"\t你的表现让我很欣慰，希望你以后能够继续为我们的王国多做贡献！"  
x300797_var_QuestHelp				=	"\t军需武备任务每轮为#G30环#W子任务，环数越高，#G经验奖励#W也越高！\n\t军需武备中收集的物品，很多可以通过生活技能制作，或和其他玩家交易得来。"          


x300797_var_ExtTarget					=	{ {type=20,n=1,target="【个人】军需武备"}}



x300797_var_ExpBonus					= 	0;
x300797_var_BonusItem					=	{}	

x300797_var_BonusMoney1               = 	0
x300797_var_BonusMoney2               =   0
x300797_var_BonusMoney3               =   0

x300797_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--

x300797_var_GameId					=	1030
x300797_var_DayCountLimited			=	1


x300797_var_EnterTime					=	{                       
											{min=0*60+0,  max=23*60+59},
										}

x300797_var_MaxStep					=	30
x300797_var_ReplyNpcId				=	123827
x300797_var_ReplyNpcObjId				=	3


x300797_var_BaseBonusRate = {50000,52000,54000,56000,58000,60000,62000,64000,66000,68000}  
x300797_var_ExtraBonusRate = {1,1.6,2.9}  




x300797_var_QuestInfo2				= 	"\t现在世道纷乱，百姓处在水深火热之中，王国中的有识之士准备组织起来保境安民，但目前国中物资匮乏，急需补充。"
x300797_var_ContinueInfo2				= 	"\t这件物品着这么难以找到吗？"
x300797_var_QuestCompleted2			= 	"\t谢谢你的慷慨解囊。"
x300797_var_QuestHelp2					=	"\t军需武备任务每轮为#G30环#W子任务，环数越高，#G经验奖励#W也越高！\n\t军需武备中收集的物品，很多可以通过生活技能制作，或和其他玩家交易得来。"            

x300797_var_QuestTable2 =	{ 
							
 { varId=1, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=2, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=3, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=4, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=5, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=6, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=7, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=8, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=9, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=10, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=11, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=12, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=13, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=14, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=15, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=16, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=17, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=18, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=19, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=20, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=21, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=22, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=23, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=24, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=25, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=26, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=27, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=28, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=29, ncount=1,needitem={{varItem=11990022,varCount=5}}},
 { varId=30, ncount=1,needitem={{varItem=11990022,varCount=5}}},
							}

x300797_ChangleToggleWorld = {} --哪几个World开放经验奖励双倍

function x300797_GetQuestId( varMap, varPlayer )
	return x300797_var_QuestId
end

function x300797_GetQuestStep(varMap, varPlayer)


    
	local nLastFlag = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3])
	if nLastFlag>=x300797_GetMaxStep(varMap,varPlayer) then
		nLastFlag = 0
	end
	return nLastFlag+1
	
end

function x300797_SaveQuestStep(varMap, varPlayer)

	local nLastFlag = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3])



	if nLastFlag<(x300797_GetMaxStep(varMap,varPlayer)-1) then
		
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3],nLastFlag+1)
		local varMyQuest = x300797_GetQuestId( varMap, varPlayer )	
		x300797_DispatchQuestInfo( varMap, varPlayer, x300797_var_ReplyNpcObjId, varMyQuest, 0 )
	else
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3],0)
		x300797_SetDayCount(varMap, varPlayer)
		
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

function x300797_ResetQuestStep(varMap, varPlayer)
	SetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3],0)
end

function x300797_GetQuestTypeById(varStep)
	
	local varIndex =0
	for varI,item in x300797_var_QuestTable2 do
		varIndex = varIndex+1;
		if item.varId == varStep then
			return varIndex
		end
	end
end

function x300797_GetMaxStep(varMap,varPlayer)
	return x300797_var_MaxStep
end

function x300797_GetData(varMap, varPlayer)
	local varStep = x300797_GetQuestStep(varMap, varPlayer)
	local varIndex = x300797_GetQuestTypeById(varStep)
	local n1 = mod(varStep,10)
	local Toggle = x300797_CheckMissonToggle( varMap, varPlayer )
	

	local n2 = (varStep - mod(varStep,10))/10+1
	if n1==0 then
		n1 = 10
		
		n2 = (varStep - mod(varStep,10))/10
	end
	
	local nBaseBonusRate = x300797_var_BaseBonusRate[n1]  
	local nExtraBonusRate = x300797_var_ExtraBonusRate[n2] 
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

function x300797_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetGameOpenById(x300797_var_GameId)<=0 then
		return
	end

	if IsPlayerStateNormal(varMap,varPlayer ) <= 0 then
		return
	end

	local varLevel = GetLevel( varMap,varPlayer )
    if varLevel < x300797_var_LevelLess then
       return
    end

	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )
	
	
	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		
		TalkAppendButton(varMap, varMyQuest, x300797_var_QuestName,8,1);
		
	else
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varMyQuest);

		TalkAppendButton(varMap, varMyQuest, x300797_var_QuestName,varState,varState);

	end


	DeliverTalkMenu(varMap, varPlayer, varTalknpc)


	
end








function x300797_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varExt )
	
	
	
	if GetGameOpenById(x300797_var_GameId)<=0 then
		x300797_ShowTips(varMap, varPlayer, "此活动未开启")
		return
	end

	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )	
	
	

	
	
	
		
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) == 0 then
		if varExt~=30 then
			if x300797_GetDayCount(varMap, varPlayer) > 0 then
			x300797_ShowTips(varMap, varPlayer, "您已经完成本周军需武备任务，请下周再来接取本任务！")
			x300797_ResetQuestStep(varMap, varPlayer)
			return 0
		else
		x300797_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varMyQuest, 0 )
		end
		else
			x300797_ShowTips(varMap, varPlayer, "你没有任务"..x300797_var_QuestName)
			return
		end
		
		
	else
		if varExt==7 then 
			x300797_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varMyQuest )
			
		elseif varExt==30 then
			x300797_DispatchSongxinInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		else
			
			x300797_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varMyQuest )
		end
	end
	
end



function x300797_DispatchSongxinInfo( varMap, varPlayer, varTalknpc,varQuest )

end




function x300797_DispatchQuestInfo( varMap, varPlayer, varTalknpc, varQuest, varExt )
	

	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300797_var_QuestName)
		
			
		TalkAppendString(varMap,x300797_var_QuestInfo)
		TalkAppendString(varMap," ")
			
		
					
		TalkAppendString( varMap,x300797_var_QuestTarget)
		

		
		if varExpBonus > 0 then
			AddQuestExpBonus( varMap, varExpBonus)
		end

		TalkAppendString( varMap,"#G小提示：#W\n\t军需武备任务每轮为#G30环#W子任务，环数越高，#G经验奖励#W也越高！\n\t军需武备中收集的物品，很多可以通过生活技能制作，或和其他玩家交易得来。")
	

	StopTalkTask()
	
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300797_var_FileId, varQuest,0);
end





function x300797_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )

	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	
	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300797_var_QuestName)
		TalkAppendString(varMap," ")
		TalkAppendString(varMap,"\t您还没有完成本次任务，请赶快去完成吧！")
	
		

	StopTalkTask()
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300797_var_FileId, varQuest,0);
	


end










function x300797_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)
	

	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x300797_var_QuestName)
		TalkAppendString(varMap,"\t#Y@myname#W，感谢你所做出的贡献，相信在大家的共同努力下，我们的王国一定会更加强盛。")
	

	
	if varExpBonus > 0 then
		AddQuestExpBonus( varMap, varExpBonus)
	end

	
		
	StopTalkTask()
	
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300797_var_FileId, varQuest);

end


function x300797_ProcAcceptCheck(varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x300797_var_GameId)<=0 then
		
		return 0;
	end
	return 1;

end

function x300797_CheckRequest(varMap, varPlayer)
	if GetGameOpenById(x300797_var_GameId)<=0 then
		x300797_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0
	end


	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )

	if GetLevel(varMap, varPlayer) <x300797_var_LevelLess then
		x300797_ShowTips(varMap, varPlayer, "您的等级不足，无法接取此任务")
		return 0
	end

	
	
	
	

	
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) > 0 then
		x300797_ShowTips(varMap, varPlayer, "您已经接取了该任务，请先完成当前任务")
		return 0;
	end


	if x300797_var_DayCountLimited >0 then
		

		
		
		

		

		
		
		
		if x300797_GetDayCount(varMap, varPlayer) > 0 then
			x300797_ShowTips(varMap, varPlayer, "很抱歉，请下周再来接取本任务！")
			x300797_ResetQuestStep(varMap, varPlayer)
			return 0
		end
	end

	

	return 1;

end



function x300797_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	
	if x300797_CheckRequest(varMap, varPlayer)<=0 then
		
		return 0;
	end

	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )
	
	local varFullQuest = IsQuestFullNM(varMap,varPlayer)
	
	if varFullQuest>0 then
		x300797_ShowTips(varMap, varPlayer, "任务已满，无法接受任务")
		return 0
	end
	
	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)

	local varRet = AddQuest( varMap, varPlayer, varMyQuest, x300797_var_FileId, 1, 0, 1,1)
		
	if varRet > 0 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


		local nRandom = random(1,x300797_var_QuestTable2[varIndex].ncount)
		if nRandom < 1 then
			nRandom = 1
		elseif nRandom > x300797_var_QuestTable2[varIndex].ncount then
			nRandom = x300797_var_QuestTable2[varIndex].ncount
		end
		
		local varStr = "您接受了任务："..x300797_var_QuestName;
		x300797_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)
		
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, nRandom )
		

		x300797_ShowSubQuest( varMap, varPlayer, varTalknpc,varQuest,nRandom )

		x300797_CheckShoujiHaveAll(varMap, varPlayer, nRandom)

		GamePlayScriptLog(varMap, varPlayer, 1331)
		return 1
	else
		
		x300797_ShowTips(varMap, varPlayer, "接受任务错误")
	
	end


end


function x300797_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x300797_ProcQuestAbandon( varMap, varPlayer, varQuest )

	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local value2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )

    local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	

	local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )
	if varRet>0 then

		local varStr = "您放弃了任务:"..x300797_var_QuestName;
	    x300797_ShowTips(varMap, varPlayer, varStr)
		Msg2Player(varMap,varPlayer,varStr,8,2)

		x300797_SetDayCount(varMap, varPlayer)
		x300797_ResetQuestStep(varMap, varPlayer)
		GamePlayScriptLog(varMap,varPlayer,1333)
	else
		x300797_ShowTips(varMap, varPlayer, "放弃任务失败")
	end
end


function x300797_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest )
	
local nLastFlag = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_CURRENT_ID[1], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[2], MD_GUILD_CIRCLE_MISSION_CURRENT_ID[3])
	
	if GetGameOpenById(x300797_var_GameId)<=0 then
		x300797_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end

	if nLastFlag >= (x300797_GetMaxStep(varMap,varPlayer)-1) then
		if GetBagSpace(varMap, varPlayer) < 1 then
			Msg2Player(varMap,varPlayer, "至少需要一个背包空间,才能完成此轮任务",8,3)
			return 0
		end
	end
	
	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )


	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)
	
	if x300797_CheckSubmit(varMap, varPlayer )>0 then
		if x300797_SubmitShouji(varMap, varPlayer,varTalknpc)<=0 then
				return 0
			end
		
		local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

		if varRet>0 then

			local varStr = "您完成了任务:"..x300797_var_QuestName;
			x300797_ShowTips(varMap, varPlayer, varStr)
			Msg2Player(varMap,varPlayer,varStr,8,2)

			
			
			x300797_GiveReward(varMap,varPlayer)

			x300797_SaveQuestStep(varMap, varPlayer)

			LuaCallNoclosure( 300797, "ProcEventEntry", varMap, varPlayer, varTalknpc, x300797_var_QuestId )	
			GamePlayScriptLog(varMap, varPlayer, 1332)
			
		else
			x300797_ShowTips(varMap, varPlayer, "交任务失败")
		end
		
	end
end


function x300797_SubmitShouji(varMap, varPlayer,varTalknpc)
	
	
	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )

	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )



	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)
	
	
	local itemid_t = x300797_var_QuestTable2[varIndex].needitem[nRandom].varItem
	local count_t = x300797_var_QuestTable2[varIndex].needitem[nRandom].varCount

	
	if GetItemClass(itemid_t)~=10 then

		local varRet = DelItem(varMap, varPlayer,itemid_t,count_t)
		
		if varRet<=0 then
			x300797_ShowTips(varMap, varPlayer, "删除物品失败")
			
			return 0
		else
		
		end
	
	else
		
		
		
		local varItemCount = GetItemCount( varMap, varPlayer, itemid_t )
		
		StartGCDTask( varMap)
			GCDAppendInt( varMap, x300797_var_FileId)
			GCDAppendInt( varMap, varMyQuest)
			GCDAppendInt( varMap, varTalknpc)
			GCDAppendInt( varMap, itemid_t)
			
			
			DeliverGCDInfo( varMap, varPlayer, 106)  
		StopGCDTask( varMap)

		StartTalkTask( varMap)
		TalkAppendString( varMap, "#Y"..x300797_var_QuestName)
			TalkAppendString( varMap, "\t你需要选择上交一件完成本轮任务的所需物品" )
		StopTalkTask( varMap)
		DeliverTalkMenu( varMap, varPlayer, varTalknpc)

		

		return 0
	end

	return 1
end

function x300797_ProcComitSubmitItem(varMap, varPlayer,varBagIdx)

	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )

	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)
	
	if x300797_CheckSubmit(varMap, varPlayer )>0 then
		
		if EraseItem(varMap, varPlayer,varBagIdx)>0 then
			local varRet = DelQuestNM( varMap, varPlayer, varMyQuest )

			if varRet>0 then

				local varStr = "您完成了任务:"..x300797_var_QuestName;
				x300797_ShowTips(varMap, varPlayer, varStr)
				Msg2Player(varMap,varPlayer,varStr,8,2)

				
				
				x300797_GiveReward(varMap,varPlayer)

				x300797_SaveQuestStep(varMap, varPlayer)


				GamePlayScriptLog(varMap, varPlayer, 1332)
				
			else
				x300797_ShowTips(varMap, varPlayer, "交任务失败")
			end
		else
			x300797_ShowTips(varMap, varPlayer, "删除物品失败")
		end
		
	end
end



function x300797_GiveReward(varMap,varPlayer)
	
	if GetGameOpenById(x300797_var_GameId)<=0 then
		x300797_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end

	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)
	
	AddExp(varMap,varPlayer,varExpBonus)
	StartTalkTask(varMap);
	TalkAppendString(varMap, "#o您获得了#R经验"..varExpBonus.."点#o的奖励");
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap,varPlayer,"#o您完成了【个人】军需武备任务，获得了#R经验"..varExpBonus.."点#o的奖励",4,2)
	
	
end



function x300797_CheckSubmit(varMap, varPlayer )
	
	if GetGameOpenById(x300797_var_GameId)<=0 then
		x300797_ShowTips(varMap, varPlayer, "此活动未开启")
		return 0;
	end

	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local varCompleted = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )


	

	if (varCompleted)<=0 then
		return 0
	end

	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)

		local itemid_t = x300797_var_QuestTable2[varIndex].needitem[nRandom].varItem
		local count_t = x300797_var_QuestTable2[varIndex].needitem[nRandom].varCount
		local varItemCount = GetItemCount( varMap, varPlayer, itemid_t )
		if varItemCount<count_t then
			return 0
		end
		

	return 1;
end









function x300797_ShowSubQuest( varMap, varPlayer, varTalknpc,varQuest, nRandom )


	
	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end

	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)

	

	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y"..x300797_var_QuestName)
	
		local str1 = "  收集"..x300797_var_QuestTable2[varIndex].needitem[nRandom].varCount.."个#G@itemid_"..x300797_var_QuestTable2[varIndex].needitem[nRandom].varItem.."\n"
		
		TalkAppendString(varMap,x300797_var_QuestInfo2)
		TalkAppendString( varMap,"\n#Y任务目标:")
		TalkAppendString(varMap,"#W"..str1)
	

	
	if varExpBonus > 0 then
		AddQuestExpBonus( varMap, varExpBonus)
	end

	

	StopTalkTask()

	DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end










function x300797_QuestLogRefresh( varMap, varPlayer, varQuest)
	
	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )
	if IsHaveQuestNM( varMap, varPlayer, varMyQuest ) <= 0 then	
		return 0
	end
		
	StartTalkTask(varMap)	
			
		
	AddQuestLogCustomText( varMap,
							"",						
							x300797_GetQuestName(varMap,varPlayer),        
							x300797_GetQuestTask(varMap,varPlayer),		
							"@npc_"..x300797_GetReplyNpcId(varMap,varPlayer),			
							x300797_GetQuestMethod(varMap,varPlayer),               
							x300797_GetQuestText(varMap,varPlayer),	
							x300797_GetQuestHelp(varMap,varPlayer)					
							)

	
	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)

	if varExpBonus > 0 then
		AddQuestExpBonus( varMap, varExpBonus)
	end

	
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	

end

function x300797_GetQuestName(varMap,varPlayer)
	
	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)

	return x300797_var_QuestName..format("(%d/%d)",varStep,x300797_GetMaxStep(varMap,varPlayer));
end

function x300797_GetQuestTask(varMap,varPlayer)
	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )
	
	local value0 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local value7 = GetQuestParam( varMap, varPlayer, varQuestIdx, 7 )
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)

	local str1=""

	

		local varId = x300797_var_QuestTable2[varIndex].needitem[nRandom].varItem
		local count_t = x300797_var_QuestTable2[varIndex].needitem[nRandom].varCount
		
		local strTail = format("(%d/%d)",value0,count_t)
		if value0>=count_t then
			strTail = "#G"..strTail
		else
			strTail = "#W"..strTail
		end
		str1 = str1.."  #W收集"..count_t.."个#G@itemid_"..varId..strTail
		

		return str1
	

	

	
end

function x300797_GetReplyNpcId(varMap,varPlayer)
	return x300797_var_ReplyNpcId;
end

function x300797_GetQuestMethod(varMap,varPlayer)
	

	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	local str1=""

		
		local varId = x300797_var_QuestTable2[varIndex].needitem[nRandom].varItem
		local count_t = x300797_var_QuestTable2[varIndex].needitem[nRandom].varCount
		
		str1 = str1.."  #W收集"..count_t.."个#G@itemid_"..varId
		

	return str1
end

function x300797_GetQuestText(varMap,varPlayer)
	
	

	return x300797_var_QuestInfo
end

function x300797_GetQuestHelp(varMap,varPlayer)
	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)
	
		return x300797_var_QuestHelp2
	
end



function x300797_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	
	x300797_QuestLogRefresh( varMap, varPlayer, varQuest );
end


function x300797_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local value1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )

	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)
	
end




function x300797_GetDayCount(varMap, varPlayer)

	local varToday = GetWeekIndex()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DATE_NV[1], MD_GUILD_CIRCLE_MISSION_DATE_NV[2],MD_GUILD_CIRCLE_MISSION_DATE_NV[3] )
	local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_GUILD_CIRCLE_MISSION_DAYCOUNT[1], MD_GUILD_CIRCLE_MISSION_DAYCOUNT[2],MD_GUILD_CIRCLE_MISSION_DAYCOUNT[3] );

	if varToday == varLastday then
		return varDaycount 
	end
	
	return 0

end




function x300797_SetDayCount(varMap, varPlayer)

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


	



function x300797_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return 1
end









function x300797_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest, nChangeType, varCount)

    local varMyQuest = x300797_GetQuestId( varMap, varPlayer )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest )

	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)


	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	local itemid_t	= x300797_var_QuestTable2[varIndex].needitem[nRandom].varItem
	local count_t	= x300797_var_QuestTable2[varIndex].needitem[nRandom].varCount
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


	x300797_QuestLogRefresh( varMap, varPlayer, varMyQuest );

    
	
end

function x300797_CheckShoujiHaveAll(varMap, varPlayer, nRandom)
	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)


	local itemid_t = x300797_var_QuestTable2[varIndex].needitem[nRandom].varItem
	x300797_ProcQuestItemChanged( varMap, varPlayer,itemid_t, -1, -1, -1)
	
end

function x300797_ProcSelectSubmitItem( varMap, varPlayer , varBagIdx, nGuid_Serial, nGuid_Server, nGuid_World)

	if x300797_CheckSubmit(varMap, varPlayer )<=0 then
		return 0
	end

	local varMyQuest = x300797_GetQuestId( varMap, varPlayer )
	
	if IsHaveQuest( varMap, varPlayer, varMyQuest) <= 0 then
        return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varMyQuest)

	local varStep,varIndex,varExpBonus = x300797_GetData(varMap, varPlayer)
	


	

	local nRandom = GetQuestParam( varMap, varPlayer, varQuestIdx, 6 )
	
	local itemid_t = x300797_var_QuestTable2[varIndex].needitem[nRandom].varItem
	local count_t = x300797_var_QuestTable2[varIndex].needitem[nRandom].varCount

	if (CheckItemMatchInBag( varMap, varPlayer , varBagIdx, itemid_t,nGuid_Serial, nGuid_Server, nGuid_World))>0 then  
		x300797_ProcComitSubmitItem(varMap, varPlayer,varBagIdx)
	end
end



function x300797_ProcLeaveGuild(varMap, varPlayer, varQuest)

	
	
	
	
	
	
	
	
end

function x300797_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


--------------------------------------------------------------
-- 检测当前服务器是否开放
--------------------------------------------------------------
function x300797_CheckMissonToggle( varMap, varPlayer )
	local nToggle = 0		
		for i, item in x300797_ChangleToggleWorld do 
			if GetWorldIdEx() == item then
				nToggle = 1
				break
			end
		end
	return nToggle
end

