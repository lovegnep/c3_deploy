--皇帝战的相关脚本-----皇宫密室

x310124_var_FileId		 											= 310124
x310124_var_PrintDebugLog										=	0	--输出调试日志
x310124_var_PrintInfoLog										=	1	--输出基本调用信息日志

x310124_var_FinishStep											=	1	--完成的步骤数

x310124_var_GameBattleOverBroadcast					=	"%s获得了本次皇帝战的胜利!!!"
x310124_var_ReliveNotice										=	"皇帝战期间,只能使用皇帝战回魂丹才能原地复活" --复活提示
x310124_var_ReliveItemId										=	11990401 --原地复活使用的道具

--国家变量使用
x310124_var_IsKaiser												= {0, 2}	--标识是否为皇帝国
x310124_var_KaiserConcatenationTempCount		=	{10, 8} --皇帝连任临时次数
x310124_var_LastKaiserDay										=	{0, 15}	--上次获取皇帝的日期

--Npc的信息表
x310124_var_NpcInfoTable										=	
{
		--x310124_var_totem												=			--图腾信息
		
		{
			var_TypeId						=	3950,
			var_Guid							=	401126,											--做唯一标识
			var_RelatingGuid			=	0,												--相关联删除的Id
			var_BaseAI						=	3,
			var_AI								=	0,
			var_Pos								=	{64, 64},
			var_AddBuff						=	{7989},										--给所有指定NPC添加一个免疫Buff
			var_FinishBit					=	1,												--完成后的占位
			var_ChangeCampStep		=	0,
		var_DynamicCreate			=	0,												--标识是否只有战争时才存在的
			var_CampId						=	20,
			var_ObjId							=	-1,												--动态创建的ObjId
			var_IsExist						=	1													--是否存在,动态改变
	}
}

--战争信息表,记录攻防守方的信息 1是守方,其他是攻方
x310124_var_BattleRoleTable									=
{
	{ --适帝方信息
		campId 					= 5,
		birthPlace			=	
		{
			472, 139, 111, 5, 5, --变更后的出生地
		},
		hasAdscription 	= 0 --标识是否已经有归属,当这个角色被分配后,则改变此归属
	}, 
	{ --主攻方信息
		campId 					= 6,
		birthPlace			=	
		{	
			472, 380, 101, 5, 5, --变更后的出生地
		},
		hasAdscription 	= 0 --标识是否已经有归属,当这个角色被分配后,则改变此归属
	},
	{ --攻方信息
		campId 					= 6,
		birthPlace			=	
		{
			472, 380, 101, 5, 5, --变更后的出生地
		},
		hasAdscription 	= 0 --标识是否已经有归属,当这个角色被分配后,则改变此归属
	},
	{ --攻方信息
		campId 					= 6,
		birthPlace			=	
		{
			472, 380, 101, 5, 5, --变更后的出生地
		},
		hasAdscription 	= 0 --标识是否已经有归属,当这个角色被分配后,则改变此归属
	} 
}

x310124_var_CountryTable										=
{
	--楼兰
	{
		campId 					= 0,
		name						=	"楼兰",
		role						=	0 --角色,标识是攻还是守,1是守方,其他是攻方
	},
	
	--天山的配置信息
	{
		campId 					= 1,
		name						=	"天山",
		role						=	0
	},
	
	--昆仑的配置信息
	{
		campId 					= 2,
		name						=	"昆仑",
		role						=	0
	},
	
	--敦煌的配置信息
	{
		campId 					= 3,
		name						=	"敦煌",
		role						=	0
	}
}

--攻防buff表,给攻击方增加的buff,根据连任次数来选择给攻击方增加哪些buff
x310124_var_AttackBuffTable									=
{
	{	 --第一次的
		{8810}, --给守方的buff
		{8816}  --给攻方的buff
	},
	{	 --第二次的
		{8811}, --给守方的buff
		{8815}	--给攻方的buff
	},
}
--运行时变量
x310124_var_BattleStep											=	{}	--战争的阶段

x310124_var_IsStarted												=	0	--标识是否开始
x310124_var_IsOpenBackroom									=	0	--标识密室是否被开启
x310124_var_KaiserId												=	-1 	--皇帝方的Id
x310124_var_MainAttack											=	-1	--主攻方的Id
x310124_var_ConcatenationCount							=	0		--连任次数

--处理没有皇帝的战争
function x310124_ProcBattleKaiserProcess( varMap, varIndex )
	
	if (x310124_var_IsStarted == 0) then
		if (x310124_var_PrintInfoLog == 1) then
			WriteLog(1, format("x310124_ProcBattleKaiserProcess --- varMap = %d"
				, varMap))
		end
		
		x310124_var_IsStarted = 1
		
		x310124_ProcInitContext()
		x310124_var_MainAttack = x310124_GetMainAttack()
		
		x310124_ProcInitBattleStep()
		
		--加载国家角色信息
		x310124_LoadCountryRolesInfo( varMap )
		
		x310124_ProcNpcObjIdLoad(varMap)
		
		x310124_ProcAllPlayerCampOnMap( varMap )
		
		x310124_ProcReSetNPCState(varMap)
		
		x310124_ProcAppendBuffToNpc(varMap)
		x310124_ProcNpcAttackableState(varMap)
	end
