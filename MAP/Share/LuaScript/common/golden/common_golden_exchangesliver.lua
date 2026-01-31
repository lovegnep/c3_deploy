

--DECLARE_QUEST_INFO_START--

x800056_var_FileId = 800056







x800056_var_QuestName="兑换银票"

x800056_var_LevelLess	= 20
x800056_var_DayCountUntil = 50

x800056_var_ItemList = {11060001,11060002,11060003}

--DECLARE_QUEST_INFO_STOP--

x800056_var_GameId	= 1003






function x800056_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExt)	
	if GetGameOpenById(x800056_var_GameId)<=0 then
		x800056_ShowTips(varMap, varPlayer,"此模块已关闭")
		return
	end

	if varExt==nil then
		return
	end

	if varExt==0 then

		local nLevel = GetLevel( varMap, varPlayer)
		if nLevel<x800056_var_LevelLess then
			x800056_ShowTips(varMap, varPlayer,format("等级不足%d，无法使用该模块",x800056_var_LevelLess))
			return 0
		end

		if x800056_var_DayCountUntil>0 then

			
			if x800056_GetDayCount(varMap, varPlayer)>=x800056_var_DayCountUntil then
				x800056_ShowTips(varMap, varPlayer,format("您当天已经换满了%d张，无法再次换取",x800056_var_DayCountUntil))
				return 0
			end
			
		end

		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x800056_var_QuestName)
			TalkAppendString(varMap,"\t在我这里，你可以将银票兑换为银卡。等级越高，可以兑换的银票种类越多。银票可以在金币商店（快速键J）购买。每天可以允许兑换50张。")

			TalkAppendString(varMap,format("\t#Y  您今天还可以换取#G%d#Y张",x800056_var_DayCountUntil-x800056_GetDayCount(varMap, varPlayer)))
			if nLevel>=20 then
				TalkAppendButton(varMap, varQuest, "全部兑换",3,15);
				TalkAppendButton(varMap, varQuest, "我要用王国银票兑换",3,1);
			end
			if nLevel>=40 then
				TalkAppendButton(varMap, varQuest, "我要用大元银票兑换",3,5);
			end
			if nLevel>=60 then
				TalkAppendButton(varMap, varQuest, "我要用帝国银票兑换",3,10);
			end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc, x800056_var_FileId, varQuest);


	end

	if varExt==1 or varExt==5 or varExt==10 or varExt==15 then
		x800056_DispatchExchangeInfo( varMap, varPlayer, varTalknpc,varExt )
	end
end



function x800056_DispatchExchangeInfo( varMap, varPlayer, varTalknpc, varExt )
	if GetGameOpenById(x800056_var_GameId)<=0 then
		x800056_ShowTips(varMap, varPlayer,"此模块已关闭")
		return
	end

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x800056_var_QuestName)
		if varExt==1 then
			TalkAppendString(varMap,format("\t你要用#G王国银票#W换取%d两银卡吗？", varExt*18))
		elseif varExt==5 then
			TalkAppendString(varMap,format("\t你要用#G大元银票#W换取%d两银卡吗？", varExt*18))
		elseif varExt==10 then
			TalkAppendString(varMap,format("\t你要用#G帝国银票#W换取%d两银卡吗？", varExt*18))
		elseif varExt==15 then
			TalkAppendString(varMap,format("\t你要用背包中#G全部银票#W换取银卡吗？\n \n\t1张#G帝国银票#W=180两银卡\n\t1张#G大元银票#W=90两银卡\n\t1张#G王国银票#W=18两银卡\n \n\t将按照银票等级由高到低的优先顺序换取，每日银票换取数量上限为50张。"))
		else
			return
		end

		
		

		

	print(varExt)
	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x800056_var_FileId, -1);
	x800056_SetSelected(varMap, varPlayer, varExt)
end






function x800056_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
	if GetGameOpenById(x800056_var_GameId)<=0 then
		
		return
	end
	TalkAppendButton(varMap,x800056_var_FileId,x800056_var_QuestName,3,0);
end





function x800056_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	if GetGameOpenById(x800056_var_GameId)<=0 then
		x800056_ShowTips(varMap, varPlayer,"此模块已关闭")
		return 0
	end
		return 1
end




