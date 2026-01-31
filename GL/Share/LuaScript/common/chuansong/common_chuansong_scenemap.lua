




x800021_var_newSceneID={ID1=50,ID2=150,ID3=250,ID4=350,}    
x800021_var_PosX = {Pos1=295,Pos2=295,Pos3=295,Pos4=295,}
x800021_var_PosZ = {Pos1=190,Pos2=190,Pos3=190,Pos4=190,}







x800021_var_newCountrySceneID ={ID1=51,ID2=151,ID3=251,ID4=351,}    
x800021_var_CountryPosX = {Pos1=400,Pos2=400,Pos3=400,Pos4=400,}
x800021_var_CountryPosZ = {Pos1=292,Pos2=292,Pos3=292,Pos4=292,}









function x800021_ProcEventEntry(varMap, varPlayer, varTalknpc)	

end





function x800021_ProcChangeSceneEvent(varMap, varPlayer, varIndex, Backhaul)

	local varText = ""
	local CanTrans = IsCashboxState(varMap,varPlayer)
	if CanTrans == 1 then
		StartTalkTask(varMap)
			varText = "#Y运镖或者护送状态中，不允许传送"
			TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end

	if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
		StartTalkTask(varMap)
			varText = "#Y变身状态，不允许传送"
			TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	
	local MinUserLevel, targetSceneId, PosX,PosZ, needMoney, varNeedItem,SourceSceneId,SourcePosX,SourcePosZ = GetNewSceneInfoByIndex(varMap,varIndex)
	if SourceSceneId ~= varMap then
		
		return
	end

	local selfPosX,selfPosZ = GetWorldPos(varMap, varPlayer)
	if IsInDistByPoint(varMap,selfPosX,selfPosZ,SourcePosX,SourcePosZ,7 ) ~= 1 then
		
		return
	end

	PosX = PosX - 4 + random(1,7)
	PosZ = PosZ - 4 + random(1,7)
	local varLevel = GetLevel(varMap, varPlayer)

	
	if varLevel < MinUserLevel then
	
		StartTalkTask(varMap)
			varText = "#y等级低于#g"..MinUserLevel.."#Y级，无法前往该地"
			TalkAppendString(varMap,varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		
		return
	end
		
	
	if IsInStall(varMap, varPlayer) ~= 0 then
		return
	end
	
	
	local life=IsCharacterLiving( varMap,varPlayer)
	if life == 0 then
		return
	end
	
	
	if GetTeamId( varMap, varPlayer) > 0  then
	
		
		if IsTeamFollow(varMap, varPlayer) ~= 1 then
			
			local bCostMoney = 0;
			local bCostItem = 0;
			if( needMoney > 0 ) then
				if( IsEnoughMoney( varMap, varPlayer, needMoney ) == 0 ) then
					StartTalkTask(varMap)
						varText = "#Y您的金钱不足，无法前往该地"
						TalkAppendString(varMap,varText);
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					return 0;
				else
					bCostMoney = 1;
				end
			end
			
			if( varNeedItem >= 0 ) then
				if( GetItemCount( varMap, varPlayer, varNeedItem ) <= 0 ) then
					StartTalkTask(varMap)
						varText = "#Y您身上没有传送物品，无法前往该地"
						TalkAppendString(varMap,varText);
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					return 0;
				else
					bCostItem = 1;
				end
			end
			
			
			if( bCostMoney == 1 ) then
				if( SpendMoney( varMap, varPlayer, needMoney,302 ) == -1 ) then
					StartTalkTask(varMap)
						varText = "#Y您的金钱不足，无法前往该地"
						TalkAppendString(varMap,varText);
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					return 0;
				end
			end
			
			
			if( bCostItem == 1 ) then
				if( DelItem(varMap, varPlayer, varNeedItem, 1) == 0 ) then
					StartTalkTask(varMap)
						varText = "#Y您身上没有传送物品，无法前往该地"
						TalkAppendString(varMap,varText);
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					return 0;
				end
			end
			
			
			LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferFunc",varMap,varPlayer,targetSceneId,PosX,PosZ)	
		else
		
			
			if IsTeamLeader(varMap,varPlayer)==1 then
				
				local varNum=GetFollowedMembersCount( varMap, varPlayer)
				local varMems = {}
				local j = 0
				for	varI=0,varNum-1 do
					varMems[varI] = GetFollowedMember(varMap, varPlayer, varI)
					if varMems[varI] == -1 then
						return
					else
						local memslevel = GetLevel(varMap, varMems[varI])
						if memslevel < MinUserLevel then
							j = 1
						end
					end
				end	
				
				if j == 0 then
					
					LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferFunc",varMap,varPlayer,targetSceneId,PosX,PosZ)
				else
					for varI=0,varNum-1 do
						StartTalkTask(varMap)
							varText = "#y有队伍成员等级低于#g"..MinUserLevel.."#Y级，无法前往该地"
							TalkAppendString(varMap,varText);
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varMems[varI])
					end
				end	
			end	
		end						
	else
		
		local bCostMoney = 0;
		local bCostItem = 0;
		if( needMoney > 0 ) then
			if( IsEnoughMoney( varMap, varPlayer, needMoney ) == 0 ) then
				StartTalkTask(varMap)
					varText = "#Y您的金钱不足，无法前往该地"
					TalkAppendString(varMap,varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0;
			else
				bCostMoney = 1;
			end
		end
		
		if( varNeedItem >= 0 ) then
			if( GetItemCount( varMap, varPlayer, varNeedItem ) <= 0 ) then
				StartTalkTask(varMap)
					varText = "#Y您身上没有传送物品，无法前往该地"
					TalkAppendString(varMap,varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0;
			else
				bCostItem = 1;
			end
		end
		
		
		if( bCostMoney == 1 ) then
			if( SpendMoney( varMap, varPlayer, needMoney,302 ) == -1 ) then
				StartTalkTask(varMap)
					varText = "#Y您的金钱不足，无法前往该地"
					TalkAppendString(varMap,varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0;
			end
		end
		
		
		if( bCostItem == 1 ) then
			if( DelItem(varMap, varPlayer, varNeedItem, 1) == 0 ) then
				StartTalkTask(varMap)
					varText = "#Y您身上没有传送物品，无法前往该地"
					TalkAppendString(varMap,varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0;
			end
		end
		
		
		LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferFunc",varMap,varPlayer,targetSceneId,PosX,PosZ)
	end

end





function x800021_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

end





function x800021_ProcGuildConvoyChangeScene(varMap,varPlayer)

	
	if varMap == PK_PUNISH_PRISON_SCENE_ID then
		StartTalkTask(varMap)
		local varText = "监狱里还不老实,想走,没门。"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
	end

	local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 32584 )
    if IsHaveFlag ~= 0 then
        StartTalkTask(varMap)
		local varText = "赛马大会中不要分心，努力向着终点冲刺吧！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
    end


	local varCountry = GetCurCountry(varMap,varPlayer)

	local Map_ID = x800021_var_newSceneID.ID1

	local offsetX = random(1,5)
	local PosX = 0
	local PosZ = 0

	if varCountry == 0 then
		Map_ID = x800021_var_newSceneID.ID1
		PosX = x800021_var_PosX.Pos1 + offsetX
		PosZ = x800021_var_PosZ.Pos1 + offsetX
	end

	if varCountry == 1 then
		Map_ID = x800021_var_newSceneID.ID2
		PosX = x800021_var_PosX.Pos2 + offsetX
		PosZ = x800021_var_PosZ.Pos2 + offsetX
	end

	if varCountry == 2 then
		Map_ID = x800021_var_newSceneID.ID3
		PosX = x800021_var_PosX.Pos3 + offsetX
		PosZ = x800021_var_PosZ.Pos3 + offsetX
	end

	if varCountry == 3 then
		Map_ID = x800021_var_newSceneID.ID4
		PosX = x800021_var_PosX.Pos4 + offsetX
		PosZ = x800021_var_PosZ.Pos4 + offsetX
	end

	-- 检查是否处于战车加护期间
	if IsHaveSpecificImpact( varMap, varPlayer, 7629) == 1 then
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 3)
        Msg2Player( varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 2)
        return
    end

	if varMap == 39 then
	    if IsHaveSpecificImpact(varMap, varPlayer, 7537 ) ~= 0 or IsHaveSpecificImpact(varMap, varPlayer, 7536  ) ~= 0 then
	        StartTalkTask(varMap)
			TalkAppendString( varMap, "在暴龙大作战期间，不能传送" )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
	    end
		return		
	end
	
	if varMap == Map_ID then
		SetPos( varMap , varPlayer , PosX , PosZ )

	else
	
		
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,Map_ID) == 0 then
			return
		end
		
        
        if varMap == 14 then
            SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_FORBID_RIDE, 0)
        end
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,Map_ID) == 0 then
			return
		end
        NewWorld( varMap , varPlayer , Map_ID , PosX , PosZ, 8000210 )
	end

    
    local varId = GetGuildID( varMap, varPlayer)
    if varId ~= -1 then
        AddGuildActivity( varMap, varPlayer, GetGuildCacheFreeParam( varId, GD_GUILD_ACTIVITY_PARAM7) )
    end
