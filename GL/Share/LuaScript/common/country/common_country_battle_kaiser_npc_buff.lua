--皇帝战相关处理NPCbuff相关脚本
x310126_var_FileId		 											= 310126
x310126_var_HasKaiserScript									=	310122 --有皇帝的脚本
x310126_var_AvailabilityMap									=	SCENE_BATTLE_KAISER
x310126_var_MapID														= SCENE_BATTLE_KAISER	--皇帝战场景Id

x310126_var_PrintDebugLog										=	0 --debug输出
x310126_var_PrintInfoLog										=	1	--输出基本调用信息日志

x310126_var_RequestNpcBuffOfficail					=	6	--请求NPCBuff的官阶

x310126_var_RequestNpcBuffCostResId					=	1 --请求NPCBuff消耗的资源Id
x310126_var_RequestNpcBuffCostResNum				=	500 --请求NPCBuff消耗的资源数量
x310126_var_StartMark												=	1	--开始标识
x310126_var_RequestNpcBuffWeekIndexBit			=	{0, 12} --请求NPCBuff的周索引位
x310126_var_RequestNpcBuffCountBit					=	{12, 5} --请求NPCBuff的当前次数位

x310126_var_AddNpcBuffButton								=	"【国家】国民能力增强" --添加NPCBuff的Button显示
x310126_var_RequestNpcBuffNotEnough					=	"很遗憾，国家没有足够的粮草，无法进行国民能力增强" --请求NPCBuff资源不足的提示
x310126_var_OfficailFailNotice							=	"很遗憾，我只接受各国大将军的号令"
x310126_var_KaiserRequestNpcBuffFailNotice	=	"皇帝攻防战没有开始,无法进行国民能力增强" --添加Buff失败的提示
x310126_var_NoKaiserConfirm									=	"只有皇帝攻防战中才可以进行国民能力增强" --没有皇帝的提示
x310126_var_AddBuffNotice										=	"你顺利的对国民能力进行了增强,还可以使用%d次" --Buff使用成功的提示
x310126_var_NpcBuffTimeNotice								=	"你当前已经使用%d次,还可以使用%d次。每次消耗#R500石#W国家粮草。" --NPCBuff的次数提示
x310126_var_NpcBuffTimeLimit								=	"使用次数已经到达上限,不能再次使用" --NPCBuff的上限提示

