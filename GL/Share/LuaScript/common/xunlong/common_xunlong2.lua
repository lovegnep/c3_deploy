
x310054_var_ScritpId = 310054



function x310054_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

end

function x310054_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )

end


function x310054_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
    
end


function x310054_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )


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
										StartItemTask(varMap)
										ItemAppend( varMap, varItem, ItemDropNum )
										local varRet = StopItemTask(varMap,humanObjId)
										if varRet > 0 then
											
											DeliverItemListSendToPlayer(varMap,humanObjId)

											
											StartTalkTask(varMap)
											local varText = format( "#Y已完成获得物品#G#{_ITEM%d}#Y: %d/%d", varItem, 1, 1 )
											
											TalkAppendString( varMap, varText )
											StopTalkTask( varMap )
											DeliverTalkTips( varMap, humanObjId )
											DelQuest(varMap, humanObjId, varQuest)
											GamePlayScriptLog(varMap, humanObjId, 542)

										else
											StartTalkTask(varMap)
											TalkAppendString(varMap,"背包已满，无法获得任务物品")
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




function x310054_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )

end


function x310054_ProcQuestAbandon( varMap, varPlayer, varQuest )
	local varRet = 0
	local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
	varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		local varStr = "您放弃了任务：%s"

		local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
		local message = format(varStr, varQuestName);
		StartTalkTask(varMap);
		TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message, 4, 2)
	else
		
		
	end
end

function x310054_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	
end

function x310054_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	
end

function x310054_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )	
	local varStr;
	varStr = GetQuestNameNM(varMap, varPlayer, varQuest);
	local target;

	if varQuest == 8054 then
		target = "  消灭@npc_43004"
	elseif varQuest == 8055 then
		target = "  消灭@npc_44002"
	elseif varQuest == 8056 then
		target = "  消灭@npc_44006"
	elseif varQuest == 8057 then
		target = "  消灭@npc_45001"
	elseif varQuest == 8058 then
		target = "  消灭@npc_45002"
	elseif varQuest ==8059 then
		target = "  消灭@npc_45006"
	end


    StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "",                    
                                varStr,                 
                                target,               
                                "无",                         
                                "",                   
                                "",                
                                ""        
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);

end
