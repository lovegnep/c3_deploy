
x300617_var_ScritpId = 300617
x300617_var_QuestId = 7019
x300617_var_NeedLevel = 40
x300617_var_NeedGold = 10000
x300617_var_KillQuestId =  7012
x300617_var_Material_Thread = 13011010 
x300617_var_Material_Color =  13011011

x300617_var_AwardItemId = 13011012 


function x300617_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetLevel(varMap, varPlayer) < 40 then
		return
	end

	local haveAccept = IsHaveQuestNM( varMap, varPlayer, varQuest ) 
	if  haveAccept== 0 then	
		 TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, 8, -1 ) 
	end
end


function x300617_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
    if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	

		DeliverTalkAddQuestInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
	  
    else
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) > 0 then 
			QuestComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
		else
			QuestNotComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
		end
    end
end


function x300617_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
    if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		local ItemNumOnPlayer = GetItemCount( varMap, varPlayer, x300617_var_AwardItemId )
		if ItemNumOnPlayer > 0 then
			StartTalkTask(varMap);
			TalkAppendString(varMap, " 很抱歉，您身上有红绳了，不能再接任务了！");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"很抱歉，您身上有红绳了，不能再接任务了！",8,2)
			return
		end

		if GetSex(varMap, varPlayer) ~= 1 then
			StartTalkTask(varMap);
			TalkAppendString(varMap, "请让你心仪的男士来接取此任务！");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"请让你心仪的男士来接取此任务！",8,2)
			return
		end

        if  IsMarried(varMap, varPlayer) == 0  then 
            if GetLevel(varMap, varPlayer) >= x300617_var_NeedLevel then			
				local money = GetMoney( varMap, varPlayer, 0 )				
				if money >= x300617_var_NeedGold then
                    x300617_Accept( varMap, varPlayer, varQuest )
				else
					StartTalkTask(varMap);
					TalkAppendString(varMap, "很抱歉，您包裹中的现银不足10两，无法领取任务！");
					StopTalkTask(varMap);
					DeliverTalkTips(varMap,varPlayer);
					Msg2Player(varMap,varPlayer,"很抱歉，您包裹中的现银不足10两，无法领取任务！",8,2)
				end
            else
				StartTalkTask(varMap);
				TalkAppendString(varMap, "很抱歉，您的等级不到40级，无法接取此任务！");
				StopTalkTask(varMap);
				DeliverTalkTips(varMap,varPlayer);Msg2Player(varMap,varPlayer,"很抱歉，您的等级不到40级，无法接取此任务！",8,2)
				
            end
        else
				StartTalkTask(varMap);
				TalkAppendString(varMap, "您已经结婚了,无法接取任务！");
				StopTalkTask(varMap);
				DeliverTalkTips(varMap,varPlayer);
				Msg2Player(varMap,varPlayer,"很抱歉，您已是已婚人物，无法接取此任务！",8,2)
        end
    end
end


function x300617_Accept( varMap, varPlayer, varQuest )

	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, varQuest )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return -1
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return -1
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return -1
		end
	end

	local	varRet = AddQuestNM( varMap, varPlayer, varQuest ) 
	local varText = GetQuestNameNM( varMap, varPlayer, varQuest )
	
	varText = "您接受了任务：" .. varText
	if varRet == 0 then
		varText = "任务获取失败，添加失败"
	elseif varRet == -1 then
		varText = "背包已满,请整理后再来接任务"
	elseif varRet == -2 then
		varText = "任务已达到上限，无法接新的任务"
	elseif varRet == -3 then
		varText = "很抱歉，您包裹中的金钱不够，无法领取任务"
	else
		varText = "您接受了任务：【婚姻】寻找红绳。"
	end

	StartTalkTask(varMap);
	TalkAppendString(varMap, varText);
	StopTalkTask(varMap);
	DeliverTalkTips(varMap,varPlayer);
	Msg2Player(varMap,varPlayer,varText,4,2)

	return -1
end



