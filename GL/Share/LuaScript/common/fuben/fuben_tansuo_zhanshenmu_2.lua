











x700085_CSP_FUBENTYPE				= 	0
x700085_CSP_SCRIPTID				=	1
x700085_CSP_TICKCOUNT				= 	2
x700085_CSP_FROMSCENEID				= 	3
x700085_CSP_ISCLOSING				= 	4
x700085_CSP_LEAVECOUNTDOWN			= 	5
x700085_CSP_TEAMID					=	6
x700085_CSP_TICKTIME				=	7
x700085_CSP_HOLDTIME				=	8
x700085_CSP_FUBENLEVEL				=	9
								   
x700085_CSP_KILLCOUNT				=	20

x700085_CSP_OBJID_BOSS_START		=	21
x700085_CSP_OBJID_BOSS_END          =   22
x700085_CSP_FULL_HP_BOSS_START		= 	23
x700085_CSP_FULL_HP_BOSS_END        =   24

x700085_CSP_ITEMOBJ_TRAP1           =	25 
x700085_CSP_ITEMOBJ_TRAP2           =   26 
x700085_CSP_LAST_TIP_TICKCOUT       =   27 
x700085_CSP_ITEMOBJ_TRAP_TO_GATHER	=   28 
x700085_CSP_GATHER_WRONG			=   29 
x700085_CSP_AREA_ID					=	30
x700085_CSP_AREA_FLAG				=	31
x700085_CSP_ZHANCHE					 = 238
x700085_CSP_XIANJINBOSS				=	239

x700085_CSP_HUMAN_COUNT				=	240
x700085_CSP_PLAYER_ENTER_START		=	241

x700085_CSP_LAST_TICKOUNT			=	247
x700085_CSP_GUID_START              =   248
x700085_CSP_FUBEN_TYPE				=	254	
x700085_CSP_FUBEN_MODE				=   255



x700085_var_QuestId					=  6608
x700085_var_FileId 					= 700085

x700085_var_BuffId					= 7979


x700085_var_GrowpointId_Trap1         = 543  
x700085_var_GrowpointId_Trap2         = 544  
x700085_var_Tips_Trap1                = "黑木.....10秒内去采集那边的黑木,否则你们就是自寻死路!"
x700085_var_Tips_Trap2                = "丹木.....10秒内去采集那边的丹木,否则你们就是自寻死路!"
x700085_var_Gether_Tips               = "正确采集机关，躲避了蒲鲜万奴的攻击。" 

x700085_var_GPInterval				= 30000
x700085_var_Tip_Interval              = 2  

x700085_var_SubmitNPC                 =   { type =28508,guid= 150575,varX = 92, z=100, facedir =180, title ="" }




x700085_var_Level_Limit  = 70
x700085_var_Rate_Limit = 40

function x700085_ProcEventEntry(varMap,varPlayer,varTalknpc)

end




function x700085_ProcFubenSceneCreated( varMap )	
	 
	for varI = 20,239 do
		SetFubenData_Param(varMap, varI,-1)
	end
							

	SetFubenData_Param(varMap, x700085_CSP_OBJID_BOSS_START+1, -1)

	x700085_CreateBoss1(varMap)
	x700085_CreateMonster( varMap )									
end




function x700085_EnterTick(varMap,nowTickCount)
  
	
	
	local nBossId2=GetFubenData_Param(varMap,x700085_CSP_OBJID_BOSS_START+1)  
	if nBossId2 >=0 then
		local nCurrentHp = GetHp( varMap, nBossId2 )
		local nFullHp = GetFubenData_Param(varMap, x700085_CSP_FULL_HP_BOSS_START+1)

		if nCurrentHp < nFullHp*0.9 then
			
			local nLastTipCount = GetFubenData_Param(varMap, x700085_CSP_LAST_TIP_TICKCOUT)
			local nTrapToGather = GetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP_TO_GATHER)
			
			ItemBoxId1 = GetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP1)
			ItemBoxId2 = GetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP2)

			if ItemBoxId1 ~= -1 or ItemBoxId2 ~= -1 then
				if nTrapToGather == -1 then 

					if ItemBoxId1 ~= -1 and ItemBoxId2 ~= -1 then 
						local nTrapTips	= ""
						local nTrapItemId = -1
						
						local rate = random(0,1)
						if rate > 0.5 then							
							nTrapTips = x700085_var_Tips_Trap1
							nTrapItemId = ItemBoxId1
						else
							nTrapTips = x700085_var_Tips_Trap2
							nTrapItemId = ItemBoxId2
						end
										
						NpcTalk(varMap, nBossId2, nTrapTips, -1)
						SetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP_TO_GATHER,nTrapItemId)					
						SetFubenData_Param(varMap, x700085_CSP_LAST_TIP_TICKCOUT,nowTickCount)
					end

				elseif nowTickCount - nLastTipCount  >= x700085_var_Tip_Interval then					
					
					if ItemBoxId1 == nTrapToGather or ItemBoxId2 == nTrapToGather then
						local nGetherWrong = GetFubenData_Param(varMap, x700085_CSP_GATHER_WRONG)
						if nGetherWrong <= 0 then
							SetFubenData_Param(varMap, x700085_CSP_GATHER_WRONG,1)
						end

						x700085_SetPlayersHP(varMap,250)					 
						SetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP_TO_GATHER,-1)						
					end
				end
			end

		end		
	end