--请求NPC给玩家添加的Buff,也根据连任次数来选择
x310126_var_RequestNpcBuffTable							=
{
{ --第一次
		{ --守方
			var_Times = 6,
			var_BuffInfo = 
			{
				{
					var_BuffName 			= "国民血量增强（+10000）",
					var_BuffId				=	30565,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民防御增强（+800）",
					var_BuffId				=	30566,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民攻击增强（+1000）",
					var_BuffId				=	30567,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民速度增强（+50%）",
					var_BuffId				=	30568,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "攻方速度减缓（-50%）",
					var_BuffId				=	30569,
					var_Target				=	2 --目标,1为本国家,2为敌对方
				},							
			}
		},
		{	--攻方
			var_Times = 6,
			var_BuffInfo = 
			{
				{
					var_BuffName 			= "国民血量增强（+10000）",
					var_BuffId				=	30565,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民防御增强（+800）",
					var_BuffId				=	30566,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民攻击增强（+1000）",
					var_BuffId				=	30567,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民速度增强（+50%）",
					var_BuffId				=	30568,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},	
				{
					var_BuffName 			= "守方速度减缓（-50%）",
					var_BuffId				=	30569,
					var_Target				=	2 --目标,1为本国家,2为敌对方
				},
			}								
		}
	},
	{	--第二次
		{ --守方
			var_Times = 6,
			var_BuffInfo = 
			{
				{
					var_BuffName 			= "国民血量增强（+10000）",
					var_BuffId				=	30565,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民防御增强（+800）",
					var_BuffId				=	30566,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民攻击增强（+1000）",
					var_BuffId				=	30567,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民速度增强（+50%）",
					var_BuffId				=	30568,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "攻方速度减缓（-50%）",
					var_BuffId				=	30569,
					var_Target				=	2 --目标,1为本国家,2为敌对方
				},
			}									
		},
		{	--攻方
			var_Times = 7,
			var_BuffInfo = 
			{
				{
					var_BuffName 			= "国民血量增强（+10000）",
					var_BuffId				=	30565,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民防御增强（+800）",
					var_BuffId				=	30566,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民攻击增强（+1000）",
					var_BuffId				=	30567,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民速度增强（+50%）",
					var_BuffId				=	30568,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "守方速度减缓（-50%）",
					var_BuffId				=	30569,
					var_Target				=	2 --目标,1为本国家,2为敌对方
				},
			}									
		}
	},
	{	--第三次
		{ --守方
			var_Times = 6,
			var_BuffInfo = 
			{
				{
					var_BuffName 			= "国民血量增强（+10000）",
					var_BuffId				=	30565,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民防御增强（+800）",
					var_BuffId				=	30566,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民攻击增强（+1000）",
					var_BuffId				=	30567,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民速度增强（+50%）",
					var_BuffId				=	30568,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "攻方速度减缓（-50%）",
					var_BuffId				=	30569,
					var_Target				=	2 --目标,1为本国家,2为敌对方
				},
			}									
		},
		{	--攻方
			var_Times = 8,
			var_BuffInfo = 
			{
				{
					var_BuffName 			= "国民血量增强（+10000）",
					var_BuffId				=	30565,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民防御增强（+800）",
					var_BuffId				=	30566,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民攻击增强（+1000）",
					var_BuffId				=	30567,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民速度增强（+50%）",
					var_BuffId				=	30568,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},	
				{
					var_BuffName 			= "守方速度减缓（-50%）",
					var_BuffId				=	30569,
					var_Target				=	2 --目标,1为本国家,2为敌对方
				},
			}								
		}
	},
	{	--第四次
		{ --守方
			var_Times = 6,
			var_BuffInfo = 
			{		
				{
					var_BuffName 			= "国民血量增强（+10000）",
					var_BuffId				=	30565,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民防御增强（+800）",
					var_BuffId				=	30566,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民攻击增强（+1000）",
					var_BuffId				=	30567,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民速度增强（+50%）",
					var_BuffId				=	30568,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},			
				{
					var_BuffName 			= "攻方速度减缓（-50%）",
					var_BuffId				=	30569,
					var_Target				=	2 --目标,1为本国家,2为敌对方
				},
			}							
		},
		{	--攻方
			var_Times = 9,
			var_BuffInfo = 
			{		
				{
					var_BuffName 			= "国民血量增强（+10000）",
					var_BuffId				=	30565,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民防御增强（+800）",
					var_BuffId				=	30566,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民攻击增强（+1000）",
					var_BuffId				=	30567,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民速度增强（+50%）",
					var_BuffId				=	30568,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},	
				{
					var_BuffName 			= "守方速度减缓（-50%）",
					var_BuffId				=	30569,
					var_Target				=	2 --目标,1为本国家,2为敌对方
				},
			}									
		}
	},
	{	--第五次
			{ --守方
				var_Times = 6,
			var_BuffInfo = 
			{
				{
					var_BuffName 			= "国民血量增强（+10000）",
					var_BuffId				=	30565,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民防御增强（+800）",
					var_BuffId				=	30566,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民攻击增强（+1000）",
					var_BuffId				=	30567,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民速度增强（+50%）",
					var_BuffId				=	30568,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "攻方速度减缓（-50%）",
					var_BuffId				=	30569,
					var_Target				=	2 --目标,1为本国家,2为敌对方
				},
			}									
		},
		{	--攻方
			var_Times = 10,
			var_BuffInfo = 
			{
				{
					var_BuffName 			= "国民血量增强（+10000）",
					var_BuffId				=	30565,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民防御增强（+800）",
					var_BuffId				=	30566,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民攻击增强（+1000）",
					var_BuffId				=	30567,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "国民速度增强（+50%）",
					var_BuffId				=	30568,
					var_Target				=	1 --目标,1为本国家,2为敌对方
				},
				{
					var_BuffName 			= "守方速度减缓（-50%）",
					var_BuffId				=	30569,
					var_Target				=	2 --目标,1为本国家,2为敌对方
				},
			}									
		}
	}
}

