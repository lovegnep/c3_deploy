


--DECLARE_QUEST_INFO_START--
x300682_var_FileId          	= 300682
x300682_var_QuestName          	= "【帮会】战神祝福"
x300682_var_Leader_Index      	= 5
x300682_var_NpcIDA      			= 150015
x300682_var_NpcIDB     			= 150014

x300682_var_FlagImpactID    		= 8860   


x300682_var_Guild_Camp_A          = 5
x300682_var_Guild_Camp_B          = 6


x300682_var_Guild_BufResPoint     = 20  










x300682_var_Guild_Camp_A          = 5
x300682_var_Guild_Camp_B          = 6

x300682_var_SubMenuDesc     		= "#Y【帮会】战神祝福#r#W\t每位帮主，可以通过消耗20点帮会的战场资源，使用战神祝福给本方战旗恢复10%的生命。#r \t帮会的战场资源主要来源于对帮会战场内的粮车的控制，占领一个粮车后，会每10秒增加1点本帮会的战场资源。如果同时占领了本方的两辆粮车或敌方的两辆粮车，则每10秒增加4点战场资源。#r \t战场内有时会随机出现战神宝箱，每开启一个宝箱，会给本帮会增加10点战场资源。您确定要使用战神祝福吗？"

x300682_var_PointNotEnough    	= "战场资源不足"
x300682_var_GuildNotify    		= "本方战旗获得了战神祝福，血量恢复10%"
x300682_var_MapNotify    			= "获得了战神祝福"

function x300682_GetNPCCamp(varMap, varPlayer, varTalknpc)
	if varTalknpc == x300682_var_NpcIDA then
		return x300682_var_Guild_Camp_A
	elseif varTalknpc == x300682_var_NpcIDB then
		return x300682_var_Guild_Camp_B
	end 
	return -1
end

function x300682_ProcEnumEvent(varMap, varPlayer, varTalknpc)
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
	
	
	
    
        
        
        
        
        
    
        
	TalkAppendButton(varMap,x300682_var_FileId,x300682_var_QuestName,3,100)
end


function x300682_ProcEventEntry(varMap, varPlayer, varTalknpc, varScript, varIndex)	
	StartTalkTask(varMap)
		TalkAppendString(varMap,x300682_var_SubMenuDesc)
   	StopTalkTask()
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300682_var_FileId, -1)
	
end

function x300682_ProcAccept( varMap, varPlayer, varTalknpc, varQuest, varIndex )
	local pos = GetGuildOfficial(varMap, varPlayer)
    if pos ~= x300682_var_Leader_Index then
       Msg2Player( varMap, varPlayer, "您不是帮主", 8, 3)
	   Msg2Player(varMap,varPlayer,"很抱歉，只有帮主才有权领取战神祝福。",8,2)
        return
    end
	local nCampID = GetCurCamp(varMap,varPlayer)
	
	local resPoint = LuaCallNoclosure(300643,"GetScoreInterval",varMap,nCampID)
	if resPoint < x300682_var_Guild_BufResPoint then
	
		Msg2Player( varMap, varPlayer, x300682_var_PointNotEnough, 8, 3)




		return 
	end
	
	local battleFlagAID =  GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_A_ID)
	local battleFlagBID =  GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_FLAG_B_ID)

	if nCampID == x300682_var_Guild_Camp_A then
	
		if IsObjValid(varMap,battleFlagAID) == 1 and GetHp(varMap,battleFlagAID) > 0 then
			
			local nAdd = floor(GetMaxHp(varMap,battleFlagAID)* 0.1)
			if nAdd > 0 then
				SetHp(varMap,battleFlagAID,nAdd)
			end
			
			
		end
		
		local GuildIdA = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_A_GUILD)
		LuaThisScenceM2Guild(varMap,x300682_var_GuildNotify,GuildIdA,2,1)
		local varMsg = "蓝方战旗获得了战神祝福"
		LuaThisScenceM2Wrold(varMap,varMsg,2,1)
        LuaThisScenceM2Wrold(varMap,varMsg,3,1)	
		
		

	elseif nCampID == x300682_var_Guild_Camp_B then
		
		if IsObjValid(varMap,battleFlagBID) == 1 and GetHp(varMap,battleFlagBID) > 0 then
			local nAdd = floor(GetMaxHp(varMap,battleFlagBID)* 0.1)
			if nAdd > 0 then
				SetHp(varMap,battleFlagBID,nAdd)
			end
			
		end
		
		local GuildIdB = GetGuildBattleSceneData_Param(varMap,LD_GUILD_BATTLE_B_GUILD)
		LuaThisScenceM2Guild(varMap,x300682_var_GuildNotify,GuildIdB,2,1)
		local varMsg = "红方战旗获得了战神祝福"
		LuaThisScenceM2Wrold(varMap,varMsg,2,1)
        LuaThisScenceM2Wrold(varMap,varMsg,3,1)	
	end
	
	LuaCallNoclosure(300643,"SetScoreIntervalInc",varMap,nCampID,-x300682_var_Guild_BufResPoint)  
	
	

end

function x300682_ProcAcceptCheck( varMap, varPlayer, varTalknpc, varQuest, varIndex )
    return 1
end
function x300682_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest, varIndex )
    
end

	
