
--DECLARE_QUEST_INFO_START--
x301457_var_GatherPointTypeId = 101 
x301457_var_ItemId = 13011604 
x301457_var_BufIndex = 7600
x301457_var_GroupPoint	=	{ {type=10,varId =101,target = "丹木"}}
--DECLARE_QUEST_INFO_STOP--

x301457_var_Growpointlevel = {
							{varQuest = 7006, varLevel = 60,itmID =13011005,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7011, varLevel = 75,itmID =13011602,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7012, varLevel = 85,itmID =13011604,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7746, varLevel = 95,itmID =13011605,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7747, varLevel = 105,itmID =13011606,varNeedItemCount = 5,varCollNum = 1},							
							{varQuest = 7780, varLevel = 115,itmID =13011607,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7820, varLevel = 125,itmID =13011608,varNeedItemCount = 5,varCollNum = 1},							
							{varQuest = 7013, varLevel = 60,itmID =13011005,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7014, varLevel = 75,itmID =13011602,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7015, varLevel = 85,itmID =13011604,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7748, varLevel = 95,itmID =13011605,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7749, varLevel = 105,itmID =13011606,varNeedItemCount = 5,varCollNum = 1},							
							{varQuest = 7781, varLevel = 115,itmID =13011607,varNeedItemCount = 5,varCollNum = 1},	
							{varQuest = 7821, varLevel = 125,itmID =13011608,varNeedItemCount = 5,varCollNum = 1},		
							{varQuest = 7698, varLevel = 60,itmID =13011005,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7699, varLevel = 75,itmID =13011602,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7700, varLevel = 85,itmID =13011604,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7750, varLevel = 95,itmID =13011605,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7751, varLevel = 105,itmID =13011606,varNeedItemCount = 5,varCollNum = 1},							
							{varQuest = 7782, varLevel = 115,itmID =13011607,varNeedItemCount = 5,varCollNum = 1},		
							{varQuest = 7822, varLevel = 125,itmID =13011608,varNeedItemCount = 5,varCollNum = 1},									
							{varQuest = 7701, varLevel = 60,itmID =13011005,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7702, varLevel = 75,itmID =13011602,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7703, varLevel = 85,itmID =13011604,varNeedItemCount = 5,varCollNum = 1},						
							{varQuest = 7752, varLevel = 95,itmID =13011605,varNeedItemCount = 5,varCollNum = 1},
							{varQuest = 7753, varLevel = 105,itmID =13011606,varNeedItemCount = 5,varCollNum = 1},	
							{varQuest = 7783, varLevel = 115,itmID =13011607,varNeedItemCount = 5,varCollNum = 1},	
							{varQuest = 7823, varLevel = 125,itmID =13011608,varNeedItemCount = 5,varCollNum = 1},														
		}                                         

x310457_var_GrowpointPos = {
							{posx1=146, posz1=59,posx2=217, posz2=206,posx3=215, posz3=168,
							},							
		}		


function 	x301457_ProcGpCreate(varMap,varGpType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x301457_var_GatherPointTypeId, varMap, 0, x301457_var_ItemId)
	SetGrowPointObjID(varMap,x301457_var_GatherPointTypeId,varX, varY,varBoxId)
end




function	 x301457_ProcGpOpen(varMap,varPlayer,varTalknpc)
	return x301457_ProcGpOpenItemBox(varMap, varPlayer, varTalknpc, x301457_var_GatherPointTypeId, x301457_var_ItemId)
	
end




function	 x301457_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return   x301457_ProcGuildRecycle( varMap, varPlayer, varTalknpc, x301457_var_GatherPointTypeId, x301457_var_ItemId )
	
end





function	x301457_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver", varMap, varPlayer, varTalknpc )
end




function x301457_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, -1 )
end





function x301457_GetQuestDesc(varMap, varPlayer)
	for varI,itm in x301457_var_Growpointlevel do
		if IsHaveQuestNM(varMap, varPlayer,itm.varQuest ) > 0 then		
			return itm
		end
	end
	return nil