end




function x800021_ProcGuildConvokeChangeScene( varMap,varPlayer, newSceneId, posX, posZ )
	
	-- 检查是否处于战车加护期间
	if IsHaveSpecificImpact(varMap, varPlayer, 7629) == 1 then
        Msg2Player(varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 3)
        Msg2Player(varMap, varPlayer, "您有战车加护效果，不能进行此操作", 8, 2)
        return
    end
    
	if varMap == PK_PUNISH_PRISON_SCENE_ID then
		StartTalkTask(varMap)
		local varText = "监狱中，不能传送"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return		
	end
	
	local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 32584 )
    if IsHaveFlag ~= 0 then
        StartTalkTask(varMap)
		local varText = "赛马大会中不要分心，努力向着终点冲刺吧！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
    end
	
	
	if varMap == 39 then
	    if IsHaveSpecificImpact(varMap, varPlayer, 7537 ) ~= 0 or IsHaveSpecificImpact(varMap, varPlayer, 7536  ) ~= 0 then
	        StartTalkTask(varMap)
			TalkAppendString( varMap, "在暴龙大作战期间，不能传送" )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
	    end
		return		
	end
	
	
	if newSceneId == 50 or newSceneId == 150 or newSceneId == 250 or newSceneId == 350 or 
	   newSceneId == 51 or newSceneId == 151 or newSceneId == 251 or newSceneId == 351 or 
	   newSceneId == 86 or newSceneId == 186 or newSceneId == 286 or newSceneId == 386 or 
	   newSceneId == 2 or newSceneId == 3 or newSceneId == 4 or newSceneId == 5 then 
		if GetLevel(varMap,varPlayer) < 40 then
			StartTalkTask(varMap)
			local varText = "只有40级以上，才能传送到目的地"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 6 then
		if GetLevel(varMap,varPlayer) < 40 then
			StartTalkTask(varMap)
			local varText = "只有40级以上，才能传送到蔡州城"  
			TalkAppendString( varMap, varText )                  
			StopTalkTask( varMap )                          
			DeliverTalkTips( varMap, varPlayer )              
			return				                              
		end                                                   
	end                                                       
	                                                          
	if newSceneId == 7 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                          
			local varText = "只有40级以上，才能传送到秦岭"    
			TalkAppendString( varMap, varText )                  
			StopTalkTask( varMap )                          
			DeliverTalkTips( varMap, varPlayer )              
			return				                              
		end                                                   
	end                                                       
	                                                          
	if newSceneId == 8 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到阿尔金山"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 9 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到碎叶城"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 10 or newSceneId == 11 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到红沙漠或撒马尔罕"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 13 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到巴格达"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 16 or newSceneId == 17 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到波斯高原或莫斯科公国"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 18 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到巴格达"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 19 or newSceneId == 20 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到波兰王国或匈牙利"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 21 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到神圣罗马帝国"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 22 or newSceneId == 23 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到拜占庭帝国或大马士革"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 24 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到耶路撒冷"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 25 or newSceneId == 26 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到西奈半岛或对马岛"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 27 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到耶路撒冷"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 29 or newSceneId == 30 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到九州或对大理"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 31 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到缅甸"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 32 or newSceneId == 33 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到印度河或婆罗洲"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 34 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到爪哇岛"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if newSceneId == 35 then                                   
		if GetLevel(varMap,varPlayer) < 40 then                 
			StartTalkTask(varMap)                        
			local varText = "只有40级以上，才能传送到苏门答腊"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			return				
		end
	end
	
	if varMap == newSceneId then
		SetPos( varMap , varPlayer , posX , posZ )
	else
		
		
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,newSceneId) == 0 then
			return
		end
		NewWorld( varMap , varPlayer , newSceneId , posX , posZ, 8000211 )
	end

    
    local varId = GetGuildID( varMap, varPlayer)
    if varId ~= -1 then
        AddGuildActivity( varMap, varPlayer, GetGuildCacheFreeParam( varId, GD_GUILD_ACTIVITY_PARAM7) )
    end

