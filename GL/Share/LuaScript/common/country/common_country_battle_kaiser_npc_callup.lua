--皇帝战相关处理NPC召唤相关脚本
x310129_var_FileId		 											= 310129
x310129_var_HasKaiserScript									=	310122 --有皇帝的脚本
x310129_var_AvailabilityMap									=	SCENE_BATTLE_KAISER

x310129_var_PrintDebugLog										=	0 --debug输出
x310129_var_PrintInfoLog										=	1	--输出基本调用信息日志

x310129_var_AddTowerButton									=	"【国家】召唤守卫军力" --增加防御塔
x310129_var_BattleNotStartNotice						=	"很抱歉，皇帝战还没有开启，无法召唤守卫军力" --战争没有开启的提示
x310129_var_BattleRoleNotice								=	"只有皇帝国才可以召唤守卫军力" --战争没有开启的提示
x310129_var_AddTowerConfirm									=	"您确认要召出%s吗?"
x310129_var_CallUpDescription								=	"\t你可以通过消耗国家粮草或现金来召唤守卫。" --召唤的描述
x310129_var_FullTimeNotice									=	"\t很抱歉，您已经无法再召集守卫了。" --次数已满的提示
x310129_var_ResourceNotEnoughNotice					=	"很抱歉，您国家的粮草不足，无法召唤守卫" --资源不足的提示
x310129_var_MoneyNotEnoughNotice						=	"很抱歉，您的现金不足，无法召唤守卫" --资源不足的提示
x310129_var_NpcExistNotice									=	"\t此守卫已经存在,不能重复召唤" --NPC已经存在的提示
x310129_var_CallUpSuccessNotice							=	"\t恭喜您召唤守卫完成！" --召唤成功的提示
x310129_var_FirstMenuNotice									=	"\t在召唤守卫时要注意召唤的时机和位置，恰当的召唤有时候会对战局产生逆转的效果！"
x310129_var_KaiserCallUpOfficailFail				=	"我只听从各国大将军的号令" --官阶判断提示

x310129_var_TempNpcId												=	-1 --临时记录

x310129_var_EnableRole											=	1 --防守方
x310129_var_RequestCallInOfficail						=	6 --可以发动召集的官阶

--国家召唤次数记录表
x310129_var_CallupNpcInfoRecordTable				=	{}
x310129_var_CallupWeekIndex									=	0 --召唤的周索引