end

--清除所有NPC信息,暂时不使用,还为测试完成
function x310124_ClearAllNpcByObjId(varMap)

	local npcInfo
	local npcInfoTable = x310124_var_NpcInfoTable
	
	if (x310124_var_PrintDebugLog == 1) then
		WriteLog(1, 
			format("x310124_ClearAllNpcByObjId Debug x310124_var_ConcatenationCount = %d", x310124_var_ConcatenationCount))
	end
	
	for npcInfoIndex = 1, getn(npcInfoTable) do
		npcInfo = npcInfoTable[npcInfoIndex]
		if (npcInfo ~= nil) then
			if (npcInfo.var_IsExist ~= 0) then

				DeleteMonster(varMap, npcInfo.var_ObjId)
							
				if (x310124_var_PrintDebugLog == 1) then
					WriteLog(1, format("x310124_ClearAllNpc Debug DeleteMonster Guid = %d, ObjId = %d",
								 npcInfo.var_Guid, npcInfo.var_ObjId))
				end
				
			end
		end
	end
	
end

--通过Guid来清除NPC,这样会比较耗性能
function x310124_ClearAllNpcByGuid(varMap)
	local needDelNpcTemp = {}
	local npcInfo
	
	if (x310124_var_PrintDebugLog == 1) then
		WriteLog(1, 
			format("x310124_ClearAllNpcByGuid Debug x310124_var_ConcatenationCount = %d", x310124_var_ConcatenationCount))
	end
	
	--将要删除的monster guid存到needDelNpcTemp里
	for npcInfoIndex = 1, getn(x310124_var_NpcInfoTable) do
		npcInfo = x310124_var_NpcInfoTable[npcInfoIndex]
		if (npcInfo ~= nil and npcInfo.var_DynamicCreate == 1) then --只清理动态创建的Npc
			--if (npcInfo.var_IsExist == 1) then --且这个NPC存在,TODO 测试先注释掉
				
				for tempI = 1, getn(x310124_var_NpcInfoTable) do
				if (needDelNpcTemp[tempI] == nil) then
						
						needDelNpcTemp[tempI] = npcInfo.var_Guid
						npcInfo.var_IsExist = 0
						if (x310124_var_PrintDebugLog == 1) then
							WriteLog(1, 
								format("x310124_ClearAllNpcByGuid Debug tempI = %d", npcInfo.var_Guid))
						end
						
						break
					end
				end
			
			--end
		end
	end
	
	local monsterId = -1
	local monsterGuid = -1
	local monsterCount = GetMonsterCount(varMap)
	for monsterIndex = 0, (monsterCount - 1) do
		monsterId = GetMonsterObjID(varMap, monsterIndex)
		
		if (monsterId ~= -1) then		
			monsterGuid = GetMonsterGUID(varMap, monsterId)
			for tempI = 1, getn(needDelNpcTemp) do
				
				if (needDelNpcTemp[tempI] ~= nil) then
					
					if (needDelNpcTemp[tempI] == monsterGuid) then
						DeleteMonster(varMap, monsterId)
						needDelNpcTemp[tempI] = nil
						
						if (x310124_var_PrintDebugLog == 1) then
							WriteLog(1, 
								format("x310124_ClearAllNpcByGuid Debug DeleteMonster MonsterGuid = %d", monsterGuid))
						end
						
						break
					end
					
				end
				
			end
		end
		
	end
end