end




function x700085_CreateBoss1(varMap)

	local nBossId=GetFubenData_Param(varMap,x700085_CSP_OBJID_BOSS_START)
	if nBossId >=0 then
		return
	end

	x700085_CreateBossByIndex(varMap,0)
end




function x700085_CreateBoss2(varMap)

	local nBossId=GetFubenData_Param(varMap,x700085_CSP_OBJID_BOSS_START+1)
	if nBossId >=0 then
		return
	end
	x700085_CreateBossByIndex(varMap,1)
end




function x700085_CreateBossByIndex(varMap,bossIndex)

	
    if bossIndex == nil or bossIndex < 0 or (bossIndex + x700085_CSP_OBJID_BOSS_START) > x700085_CSP_OBJID_BOSS_END then
	    return
	end

    local fubenlevel = GetFubenData_Param(varMap, x700085_CSP_FUBENLEVEL )
	local fuben_type = GetFubenData_Param(varMap, x700085_CSP_FUBEN_TYPE )

	local nIndexFrom = GetFubenDataPosByScriptID(x700085_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700085_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700085_var_FileId,nIndexFrom,varI)

		if idScript == x700085_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and bossIndex == varFlag and fuben_type == varFlag3 then
		    local varObj = 0
			if title~="" then
				varObj = CreateMonster(varMap, type, varX, z, ai, aiscript, x700085_var_FileId, -1, 21,-1,facedir,  "",title)
			else
				varObj = CreateMonster(varMap, type, varX, z, ai, aiscript, x700085_var_FileId, -1, 21,-1,facedir)
			
			end										

			if varObj >=0 and patrolid>=0 then
				SetPatrolId(varMap, varObj, patrolid)				
			end

		    local nFullHp = GetHp( varMap, varObj )
            if varFlag == 0 or varFlag == 1 then
			    SetFubenData_Param(varMap, x700085_CSP_OBJID_BOSS_START+bossIndex, varObj)
			    SetFubenData_Param(varMap, x700085_CSP_FULL_HP_BOSS_START+bossIndex, nFullHp)
			end

        end
	end

end




