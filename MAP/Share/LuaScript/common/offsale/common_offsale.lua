x310355_var_FileId = 310355
x310355_var_QuestName = "现银寄售系统"
x310355_var_QuestGoldName = "现金寄售系统"
x310355_var_GameId = 1073
x310355_var_PlayerGUID = {					
                            1510836048,
                            1510836049,
                            1510836050,
                            1510836051,
                            1510836052,
                            1510836053,
                            1510836054,
                            1510836055,
                            1510836056,
                            1510836057,
                            1510836058,
                            1510836059,
                            1210436666,
                            1210436667,
                            1210436668,
                            1210436669,
                            1210436670,
                            1210436671,
                            1210436672,
                            1210436673,
                            1210436674,
                            1210436675,
                            1210436676,
                            1210436677,
												 }

x310355_var_Fuwuqi ={151,156,161,167,364,121,138,321,114}
x310355_var_Gold_Fuwuqi = {151,156,161,167,364,121,138,321,106,196,211,216,201,241,284,114}

x310355_var_SceneMatchNPC = 	{ 
								
								{ varMap = 0, varTalkNpcGUID = 139086, },
								
								
								{ varMap = 50, varTalkNpcGUID = 123768, },
								
								
								{ varMap = 150, varTalkNpcGUID = 126064, },
																
								
								{ varMap = 250, varTalkNpcGUID = 129067, },
																
								
								{ varMap = 350, varTalkNpcGUID = 132064, },		
																			
								
								{ varMap = 39, varTalkNpcGUID = 145058, },			
																							
								
								{ varMap = 40, varTalkNpcGUID = 145149, },																													
							}
							
							

function x310355_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
--		local tempwordID = 0
--		local worldID = GetWorldId(varMap,varPlayer)
--		for varI0 ,item0 in x310355_var_Fuwuqi do
--			if worldID == item0 then
--				tempwordID = 1
--				break;
--			end
--		end
--		if tempwordID == 0 then return end
--		local tempguid = 0
--		local guid = GetPlayerGUID(varMap, varPlayer)
--		for varI ,item in x310355_var_PlayerGUID do
--			if guid == item then
--				tempguid = 1;
--				break;
--			end
--		end
--		if tempguid == 0 then return end
	
		
		if GetGameOpenById(x310355_var_GameId)<=0 then
				return 			
		end
		
		TalkAppendButton(varMap,x310355_var_FileId,x310355_var_QuestName,3,100)
	
	
	
		local isok = x310355_GetGoldServer(varMap,varPlayer)
		if  isok == 1 then -- 判断是否在列表当中
			TalkAppendButton(varMap,x310355_var_FileId,x310355_var_QuestGoldName,3,101)
		end
end

function x310355_GetGoldServer(varMap,varPlayer)
		local WorldId = GetWorldId(varMap,varPlayer)
		local Guid = GetPlayerGUID(varMap,varPlayer)
		
--		for varI,server in x310355_var_Gold_Fuwuqi do
--			if WorldId == server then
--				--for varo,mplayer in x310355_var_PlayerGUID do
--					--if Guid == mplayer then
--						return 1
--					--end
--				--end
--			end
--		end
		
		return 1
end

function x310355_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex )	


--		local tempwordID = 0
--		local worldID = GetWorldId(varMap,varPlayer)
--		for varI0 ,item0 in x310355_var_Fuwuqi do
--			if worldID == item0 then
--				tempwordID = 1
--				break;
--			end
--		end
--		if tempwordID == 0 then return end
--		local tempguid = 0
--		local guid = GetPlayerGUID(varMap, varPlayer)
--		for varI ,item in x310355_var_PlayerGUID do
--			if guid == item then
--				tempguid = 1;
--				break;
--			end
--		end
--		if tempguid == 0 then return end
	

		if GetMergeDBToggle() == 1 then
			local text = "为配合并服，现银/现金寄售系统暂时关闭，并服完成后即可正常使用"
			StartTalkTask(varMap)
			TalkAppendString(varMap,text );
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,text,8,2)
			return
		end
		
		if GetUpdateDBBeforeToggle() == 1 then
			local text = "为配合资料库升级，现银/现金寄售系统暂时关闭，升级完成后即可正常使用"
			StartTalkTask(varMap)
			TalkAppendString(varMap,text );
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,text,8,2)
			return 	
		end
		
		if GetGameOpenById(x310355_var_GameId)<=0 then
			local text = "现银/现金寄售暂停开放"
			StartTalkTask(varMap)
			TalkAppendString(varMap,text );
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,text,8,2)
			return 			
		end
		
		if GetLevel(varMap, varPlayer) < 40 then
			local text = "很抱歉，您的等级不足40级无法使用现银/现金寄售系统"
			StartTalkTask(varMap)
			TalkAppendString(varMap,text );
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,text,8,2)
			return 			
		end
		
		
		if IsPasswordProtect(varMap, varPlayer, 3, 1) == 0 then--3:银子 1：向客户端发消息 0：设置了保护
			local text = "很抱歉，您正处于财产保护中"
			StartTalkTask(varMap)
			TalkAppendString(varMap,text );
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,text,8,2)
			return 			
		end	
		
		
		if varIndex == 100 then
			OpenOffSaleSystem(varMap, varPlayer ,1)
		end
		
		local isok = x310355_GetGoldServer(varMap,varPlayer)
		if  isok == 1 then -- 判断是否在列表当中
			if varIndex == 101 then 
				OpenOffSaleSystem(varMap, varPlayer ,2)
			end
		end