function x310126_ProcEnumEvent(varMap, varPlayer, varTalknpc)
	if (x310126_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310126_ProcEnumEvent Debug --- varMap = %d, varPlayer = %d, varTalknpc = %d", 
					varMap, varPlayer, varTalknpc))
	end
	
	TalkAppendButton(varMap, x310126_var_FileId, x310126_var_AddNpcBuffButton, 3, 1)
end

function x310126_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	if (x310126_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310126_ProcEventEntry --- varMap = %d, varPlayer = %d, varTalknpc = %d"
			,	varMap, varPlayer, varTalknpc))
	end
	
	if (idExt ~= nil) then
		if (x310126_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310126_ProcEventEntry --- idExt = %d"
				,	idExt))
		end
	
		if (idExt == 1) then
			x310126_ProcRequestNpcAddBuff(varMap, varPlayer, varTalknpc)
		else
			x310126_ProcRequestNpcBuffBroadcast(varMap, varPlayer, varTalknpc, idExt)
		end
	end
	
end

--加Buff的处理
function x310126_ProcRequestNpcAddBuff(varMap, varPlayer, varTalknpc)
	if (x310126_var_PrintInfoLog == 1) then
		WriteLog(1, 
			format("x310126_ProcRequestNpcAddBuff Info --- varMap = %d, varPlayer = %d, varTalknpc = %d",
						 varMap, varPlayer, varTalknpc))
	end
	
	local isBattleStarted = LuaCallNoclosure(x310126_var_HasKaiserScript, "IsBattleStarted", varMap)
	if (x310126_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310126_ProcRequestNpcAddBuff Debug --- isBattleStarted = %d", 
					isBattleStarted))
	end
	
	if (isBattleStarted == x310126_var_StartMark) then
		if( CountryGetOfficial(varMap, varPlayer) ~= x310126_var_RequestNpcBuffOfficail ) then
			x310126_ProcNoticeToPlayer(varMap, varPlayer, varTalknpc, x310126_var_OfficailFailNotice)
			return 
		end
		
		local kaiserId = x310126_GetKaiserCountry()
		if (kaiserId == -1) then
			x310126_ProcNoticeToPlayer(varMap, varPlayer, varTalknpc, x310126_var_NoKaiserConfirm)
			return
		end
		
		local npcBuffTableCount = x310126_GetConcatenationCount(varMap)
		if (x310126_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310126_ProcRequestNpcAddBuff Debug --- kaiserId = %d, npcBuffTableCount = %d", 
					kaiserId, npcBuffTableCount))
		end
		
		local buffTable = x310126_var_RequestNpcBuffTable[npcBuffTableCount]
		if (buffTable ~= nil) then
			local countryId = GetCurCountry(varMap, varPlayer)
			local role = LuaCallNoclosure(x310126_var_HasKaiserScript, "GetCountryRole", varMap, varPlayer)
			if (role > 1) then
				role = 2
			end
			
			if (x310126_var_PrintDebugLog == 1) then
				WriteLog(1, 
					format("x310126_ProcRequestNpcAddBuff Debug --- role = %d",
						 role))
						 
				--if (role == 0) then --测试使用
				--	role = 1
				--end
			end
			
			local rolesTable = buffTable[role]
			if (rolesTable ~= nil) then
				
				local totalTimes = rolesTable.var_Times
				if (totalTimes == nil) then
					WriteLog(1, format("x310126_ProcRequestNpcAddBuff ERROR --- BuffRoleTimes is nil !!!"))
					return 
				end
				
				local roleBuffTable = rolesTable.var_BuffInfo
				local roleBuff = nil
				if (roleBuffTable ~= nil) then
				
					local currentCount = x310126_ProcNpcBuffTimesInfo(countryId)
					if (x310126_var_PrintDebugLog == 1) then
						WriteLog(1, format("x310126_ProcRequestNpcAddBuff Debug --- totalTimes = %d, currentCount = %d", 
									totalTimes, currentCount))
					end
					
					if (currentCount >= totalTimes) then
						x310126_ProcNoticeToPlayer(varMap, varPlayer, varTalknpc, x310126_var_NpcBuffTimeLimit)
						return
					end
				
					StartTalkTask(varMap)
					TalkAppendString(varMap, format(x310126_var_NpcBuffTimeNotice, currentCount, totalTimes - currentCount))
					
					if (x310126_var_PrintDebugLog == 1) then
						WriteLog(1, format("x310126_ProcRequestNpcAddBuff Debug --- countryId = %d, role = %d, roleBuffTableCount = %d", 
									countryId, role, getn(roleBuffTable)))
					end
					
					for buffIndex = 1, getn(roleBuffTable) do
						roleBuff = roleBuffTable[buffIndex]
						if (roleBuff ~= nil) then
							TalkAppendButton(varMap, x310126_var_FileId, roleBuff.var_BuffName, 3, roleBuff.var_BuffId)
						end
					end
					
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varTalknpc)
				end
			end
		end
		
	else
		x310126_ProcNoticeToPlayer(varMap, varPlayer, varTalknpc, x310126_var_KaiserRequestNpcBuffFailNotice)
	end