end




function x800021_ProcCountryChangeScene(varMap,varPlayer)

	
	if varMap == PK_PUNISH_PRISON_SCENE_ID then
		StartTalkTask(varMap)
		local varText = "监狱里还不老实,想走,没门。"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
	end
	
	
	local varMapType = GetSceneType(varMap)
	if varMapType==1 then
		StartTalkTask(varMap)
		local varText = "副本中，不能响应国家拉人事件。"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
	end
	
	
	IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7536  )
    if IsHaveFlag ~= 0 then
        StartTalkTask(varMap)
		local varText = "在暴龙大作战期间，不能回应国家拉人事件。"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
    end
    
    IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7537 )
    if IsHaveFlag ~= 0 then
        StartTalkTask(varMap)
		local varText = "在暴龙大作战期间，不能回应国家拉人事件。"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
    end
    
	IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 32584 )
    if IsHaveFlag ~= 0 then
        StartTalkTask(varMap)
		local varText = "赛马大会中不要分心，努力向着终点冲刺吧！"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
    end

	
		if GetLevel(varMap, varPlayer) >= 40 then
			GetCountryQuestData(varMap,varPlayer,CD_INDEX_DESTROY_ISSUE_TIME, CHUANSONG_SCENEMAP_SCRIPT,-1,"ProcReturn1")
		else
			StartTalkTask(varMap)
			local varText = "很抱歉，您的等级不足40级，不能被传送的大将军身边。"
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
		end