--先处理当前Map上的所有玩家的阵营
function x310124_ProcAllPlayerCampOnMap( varMap )
	local playerCount = GetScenePlayerCount( varMap )
	
	if (x310124_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310124_ProcAllPlayerOnMap --- playerCount = %d", playerCount))
	end
	
	for varI = 0, playerCount do
		local varPlayer = GetScenePlayerObjId(varMap, varI)
		if (varPlayer ~= -1) then
			x310124_ChangePlayerCamp(varMap, varPlayer, 0)
		end
	end
end

--重置玩家原始阵营
function x310124_ResetPlayerCamp(varMap, varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)
	local campId = x310124_var_CountryTable[varCountry + 1].campId
	SetCurCamp(varMap, varPlayer, campId)
	SetMPVP6v6BattleDisable(varMap, varPlayer, 1, 0)
end

--设置阵营
function x310124_ChangePlayerCamp( varMap, varPlayer, varIsLeave )
	
	local varCountry = GetCurCountry(varMap, varPlayer)
	if (varIsLeave == 1 and x310124_var_IsStarted == 1) then --如果是战斗状态且玩家离开地图,则将其阵营回归
		
		if (x310124_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310124_ChangePlayerCamp --- Player Leave Battle.. varPlayer = %d, varCountry = %d, initCamp = %d",
					 varPlayer, varCountry, GetCurCamp(varMap, varPlayer)))
		end
		
		x310124_ResetPlayerCamp(varMap, varPlayer)
		
		if (x310124_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310124_ChangePlayerCamp --- Player CurrentCamp = %d",
						 GetCurCamp(varMap, varPlayer)))
		end
		
	else
		
		if (x310124_var_IsStarted == 1) then --设置战斗已开始的阵营编号
			
			if (x310124_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310124_ChangePlayerCamp --- The Battle is start. Enter varPlayer = %d, varCountry = %d, initCamp = %d",
							 varPlayer, varCountry, GetCurCamp(varMap, varPlayer)))
			end
			
			local roleId = x310124_var_CountryTable[varCountry + 1].role
			local campId = x310124_var_BattleRoleTable[roleId].campId
			SetCurCamp(varMap, varPlayer, campId)
			
			if (roleId == 1) then --防守方
				SetMPVP6v6BattleDisable(varMap, varPlayer, 0, 1)  --阵营玩家颜色
			elseif (roleId > 1) then
				SetMPVP6v6BattleDisable(varMap, varPlayer, 0, 0)
			end
			
			if (x310124_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310124_ChangePlayerCamp --- Player CurrentCamp = %d",
							 GetCurCamp(varMap, varPlayer)))
			end
			
		else	--设置战斗已结束的阵营编号
			
			if (x310124_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310124_ChangePlayerCamp --- The Battle is over. Enter varPlayer = %d, varCountry = %d,  initCamp = %d",
				varPlayer, varCountry, GetCurCamp(varMap, varPlayer)))
			end
			
			x310124_ResetPlayerCamp(varMap, varPlayer)
			
			if (x310124_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310124_ChangePlayerCamp --- Player CurrentCamp = %d",
							 GetCurCamp(varMap, varPlayer)))
			end
			
		end
		
	end
	
end

--处理NpcObjId的加载
function x310124_ProcNpcObjIdLoad(varMap)
	local monsterCount = GetMonsterCount(varMap)
	
	local objId = -1
	local guid = -1
	for monsterId = 0, (monsterCount - 1) do
		objId = GetMonsterObjID(varMap, monsterId)
		if (objId ~= -1) then
			guid = GetMonsterGUID(varMap, objId)
			
			local npcInfo
			for npcTableIndex = 1, getn(x310124_var_NpcInfoTable) do
				npcInfo = x310124_var_NpcInfoTable[npcTableIndex]
				
				if (npcInfo ~= nil and guid == npcInfo.var_Guid) then
					if (npcInfo.var_DynamicCreate == 0 and npcInfo.var_ObjId == -1) then
						npcInfo.var_ObjId = objId
						
						if (x310124_var_PrintDebugLog == 1) then
							WriteLog(1, format("x310124_ProcNpcObjIdLoad --- guid = %d, objId = %d", guid, objId))	
						end
						
					end
				end
				
			end
			
		end
	end
end