end

--想玩家通知
function x310126_ProcNoticeToPlayer(varMap, varPlayer, varTalknpc, varNotice)
	Msg2Player(varMap, varPlayer, varNotice, 8, 3)
end

--获取皇帝国家
function x310126_GetKaiserCountry()
	return GetEmpireCountry()
end

function x310126_ProcRequestNpcBuffSubResValid(varMap, varCountry, varIndex, varResult, varPlayer, varTalknpc, varBuff)
	if (x310126_var_PrintInfoLog == 1) then
		WriteLog(1, 
		format("x310126_ProcRequestNpcBuffSubResValidate Debug --- varMap = %d, varCountry = %d, varIndex = %d, varResult = %d, varPlayer = %d",
						varMap, varCountry, varIndex, varResult, varPlayer))
	end
	
	if (varResult == 0) then
		
		local count = GetCountryResource(varMap, varPlayer, x310126_var_RequestNpcBuffCostResId)
		if (count >= x310126_var_RequestNpcBuffCostResNum) then
			SubCountryResourceWithRecall(varMap, countryId, x310126_var_RequestNpcBuffCostResId
							, x310126_var_RequestNpcBuffCostResNum, x310126_var_FileId, "ProcRequestNpcBuffSubResValid",
							varPlayer, varTalknpc, varBuff)
		else
			--提示不够
			x310126_ProcNoticeToPlayer(varMap, varPlayer, varTalknpc, x310126_var_RequestNpcBuffNotEnough)
		end
		
	elseif (varResult == 1) then
		local npcBuffTableCount = x310126_GetConcatenationCount(varMap)
		if (x310126_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310126_ProcRequestNpcBuffSubResValid Debug --- npcBuffTableCount = %d", 
					npcBuffTableCount))
		end
		
		local buffTable = x310126_var_RequestNpcBuffTable[npcBuffTableCount]
		local role = 0
		if (buffTable ~= nil) then
			
			role = LuaCallNoclosure(x310126_var_HasKaiserScript, "GetCountryRole", varMap, varPlayer)
			if (role > 1) then
				role = 2
			end
			
			--测试使用
			--if (role == 0) then
			--	role = 1
			--end
			
			local rolesTable = buffTable[role]
			if (rolesTable ~= nil) then
				
				local roleBuffTable = rolesTable.var_BuffInfo
				local roleBuff = nil
				if (roleBuffTable ~= nil) then
					
					for buffIndex = 1, getn(roleBuffTable) do
						roleBuff = roleBuffTable[buffIndex]
						
						if (roleBuff ~= nil) then
							if (roleBuff.var_BuffId == varBuff) then
								
								if (x310126_var_PrintInfoLog == 1) then
									WriteLog(1, format("x310126_ProcRequestNpcBuffSubResValidate Info --- Send Broadcast, varBuff = %d"
											, varBuff))
								end
								
								x310126_ProcAddNpcBuff(x310126_var_MapID, varCountry, roleBuff.var_Target, varBuff)
								TransferKaiserOrder(6, SCENE_BATTLE_KAISER_BACKROOM, varCountry, 
														BATTLE_KAISER_MAIN_SCRIPT, roleBuff.var_Target, varBuff)

								local currentCount = x310126_ProcNpcBuffTimesInfo(varCountry)
								SetCountryParamByBit(varCountry, CD_KAISER_BATTLE_REQUEST_NPC_BUFF_INFO, 
									x310126_var_RequestNpcBuffCountBit[1], x310126_var_RequestNpcBuffCountBit[2], currentCount + 1)
								
								StartTalkTask(varMap)
								TalkAppendString(varMap, format(x310126_var_AddBuffNotice, (rolesTable.var_Times - (currentCount + 1) )) )
								StopTalkTask(varMap)
								DeliverTalkMenu(varMap, varPlayer, varTalknpc)
								
								break
							end
						end
						
					end
					
				end
			end
		end
		
	end