function x300617_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )


	local varItemCount=0;
	local varItem=0;
	local ItemRand=0;
	local ItemDropNum=0;
	
	local NeedKilledNum, InstIndex, ObjName = GetQuestNeedKillObjInfoNM( varMap, varPlayer, varQuest, varObjData, varObj )
		if NeedKilledNum >= 0 then
			local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
			for varI = 0, KilledNum-1 do
				local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
				if humanObjId ~= -1 then
					if IsPlayerStateNormal(varMap, humanObjId) > 0 then
						if GetHp(varMap, humanObjId) > 0 then
							if IsHaveQuestNM( varMap, humanObjId, varQuest ) > 0 then	
								if InstIndex >= 0 then
									
									varItemCount, varItem, ItemRand, ItemDropNum = GetQuestItemNM( varMap, humanObjId, varQuest, InstIndex )
							
											
									if HaveItem( varMap, humanObjId, varItem ) ~= 1 then 
										StartItemTask(varMap)
										ItemAppend( varMap, varItem, ItemDropNum )
										local varRet = StopItemTask(varMap,humanObjId)
										if varRet > 0 then
											
											DeliverItemListSendToPlayer(varMap,humanObjId)
										else
											StartTalkTask(varMap)
											TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
											StopTalkTask(varMap)
											DeliverTalkTips(varMap,humanObjId)
										end
											
									  end
										
									
								end
							end

						end
					end
				end
			end
		end


end




function x300617_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
	
	
	if varQuest == nil or varQuest < 0 then
        return
    end
    
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) <= 0 then
		return
	end

	if IsPlayerStateNormal(varMap, varPlayer) == 0 then
		return 
	end

	if GetHp(varMap, varPlayer) <= 0 then
		return
	end

	local NeedNum, ObjIndex = GetQuestNeedItemNumNM( varMap, varPlayer, varQuest, varItemData )
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )

	if NeedNum > 0 then
		local Num = GetItemCount( varMap, varPlayer, varItemData )
		if Num < NeedNum then 
			StartTalkTask(varMap)
			local varText = format("已得到了@itemid_%d: %d/%d", varItemData, Num, NeedNum )
			if varText == nil then
				varText = "";
			end
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
   			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )         
		elseif Num == NeedNum then
			
			StartTalkTask(varMap)
			local varText = format( "已得到了@itemid_%d: %d/%d", varItemData, Num, NeedNum )
			if varText == nil then
				varText = "";
			end
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, ObjIndex, Num )         
		end
	end
		local varNum = 0
		for i = 0 , 1 do
			if GetQuestParam(varMap, varPlayer, varQuestIdx, i) >= 1 then
				varNum = varNum + 1
			end
		end
			if varNum == 2 then
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
			else
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
			end
		
	return 0
end


function x300617_QuestComplate( varMap, varPlayer, varQuest )
	local varRet = DelQuest( varMap, varPlayer, varQuest )

	if varRet > 0 then
		local varText = GetQuestNameNM( varMap, varPlayer, varQuest )
		varText = "您完成了任务：" .. varText
		StartTalkTask(varMap);
		TalkAppendString(varMap, varText);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player( varMap, varPlayer, varText, 4,2 )
	end
end



function x300617_ProcQuestAbandon( varMap, varPlayer, varQuest )
	local varRet = 0
	local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
	varRet = DelQuest( varMap, varPlayer, varQuest )
	if varRet == 1 then
	
		   if HaveItem(varMap, varPlayer, x300617_var_Material_Thread) > 0 then
		   		if DelItem(varMap, varPlayer, x300617_var_Material_Thread, 1) ~= 1 then return 0 end
		   end
		   
		   if HaveItem(varMap, varPlayer, x300617_var_Material_Color) > 0 then
		   		if DelItem(varMap, varPlayer, x300617_var_Material_Color, 1) ~= 1 then return 0 end
		   end

		local varText = GetQuestNameNM( varMap, varPlayer, varQuest )
		varText = "您放弃了任务：" .. varText
		StartTalkTask(varMap);
		TalkAppendString(varMap, varText);
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player( varMap, varPlayer, varText, 4,2 )
	else
		
		
	end
end

function x300617_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
		StartTalkTask(varMap);
		TalkAppendString(varMap, "请去找我的助理杜成双去制作红绳吧！");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player( varMap, varPlayer, "请去找我的助理杜成双去制作红绳吧！", 4,2 )
	end
end

function x300617_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return
	end
	

	local npcName = GetName( varMap, varTalknpc )
	if npcName == "" then	
		return
	end

	local guid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
	if guid ~= -1 then 
		if guid == varTalkNpcGUID then	
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
		end
	else
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
	end
end