--加载攻守方相应的角色信息
function x310124_LoadCountryRolesInfo( varMap )
	local kaiserCountryId = x310124_GetKaiserCountry()
	
	if (kaiserCountry == -1) then
		WriteLog(1, "x310124_LoadCountryRolesInfo ERROR!!! --- kaiserCountry = -1")
		return 
	end
	
	for i = 0, 3 do
		if (kaiserCountryId == i) then --加载皇帝方信息

			if (x310124_var_PrintDebugLog == 1) then
				WriteLog(1, 
					format("x310124_LoadCountryRolesInfo Debug KaiserId = %d", kaiserCountryId))
			end
			
			roleId = 1
		else
			local tempRandTable = {} --构建一个临时分配表
			local tempIndex = 1
			for j = 2, 4 do
				if (x310124_var_BattleRoleTable[j].hasAdscription == 0) then --没有归属
					tempRandTable[tempIndex] = j
					tempIndex = tempIndex + 1					
				end
			end
			
			local tempRandIndex = random(1, getn(tempRandTable))
			roleId = tempRandTable[tempRandIndex]
		end
		
		x310124_var_BattleRoleTable[roleId].hasAdscription = 1
		x310124_var_CountryTable[i + 1].role = roleId
		
		if (x310124_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310124_LoadCountryRolesInfo Debug --- country = %d, role = %d", i, roleId))
		end
	end
end

--加载Npc信息
function x310124_ProcNpcInfoLoad(varMap)
	local kaiserCountryId = x310124_GetKaiserCountry()
	local npcInfo
	for npcInfoIndex = 1, getn(x310124_var_NpcInfoTable) do --加载NPC信息
		npcInfo = x310124_var_NpcInfoTable[npcInfoIndex]
		if (npcInfo ~= nil) then
			
			if (npcInfo.var_IsExist == 0) then
				local isCreate = 0
				if (npcInfo.var_DynamicCreate == 1) then
					if (x310124_var_IsStarted == 1) then
						isCreate = 1
					end	
				end
			
				if (isCreate == 1) then
					local campId = npcInfo.var_CampId
					if (var_ChangeCampStep == 0) then
						campId = x310124_var_BattleRoleTable[1].campId
					end
				
					local objId = CreateMonster(varMap, npcInfo.var_TypeId, npcInfo.var_Pos[1], npcInfo.var_Pos[2], 
								npcInfo.var_BaseAI, npcInfo.var_AI, x310124_var_FileId, npcInfo.var_Guid, campId, -1)
					npcInfo.var_ObjId = objId
					npcInfo.var_IsExist = 1
					if (x310124_var_PrintDebugLog == 1) then
							WriteLog(1, 
								format("x310124_ProcNpcInfoLoad LoadNpc, Guid = %d, objId = %d", npcInfo.var_Guid, npcInfo.var_ObjId))
					end
				end
				
			end
			
		end
	end
	
end


function x310124_ProcReSetNPCState(varMap)
	for npcInfoIndex = 1, getn(x310124_var_NpcInfoTable) do
		npcInfo = x310124_var_NpcInfoTable[npcInfoIndex]
		if npcInfo ~= nil and npcInfo.var_DynamicCreate == 0 then			
			
			if npcInfo.var_ObjId ~= -1 then
				npcInfo.var_IsExist = 1
				local maxHp = GetMaxHp(varMap, npcInfo.var_ObjId)
				if maxHp ~= nil then
					SetHp(varMap, npcInfo.var_ObjId, maxHp)
				end			
				SetPos(varMap, npcInfo.var_ObjId, npcInfo.var_Pos[1], npcInfo.var_Pos[2])
			end
			
		end
	end
end


--初始化战争的环境变量
function x310124_ProcInitContext()
	
	x310124_var_KaiserId = x310124_GetKaiserCountry()
	x310124_var_ConcatenationCount = x310124_GetConcatenationCount(x310124_var_KaiserId) + 1
	
	if (x310124_var_PrintDebugLog == 1) then
		WriteLog(1, 
			format("x310124_ProcNpcInfoLoad Debug x310124_var_ConcatenationCount = %d, kaiserCountryId = %d",
						 x310124_var_ConcatenationCount, x310124_var_KaiserId))
	end
	
	if (x310124_var_ConcatenationCount <= 0)	then
		WriteLog(1, 
			format("x310124_ProcNpcInfoLoad ERROR!!! x310124_var_ConcatenationCount = %d", x310124_var_ConcatenationCount))
		
		return
	end
	
	if (x310124_var_ConcatenationCount >= getn(x310124_var_AttackBuffTable)) then
		if (x310124_var_PrintDebugLog == 1) then
				WriteLog(1, 
			format("x310124_ProcNpcInfoLoad Warning!!! npcInfoTableIndex overflow npcInfoTable count!!!"))
		end
		
		x310124_var_ConcatenationCount = getn(x310124_var_AttackBuffTable) --如果超过了最大连任次数则按照连任的最后一次来加载
	end
end

--获取主攻方
function x310124_GetMainAttack()
	local mark = -1
	for countryId = 0, 3 do
		mark = GetCountryParamByBit(countryId, CD_KAISER_BATTLE_INFO, x310124_var_IsKaiser[1],
					 x310124_var_IsKaiser[2])
		
		if (mark == 2) then
			return countryId
		end
					 
	end
end

--获取连任次数
function x310124_GetConcatenationCount(varCountryId)
	
	if (x310124_var_PrintDebugLog == 1) then
		WriteLog(1, 
			format("x310124_GetConcatenationCount Debug varCountryId = %d", varCountryId))
	end
	
	if (varCountryId >= 0 and varCountryId <4) then
		local count = GetCountryParamByBit(varCountryId, CD_KAISER_BATTLE_INFO, 
					x310124_var_KaiserConcatenationTempCount[1], x310124_var_KaiserConcatenationTempCount[2])
		
		return count
	end
	
	return -1
end

--执行环境变量的数据检测,只有在调试模式下才会开启
function x310124_ProcCheckContext()
	if (x310124_var_KaiserId == -1) then
		WriteLog(1, format("x310124_ProcCheckContext Warning !!! ------ Error x310124_var_KaiserId = -1"))
	end
	
	if (x310124_var_ConcatenationCount == 0 or x310124_var_ConcatenationCount == -1) then
		WriteLog(1, format("x310124_ProcCheckContext Warning !!! ------ Error x310124_var_ConcatenationCount = %d", x310124_var_ConcatenationCount))
	end
	
	if (x310124_var_MainAttack == -1) then
		WriteLog(1, format("x310124_ProcCheckContext Warning !!! ------ Error x310124_var_MainAttack = -1"))
	end
end

--处理开启密室的逻辑
function x310124_ProcOpenBackroom(varMap)
	
	if (x310124_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310124_ProcOpenBackroom --- varMap = %d", varMap))
	end
	
	if (x310124_var_IsStarted == 1) then
		x310124_var_IsOpenBackroom = 1
		x310124_ProcNpcAttackableState(varMap)
	end
end

--获取皇帝国家
function x310124_GetKaiserCountry()
	--for i = 0, 3 do
	--	if (GetCountryParamByBit(i, CD_KAISER_BATTLE_INFO, x310124_var_IsKaiser[1],
	--			 x310124_var_IsKaiser[2]) == 1) then
	--			 return i 
	--	end
	--end	
	
	return GetEmpireCountry()
end

--获取战争的完成阶段,暂时使用往上累加的方式来计算
function x310124_GetBattleFinishStep()
	local step = 0
	for stepIndex = 1, getn(x310124_var_BattleStep) do
		if (x310124_var_BattleStep[stepIndex] == 1) then
			step = step + 1
		end
	end
	
	return step
end

--获取下一个最有可能当国王的国家,即主攻方
function x310124_GetNextPossibleKaiser()
end

--玩家进入流程
function x310124_ProcPlayerEnterMap( varMap, varPlayer )
	if (x310124_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310124_ProcPlayerEnterMap --- varMap = %d, varPlayer = %d",
							 varMap, varPlayer))
	end

	x310124_ChangePlayerCamp( varMap, varPlayer, 0)
end

--玩家离开流程
function x310124_ProcPlayerLeaveMap( varMap, varPlayer)
	if (x310124_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310124_ProcPlayerLeaveMap --- varMap = %d, varPlayer = %d",
							 varMap, varPlayer))
	end
	
	x310124_ChangePlayerCamp( varMap, varPlayer, 1)