end




function x800021_ProcReturn1(varMap, varPlayer,QuestData,varQuest)
	local varCurDayTime = GetDayTime()
	if QuestData == varCurDayTime then
		GetCountryQuestData(varMap,varPlayer,CD_INDEX_DESTROY_ISSUE_COUNT, CHUANSONG_SCENEMAP_SCRIPT,-1,"ProcReturn2")
	end
end




function x800021_ProcReturn2(varMap, varPlayer,QuestData,varQuest)
	if QuestData > 10 then
		return
	end
	GetCountryQuestData(varMap,varPlayer,CD_INDEX_DESTROY_ISSUE_SCENE, CHUANSONG_SCENEMAP_SCRIPT,-1,"ProcReturn3")
end




function x800021_ProcReturn3(varMap, varPlayer,QuestData,varQuest)
	if QuestData < 0 then
		return
	end

	local varCountry = GetCurCountry(varMap,varPlayer)

	local offsetX = random(1,5)
	local offsetZ = random(1,5)

	local BasePosX = 0
	local BasePosZ = 0
	local NewSceneID = QuestData

	if NewSceneID == 51 then
		BasePosX = x800021_var_CountryPosX.Pos1
		BasePosZ = x800021_var_CountryPosZ.Pos1
	elseif NewSceneID == 151 then
		BasePosX = x800021_var_CountryPosX.Pos2
		BasePosZ = x800021_var_CountryPosZ.Pos2
	elseif NewSceneID == 251 then
		BasePosX = x800021_var_CountryPosX.Pos3
		BasePosZ = x800021_var_CountryPosZ.Pos3
	else
		BasePosX = x800021_var_CountryPosX.Pos4
		BasePosZ = x800021_var_CountryPosZ.Pos4
	end

	local PosX = BasePosX + offsetX
	local PosZ = BasePosZ + offsetZ

	if varMap == NewSceneID then
		SetPos(varMap, varPlayer,PosX,PosZ)
	else
        
        if varMap == 14 then
            SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_FORBID_RIDE, 0)
        end
        
        
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,NewSceneID) == 0 then
			return
		end
		NewWorld(varMap, varPlayer, NewSceneID,PosX ,PosZ, 8000212 )
	end
end





