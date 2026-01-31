


--DECLARE_QUEST_INFO_START--
x300681_var_FileId         		= 300681
x300681_var_QuestName          	= "【帮会】战神之力"
x300681_var_BuffCriName          	= "【帮会】增加战神之怒"
x300681_var_BuffTenName          	= "【帮会】增加战神之护"
x300681_var_Leader_Index      	= 5


x300681_var_Guild_Camp_A          = 5
x300681_var_Guild_Camp_B          = 6


x300681_var_NpcIDA      			= 150015
x300681_var_NpcIDB     			= 150014
x300681_var_BuffCriImpactID     	= 8862
x300681_var_BuffTenImpactID     	= 8861

x300681_var_GuildNotify    		= "帮会获得了战神之力"

x300681_var_PointNotEnough    	= "战场资源不足"


x300681_var_Guild_BufResPoint     = 60  

function x300681_GetNPCCamp(varMap, varPlayer, varTalknpc)
	if varTalknpc == x300681_var_NpcIDA then
		return x300681_var_Guild_Camp_A
	elseif varTalknpc == x300681_var_NpcIDB then
		return x300681_var_Guild_Camp_B
	end 
	return -1
end

function x300681_ProcEnumEvent(varMap, varPlayer, varTalknpc)

	local nCampID = GetCurCamp(varMap,varPlayer)
	local varTalkNpcGUID = GetMonsterGUID(varMap, varTalknpc)
	local NPCcamp = x300681_GetNPCCamp(varMap, varPlayer, varTalkNpcGUID)
	if nCampID ~= NPCcamp then
		StartTalkTask(varMap)
        TalkAppendString(varMap, "不是同一阵营。");
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end
	
	
        
	TalkAppendButton(varMap,x300681_var_FileId,x300681_var_QuestName,3,1)
end



function x300681_ProcEventEntry(varMap, varPlayer, varTalknpc, varScript, varIndex)	
	
	if varIndex < 100 then
		
		StartTalkTask(varMap)
		
			local Readme_1 = "#Y【帮会】战神之力#r#W"
			local Readme_2 = "\t每位帮主，可以通过消耗60点帮会的战场资源，给所有的帮会成员增加战神之力，提升所有帮会成员的战斗力。#r"
			local Readme_3 = "\t帮会的战场资源主要来源于对帮会战场内的粮车的控制，顺利占领粮车后，会每10秒增加1点本帮会的战场资源。如果同时占领了本方的两辆粮车或敌方的两辆粮车，则每10秒增加4点战场资源。#r"
			local Readme_4 = "\t战场内有时会随机出现战神宝箱，每顺利开启一个宝箱，会给本帮会增加10点战场资源。"
			local Readme_5 = "注意：战场资源只有在帮会战场中才能由帮主使用，并且在帮会战场结束后会清空。"
			local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
			
			TalkAppendString(varMap, varReadme);
			TalkAppendButton(varMap,x300681_var_FileId,x300681_var_BuffCriName,3,1+100)
			TalkAppendButton(varMap,x300681_var_FileId,x300681_var_BuffTenName,3,2+100)
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	else
	
		varIndex = varIndex - 100
		x300681_ClickBuffMenu(varMap, varPlayer, varTalknpc, varIndex)
		
	end
	
end

function x300681_ProcAccept( varMap, varPlayer, varTalknpc, varQuest, varIndex )
   local pos = GetGuildOfficial(varMap, varPlayer)
    if pos ~= x300681_var_Leader_Index then
       StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，只有帮主才有权领取战旗祝福。");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
	   Msg2Player(varMap,varPlayer,"很抱歉，只有帮主才有权领取战旗祝福。",8,2)
        return
    end

end