end


function x310355_CheckMoney( varMap, varPlayer, moneyType,  varCount )


--		local tempwordID = 0
--		local worldID = GetWorldId(varMap,varPlayer)
--		for varI0 ,item0 in x310355_var_Fuwuqi do
--			if worldID == item0 then
--				tempwordID = 1
--				break;
--			end
--		end
--		if tempwordID == 0 then return end
--		local tempguid = 0
--		local guid = GetPlayerGUID(varMap, varPlayer)
--		for varI ,item in x310355_var_PlayerGUID do
--			if guid == item then
--				tempguid = 1;
--				break;
--			end
--		end
--		if tempguid == 0 then return end


		if GetMergeDBToggle() == 1 then
			local text = "为配合并服，现银/现金寄售系统暂时关闭，并服完成后即可正常使用"
			StartTalkTask(varMap)
			TalkAppendString(varMap,text );
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,text,8,2)
			return 0;
		end
		
		if GetUpdateDBBeforeToggle() == 1 then
			local text = "为配合资料库升级，现银/现金寄售系统暂时关闭，升级完成后即可正常使用"
			StartTalkTask(varMap)
			TalkAppendString(varMap,text );
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,text,8,2)
			return 0;
		end
		
		if GetGameOpenById(x310355_var_GameId)<=0 then
			local text = "现银/现金寄售暂停开放"
			StartTalkTask(varMap)
			TalkAppendString(varMap,text );
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,text,8,2)
			return 0;	
		end	
		
		if GetLevel(varMap, varPlayer) < 40 then
				local text = "很抱歉，您的等级不足40级无法使用现银/现金寄售系统"
				StartTalkTask(varMap)
				TalkAppendString(varMap,text );
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,text,8,2)
				return 			
		end
		
			if IsPasswordProtect(varMap, varPlayer, 3, 1) == 0 then--3:银子 1：向客户端发消息 0：设置了保护
				local text = "很抱歉，您正处于财产保护中"
				StartTalkTask(varMap)
				TalkAppendString(varMap,text );
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,text,8,2)
				return 			
			end	
			
		local isInDistance = 0	
		for varI,itm in x310355_var_SceneMatchNPC do
			if itm.varMap == varMap then		
				local npcObjId = FindMonsterByGUID(varMap,itm.varTalkNpcGUID)		
				if IsInDist(varMap,varPlayer,npcObjId,5) == 1 then
					isInDistance = 1				
				end	
				break		
			end
		end
		if isInDistance ~= 1 then
			local text = "距离NPC过远"
			StartTalkTask(varMap)
			TalkAppendString(varMap,text );
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,text,8,2)
			return 0;
		end
		
		if varCount <= 0 then
			local text = "出售金额错误"
			StartTalkTask(varMap)
			TalkAppendString(varMap,text );
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer,text,8,2)
			return 0;	
		end
		
		if moneyType == 0 then
			local siller = GetMoney(varMap, varPlayer, moneyType)
			if siller >= varCount then	--现银足够
				return 1
			else
				local text = "你背包里的现银/现金不足"
				StartTalkTask(varMap)
				TalkAppendString(varMap,text );
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,text,8,2)
				return 0
			end
			
		elseif moneyType == 2 then -- 判断是否在列表当中
		
			local isok = x310355_GetGoldServer(varMap,varPlayer)
			if isok == 1 then
				local gold = GetMoney(varMap, varPlayer, moneyType)
				if gold >= varCount then
					return 1
				else
					local text = "你背包里的现金不足"
					StartTalkTask(varMap)
					TalkAppendString(varMap,text );
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					Msg2Player(varMap,varPlayer,text,8,2)		
					return 0
				end	
			end
		end
		
	return 0;
	
end


function x310355_OffSaleResult( varMap, varPlayer, result, tradeid, type, varCount )
	if result == 0 then
		local text = "出售完成，交易ID："..tradeid
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)		
	elseif result == 1 then 
		local text = "出售失败，返回金钱 error="..result
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)		
	elseif result == 2 then 
		local text = "出售失败，返回金钱 error="..result
		StartTalkTask(varMap)
		TalkAppendString(varMap,text );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,text,8,2)
		
		elseif x310355_GetGoldServer(varMap,varPlayer) == 1 then
			if result == 3 then 
				local text = "出售失败，返回金钱 error="..result
				StartTalkTask(varMap)
				TalkAppendString(varMap,text );
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,text,8,2)		
			end
		end
end