function x800021_BattleTransCheckPlayerState( varMap,varPlayer )

    local varState = IsPlayerStateNormal(varMap,varPlayer )
    if varState == 0 then
        return 1,"状态异常"
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_MENTALGAME )
    if varState == 1 then
        return 1,"处于答题状态，不能进入战场"
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_STALL )
    if varState == 1 then
        return 1,"处于设摊状态，不能进入战场"
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE )
    if varState == 1 then
        return 1,"处于死亡状态，不能进入战场"
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_CRASHBOX )
    if varState == 1 then
        return 1,"处于运镖状态，不能进入战场"
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_AUTOPLAY )
    if varState == 1 then
        ErrorMsg = "处于挂机状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_SUBTRAIN )
    if varState == 1 then
        return 1,"处于代练状态，不能进入战场"
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_BUS )
    if varState == 1 then
        return 1,"处于bus状态，不能进入战场"
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_PKMODE )
    if varState == 1 then
        return 1,"pk值过高或处于狂暴模式，不能进入战场"
    end
    
    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TONGQUBUFF )
    if varState == 1 then
        return 1,"处于童趣状态，不能进入战场"
    end
        
    local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7702 )
    if IsHaveFlag ~= 0 then
        return 1, "在夺旗状态下，不能进入战场"
    end

    
    if IsHaveQuestNM(varMap, varPlayer, 10304) > 0 then
			local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, 10304)
			local buffIndex = GetQuestParam(varMap, varPlayer, varQuestIdx, 2)
			if buffIndex >=0 and buffIndex <=3 then
				  ErrorMsg = "携带龙魂状态，不能传送"
    	    return 1,ErrorMsg
    	end
		end
    
    if IsHideName(varMap, varPlayer) > 0 then
    	return 1,"蒙面状态下,不能进入战场"
    end
    
    if varMap == PK_PUNISH_PRISON_SCENE_ID then
    	return 1,"在监狱里，不能进入战场"
    end
    
    IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7536  )
    if IsHaveFlag ~= 0 then
        return 1, "在暴龙大作战期间，不能进入战场"
    end
    
    IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7537 )
    if IsHaveFlag ~= 0 then
        return 1, "在暴龙大作战期间，不能进入战场"
    end

   	IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7629 )
    if IsHaveFlag ~= 0 then
        return 1, "战车加护期间，不能进入战场"
    end
    
		if GetSceneType(varMap) == 1 then
			return 1, "副本无法传送"
		end

    return 0

end




function x800021_AskEnterKingBattle( varMap,varPlayer )

    
    local varState,varMsg = x800021_BattleTransCheckPlayerState( varMap,varPlayer )
    if varState == 1 then
        
        StartTalkTask(varMap)
        TalkAppendString( varMap, varMsg );
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return
    end

    
    RequestEnterKingBattleScene(varMap, varPlayer)
end




function x800021_AskEnterWorldCup( varMap,varPlayer)
    local nGuildId = GetGuildID( varMap, varPlayer)
    if nGuildId < 0 or nGuildId > 1024 then
        if varTalknpc ~= 0 then
            StartTalkTask( varMap)
                TalkAppendString( varMap, "#Y"..x300615_var_Name)
                TalkAppendString( varMap, "你尚未加入任何帮会！不能进入战场。" )
            StopTalkTask()
            DeliverTalkMenu( varMap, varPlayer, varTalknpc)
            return
        end
    end

    
    local varState,varMsg = x800021_BattleTransCheckPlayerState( varMap,varPlayer )
    if varState == 1 then
        
        StartTalkTask(varMap)
        TalkAppendString( varMap, varMsg );
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return
    end

    GuildContendAskEnter( varMap, varPlayer)
end




function x800021_ProcEnterWorldCup( varMap, varPlayer, targetSceneId)
    GetGuildQuestData( varMap, varPlayer, GD_GUILD_INDEX_CONTEND_STATE, 800021, targetSceneId, "EnterWorldCup" )
end


function x800021_EnterWorldCup( varMap, varPlayer, QuestData, varQuest, varTalknpc)

    if QuestData == STATE_GUILD_WORLDCUP_END then
        Msg2Player( varMap, varPlayer, "比赛已经结束，你不能再进入战场了。", 8, 2)
        Msg2Player( varMap, varPlayer, "比赛已经结束，你不能再进入战场了", 8, 3)
        return
    end
    
    
	if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,varQuest) == 0 then
		return
	end

    local nCurX,nCurZ = GetWorldPos( varMap, varPlayer)
    SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_SCENE_PRE, varMap)
    SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_POSX_PRE, nCurX)
    SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_POSZ_PRE, nCurZ)
    SetPlayerRuntimeData( varMap, varPlayer, RD_BATTLE_SCENE_KICK_DOWN, 0)

    SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_GUILDBATTLEFIELDSCENE, 1)
	if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,varQuest) == 0 then
		return
	end
    NewWorld( varMap, varPlayer, varQuest, 50, 50, 8000213)