--召唤NPC信息
x310129_var_CallupNpcInfo										=
{
	[401234] 																	=
	{
		{
			var_ButtonName						=	"城门守卫", --显示的按钮的名字
			var_NpcMark								=	1001, 		--标识召唤NPC的对应标志
			var_CallNpcInfoTable			=	 --一次创建多个NPC,方便箭塔跟影子的符合
			{
				{
					var_CallNpcType				=	3993,
					var_Guid							=	1001,
					var_AIType						=	25,
					var_AI								=	0,
					var_Pos								=	{255, 229},
					var_CampId						=	5,
					var_AliveTime					=	30*60*1000,         --生存时间
					var_AddBuff						=	{7989},
					var_ObjId							=	-1
				},
			},
			var_CostType							=	
			{
				{
					var_CostTypeId				=	5001,												 --用做该NPC的唯一标识
					var_CostTypeName 			=	"消耗粮草(%d石),还可召唤%d次", --显示的描述
					var_TotalTime					=	1,
					var_CostTarget				=	1,	--消耗对象,1为国家,2为玩家
					var_CostResId					=	1,
					var_CostValues				=	{1000} --消耗的值,不同次数消耗的值不同
				},
				{
					var_CostTypeId				=	5002,												 --用做该NPC的唯一标识
					var_CostTypeName 			=	"消耗现金(%d两),还可召唤%d次", --显示的描述
					var_TotalTime					=	4,
					var_CostTarget				=	2,	--消耗对象,1为国家,2为玩家
					var_CostResId					=	2,
					var_CostValues				=	{50, 50, 100, 100} --消耗的值,不同次数消耗的值不同
				}
			}
		},
		
		{
			var_ButtonName						=	"威武之魂守卫", --显示的按钮的名字
			var_NpcMark								=	1002, 		--标识召唤NPC的对应标志
			var_CallNpcInfoTable			=	 --一次创建多个NPC,方便箭塔跟影子的符合
			{
				{
					var_CallNpcType				=	3993,
					var_Guid							=	1002,
					var_AIType						=	25,
					var_AI								=	0,
					var_Pos								=	{254, 190},
					var_CampId						=	5,
					var_AliveTime					=	30*60*1000,         --生存时间
					var_AddBuff						=	{7989},
					var_ObjId							=	-1
				},
--				{
--					var_CallNpcType				=	3952,
--					var_Guid							=	111112,
--					var_AIType						=	22,
--					var_AI								=	0,
--					var_Pos								=	{206, 305},
--					var_CampId						=	5,
--					var_AliveTime					=	10000,         --生存时间
--					var_ObjId							=	-1
--				}
			},
			var_CostType							=	
			{
				{
					var_CostTypeId				=	5001,												 --用做该NPC的唯一标识
					var_CostTypeName 			=	"消耗粮草(%d石),还可召唤%d次", --显示的描述
					var_TotalTime					=	1,
					var_CostTarget				=	1,	--消耗对象,1为国家,2为玩家
					var_CostResId					=	1,
					var_CostValues				=	{1000} --消耗的值,不同次数消耗的值不同
				},
				{
					var_CostTypeId				=	5002,												 --用做该NPC的唯一标识
					var_CostTypeName 			=	"消耗金钱(%d两),还可召唤%d次", --显示的描述
					var_TotalTime					=	4,
					var_CostTarget				=	2,	--消耗对象,1为国家,2为玩家
					var_CostResId					=	2,
					var_CostValues				=	{50, 50, 100, 100} --消耗的值,不同次数消耗的值不同
				}
			}
		},
		
	},
	
	
		[401235] 																	=
	{
		{
			var_ButtonName						=	"统御之魂守卫", --显示的按钮的名字
			var_NpcMark								=	1010, 		--标识召唤NPC的对应标志
			var_CallNpcInfoTable			=	 --一次创建多个NPC,方便箭塔跟影子的符合
			{
				{
					var_CallNpcType				=	3994,
					var_Guid							=	1010,
					var_AIType						=	25,
					var_AI								=	0,
					var_Pos								=	{255, 120},
					var_CampId						=	5,
					var_AliveTime					=	30*60*1000,         --生存时间
					var_AddBuff						=	{7989},
					var_ObjId							=	-1
				},
			},
			var_CostType							=	
			{
				{
					var_CostTypeId				=	5001,												 --用做该NPC的唯一标识
					var_CostTypeName 			=	"消耗粮草(%d石),还可召唤%d次", --显示的描述
					var_TotalTime					=	1,
					var_CostTarget				=	1,	--消耗对象,1为国家,2为玩家
					var_CostResId					=	1,
					var_CostValues				=	{1000} --消耗的值,不同次数消耗的值不同
				},
				{
					var_CostTypeId				=	5002,												 --用做该NPC的唯一标识
					var_CostTypeName 			=	"消耗金钱(%d两),还可召唤%d次", --显示的描述
					var_TotalTime					=	4,
					var_CostTarget				=	2,	--消耗对象,1为国家,2为玩家
					var_CostResId					=	2,
					var_CostValues				=	{50, 50, 100, 100} --消耗的值,不同次数消耗的值不同
				}
			}
		},
		
		
	},
	
	
--		[401551] 																	=
--	{
--		{
--			var_ButtonName						=	"长生天守卫", --显示的按钮的名字
--			var_NpcMark								=	1020, 		--标识召唤NPC的对应标志
--			var_CallNpcInfoTable			=	 --一次创建多个NPC,方便箭塔跟影子的符合
--			{
--				{
--					var_CallNpcType				=	3995,
--					var_Guid							=	1020,
--					var_AIType						=	5,
--					var_AI								=	0,
--					var_Pos								=	{64, 68},
--					var_CampId						=	5,
--					var_AliveTime					=	30*60*1000,         --生存时间
--					var_ObjId							=	-1
--				},
--				{
--					var_CallNpcType				=	3952,
--					var_Guid							=	111112,
--					var_AIType						=	22,
--					var_AI								=	0,
--					var_Pos								=	{212, 301},
--					var_CampId						=	5,
--					var_AliveTime					=	10000,         --生存时间
--					var_ObjId							=	-1
--				}
--		}
--			
--		},
--		
--			{
--		},
--		
--	},
	
}