end

--通过NPC增加相应Buff
function x310126_ProcAddNpcBuff(varMap, varCountry, varTarget, varBuff)
	
	if (x310126_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310126_ProcAddNpcBuff --- varMap = %d, varCountry = %d, varBuff = %d",
					varMap, varCountry, varBuff))
	end

	local playerCount = GetScenePlayerCount( varMap )	
	local playerObjId = -1
	for playerId = 0, (playerCount - 1) do
		playerObjId = GetScenePlayerObjId(varMap, playerId)
		if (playerObjId ~= -1) then
			local country = GetCurCountry(varMap, playerObjId)
			if (x310126_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310126_ProcAddNpcBuff --- playerObjId = %d, country = %d",
							playerObjId, country))
			end			
			
			if (varTarget == 1) then --自己国家
				if (country == varCountry) then --同一国家,增加Buff
				
					if (x310126_var_PrintDebugLog == 1) then
						WriteLog(1, format("x310126_ProcAddNpcBuff --- varTarget == 1, targetRole = %d",
							playerObjId))
					end
					
					SendSpecificImpactToUnit(varMap, playerObjId, playerObjId, playerObjId, varBuff, 0)
				end
			elseif (varTarget == 2) then --对立方
				
				local role = LuaCallNoclosure(x310126_var_HasKaiserScript, "GetCountryRoleByCountry", varMap, varCountry + 1)
				local targetRole = LuaCallNoclosure(x310126_var_HasKaiserScript, "GetCountryRoleByCountry", varMap, country + 1)
				if (x310126_var_PrintDebugLog == 1) then
					WriteLog(1, format("x310126_ProcAddNpcBuff --- varTarget == 2, role = %d, targetRole = %d",
						role, targetRole))
				end
				
				if (role == 1) then
					if (targetRole ~= 1) then
						SendSpecificImpactToUnit(varMap, playerObjId, playerObjId, playerObjId, varBuff, 0)
					end
				else
					if (targetRole == 1) then
						SendSpecificImpactToUnit(varMap, playerObjId, playerObjId, playerObjId, varBuff, 0)
					end
				end
				
			end
		end
	end
end