end




function x800021_ProcPVP2v2BattleChangeScene( varMap,varPlayer,targetSceneId )
	
	
	if varMap ~= targetSceneId then
		
		
        local varState,varMsg = x800021_BattleTransCheckPlayerState( varMap,varPlayer )
        if varState == 1 then
            
            StartTalkTask(varMap)
            TalkAppendString( varMap, varMsg );
            StopTalkTask(varMap)
            DeliverTalkTips(varMap,varPlayer)
            return
        end
        
        
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,targetSceneId) == 0 then
			return
		end
		
		
        local nCurX,nCurZ = GetWorldPos( varMap,varPlayer )
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_SCENE_PRE,varMap + 1)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSX_PRE,nCurX)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSZ_PRE,nCurZ)
		SetPlayerRuntimeData(varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ,0)
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,targetSceneId) == 0 then
			return
		end
		NewWorld(varMap, varPlayer, targetSceneId, 100, 100, 8000214);		
		
		
		local varName = GetName(varMap,varPlayer)
	    local strMsg = format("P2BL:<Info>x800021_ProcPVP2v2BattleChangeScene varMap = %d varName=%s targetSceneId=%d", varMap, varName, targetSceneId  )
	    WriteLog( 1, strMsg ) 
	end
end




function x800021_ProcPVP2v2BattleTransError( varMap,varPlayer,nErrorCode )
	
	local varStr = nil
	if nErrorCode == 1 then
		varStr = "很抱歉，双人战场还没有开始！"
	elseif nErrorCode == 2 then
		varStr = "很抱歉，你没有报名参加双人战场！"
	elseif nErrorCode == 3 then
		varStr = "很抱歉，没有为您的队伍找到合适的对手！"
	elseif nErrorCode == 4 then
		varStr = "很抱歉，双人战场已经结束！"
	elseif nErrorCode == 5 then
		varStr = "很抱歉，双人战场的赛场已经满了！请稍候重试。"
	elseif nErrorCode == 6 then
		varStr = "很抱歉，双人战场已关闭！"
	elseif nErrorCode == 7 then
		varStr = "很抱歉，暂时无法开启双人战场赛场！"
	end
	
	if varStr ~= nil then
    	StartTalkTask(varMap)
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
    end
	
end






function x800021_ProcPVP6v6BattleChangeScene( varMap,varPlayer,targetSceneId )
	
	
	if varMap ~= targetSceneId then
		
		
        local varState,varMsg = x800021_BattleTransCheckPlayerState( varMap,varPlayer )
        if varState == 1 then
            
            StartTalkTask(varMap)
            TalkAppendString( varMap, varMsg );
            StopTalkTask(varMap)
            DeliverTalkTips(varMap,varPlayer)
            return
        end
        
        
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,targetSceneId) == 0 then
			return
		end
		
		
        local nCurX,nCurZ = GetWorldPos( varMap,varPlayer )
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_SCENE_PRE,varMap + 1)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSX_PRE,nCurX)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSZ_PRE,nCurZ)
		SetPlayerRuntimeData(varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN ,0)
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,targetSceneId) == 0 then
			return
		end
		NewWorld(varMap, varPlayer, targetSceneId, 100, 100, 8000214);		
		
		
		local varName = GetName(varMap,varPlayer)
	    local strMsg = format("P2BL:<Info>x800021_ProcPVP6v6BattleChangeScene varMap = %d varName=%s targetSceneId=%d", varMap, varName, targetSceneId  )
	    WriteLog( 1, strMsg ) 	
	end
end




function x800021_ProcPVP6v6BattleTransError( varMap,varPlayer,nErrorCode )
	
	local varStr = nil
	if nErrorCode == 1 then
		varStr = "很抱歉，组队战场还没有开始！"
	elseif nErrorCode == 2 then
		varStr = "很抱歉，你没有报名参加组队战场！"
	elseif nErrorCode == 3 then
		varStr = "很抱歉，没有为您的队伍找到合适的对手！"
	elseif nErrorCode == 4 then
		varStr = "很抱歉，组队战场已经结束！"
	elseif nErrorCode == 5 then
		varStr = "很抱歉，组队战场的赛场已经满了！请稍候重试。"
	elseif nErrorCode == 6 then
		varStr = "很抱歉，组队战场已关闭！"
	elseif nErrorCode == 7 then
		varStr = "很抱歉，暂时无法开启组队战场！"
	end
	
	if varStr ~= nil then
    	StartTalkTask(varMap)
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
    end
	