end

--初始化战争步骤
function x310124_ProcInitBattleStep()

	local npcInfoTable = x310124_var_NpcInfoTable
	
	local tempTable = {}
	if (npcInfoTable ~= nil) then
		for npcInfoIndex = 1, getn(npcInfoTable) do
			for tempIndex = 1, getn(npcInfoTable) do
				
				if (tempTable[tempIndex] == nil) then
					tempTable[tempIndex] = npcInfoTable[npcInfoIndex].var_FinishBit
					break
				elseif (tempTable[tempIndex] == npcInfoTable[npcInfoIndex].var_FinishBit) then
					break
				end
				
			end
		end
	end
	
	if (x310124_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310124_ProcInitBattleStep Debug tempTable = %d"
					, getn(tempTable)))
	end
	
	for stepIndex = 1, getn(tempTable) do
		x310124_var_BattleStep[stepIndex] = 0
	end
	
	if (x310124_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310124_ProcInitBattleStep Debug x310124_var_BattleStep init finish, count = %d"
					, getn(x310124_var_BattleStep)))
	end
	
end

--处理玩家死亡
function x310124_ProcPlayerDie(varMap, varPlayer, varKiller)
	
	if (x310124_var_IsStarted == 1) then
		
		if (GetObjType(varMap, varKiller) == 1
					and GetObjType(varMap, varPlayer) == 1) then
					
			local killerCamp = GetCurCamp(varMap, varKiller)
			local dierCamp = GetCurCamp(varMap, varPlayer)
		
			if (x310124_var_PrintDebugLog == 1) then
				WriteLog(1, 
					format("x310124_ProcPlayerDie Debug --- varMap = %d, varPlayer = %d, varKiller= %d, dierCamp = %d, killerCamp = %d",
								 varMap, varPlayer, varKiller, dierCamp, killerCamp))
			end
			
		 local teamid = GetTeamId(varMap, varKiller)
		 local teamnum = GetNearTeamCount(varMap, varKiller)
			
		if (killerCamp ~= dierCamp) then--对立方,处理任务及荣誉
			if teamid == -1 then
				LuaCallNoclosure(BATTLE_KAISER_MAIN_SCRIPT, "ProcPlayerKillMission",varMap, varKiller, 1) 
			else
				for varI = 0, teamnum - 1 do
				local memberId = GetNearTeamMember(varMap, varKiller, varI)		
					if IsPlayerStateNormal(varMap, memberId) > 0 and GetHp(varMap, memberId) > 0  then
						LuaCallNoclosure(BATTLE_KAISER_MAIN_SCRIPT, "ProcPlayerKillMission",varMap, memberId, 1)	
					end
				end	
			end	
		end
			
		end
	end
end