function x700085_CreateMonster(varMap)

    local fubenlevel = GetFubenData_Param(varMap, x700085_CSP_FUBENLEVEL )
	local fuben_type = GetFubenData_Param(varMap, x700085_CSP_FUBEN_TYPE )

	local nIndexFrom = GetFubenDataPosByScriptID(x700085_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700085_var_FileId )

	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700085_var_FileId,nIndexFrom,varI)

		if idScript == x700085_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and fuben_type == varFlag3 then
            for j=0,varCount -1 do

                local rx = random(-r,r)
                local x1 = varX + rx
                local rz = random(-r,r)
                local z1 = z + rz

				local varObj = 0
				if title~="" then
					varObj = CreateMonster(varMap, type, x1, z1, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					varObj = CreateMonster(varMap, type, x1, z1, ai, aiscript, -1, -1, 21,-1,facedir)
				
				end

				if varObj >=0 and patrolid>=0 then
					SetPatrolId(varMap, varObj, patrolid)				
				end
			end
        end
	end

end




function x700085_ProcDie(varMap, varPlayer, varKiller)

	local nDieCount = GetFubenData_Param(varMap, x700085_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700085_CSP_KILLCOUNT, nDieCount+1);
	
	local xianjinboss = GetFubenData_Param(varMap, x700085_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcXianjinBossDie", varMap)
	end
	
	local zhanChe = GetFubenData_Param(varMap, x700085_CSP_ZHANCHE)
	if zhanChe == varPlayer then
		LuaCallNoclosure(FUBEN_COMMON_SCRIPT_CALL,"ProcZhanCheBossDie", varMap)
	end
	
	local objId1 = GetFubenData_Param(varMap, x700085_CSP_OBJID_BOSS_START)

	
	if varPlayer == objId1 then
	 	SetGrowPointIntervalContainer(varMap,x700085_var_GrowpointId_Trap1,1)
		SetGrowPointIntervalContainer(varMap,x700085_var_GrowpointId_Trap2,1)
		x700085_CreateBoss2(varMap)
		x700085_ShowTipsToAll(varMap, "蒲鲜万奴出现,当他血量减到90%时，需按他的提示采集正确的物品！")
		SetFubenData_Param(varMap, x700085_CSP_OBJID_BOSS_START,-1)		
	
	end

    
	local objId2 = GetFubenData_Param(varMap, x700085_CSP_OBJID_BOSS_START+1)
	if varPlayer == objId2	 then
		local humancount = GetFuben_PlayerCount(varMap);
			for ii = 0, humancount - 1 do
				local humanId = GetFuben_PlayerObjId(varMap, ii);
				LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,humanId,54 )
			end	
	
		
		x700085_CreateXianJinBoss(varMap)
		x700085_CreateZhanCheBoss(varMap)
		x700085_ShowTipsToAll(varMap, "顺利击杀蒲鲜万奴，副本完成。") 
		SetFubenData_Param(varMap, x700085_CSP_OBJID_BOSS_START+1,-2)
	end

end

function x700085_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end





function x700085_CreateSubmitNpc( varMap)
	x700085_ShowTipsToAll(varMap, "副本完成")
	if x700085_var_SubmitNPC.title~= "" then
		CreateMonster(varMap, x700085_var_SubmitNPC.type, x700085_var_SubmitNPC.varX, x700085_var_SubmitNPC.z, 3, 0, -1, x700085_var_SubmitNPC.guid, -1,-1,x700085_var_SubmitNPC.facedir, "", x700085_var_SubmitNPC.title)
	else
		CreateMonster(varMap, x700085_var_SubmitNPC.type, x700085_var_SubmitNPC.varX, x700085_var_SubmitNPC.z, 3, 0, -1, x700085_var_SubmitNPC.guid, -1,-1,x700085_var_SubmitNPC.facedir)
		
	end

	
	 x700085_CreateXianJinBoss(varMap)
	 
	 
	LuaCallNoclosure( 701104, "ProcSceneBossDie", varMap, 0)

	local nGetherWrong = GetFubenData_Param(varMap, x700085_CSP_GATHER_WRONG)

	if nGetherWrong > 0 then
		LuaCallNoclosure( 701102, "ProcSceneBossDie", varMap, 0)
	end

end





function x700085_CreateXianJinBoss(varMap)
	local nFubenMode = GetFubenData_Param(varMap, x700085_CSP_FUBEN_MODE)

	if nFubenMode~=1 and nFubenMode~=2 then
	  return
	end

	local fuben_type = GetFubenData_Param(varMap, x700085_CSP_FUBEN_TYPE )
	if fuben_type ~= 0 then
		return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700085_CSP_FUBENLEVEL )

	local nIndexFrom = GetFubenDataPosByScriptID(x700085_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700085_var_FileId )

	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700085_var_FileId,nIndexFrom,varI)

		if idScript == x700085_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then
            for j=0,varCount -1 do
				local varRet = 0
				if title~="" then
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700085_var_FileId, -1, 21,-1,facedir,  "",title)
				else
					varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700085_var_FileId, -1, 21,-1,facedir)
				
				end
				SetFubenData_Param(varMap, x700085_CSP_XIANJINBOSS, varRet )
			end
        end
	end

	x700085_ShowTipsToAll(varMap, "翻番宝箱出现！")
end




function x700085_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	SetFubenData_Param(varMap, x700085_CSP_AREA_ID, varArea)
	if varArea == 0 then  
		local BossId = GetFubenData_Param(varMap, x700085_CSP_OBJID_BOSS_START+1)
		if BossId ~= -2 then
			return 
		end
		SetFubenData_Param(varMap, x700085_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700085_var_QuestId, x700085_var_FileId)
		
	else
	 	LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700085_var_QuestId, x700085_var_FileId)
	end
end




function x700085_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	EnterAreaEventListHideNM(varMap, varPlayer)
	SetFubenData_Param(varMap, x700085_CSP_AREA_ID, -1)
end




function x700085_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )	
	local varArea = GetFubenData_Param(varMap, x700085_CSP_AREA_ID)
	
	if varArea == 0 then
		local BossId = GetFubenData_Param(varMap, x700085_CSP_OBJID_BOSS_START+1)
		if BossId ~= -2 then
			return 
		end
		local varFlag = GetFubenData_Param(varMap, x700085_CSP_AREA_FLAG)
		if varFlag == 1 then
			return
		end
		SetFubenData_Param(varMap, x700085_CSP_AREA_FLAG,1)
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700085_var_QuestId, x700085_var_FileId)
	elseif varArea == 1 then
		
	end
end