function x800056_ProcAccept( varMap, varPlayer )

	if GetGameOpenById(x800056_var_GameId)<=0 then
		x800056_ShowTips(varMap, varPlayer,"此模块已关闭")
		return
	end

	local nLevel = GetLevel( varMap, varPlayer)
	if nLevel<x800056_var_LevelLess then
		x800056_ShowTips(varMap, varPlayer,format("等级不足%d，无法使用该模块",x800056_var_LevelLess))
		return
	end

	if x800056_var_DayCountUntil>0 then
		if x800056_GetDayCount(varMap, varPlayer)>=x800056_var_DayCountUntil then
			x800056_ShowTips(varMap, varPlayer,format("您当天已经换满了%d张，无法再次换取",x800056_var_DayCountUntil))
			return
		end
		
	end

	local varExt = x800056_GetSelected(varMap, varPlayer)
	print(varExt)
	local nHaveCount = 0

	local varIndex = 0
	
	if varExt==1 then
		varIndex = 1;
	elseif varExt==5 then
		varIndex = 2;
	elseif varExt==10 then
		varIndex = 3;
	elseif varExt==15 then
		varIndex = 4;
	else
		return
	end
	
	local nHaveCount1 = GetItemCount( varMap, varPlayer, x800056_var_ItemList[1] )
	local nHaveCount2 = GetItemCount( varMap, varPlayer, x800056_var_ItemList[2] ) 
	local nHaveCount3 = GetItemCount( varMap, varPlayer, x800056_var_ItemList[3] )

	if varExt==15 then 
	
		nHaveCount = nHaveCount1
		
		if nLevel >= 40 then
			nHaveCount = nHaveCount1 + nHaveCount2
		end
		
		if nLevel >= 60 then
	 	nHaveCount = nHaveCount1 + nHaveCount2 + nHaveCount3
	 	end
	else
		nHaveCount = GetItemCount( varMap, varPlayer, x800056_var_ItemList[varIndex] )
	end

	if nHaveCount<1 then
		if varExt==1 then
			local varStr = format("背包中没有足够的#G@item_%d",x800056_var_ItemList[varIndex])
			x800056_ShowTips(varMap, varPlayer,varStr)
		elseif varExt==5 then
			local varStr = format("背包中没有足够的#G@item_%d",x800056_var_ItemList[varIndex])
			x800056_ShowTips(varMap, varPlayer,varStr)
		elseif varExt==10 then
			local varStr = format("背包中没有足够的#G@item_%d",x800056_var_ItemList[varIndex])
			x800056_ShowTips(varMap, varPlayer,varStr)
		elseif varExt==15 then
			x800056_ShowTips(varMap, varPlayer,"背包中没有可兑换的#G银票")
		else
			return
		end

		return
	end
	
	local varDelCount = 1
	
	if varExt==15 then 
		if nLevel >= 60 and nHaveCount3 > 0 then
			varExt = 10 
			varIndex = 3
			local nCanCount = x800056_var_DayCountUntil-x800056_GetDayCount(varMap, varPlayer)
			if nHaveCount3 < nCanCount then 
				varDelCount = nHaveCount3
				x800056_Addmoney(varMap, varPlayer, varExt,varIndex,varDelCount)
			else
				varDelCount = nCanCount
				x800056_Addmoney(varMap, varPlayer, varExt,varIndex,varDelCount)
				return
			end
		end
		if nLevel >= 40 and nHaveCount2 > 0 then 
			varExt = 5 
			varIndex = 2
			local nCanCount = x800056_var_DayCountUntil-x800056_GetDayCount(varMap, varPlayer)
			if nHaveCount2 < nCanCount then 
				varDelCount = nHaveCount2
				x800056_Addmoney(varMap, varPlayer, varExt,varIndex,varDelCount)
			else
				varDelCount = nCanCount
				x800056_Addmoney(varMap, varPlayer, varExt,varIndex,varDelCount)
				return
			end
		end
		if nLevel >= 20 and nHaveCount1 > 0 then 
			varExt = 1 
			varIndex =1
			local nCanCount = x800056_var_DayCountUntil-x800056_GetDayCount(varMap, varPlayer)
			if nHaveCount1 < nCanCount then 
				varDelCount = nHaveCount1
				x800056_Addmoney(varMap, varPlayer, varExt,varIndex,varDelCount)
			else
				varDelCount = nCanCount
				x800056_Addmoney(varMap, varPlayer, varExt,varIndex,varDelCount)
				return
			end
		end	
		
	else
		x800056_Addmoney(varMap, varPlayer, varExt,varIndex,varDelCount)
		
	end
