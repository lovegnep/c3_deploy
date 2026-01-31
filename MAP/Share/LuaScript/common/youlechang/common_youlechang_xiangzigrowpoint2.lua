

x310331_var_GrowpointId = 198 		
x310331_var_MinLevel = 20   	


x310331_var_QuestName="【个人】疯狂的宝箱"
x310331_var_QuestId = 9050
x310331_var_ItemNum = 1

x310331_var_ItemId = 12035000
x310331_var_ItemIndex =12035000
x310331_var_BossTypeTab ={17300,17301,17302,17303,17304,17305,17306,17307,17308,17309,17310,17311,17312}

function x310331_HaveAccepted(varMap, varPlayer)
	if IsHaveQuestNM( varMap, varPlayer, x310331_var_QuestId ) > 0 then
		return 1
	end
	return 0
end




function 	x310331_ProcGpCreate(varMap,growPointType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x310331_var_GrowpointId, varMap, 0, x310331_var_ItemIndex)
	SetGrowPointObjID(varMap,x310331_var_GrowpointId,varX, varY,varBoxId)
end




function	 x310331_ProcGpOpen(varMap,varPlayer,varTalknpc)
		
    return x310331_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x310331_var_GrowpointId, x310331_var_ItemIndex)	
end




function	 x310331_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x310331_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x310331_var_GrowpointId, x310331_var_ItemIndex )
end





function	x310331_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x310331_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end





function x310331_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310331_var_QuestId)
	if x310331_HaveAccepted(varMap, varPlayer) <= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您没有任务【个人】疯狂的宝箱。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return -31
	end
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"你已完成此任务")
        StopTalkTask(varMap)
        
        DeliverTalkTips(varMap,varPlayer)
		return -31
	end	
	    
	if GetLevel(varMap, varPlayer) < x310331_var_MinLevel then  		
		return -31
	end
	
  	
	return 0
	
	
end

function x310331_ShowTipsToAll(varMap, varStr)

	local varHumanCount = GetScenePlayerCount( varMap)
    if varHumanCount > 0 then
        for varI = 0, varHumanCount do
            local varObj = GetScenePlayerObjId( varMap,varI)
            if varObj >= 0 then
                Msg2Player(varMap, varObj, varStr, 0, 2)
            end
        end
    end
end

function x310331_GiveMainItem(varMap, varPlayer)
	StartItemTask( varMap)
	ItemAppend( varMap, x310331_var_ItemId, 1)
	if StopItemTask( varMap, varPlayer) <= 0 then
	    Msg2Player( varMap, varPlayer, "你的背包已满，无法获得道具奖励。", 8, 2)
	else
	    DeliverItemListSendToPlayer( varMap, varPlayer)
	end
end


function x310331_GiveExp( varMap, varPlayer)
	local rate = random(1,100)
	if rate == 100 then
		local varLevel = GetLevel(varMap,varPlayer)
		local bonusExp = 64800 * varLevel * 3
		AddExp(varMap,varPlayer,bonusExp)
		local varName = GetName(varMap,varPlayer)
		if varName == nil then
			varName = "ErrorName"
		end

		x310331_ShowTipsToAll(varMap, varName.."开出了高经验。")
		return 1
	elseif rate >= 75 then
		local varLevel = GetLevel(varMap,varPlayer)
		local bonusExp = 64800 * varLevel * 1.5
		AddExp(varMap,varPlayer,bonusExp)
		return 1
	else
		local varLevel = GetLevel(varMap,varPlayer)
		local bonusExp = 64800 * varLevel
		AddExp(varMap,varPlayer,bonusExp)
		return 1
	end
	return 0
end
function x310331_GiveItem( varMap, varPlayer)
	local bossRate = random(1,100)*random(1,100)
	if bossRate == 1 then   
		local ran = random(1,getn(x310331_var_BossTypeTab))
		local varX,z = GetWorldPos(varMap, varPlayer)
		CreateMonster(varMap, x310331_var_BossTypeTab[ran], varX, z, 1, -1, -1, -1, 21,-1, 0)
		
		local varName = GetName(varMap,varPlayer)
		if varName == nil then
			varName = "ErrorName"
		end
		x310331_ShowTipsToAll(varMap, varName.."在开启宝箱时放出了十八魔君！")
		return 0
	end
	
	local rate = random(1,100)
	local varItem = 12035010
	if rate <= 10 then
		varItem = 12035010
	elseif rate <= 20 then
		varItem = 12035011
	elseif rate <= 30 then
		varItem = 12035012
	elseif rate <= 40 then
		varItem = 12035013
	else
		Msg2Player(varMap, varPlayer, "这个宝箱里面什么也没有。", 0, 3)
		return 0
	end
	
	StartItemTask( varMap )
	ItemAppend( varMap, varItem, 1 )
	
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartTalkTask(varMap)
		local varMsg = format( "你获得了@item_%d。",varItem)
		TalkAppendString(varMap,varMsg)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		return 1
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，请整理背包！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return -1
	end	
		
		
	
	return 0
end


function x310331_CreateBoss( varMap, varPlayer)
	local varName = GetName(varMap,varPlayer)
	if varName == nil then
		varName = "ErrorName"
	end
	LuaAllScenceM2Wrold (varMap,varName.."打出了BOSS", 5, 1)
	return 1
end

function x310331_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
		
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x310331_var_QuestId)
	if GetBagSpace(varMap,varPlayer) <= 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，请整理背包！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	if x310331_GiveItem( varMap, varPlayer) ~= -1 then		
		local varNum = GetQuestParam( varMap,varPlayer,varQuestIdx,1)
		varNum = varNum + 1
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, varNum )
		if varNum >= 5 then
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1 )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
		end
	end
		LuaCallNoclosure( 310322, "ProcQuestLogRefresh", varMap, varPlayer, x310331_var_QuestId)
		return 1

end