--更改Npc的可攻击状态
function x310124_ProcNpcAttackableState(varMap)

	local npcInfoTable = x310124_var_NpcInfoTable
	if (npcInfoTable ~= nil) then
		local kaiserCamp = x310124_var_BattleRoleTable[1].campId
		local npcInfo
		for tableIndex = 1, getn(npcInfoTable) do
			npcInfo = npcInfoTable[tableIndex]
			if (npcInfo ~= nil) then
				
				if (x310124_var_PrintDebugLog == 1) then
					WriteLog(1, format("x310124_ProcNpcAttackableState Debug --- x310124_var_IsOpenBackroom = %d, npcGuid = %d, camp = %d",
							x310124_var_IsOpenBackroom, npcInfo.var_Guid, GetMonsterCamp(varMap, npcInfo.var_ObjId)))
				end
				
				if (x310124_var_IsOpenBackroom == 0) then
					if (npcInfo.var_ObjId ~= -1) then
						if (x310124_var_PrintDebugLog == 1) then
							WriteLog(1, format("x310124_ProcNpcAttackableState Debug --- npcObjId = %d, campId = %d",
									npcInfo.var_ObjId, GetMonsterCamp(varMap, npcInfo.var_ObjId)))
						end
					
						if (GetMonsterCamp(varMap, npcInfo.var_ObjId) ~= 20) then
							npcInfo.var_CampId = 20
							SetMonsterCamp(varMap, npcInfo.var_ObjId, npcInfo.var_CampId)
						end
					end
				
				elseif (x310124_var_IsOpenBackroom == 1) then --处理密室已打开状态
					
					if (npcInfo.var_ChangeCampStep == x310124_GetBattleFinishStep()) then
					
						if (npcInfo.var_CampId ~= kaiserCamp) then --与攻方阵营不一致,更改阵营
							if (x310124_var_PrintDebugLog == 1) then
								WriteLog(1, 
									format("x310124_ProcNpcAttackableState Debug --- BattleStep = %d, npcGuid = %d, objId = %d, kaiserCamp = %d",
											 x310124_GetBattleFinishStep(), npcInfo.var_Guid, npcInfo.var_ObjId, kaiserCamp))
							end
							
							npcInfo.var_CampId = kaiserCamp
							if (IsObjValid(varMap, npcInfo.var_ObjId) == 1) then
								SetMonsterCamp(varMap, npcInfo.var_ObjId, kaiserCamp)
							end
						end
						
					end
										
				end
			
			end
		end
		
	end
end

function x310124_ProcDie(varMap, varDie, varKiller)
	if (x310124_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310124_ProcDie Debug --- varMap = %d, varDie = %d, varKiller = %d",
					 varMap, varDie, varKiller))
	end
	
	local npcInfoTable = x310124_var_NpcInfoTable
	if (npcInfoTable ~= nil) then
		local index = -1
		
		for tableIndex = 1, getn(npcInfoTable) do
			if (varDie == npcInfoTable[tableIndex].var_ObjId) then
				index = tableIndex
				break
			end
		end
		
		if (index ~= -1) then
			local npcInfo = npcInfoTable[index]
			if (npcInfo ~= nil) then
				local finishBit = npcInfo.var_FinishBit
				
				if (x310124_var_PrintDebugLog == 1) then
					WriteLog(1, format("x310124_ProcDie Debug --- npcGuid = %d, finishBit = %d",
								 npcInfo.var_Guid, finishBit))
				end
				npcInfo.var_IsExist = 0
				x310124_var_BattleStep[finishBit] = 1 --阶段转换
			end
		end
		
		if (x310124_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310124_ProcDie Debug --- BattleStep = %d",
						 x310124_GetBattleFinishStep()))
		end
		
		--判断是否已经到了结束的步骤
		if (x310124_GetBattleFinishStep() == x310124_var_FinishStep) then
			x310124_GameOver(varMap)
		end
	end

end

--结束的处理
function x310124_ProcBattleKaiserOver(varMap)
	x310124_GameOver(varMap)
end

--游戏结束的处理
function x310124_GameOver(varMap)
	if (x310124_var_IsStarted == 1) then
	
		WriteLog(1, format("x310124_GameOver --- varMap = %d, x310124_var_MainAttack = %d",
				 varMap, x310124_var_MainAttack))
		
		local broadcast, countryName
		
		if (x310124_GetBattleFinishStep() == x310124_var_FinishStep) then
			if (x310124_var_MainAttack == -1) then --没有皇帝产生
				WriteLog(1, format("x310124_GameOver ERROR!!! varMap = %d, x310124_var_MainAttack = %d",
						 varMap, x310124_var_MainAttack))
				
			else
				--向国家变量设置相关信息
				LuaCallNoclosure( BATTLE_KAISER_MAIN_SCRIPT, "SetCountryFreeParam", varMap, x310124_var_MainAttack)
				broadcast = x310124_var_GameBattleOverBroadcast
				
				BattleKaiserOverNotice(x310124_var_MainAttack)
				
				countryName = x310124_var_CountryTable[x310124_var_MainAttack + 1].name
				LuaAllScenceM2Wrold(varMap, format(broadcast, countryName), 5, 1)
			end
			
		else
				--向国家变量设置相关信息
			local nToday = GetDayTime()
			local nKaiserDay = GetCountryParamByBit(x310124_var_MainAttack, CD_KAISER_BATTLE_LAST_KAISER_DATE, 
										x310124_var_LastKaiserDay[1], x310124_var_LastKaiserDay[2])
			
			
			if (nKaiserDay ~= nToday) then --时间结束
				LuaCallNoclosure( BATTLE_KAISER_MAIN_SCRIPT, "SetCountryFreeParam", varMap, x310124_var_KaiserId)
				broadcast = x310124_var_GameBattleOverBroadcast
				
				countryName = x310124_var_CountryTable[x310124_var_KaiserId + 1].name
				LuaAllScenceM2Wrold(varMap, format(broadcast, countryName), 5, 1)
				x310124_ClearAllNpcByGuid(varMap)
			end
			
		end
		
		x310124_ReleaseMapTable()
		x310124_ProcAllPlayerCampOnMap(varMap)
		
		x310124_ProcInitContext()
		
		x310124_ProcPlayerBuff(varMap, 0) --处理玩家buff
		--x310124_ProcNpcInfoLoad(varMap)
	end
	