--玩家接受时的临时对应表
x310129_var_PlayerAcceptTable					= {}

function x310129_ProcEnumEvent(varMap, varPlayer, varTalknpc)
	if (x310129_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310129_ProcEnumEvent Debug --- varMap = %d, varPlayer = %d, varTalknpc = %d", 
					varMap, varPlayer, varTalknpc))
	end
	
	if (x310129_var_PlayerAcceptTable[varPlayer] == nil) then
		x310129_var_PlayerAcceptTable[varPlayer] = {}
	end
	
	TalkAppendButton(varMap, x310129_var_FileId, x310129_var_AddTowerButton, 3, 1)
end

--获取皇帝国家
function x310129_GetKaiserCountry()
	if (x310129_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310129_ProcEnumEvent Debug --- varMap = %d, varPlayer = %d, varTalknpc = %d", 
					varMap, varPlayer, varTalknpc))
	end
	
	if (x310129_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310129_ProcEnumEvent Debug ---role = %d", 
					role))
	end
	
	if (role == 1) then --防守方
		TalkAppendButton(varMap, x310129_var_FileId, x310129_var_AddTowerButton, 3, 1)
	end

	return GetEmpireCountry()
end

function x310129_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)

	if (x310129_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310129_ProcEventEntry --- varMap = %d, varPlayer = %d, varTalknpc = %d"
			,	varMap, varPlayer, varTalknpc))
	end
	
	if (idExt ~= nil) then
		if (x310129_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310129_ProcEventEntry --- idExt = %d"
				,	idExt))
		end
		
		if( CountryGetOfficial(varMap, varPlayer) ~= x310129_var_RequestCallInOfficail ) then
			Msg2Player(varMap, varPlayer, x310129_var_KaiserCallUpOfficailFail, 8, 3)
			return
		end
		
		if (idExt == 1) then --召唤塔
			local isBattleStarted = LuaCallNoclosure(x310129_var_HasKaiserScript, "IsBattleStarted", varMap)
			if (x310129_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310129_ProcEventEntry Debug --- isBattleStarted = %d", 
							isBattleStarted))
			end
			
			if (isBattleStarted ~= 1) then
				x310129_NoticeToPlayer(varMap, varPlayer, varTalknpc, x310129_var_BattleNotStartNotice)
				return	
			end
			
			local role = LuaCallNoclosure(x310129_var_HasKaiserScript, "GetCountryRole", varMap, varPlayer)
			if (x310129_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310129_ProcEventEntry Debug ---role = %d", 
							role))
			end
			
			if (role ~= x310129_var_EnableRole) then
				x310129_NoticeToPlayer(varMap, varPlayer, varTalknpc, x310129_var_BattleRoleNotice)
				return 
			end
		
			local guid = GetMonsterGUID(varMap, varTalknpc)
			local npcInfoTable = x310129_var_CallupNpcInfo[guid]
			
			StartTalkTask(varMap)
			TalkAppendString(varMap, x310129_var_FirstMenuNotice)
			local npcInfo = nil
			for i = 1, getn(npcInfoTable) do
				npcInfo = npcInfoTable[i]
				if (npcInfo ~= nil) then
					TalkAppendButton(varMap, x310129_var_FileId, npcInfo.var_ButtonName, 3, npcInfo.var_NpcMark)		
				end
			end
				
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif (idExt > 1000 and idExt < 5000) then
			local guid = GetMonsterGUID(varMap, varTalknpc)
			local npcInfoTable = x310129_var_CallupNpcInfo[guid]
			for i, npcInfo in npcInfoTable do
				if (npcInfo ~= nil) then
					if (npcInfo.var_NpcMark == idExt) then --找到标记
						
						local costTypeTable = npcInfo.var_CostType
						if (costTypeTable ~= nil) then
							StartTalkTask(varMap)
							TalkAppendString(varMap, x310129_var_CallUpDescription)
							
							for i, costType in costTypeTable do
								if (costType ~= nil) then
									local count = x310129_ProcNpcCallUpCount(guid, 
													npcInfo.var_NpcMark, costType.var_CostTypeId)
													
									local costIndex = x310129_GetCostIndex(costType.var_CostValues, count)
									local costValue = costType.var_CostValues[costIndex]
									TalkAppendButton(varMap, x310129_var_FileId, 
											format(costType.var_CostTypeName, costValue, costType.var_TotalTime - count), 
																3, costType.var_CostTypeId)	
								end
							end
							
							StopTalkTask(varMap)
							DeliverTalkMenu(varMap, varPlayer, varTalknpc)
						end

						x310129_var_PlayerAcceptTable[varPlayer].npcMark = npcInfo.var_NpcMark
						
						if (x310129_var_PrintDebugLog == 1) then
							WriteLog(1, format("x310129_ProcEventEntry Debug --- Record npcMarkId = %d", npcInfo.var_NpcMark))
						end

						break
					end
				end
			end
		elseif (idExt > 5000) then
			local guid = GetMonsterGUID(varMap, varTalknpc)
			local npcInfoTable = x310129_var_CallupNpcInfo[guid]
			if (npcInfoTable == nil) then
				return
			end
			
			if (x310129_var_PlayerAcceptTable[varPlayer] == nil) then
				return
			end
			
			local npcMark = x310129_var_PlayerAcceptTable[varPlayer].npcMark
			if (x310129_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310129_ProcEventEntry Debug --- npcMark = %d", npcMark))
			end
			
			for npcIndex, npcInfo in npcInfoTable do
				if (npcInfo ~= nil) then
					if (npcMark == npcInfo.var_NpcMark) then
						local costTypeTable = npcInfo.var_CostType
					
						if (costTypeTable ~= nil) then
							for costTypeIndex, costType in costTypeTable do
								if (costType ~= nil and costType.var_CostTypeId == idExt) then
									
									local count = x310129_ProcNpcCallUpCount(guid, npcMark, costType.var_CostTypeId)
									
									if (count >= costType.var_TotalTime) then
										x310129_NoticeToPlayer(varMap, varPlayer, varTalknpc, x310129_var_FullTimeNotice)
										return
									end
									
									local costIndex = x310129_GetCostIndex(costType.var_CostValues, count)
									local costValue = costType.var_CostValues[costIndex]
									
									if (x310129_var_PrintDebugLog == 1) then
										WriteLog(1, format("x310129_ProcEventEntry Debug --- costIndex = %d, costValue = %d",
													costIndex, costValue))
									end
									
									local callNpcTable = npcInfo.var_CallNpcInfoTable
									if (callNpcTable == nil) then
										return
									end
									
									local callNpc = nil
									for i = 1, getn(callNpcTable) do
										callNpc = callNpcTable[i]
										if (callNpc ~= nil) then
											
											local isCreate = 0
											if (callNpc.var_ObjId == -1) then
												isCreate = 1
											else
												if (GetMonsterPosition(varMap, callNpc.var_ObjId) == nil) then
													isCreate = 1
												end
											end
	
											if (isCreate == 1) then --标识可以创建
												
												if (costType.var_CostTarget == 1) then --消耗国家
												local countryId = GetCurCountry(varMap, varPlayer)
												local resNum = GetCountryResource(varMap, varPlayer, costType.var_CostResId)
												if (resNum < costValue) then
													Msg2Player(varMap, varPlayer, x310129_var_ResourceNotEnoughNotice, 8, 3)
													return
												end
												
												x310129_var_TempNpcId = varTalknpc
												
												SubCountryResourceWithRecall(varMap, countryId, costType.var_CostResId
													, costValue, x310129_var_FileId, "ProcCallUpNpcValid",
																varPlayer, guid, npcMark, costType.var_CostTypeId)
																
												elseif (costType.var_CostTarget == 2) then --消耗玩家
													costValue = costValue * 1000
													local money = GetMoney(varMap, varPlayer, costType.var_CostResId)
													if (money < costValue) then
														Msg2Player(varMap, varPlayer, x310129_var_MoneyNotEnoughNotice, 8, 3)
													else
														if (CostMoney(varMap, varPlayer, costType.var_CostResId, costValue) == 1) then
															if (x310129_var_PrintDebugLog == 1) then
																WriteLog(1, format("x310129_ProcEventEntry --- monsterGuid = %d, posx = %d, posz = %d, aliveTime = %d, objId = %d"
																,	callNpc.var_CallNpcType, callNpc.var_Pos[1], callNpc.var_Pos[2], callNpc.var_AliveTime
																, callNpc.var_ObjId))
															end
															
															callNpc.var_ObjId = CreateMonster(varMap, callNpc.var_CallNpcType, callNpc.var_Pos[1], callNpc.var_Pos[2], 
																						callNpc.var_AIType, callNpc.var_AI, -1, callNpc.var_Guid, callNpc.var_CampId, 
																						callNpc.var_AliveTime)
															
															if (callNpc.var_AddBuff ~= nil) then
																for index, buffInfo in callNpc.var_AddBuff do
																	if (x310129_var_PrintDebugLog == 1) then
																		WriteLog(1, format("x310129_ProcEventEntry Debug --- npcGuid = %d, buffInfo = %d", 
																						callNpc.var_CallNpcType, buffInfo))
																	end
																	
																	SendSpecificImpactToUnit(varMap, callNpc.var_ObjId, callNpc.var_ObjId, callNpc.var_ObjId, buffInfo, 0)
																end
															end
															
															x310129_NoticeToPlayer(varMap, varPlayer, x310129_var_TempNpcId, x310129_var_CallUpSuccessNotice)
															local count = x310129_var_CallupNpcInfoRecordTable[guid][npcMark][costType.var_CostTypeId].count
															x310129_var_CallupNpcInfoRecordTable[guid][npcMark][costType.var_CostTypeId].count = count + 1
															x310129_var_PlayerAcceptTable[varPlayer] = nil
														end
														
													end
												end
												break
											else
												Msg2Player(varMap, varPlayer, x310129_var_NpcExistNotice, 8, 3)
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
	end
	
end

--召唤NPC的资源验证
function x310129_ProcCallUpNpcValid(varMap, varCountry, varIndex, varResult, varPlayer, varNpcGuid, varNpcMarkId, varCostTypeId)
	if (x310129_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310129_ProcCallUpNpcValid Debug --- varResult = %d, varNpcGuid = %d, varNpcMarkId = %d, varCostTypeId = %d", 
					varResult, varNpcGuid, varNpcMarkId, varCostTypeId))
	end
	
	local npcInfoTable = x310129_var_CallupNpcInfo[varNpcGuid]
	if (npcInfoTable == nil) then
		return
	end
	
	for npcIndex, npcInfo in npcInfoTable do
		if (npcInfo ~= nil) then
			if (varNpcMarkId == npcInfo.var_NpcMark) then
				local costTypeTable = npcInfo.var_CostType
				if (costTypeTable ~= nil) then
					for costTypeIndex, costType in costTypeTable do
						if (costType ~= nil and costType.var_CostTypeId == varCostTypeId) then
							
							local count = x310129_ProcNpcCallUpCount(varNpcGuid, varNpcMarkId, varCostTypeId)
							if (count >= costType.var_TotalTime) then
								x310129_NoticeToPlayer(varMap, varPlayer, varTalknpc, x310129_var_FullTimeNotice)
								return
							end
							
							local costIndex = x310129_GetCostIndex(costType.var_CostValues, count)
							local costValue = costType.var_CostValues[costIndex]
							
							local countryId = GetCurCountry(varMap, varPlayer)
							local resNum = GetCountryResource(varMap, varPlayer, costType.var_CostResId)
							if (resNum < costValue) then
								Msg2Player(varMap, varPlayer, x310129_var_ResourceNotEnoughNotice, 8, 3)
								return
							end
							
							if (varResult == 0) then
								SubCountryResourceWithRecall(varMap, countryId, costType.var_CostResId
									, costValue, x310129_var_FileId, "ProcCallUpNpcValid",
												varPlayer, varNpcGuid, npcMark, costType.var_CostTypeId)
												
							elseif (varResult == 1) then
							
								local callNpcTable = npcInfo.var_CallNpcInfoTable
								if (callNpcTable == nil) then
									return
								end
								
								local callNpc = nil
								for i = 1, getn(callNpcTable) do
									callNpc = callNpcTable[i]
									if (callNpc ~= nil) then
										
										local isCreate = 0
										if (callNpc.var_ObjId == -1) then
											isCreate = 1
										else
											if (GetMonsterPosition(varMap, callNpc.var_ObjId) == nil) then
												isCreate = 1
											end
										end

										if (isCreate == 1) then
											if (x310129_var_PrintDebugLog == 1) then
												WriteLog(1, format("x310129_ProcCallUpNpcValid --- monsterGuid = %d, posx = %d, posz = %d, aliveTime = %d, objId = %d"
												,	callNpc.var_CallNpcType, callNpc.var_Pos[1], callNpc.var_Pos[2], callNpc.var_AliveTime
												, callNpc.var_ObjId))
											end
											
											callNpc.var_ObjId = CreateMonster(varMap, callNpc.var_CallNpcType, callNpc.var_Pos[1], callNpc.var_Pos[2], 
																		callNpc.var_AIType, callNpc.var_AI, -1, callNpc.var_Guid, callNpc.var_CampId, 
																		callNpc.var_AliveTime)
											
											if (callNpc.var_AddBuff ~= nil) then
												for index, buffInfo in callNpc.var_AddBuff do
													if (x310129_var_PrintDebugLog == 1) then
														WriteLog(1, format("x310129_ProcEventEntry Debug --- npcGuid = %d, buffInfo = %d", 
																		callNpc.var_CallNpcType, buffInfo))
													end
													
													SendSpecificImpactToUnit(varMap, callNpc.var_ObjId, callNpc.var_ObjId, callNpc.var_ObjId, buffInfo, 0)
												end
											end
											
											x310129_NoticeToPlayer(varMap, varPlayer, x310129_var_TempNpcId, x310129_var_CallUpSuccessNotice)
											local count = x310129_var_CallupNpcInfoRecordTable[varNpcGuid][varNpcMarkId][varCostTypeId].count
											x310129_var_CallupNpcInfoRecordTable[varNpcGuid][varNpcMarkId][varCostTypeId].count = count + 1
											break
										end
									end
								end
								
								x310129_var_PlayerAcceptTable[varPlayer] = nil
								x310129_var_TempNpcId = -1
							end
							
						end
					end
				end
				
			end
		end
	end
	