end

function x301457_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )	
	local varQuestDesc = x301457_GetQuestDesc(varMap, varPlayer)
	if varQuestDesc == nil then
		Msg2Player(varMap,varPlayer,"很抱歉，您没有【帮会】帮会图腾任务，无法采集",8,2)
		Msg2Player(varMap,varPlayer,"很抱歉，您没有【帮会】帮会图腾任务，无法采集",8,3)
		return 1
	end
	local varQuest = varQuestDesc.varQuest
	local varNeedItemCount = varQuestDesc.varNeedItemCount
	local varCollNum = varQuestDesc.varCollNum 
	local varNeedItem = varQuestDesc.itmID
	local varItemCountNow = GetItemCount( varMap, varPlayer, varNeedItem )
		if varItemCountNow >= varNeedItemCount then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"物品已经收集齐全")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 1
	end
	
	if varQuest == -1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您没有任务");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,"很抱歉，您没有任务",8,2)
		return 0 
	end
	
	if IsQuestHaveDoneNM( varMap, varPlayer, varQuestDesc.varQuest ) > 0 then 
		return 1
	end
	
	local varLevel = GetLevel(varMap,varPlayer)
	if varMap == 5 and varLevel >50 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您的等级过高")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"很抱歉，您的等级高于本地图，请去更高等级的地图完成任务。",8,2)
		return 1
	end
	if varMap == 6 and varLevel >55 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您的等级过高")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"很抱歉，您的等级高于本地图，请去更高等级的地图完成任务。",8,2)
		return 1
	end	
	if varMap == 7 and varLevel >60 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"您的等级过高")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"很抱歉，您的等级高于本地图，请去更高等级的地图完成任务。",8,2)
		return 1
	end	
end

function x301457_ProcGuildRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	local varQuestDesc = x301457_GetQuestDesc(varMap, varPlayer)
	if varQuestDesc == nil then
		return 1
	end
	local varQuest = varQuestDesc.varQuest
	local varNeedItemCount = varQuestDesc.varNeedItemCount
	local varCollNum = varQuestDesc.varCollNum 
	local varNeedItem = varQuestDesc.itmID
	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel <=  60 then
		if varMap == 6 then
			 local varRet = random(1,80000)
			 if varRet <= 10 then 
					local varName = GetName(varMap,varPlayer)
					local varMsg1 = "由于"..varName.."在收集图腾时触发了天变，蔡州城附近出现天龙之魂"
					LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_PLANE_SCROLL, 1)
					LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_LEFTDOWN, 1)
					LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
					CreateMonster(varMap,3059,x310457_var_GrowpointPos[1].posx1, x310457_var_GrowpointPos[1].posz1, 16,-1, -1,13079463,21,1000 * 60 *15 )
					CreateMonster(varMap,3059,x310457_var_GrowpointPos[1].posx2, x310457_var_GrowpointPos[1].posz2, 16,-1, -1,13079463,21,1000 * 60 *15 )
					CreateMonster(varMap,3059,x310457_var_GrowpointPos[1].posx3, x310457_var_GrowpointPos[1].posz3, 16,-1, -1,13079463,21,1000 * 60 *15 )
					
					
					
					
					
					
			 	    return 1
				end                                                                                   

		end
	
		local varItemCountNow = GetItemCount( varMap, varPlayer, varNeedItem )
		local varItemAdd = varNeedItemCount - varItemCountNow
		varItemAdd = random(varItemAdd)
		if varItemAdd < varCollNum then
			varItemAdd = varCollNum
		end

		StartItemTask( varMap )
		ItemAppend( varMap, varNeedItem, varItemAdd )
		local varRet = StopItemTask( varMap, varPlayer )
		if varRet > 0 then
			 DeliverItemListSendToPlayer(varMap,varPlayer)
			 return 1
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"无法得到采集物品，请整理背包！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return 0
		end
	end
    return 0
end