--处理请求NpcBuff的广播
function x310126_ProcRequestNpcBuffBroadcast(varMap, varPlayer, varTalknpc, varBuff)
	if (x310126_var_PrintDebugLog == 1) then
		WriteLog(1, 
			format("x310126_ProcRequestNpcBuffBroadcast Debug --- varMap = %d, varTalknpc = %d, varBuff = %d",
						 varMap, varTalknpc, varBuff))
	end
	
	local countryId = GetCurCountry(varMap, varPlayer)
	local isBattleStarted = LuaCallNoclosure(x310126_var_HasKaiserScript, "IsBattleStarted", varMap)
	if (isBattleStarted == x310126_var_StartMark) then
		
		--判断官阶
		if( CountryGetOfficial(varMap, varPlayer) == x310126_var_RequestNpcBuffOfficail ) then
			local resNum = GetCountryResource(varMap, varPlayer, x310126_var_RequestNpcBuffCostResId)
			if (x310126_var_PrintDebugLog == 1) then
				WriteLog(1, 
					format("x310126_ProcRequestNpcBuffBroadcast Debug --- resNum = %d",
								resNum))
			end
			
			if (resNum >= x310126_var_RequestNpcBuffCostResNum) then	--如果满足数量,则去GL验证
				SubCountryResourceWithRecall(varMap, countryId, x310126_var_RequestNpcBuffCostResId
							, x310126_var_RequestNpcBuffCostResNum, x310126_var_FileId, "ProcRequestNpcBuffSubResValid",
								varPlayer, varTalknpc, varBuff)
			else
				x310126_ProcNoticeToPlayer(varMap, varPlayer, varTalknpc, x310126_var_RequestNpcBuffNotEnough)
			end
		else	
			x310126_ProcNoticeToPlayer(varMap, varPlayer, varTalknpc, x310126_var_OfficailFailNotice)
		end
		
	end
end

--获取连任次数
function x310126_GetConcatenationCount(varMap)
	local kaiserId = x310126_GetKaiserCountry()
	local count = LuaCallNoclosure(x310126_var_HasKaiserScript, "GetConcatenationCount", varMap, kaiserId)
	if (count > getn(x310126_var_RequestNpcBuffTable)) then
		if (x310126_var_PrintInfoLog == 1) then
			WriteLog(1, 
				format("x310126_GetConcatenationCount  Info --- ConcatenationCount > x310126_var_RequestNpcBuffTable, count = %d",
					 count))
		end
		
		count = getn(x310126_var_RequestNpcBuffTable)
	elseif (count <= 0) then
		count = 1
	end
	
	return count
end

--处理请求NPCBuff的次数
function x310126_ProcNpcBuffTimesInfo(varCountryId)
	if (x310126_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310126_ProcRequestNpcBuffTimes --- varCountryId = %d"
			,	varCountryId))
	end
	
	local curWeekIndex = GetWeekIndex() --当前周索引
	local requestNpcBuffWeek = GetCountryParamByBit(varCountryId, CD_KAISER_BATTLE_REQUEST_NPC_BUFF_INFO, 
				x310126_var_RequestNpcBuffWeekIndexBit[1], x310126_var_RequestNpcBuffWeekIndexBit[2])
	
	if (curWeekIndex ~= requestNpcBuffWeek) then
		SetCountryParamByBit(varCountryId, CD_KAISER_BATTLE_REQUEST_NPC_BUFF_INFO, 
				x310126_var_RequestNpcBuffWeekIndexBit[1], x310126_var_RequestNpcBuffWeekIndexBit[2], curWeekIndex) --设置当前周索引
				
		SetCountryParamByBit(varCountryId, CD_KAISER_BATTLE_REQUEST_NPC_BUFF_INFO, 
				x310126_var_RequestNpcBuffCountBit[1], x310126_var_RequestNpcBuffCountBit[2], 0) --次数清零
	end
	
	local currentCount = GetCountryParamByBit(varCountryId, CD_KAISER_BATTLE_REQUEST_NPC_BUFF_INFO, 
				x310126_var_RequestNpcBuffCountBit[1], x310126_var_RequestNpcBuffCountBit[2])
				
	return currentCount
end

function x310126_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x310126_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if (x310126_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310126_ProcQuestAccept --- varMap = %d, varPlayer = %d, varTalknpc = %d"
			,	varMap, varPlayer, varTalknpc))
	end
	
end

function x310126_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
end