end

--处理玩家的Buff
function x310124_ProcPlayerBuff(varMap, varSingal)
	if (x310124_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310124_ProcPlayerBuff --- varMap = %d, x310124_var_ConcatenationCount = %d, varSingal = %d"
				, varMap, x310124_var_ConcatenationCount, varSingal))
	end
	
	local buffTable = x310124_var_AttackBuffTable[x310124_var_ConcatenationCount]
	if (buffTable ~= nil) then
		local playerCount = GetScenePlayerCount( varMap )
		
		local playerObjId = -1
		for playerId = 0, (playerCount - 1) do
			playerObjId = GetScenePlayerObjId(varMap, playerId)
			if (playerObjId ~= -1) then
				x310124_ProcBuff(varMap, playerObjId, varSingal)
			end
		end
	end
end


--添加Buff
function x310124_ProcBuff(varMap, varPlayer, varSingal)
	local countryId = GetCurCountry(varMap, varPlayer)
	local role = x310124_var_CountryTable[countryId + 1].role
	
	local buffTable = x310124_var_AttackBuffTable[x310124_var_ConcatenationCount]
	if (buffTable ~= nil) then
		if (role ~= 1) then --增加守方的Buff
			role = 2
		end
		
		if (x310124_var_PrintDebugLog == 1) then
			WriteLog(1, 
					format("x310124_ProcBuff --- varMap = %d, varPlayer = %d, role = %d, varSingal = %d", 
					varMap, varPlayer, role, varSingal))
		end
		
		local buffIds = buffTable[role]
		local buffId = -1
		for buffTableIndex = 1, getn(buffIds) do
			buffId = buffIds[buffTableIndex]
			if (buffId ~= -1) then
				if (varSingal == 1) then
					SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, buffId, 3600)
				elseif (varSingal == 0) then
					if (IsHaveSpecificImpact( varMap, varPlayer, buffId) == 1) then
						CancelSpecificImpact(varMap, varPlayer, buffId)					
					end
				end
			end
		end
		
	end
	
end

--重置场景中的表数据
function x310124_ReleaseMapTable()
	if (x310124_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310124_ReleaseMapTable --- Kaiser Battle Over!!! Excute Relase Table..."))
	end

	local npcInfoTable = x310124_var_NpcInfoTable
	if (npcInfoTable ~= nil) then
		for tableIndex = 1, getn(npcInfoTable) do
			local npcInfo = npcInfoTable[tableIndex]
			if (npcInfo ~= nil) then
				npcInfo.var_CampId = 20
				npcInfo.var_ObjId = -1
				npcInfo.var_IsExist = 0
			end
		end
	end

	x310124_var_BattleStep											=	{}
	x310124_var_IsStarted												=	0
	x310124_var_KaiserId												=	-1
	x310124_var_MainAttack											=	-1	
	x310124_var_ConcatenationCount							=	0 
	x310124_var_IsOpenBackroom									=	0

	for i = 1, 4 do
		x310124_var_BattleRoleTable[i].hasAdscription = 0
		x310124_var_CountryTable[i].role = 0
	end
	
end

function x310124_ProcAddNpcBuff(varMap, varCountry, varTarget, varBuff)
	
	if (x310124_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310124_ProcAddNpcBuff --- varMap = %d, varCountry = %d, varBuff = %d",
					varMap, varCountry, varBuff))
	end

	local playerCount = GetScenePlayerCount( varMap )	
	
	local playerObjId = -1
	for playerId = 0, (playerCount - 1) do
		playerObjId = GetScenePlayerObjId(varMap, playerId)
		if (playerObjId ~= -1) then
			
			if (x310124_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310124_ProcAddNpcBuff --- playerObjId = %d",
							playerObjId))
			end
			
			local country = GetCurCountry(varMap, playerObjId)
			if (varTarget == 1) then --自己国家
				if (country == varCountry) then --同一国家,增加Buff
				
					if (x310124_var_PrintDebugLog == 1) then
						WriteLog(1, format("x310124_ProcAddNpcBuff --- varTarget == 1, role = %d, targetRole = %d",
							playerObjId, playerObjId))
					end
					
					SendSpecificImpactToUnit(varMap, playerObjId, playerObjId, playerObjId, varBuff, 0)
				end
			elseif (varTarget == 2) then --对立方
				
				local role = x310124_var_CountryTable[varCountry + 1].role
				local targetRole = x310124_var_CountryTable[country + 1].role
				if (targetRole ~= role) then
					
					if (x310124_var_PrintDebugLog == 1) then
						WriteLog(1, format("x310124_ProcAddNpcBuff --- varTarget == 2, role = %d, targetRole = %d",
							role, targetRole))
					end
					
					SendSpecificImpactToUnit(varMap, playerObjId, playerObjId, playerObjId, varBuff, 0)
				end
				
			end
			
		end
	end
	