end




function x800021_ProcKingBattleChangeScene( varMap,varPlayer,newSceneID,Flag )
    

    
	if varMap == PK_PUNISH_PRISON_SCENE_ID then
		StartTalkTask(varMap)
		local varText = "监狱里还不老实,想走,没门。"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
	end

    local PosX = 100
    local PosZ = 100

			
    if varMap == newSceneID then
			
			if Flag == 0 then
		    SetPos( varMap , varPlayer , 77 , 174 )
			else
            SetPos( varMap , varPlayer , 213,54 )
			end
		else
			
			
			local varState,varMsg = x800021_BattleTransCheckPlayerState( varMap,varPlayer )
			if varState == 1 then
				
				StartTalkTask(varMap)
				TalkAppendString( varMap, varMsg );
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return
			end
			
			
			if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,newSceneID) == 0 then
				return
			end

			
			local nCurX,nCurZ = GetWorldPos( varMap,varPlayer )
			SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_SCENE_PRE,varMap + 1)
			SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSX_PRE,nCurX)
			SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSZ_PRE,nCurZ)
			SetPlayerRuntimeData(varMap,varPlayer,RD_BATTLESCENE_ENTER_FLAG,1)
			if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,newSceneID) == 0 then
				return
			end
			NewWorld( varMap , varPlayer , newSceneID , PosX , PosZ,8000215 )
	end
end




function x800021_ProcKingBattleTransError( varMap,varPlayer,nErrorId )
    
    
    local varStr = nil
    if nErrorId == 0 then        
        varStr = "只有参加帮会之后才能进入！"
    elseif nErrorId == 1 then
        varStr = "您的帮会没有报名！"
    elseif nErrorId == 2 then
        varStr = "国王战场还没到开放时间！"
    elseif nErrorId == 3 then
        varStr = "国王战场已经关闭入口（超过两分钟）"
    elseif nErrorId == 4 then
        varStr = "目前没有国王战场开始"
    elseif nErrorId == 5 then
        varStr = "战场人数已满"
    elseif nErrorId == 6 then
        varStr ="你已经进入过战场，不能重复进入！"
    elseif nErrorId == 7 then
    	varStr ="只有一方报名,国王已经诞生,战场关闭"
    else
        varStr ="未知错误，不能进入！"
    end
    
    if varStr ~= nil then
    	StartTalkTask(varMap)
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
    end

end




function x800021_ProcGuildBattleChangeScene(varMap,varPlayer,newSceneID,Flag)

	
	if varMap == PK_PUNISH_PRISON_SCENE_ID then
		StartTalkTask(varMap)
		local varText = "监狱里还不老实,想走,没门。"
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return
	end

    
	local BasePosX = 0
	local BasePosZ = 0
    if Flag == 0 then
        BasePosX = 234
        BasePosZ = 126
    elseif Flag == 1 then
        BasePosX = 21
        BasePosZ = 126
    end


    
	local PosX = BasePosX 
	local PosZ = BasePosZ 

    if varMap == newSceneID then
    	
        ClearRageRecoverTick(varMap, varPlayer)
	    RestoreHp(varMap, varPlayer,100)
	    RestoreRage(varMap, varPlayer,100)
	    ClearMutexState(varMap, varPlayer, 6)
	    SendReliveResult(varMap, varPlayer,1)	
	
		SetPos( varMap , varPlayer , PosX , PosZ )
	else
        
        
        local varState,varMsg = x800021_BattleTransCheckPlayerState( varMap,varPlayer )
        if varState == 1 then
            
            StartTalkTask(varMap)
            TalkAppendString( varMap, varMsg );
            StopTalkTask(varMap)
            DeliverTalkTips(varMap,varPlayer)
            return
        end
        
        
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,newSceneID) == 0 then
			return
		end

        
        local nCurX,nCurZ = GetWorldPos( varMap,varPlayer )
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_SCENE_PRE,varMap + 1)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSX_PRE,nCurX)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSZ_PRE,nCurZ)

        
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,newSceneID) == 0 then
			return
		end
		NewWorld( varMap , varPlayer , newSceneID , PosX , PosZ, 8000216 )
	end