function x300681_ClickBuffMenu(varMap, varPlayer, varTalknpc, varIndex)

	local pos = GetGuildOfficial(varMap, varPlayer)
    if pos ~= x300681_var_Leader_Index then
       StartTalkTask(varMap)
        TalkAppendString(varMap, "很遗憾，您不是帮主，没有权利领取战神祝福。");
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
    end
    
	local nCampID = GetCurCamp(varMap,varPlayer)
	local resPoint = LuaCallNoclosure(300643,"GetScoreInterval",varMap,nCampID)
	if resPoint < x300681_var_Guild_BufResPoint then
		StartTalkTask(varMap)
        TalkAppendString(varMap, x300681_var_PointNotEnough);
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 
	end
	
	if nCampID == x300681_var_Guild_Camp_A then
		if varIndex == 1 then
			x300681_AddImpactToAllUser(varMap, varPlayer, varTalknpc, x300681_var_BuffCriImpactID)  
		elseif varIndex == 2 then
			x300681_AddImpactToAllUser(varMap, varPlayer, varTalknpc, x300681_var_BuffTenImpactID)  
		end

		local GuildIdA = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_GUILD)
		local GuildTitle = GetGuildTitle(varMap,varPlayer)
		local varMsg = "蓝方获得了战神之力"
		LuaThisScenceM2Wrold(varMap,varMsg,2,1)
        LuaThisScenceM2Wrold(varMap,varMsg,3,1)	

	elseif nCampID == x300681_var_Guild_Camp_B then
		if varIndex == 1 then
			x300681_AddImpactToAllUser(varMap, varPlayer, varTalknpc, x300681_var_BuffCriImpactID)  
		elseif varIndex == 2 then
			x300681_AddImpactToAllUser(varMap, varPlayer, varTalknpc, x300681_var_BuffTenImpactID)  
		end
	
		
		local GuildIdB = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_GUILD)
		local GuildTitle = GetGuildTitle(varMap,varPlayer)
		local varMsg = "红方获得了战神之力"
		LuaThisScenceM2Wrold(varMap,varMsg,2,1)
        LuaThisScenceM2Wrold(varMap,varMsg,3,1)	
	end
	
	LuaCallNoclosure(300643,"SetScoreIntervalInc",varMap,nCampID,-x300681_var_Guild_BufResPoint)  
	
	
	
end

function x300681_AddImpactToAllUser( varMap, varPlayer, varTalknpc, varImpact )
	
	local nCampID = GetCurCamp(varMap,varPlayer)
	local varHumanCount = GetScenePlayerCount( varMap )
	for varI = 0,varHumanCount-1 do
	    local varObj = GetScenePlayerObjId( varMap,varI)
	    if varObj >= 0 then
	        local nCampIDOther = GetCurCamp(varMap,varObj)
	        if nCampID == nCampIDOther then
	        	SendSpecificImpactToUnit(varMap, varPlayer,varObj,varObj,varImpact,0)
	        end
	    end
	end
end

function x300681_ProcAccept( varMap, varPlayer, varTalknpc, varQuest, varIndex )
	local nCampID = GetCurCamp(varMap,varPlayer)
	
	local resPoint = LuaCallNoclosure(300643,"GetScoreInterval",varMap,nCampID)
	if resPoint < x300681_var_Guild_BufResPoint then
		StartTalkTask(varMap)
        TalkAppendString(varMap, x300681_var_PointNotEnough);
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return 
	end
	
	
	if nCampID == x300681_var_Guild_Camp_A then
		if varIndex == 1 then
			x300681_AddImpactToAllUser(varMap, varPlayer, varTalknpc, x300681_var_BuffCriImpactID)  
		elseif varIndex == 2 then
			x300681_AddImpactToAllUser(varMap, varPlayer, varTalknpc, x300681_var_BuffTenImpactID)  
		end
	
		
		local GuildIdA = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_GUILD)
		LuaThisScenceM2Guild(varMap,x300681_var_GuildNotify,GuildIdA,2,1)

	elseif nCampID == x300681_var_Guild_Camp_B then
		if varIndex == 1 then
			x300681_AddImpactToAllUser(varMap, varPlayer, varTalknpc, x300681_var_BuffCriImpactID)  
		elseif varIndex == 2 then
			x300681_AddImpactToAllUser(varMap, varPlayer, varTalknpc, x300681_var_BuffTenImpactID)  
		end
	
		
		local GuildIdB = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_GUILD)
		LuaThisScenceM2Guild(varMap,x300681_var_GuildNotify,GuildIdB,2,1)	
	end
	
	LuaCallNoclosure(300643,"SetScoreIntervalInc",varMap,nCampID,-x300681_var_Guild_BufResPoint)  
	
end

function x300681_ProcAcceptCheck( varMap, varPlayer, varTalknpc, varQuest, varIndex )
    return 1
end

function x300681_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest, varIndex )
    
end

	