end

function x310124_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

end

function x310124_ProcEventEntry(varMap, varPlayer, varTalknpc)
end

--处理玩家离开区域
function x310124_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )
end
--处理玩家复活的流程
function x310124_ProcPlayerRelive( varMap, varPlayer, varReliveOp)
	if (x310124_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310124_ProcPlayerRelive Debug --- varMap = %d, varPlayer = %d, varReliveOp = %d",
							 varMap, varPlayer, varReliveOp))
	end

	if (varReliveOp == 0) then --原地复活
		local itemCount = GetItemCount(varMap, varPlayer, x310124_var_ReliveItemId)
		if (x310124_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310124_ProcPlayerRelive Debug --- itemCount = %d, varPlayer = %d",
							 itemCount, varPlayer))
		end
		

		if 	varMap == 472 or varMap == 550 or varMap == 551 or varMap == 552 or varMap == 553 or varMap == 554 or varMap == 555 or varMap == 556 or varMap == 557 or varMap == 558 or varMap == 559 or varMap == 560 or varMap == 561 or varMap == 562 or varMap == 563 or varMap == 564  or varMap == 565  or varMap == 566    then  
			if (itemCount > 0) then
				if (DelItem(varMap, varPlayer, x310124_var_ReliveItemId, 1) == 1) then
					
					ClearRageRecoverTick(varMap, varPlayer)
					RestoreHp(varMap, varPlayer, 100)
					RestoreRage(varMap, varPlayer, 100)
					ClearMutexState(varMap, varPlayer, 6)
					SendReliveResult(varMap, varPlayer,1)	
						LastMount(varMap, varPlayer )
						RestoreHp(varMap, varPlayer,0)
					ClearPlayerNextSceneInfo(varMap, varPlayer)
				else
					Msg2Player(varMap, varPlayer, "扣除失败,无法复活", 8, 3)
				end		
			else
				Msg2Player(varMap, varPlayer, x310124_var_ReliveNotice, 8, 3)
			end
		else
				Msg2Player(varMap, varPlayer, "很抱歉,当前场景无法原地复活", 8, 3)
		end		
		
	elseif (varReliveOp == 1 or varReliveOp == 2) then --场景复活
	
		local curCountry = GetCurCountry(varMap, varPlayer)
		if (curCountry < 0 or curCountry > 3) then
			WriteLog(1, 
				format("x310124_ProcPlayerRelive ERRROR!!! --- varMap = %d, varPlayer = %d, curCountry = %d",
							 varMap, varPlayer, curCountry))
			return 
		end
		
		local role = x310124_var_CountryTable[curCountry + 1].role
		local battleRoleInfo = x310124_var_BattleRoleTable[role].birthPlace
		if (battleRoleInfo ~= nil) then
			ClearRageRecoverTick( varMap, varPlayer)
	    RestoreHp( varMap, varPlayer, 100)
	    RestoreRage( varMap, varPlayer, 100)
	    ClearMutexState( varMap, varPlayer, 6)
	    SendReliveResult( varMap, varPlayer, 1)
	    NewWorld(varMap, varPlayer, battleRoleInfo[1], 
							battleRoleInfo[2], battleRoleInfo[3], x310123_var_FileId);
			ClearPlayerNextSceneInfo(varMap, varPlayer)				
		end
		
	end
end
--向Npc身上增加Buff
function x310124_ProcAppendBuffToNpc(varMap)
	if (x310124_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310124_ProcAppendBuffToNpc Info ... "))
	end
	
	local npcBuffTable
	for index, npcInfo in x310124_var_NpcInfoTable do
		if (npcInfo.var_IsExist == 1 and npcInfo.var_ObjId ~= -1) then
			
			npcBuffTable = npcInfo.var_AddBuff
			if (npcBuffTable ~= nil) then
				
				for buffIndex, buffInfo in npcBuffTable do
					if (IsHaveSpecificImpact(varMap, npcInfo.var_ObjId, buffInfo) == 1) then
						if (x310124_var_PrintDebugLog == 0) then
							WriteLog(1, format("x310124_ProcAppendBuffToNpc Debug ... Has Buff npcId = %d, buffId = %d",
								npcInfo.var_ObjId, buffInfo))
						end
					
						CancelSpecificImpact(varMap, npcInfo.var_ObjId, buffInfo)
					end
					
					SendSpecificImpactToUnit(varMap, npcInfo.var_ObjId, npcInfo.var_ObjId, npcInfo.var_ObjId, buffInfo, 0)
				end
			
			end
			
		end
	end
end