end




function x800056_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x800056_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x800056_CheckSubmit( varMap, varPlayer )

end




function x800056_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x800056_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x800056_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x800056_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end

function x800056_ShowTips(varMap, varPlayer,varStr)
	
	StartTalkTask(varMap);
	TalkAppendString(varMap, varStr);
	StopTalkTask(varMap);

	DeliverTalkTips(varMap, varPlayer);
end




function x800056_GetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_XIANJIN2YINKA_DATE[1], MD_XIANJIN2YINKA_DATE[2],MD_XIANJIN2YINKA_DATE[3] );
	
	if varLastday ~= varToday then
		return 0
	end

	local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_XIANJIN2YINKA_DAYCOUNT[1], MD_XIANJIN2YINKA_DAYCOUNT[2],MD_XIANJIN2YINKA_DAYCOUNT[3] );
	return varDaycount;
end




function x800056_SetDayCount(varMap, varPlayer, varFlag)

	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_XIANJIN2YINKA_DATE[1], MD_XIANJIN2YINKA_DATE[2], MD_XIANJIN2YINKA_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_XIANJIN2YINKA_DATE[1], MD_XIANJIN2YINKA_DATE[2], MD_XIANJIN2YINKA_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_XIANJIN2YINKA_DAYCOUNT[1], MD_XIANJIN2YINKA_DAYCOUNT[2], MD_XIANJIN2YINKA_DAYCOUNT[3], varFlag)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_XIANJIN2YINKA_DAYCOUNT[1], MD_XIANJIN2YINKA_DAYCOUNT[2], MD_XIANJIN2YINKA_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_XIANJIN2YINKA_DAYCOUNT[1], MD_XIANJIN2YINKA_DAYCOUNT[2], MD_XIANJIN2YINKA_DAYCOUNT[3], varDaycount+varFlag)
	end
end





function x800056_GetSelected(varMap, varPlayer)
	local varFlag = GetPlayerGameData(varMap, varPlayer, MD_XIANJIN2YINKA_FLAG[1], MD_XIANJIN2YINKA_FLAG[2],MD_XIANJIN2YINKA_FLAG[3] )
	return varFlag
end





function x800056_SetSelected(varMap, varPlayer, varFlag)
	SetPlayerGameData(varMap, varPlayer, MD_XIANJIN2YINKA_FLAG[1], MD_XIANJIN2YINKA_FLAG[2], MD_XIANJIN2YINKA_FLAG[3], varFlag)
end


function x800056_Addmoney(varMap, varPlayer, varExt,varIndex,varDelCount)

	local nMoney1 = GetMoney(varMap, varPlayer, 1) 
	if(nMoney1+varExt*varDelCount*1000*18)>999999999 then
		x800056_ShowTips(varMap, varPlayer,"银卡已达上限")
		return
	end
	
	local	varRet = DelItem(varMap, varPlayer,x800056_var_ItemList[varIndex],varDelCount)

	if varRet<=0 then
		x800056_ShowTips(varMap, varPlayer,"使用物品失败")
		return
	end
	
	AddMoney(varMap, varPlayer, 1, varExt*varDelCount*1000*18)

	local varStr = format("你使用%d个#G@item_%d#o换取了%d两银卡",varDelCount,x800056_var_ItemList[varIndex], varExt*varDelCount*18 );

	x800056_ShowTips(varMap, varPlayer,varStr)

	Msg2Player(varMap, varPlayer, varStr, 4, 2);

	x800056_SetDayCount(varMap, varPlayer ,varDelCount)

	
	GamePlayScriptLog(varMap, varPlayer, 921)

	
	local myGuid = GetPlayerGUID( varMap,varPlayer )
	myGuid = format("%u",myGuid)
	local strName = GetName(varMap,varPlayer)
	local varDayCount = x800056_GetDayCount(varMap, varPlayer)
	local varMsg = "DHYP,"..myGuid..","..strName..","..varExt..","..varDayCount;

	WriteLog(1,varMsg)
end