end




function x800021_ProcGuildBattleTransError( varMap,varPlayer,nError )
    
    local varStr = nil
    if nError == 1 then
		varStr = "很抱歉，活动还没有开始！"
    elseif nError == 2 then
		varStr = "很抱歉，您没有帮会！"
    elseif nError == 3 then
		varStr = "很抱歉，您所在的帮会还没有报名！"
    elseif nError == 4 then
		varStr = "很抱歉，帮会战还没有开始！"
    elseif nError == 5 then
		varStr = "很抱歉，您所在的帮会在此次帮会战中轮空！"
    elseif nError == 6 then
		varStr = "很抱歉，您的帮会信息区配不正确！"
    elseif nError == 7 then
		varStr = "很抱歉，您不是帮主！"
    elseif nError == 8 then
		varStr = "很抱歉，您的帮会成员不足10人！"
    elseif nError == 9 then
		varStr = "很抱歉，已经受理过您的帮战申请请求！"
    elseif nError == 10 then
		varStr = "很抱歉，帮会战报名已达上限！"
    elseif nError == 11 then
		varStr = "很抱歉，帮会战已经结束！"
    else
		varStr = "很抱歉，未知错误！"
    end
    
    if varStr ~= nil then
    	StartTalkTask(varMap)
		TalkAppendString(varMap, varStr);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
    end
end




function x800021_ProcMPVP2v2BattleChangeScene(varMap, varPlayer, targetSceneId)
	
	
	if varMap ~= targetSceneId then
		
		
        local varState, varMsg = x800021_BattleTransCheckPlayerState(varMap, varPlayer)
        if varState == 1 then
            Msg2Player(varMap, varPlayer, varMsg, 8, 3)
            return
        end
        
        
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT, "CheckCountryBattleLiteSceneTrans", varMap, varPlayer, targetSceneId) == 0 then
			return
		end
		
		
        local nCurX, nCurZ = GetWorldPos(varMap, varPlayer)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_SCENE_PRE, varMap + 1)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSX_PRE, nCurX)
        SetPlayerRuntimeData(varMap, varPlayer, RD_HUMAN_POSZ_PRE, nCurZ)
		SetPlayerRuntimeData(varMap, varPlayer, RD_BATTLE_SCENE_KICK_DOWN, 0)
		
		if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT, "CheckCountryBattleLiteSceneTrans", varMap, varPlayer, targetSceneId) == 0 then
			return
		end
		
		NewWorld(varMap, varPlayer, targetSceneId, 100, 100, 8000217)		
		
		local varName = GetName(varMap, varPlayer)
	    local strMsg = format("MP2BL:<Info>x800021_ProcMPVP2v2BattleChangeScene varMap = %d varName=%s targetSceneId=%d", varMap, varName, targetSceneId )
	    WriteLog(1, strMsg) 
	end
end




function x800021_ProcMPVP2v2BattleTransError(varMap, varPlayer, nErrorCode)
	
	local varStr = nil
	if nErrorCode == 1 then
		varStr = "很抱歉，双人战场还没有开始！"
	elseif nErrorCode == 2 then
		varStr = "很抱歉，你没有报名参加双人战场！"
	elseif nErrorCode == 3 then
		varStr = "很抱歉，没有为您的队伍找到合适的对手！"
	elseif nErrorCode == 4 then
		varStr = "很抱歉，双人战场已经结束！"
	elseif nErrorCode == 5 then
		varStr = "很抱歉，双人战场的赛场已经满了！请稍候重试。"
	elseif nErrorCode == 6 then
		varStr = "很抱歉，双人战场已关闭！"
	elseif nErrorCode == 7 then
		varStr = "很抱歉，暂时无法开启双人战场赛场！"
	end
	
	if varStr ~= nil then
        Msg2Player(varMap, varPlayer, varStr, 8, 3)
    end
end




function x800021_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
end




function x800021_ProcAccept(varMap, varPlayer)
end





function x800021_ProcQuestAbandon(varMap, varPlayer, varQuest)
end




function x800021_CheckSubmit( varMap, varPlayer, varTalknpc)
end




function x800021_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
end




function x800021_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end




function x800021_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
end




function x800021_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
end