end

function x310129_GetCostIndex(varCostTypeTable, varCount)
	local costIndex = varCount + 1
	if (costIndex > getn(varCostTypeTable)) then
		costIndex = getn(varCostTypeTable)
	elseif (costIndex <= 0) then
		WriteLog(1, format("x310129_ProcEventEntry Error --- costIndex = %d", costIndex))
		return
	end
	
	return costIndex
end

--处理NPC的召唤次数
function x310129_ProcNpcCallUpCount(varNpcGuid, varNpcMark, varCostType)
	
	--通过递归对表初始化
	local currWeek = GetWeekIndex()
	if (currWeek ~= x310129_var_CallupWeekIndex) then
		x310129_var_CallupWeekIndex = currWeek
		x310129_var_CallupNpcInfoRecordTable = {}
	end
	
	if (x310129_var_CallupNpcInfoRecordTable[varNpcGuid] == nil) then
		
		if (x310129_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310129_ProcNpcCallUpCount Debug --- varNpcGuid init %d", varNpcGuid))
		end
		
		x310129_var_CallupNpcInfoRecordTable[varNpcGuid] = {}
		return x310129_ProcNpcCallUpCount(varNpcGuid, varNpcMark, varCostType)
	elseif(x310129_var_CallupNpcInfoRecordTable[varNpcGuid][varNpcMark] == nil) then
		
		if (x310129_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310129_ProcNpcCallUpCount Debug --- varNpcMark init %d", varNpcMark))
		end
		
		x310129_var_CallupNpcInfoRecordTable[varNpcGuid][varNpcMark] = {}
		return x310129_ProcNpcCallUpCount(varNpcGuid, varNpcMark, varCostType)
	elseif(x310129_var_CallupNpcInfoRecordTable[varNpcGuid][varNpcMark][varCostType] == nil) then
		
		if (x310129_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310129_ProcNpcCallUpCount Debug --- varCostType init %d", varCostType))
		end
		
		x310129_var_CallupNpcInfoRecordTable[varNpcGuid][varNpcMark][varCostType] = {}
		x310129_var_CallupNpcInfoRecordTable[varNpcGuid][varNpcMark][varCostType].count = 0
	end
	
	local count = x310129_var_CallupNpcInfoRecordTable[varNpcGuid][varNpcMark][varCostType].count
	
	if (x310129_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310129_ProcNpcCallUpCount Debug --- varNpcGuid = %d, varNpcMark = %d, varCostType = %d count = %d",
					varNpcGuid, varNpcMark, varCostType, count))
	end
	
	return count
end

function x310129_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end

function x310129_ProcAccept(varMap, varPlayer)

	local npcInfo = x310129_var_PlayerAcceptTable[varPlayer]
	if (x310129_var_PlayerAcceptTable[varPlayer] == nil) then
		return
	end
	
	local callNpcTable = npcInfo.var_CallNpcInfoTable
	if (callNpcTable == nil) then
		return
	end
	
	local callNpc = nil
	for i = 1, getn(callNpcTable) do
		callNpc = callNpcTable[i]
		if (callNpc ~= nil) then
			
			local isCreate = 0
			if (callNpc.var_ObjId == -1) then
				isCreate = 1
			else
				if (GetMonsterPosition(varMap, callNpc.var_ObjId) == nil) then
					isCreate = 1
				end
			end
			
			if (isCreate == 1) then
				if (x310129_var_PrintDebugLog == 1) then
					WriteLog(1, format("x310129_ProcAccept --- monsterGuid = %d, posx = %d, posz = %d, aliveTime = %d, objId = %d"
					,	callNpc.var_CallNpcType, callNpc.var_Pos[1], callNpc.var_Pos[2], callNpc.var_AliveTime
					, callNpc.var_ObjId))
				end
				
				callNpc.var_ObjId = CreateMonster(varMap, callNpc.var_CallNpcType, callNpc.var_Pos[1], callNpc.var_Pos[2], 
											callNpc.var_AIType, callNpc.var_AI, -1, callNpc.var_Guid, callNpc.var_CampId, 
											callNpc.var_AliveTime)
			end
		end
	end
	
	x310129_var_PlayerAcceptTable[varPlayer] = nil
end

function x310129_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if (x310129_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310129_ProcQuestAccept --- varMap = %d, varPlayer = %d, varTalknpc = %d"
			,	varMap, varPlayer, varTalknpc))
	end
	
end

function x310129_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
end

--通知玩家相关提示
function x310129_NoticeToPlayer(varMap, varPlayer, varTalknpc, varMsg)
	StartTalkTask(varMap)
	TalkAppendString(varMap, varMsg)
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end