function x700085_ProcGpCreate(varMap,growPointType,varX,varY)

	local varBoxId = ItemBoxEnterScene(varX, varY, growPointType, varMap, 0, -1)
	SetGrowPointObjID(varMap, growPointType, varX, varY, varBoxId)
	if growPointType == x700085_var_GrowpointId_Trap1 then	
		SetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP1,varBoxId)

	elseif growPointType == x700085_var_GrowpointId_Trap2	then
		SetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP2,varBoxId)
    end

	local nItmeBoxId1 = GetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP1)
	local nItemBoxId2 = GetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP2)

	return 0
end




function x700085_ProcGpOpen(varMap,varPlayer,varTalknpc)	
	 return 0
end




function x700085_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	return 1
end




function x700085_ProcGpProcOver(varMap,varPlayer,varTalknpc)

	
	
	local ItemBoxId1 = GetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP1)
	local ItemBoxId2 = GetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP2)
	local nTrapToGather = GetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP_TO_GATHER)


	if varTalknpc == ItemBoxId1 then
		SetGrowPointIntervalContainer(varMap,x700085_var_GrowpointId_Trap1,x700085_var_GPInterval)
		SetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP1,-1)
	elseif varTalknpc ==	ItemBoxId2	then
		SetGrowPointIntervalContainer(varMap,x700085_var_GrowpointId_Trap2,x700085_var_GPInterval)
		SetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP2,-1)
	end

	local objId2 = GetFubenData_Param(varMap, x700085_CSP_OBJID_BOSS_START+1)
	if varTalknpc == nTrapToGather and objId2 >= 0 then
		SetFubenData_Param(varMap, x700085_CSP_ITEMOBJ_TRAP_TO_GATHER,-1)
		x700085_ShowTipsToAll(varMap, x700085_var_Gether_Tips)
		local humancount = GetFuben_PlayerCount(varMap);
		for ii = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, ii);
			SendSpecificImpactToUnit( varMap, humanId, humanId, humanId, x700085_var_BuffId, 0)
		end	
	end

	return 0
end




function x700085_SetPlayersHP(varMap,nToSetHP)

	if nToSetHP <=0 then		
		return
	end

	local humancount = GetFuben_PlayerCount(varMap)

	for varI= 0 ,humancount-1  do
	
		local nPlayerObjId = GetFuben_PlayerObjId(varMap,varI);

		if nPlayerObjId ~= -1 then		
			local ErrorCode = LuaCallNoclosure( FUBEN_COMMON_SCRIPT_CALL, "IsPlayerErrorState", varMap, nPlayerObjId)
			if 	ErrorCode == 0 then
				local nCurrentHP = GetHp(varMap,nPlayerObjId )				
				local nHurt = 0








				nHurt = nCurrentHP / 2
				SetHp(varMap,nPlayerObjId,-nHurt)

				local strPlayerName = GetName(varMap, nPlayerObjId)
				nCurrentHP = GetHp(varMap,nPlayerObjId )
				local varStr = "玩家"..strPlayerName.."血量减至"..nCurrentHP
				x700085_ShowTipsToAll(varMap, varStr)
			end
		end
    end	
end

function x700085_CreateZhanCheBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700085_CSP_FUBEN_TYPE)

  --队伍副本
	if nFubenType ~= 0 then
		return
	end

	--道具副本
	local nFubenMode = GetFubenData_Param(varMap, x700085_CSP_FUBEN_MODE)

	if 0 == nFubenMode then
	  return
	end

  --等级限制
	local fubenlevel = GetFubenData_Param(varMap, x700085_CSP_FUBENLEVEL)

	if fubenlevel < x700085_var_Level_Limit then
		return
	end

	--概率限制
	local nRate = random(1,100)
	
	if nRate > x700085_var_Rate_Limit then
		return
	end

	local nIndexFrom = GetFubenDataPosByScriptID(x700085_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700085_var_FileId )
	local nZhanCheFlag = -1
	local nRandType = random(0,1)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700085_var_FileId,nIndexFrom,varI)
		if idScript == x700085_var_FileId and 200 == monsterFlag and levelmin <= fubenlevel 
				and levelmax >= fubenlevel and varFlag == nFubenMode and 1 == varFlag1 and nRandType == varFlag2  then

			if title~="" then
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir,"",title)
			else
				nZhanCheFlag = CreateMonster(varMap, type, varX, z, ai, aiscript, 701010, 401020, 20,-1,facedir)
			end

			if nZhanCheFlag >= 0 then
				SetFubenData_Param(varMap, x700085_CSP_ZHANCHE, nZhanCheFlag)
				break
			end
		end
	end

	if nZhanCheFlag >= 0 then
			x700085_ShowTipsToAll(varMap, "战车雷爪之王出现！")
	end
end
