
--------------------------------活动代号检查----------------------------------
X888895_ACTIVITY_NEIZHENG = 1											--内政
X888895_ACTIVITY_LUNHUITAI = 2										--轮回台
X888895_ACTIVITY_BANGHUIRENWU = 3								--帮会任务	
X888895_ACTIVITY_CHUGUORENWU = 4								--出国任务	
X888895_ACTIVITY_SHOUBIANRENWU = 5								--守边任务	
X888895_ACTIVITY_GUANFUYAYUN = 6								--官府押运
X888895_ACTIVITY_FUTUTA = 7												--浮屠塔	
X888895_ACTIVITY_SANFAN = 8												--三番	
X888895_ACTIVITY_SHENGSHANDIGONG = 9							--圣山地宫	
X888895_ACTIVITY_SHUANGRENZHANCHANG = 10				--双人战场	
X888895_ACTIVITY_LIURENZHANCHANG = 11						--六人战场	
X888895_ACTIVITY_BANGHUIZHAN = 12								--帮会战	
X888895_ACTIVITY_NEIZHENGT = 13	 --体力内政
X888895_ACTIVITY_ZHENGDUOLONGHUN = 14   --争夺龙魂
X888895_ACTIVITY_ZHENGDUOLONGHUNT = 15 --体力争夺龙魂
X888895_ACTIVITY_DUOQI = 16 --敌国夺旗
X888895_ACTIVITY_CISHA = 17  --敌国刺杀
X888895_ACTIVITY_SHOUBIAN = 18  --国家守边
X888895_ACTIVITY_QINGBAO = 19  --敌国情报
X888895_ACTIVITY_CHUJIAN = 20  --敌国除奸
X888895_ACTIVITY_NEIZHENG1 = 21  --【个人】国家内政

--活动调用接口
function x888895_EventActivity( varMap, varPlayer, event )
	
	--内政
	if event == X888895_ACTIVITY_NEIZHENG then
		
		--x888895_ziliaophuodong(varMap,varPlayer,var)
	
	--轮回台
	elseif event == X888895_ACTIVITY_LUNHUITAI then


	
	--帮会任务
	elseif event == X888895_ACTIVITY_BANGHUIRENWU then


	
	--出国任务
	elseif event == X888895_ACTIVITY_CHUGUORENWU then


	
	--守边任务
	elseif event == X888895_ACTIVITY_SHOUBIANRENWU then


	
	--官府押运
	elseif event == X888895_ACTIVITY_GUANFUYAYUN then


	
	--浮屠塔
	elseif event == X888895_ACTIVITY_FUTUTA then


	
	--三番
	elseif event == X888895_ACTIVITY_SANFAN then


	
	--圣山地宫
	elseif event == X888895_ACTIVITY_SHENGSHANDIGONG then


	
	--双人战场
	elseif event == X888895_ACTIVITY_SHUANGRENZHANCHANG then


	
	--六人战场
	elseif event == X888895_ACTIVITY_LIURENZHANCHANG then


	
	--帮会战
	elseif event == X888895_ACTIVITY_BANGHUIZHAN then

--内政
	elseif event == X888895_ACTIVITY_NEIZHENGT then
					  --完成任务给纪念兑换券
						local year, month, day = GetYearMonthDay()
						local day = GetDayOfYear()
						if year == 2012 and day > 263 and day < 277 then
						StartItemTask(varMap)
						ItemAppendBind( varMap, 12110216, 3)
						local ret = StopItemTask(varMap,varPlayer)
						if ret > 0 then 
							  varMsg ="恭喜您获得3个天狼盔甲碎片"
								Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
								Msg2Player( varMap,varPlayer,varMsg,8,3) ;			
					   		DeliverItemListSendToPlayer( varMap, varPlayer)
					  else
				    		Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
						end
						end
						
	elseif event == X888895_ACTIVITY_ZHENGDUOLONGHUN then   --争夺龙魂
					  --完成任务给纪念兑换券
						local year, month, day = GetYearMonthDay()
						local day = GetDayOfYear()
						if year == 2012 and day > 263 and day < 277 then
						StartItemTask(varMap)
						ItemAppendBind( varMap, 12110216, 2)
						local ret = StopItemTask(varMap,varPlayer)
						if ret > 0 then 
							  varMsg ="恭喜您获得2个天狼盔甲碎片"
								Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
								Msg2Player( varMap,varPlayer,varMsg,8,3) ;			
					   		DeliverItemListSendToPlayer( varMap, varPlayer)
					  else
				    		Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
				
						end
						end
	elseif event == X888895_ACTIVITY_ZHENGDUOLONGHUNT then --体力争夺龙魂
					  --完成任务给纪念兑换券
						local year, month, day = GetYearMonthDay()
						local day = GetDayOfYear()
						if year == 2012 and day > 263 and day < 277 then
						StartItemTask(varMap)
						ItemAppendBind( varMap, 12110216, 2)
						local ret = StopItemTask(varMap,varPlayer)
						if ret > 0 then 
							  varMsg ="恭喜您获得2个天狼盔甲碎片"
								Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
								Msg2Player( varMap,varPlayer,varMsg,8,3) ;			
					   		DeliverItemListSendToPlayer( varMap, varPlayer)
					  else
				    		Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
					   		
						end 
						end
	elseif event == X888895_ACTIVITY_DUOQI then--敌国夺旗
					  --完成任务给纪念兑换券
						local year, month, day = GetYearMonthDay()
						local day = GetDayOfYear()
						if year == 2012 and day > 263 and day < 277 then
						StartItemTask(varMap)
						ItemAppendBind( varMap, 12110216, 1)
						local ret = StopItemTask(varMap,varPlayer)
						if ret > 0 then 
							  varMsg ="恭喜您获得1个天狼盔甲碎片"
								Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
								Msg2Player( varMap,varPlayer,varMsg,8,3) ;			
					   		DeliverItemListSendToPlayer( varMap, varPlayer)
					  else
				    		Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
					   		
						end 
						end
	elseif event == X888895_ACTIVITY_CISHA then --敌国刺杀
						  --完成任务给纪念兑换券
						local year, month, day = GetYearMonthDay()
						local day = GetDayOfYear()
						if year == 2012 and day > 263 and day < 277 then
						StartItemTask(varMap)
						ItemAppendBind( varMap, 12110216, 1)
						local ret = StopItemTask(varMap,varPlayer)
						if ret > 0 then 
							  varMsg ="恭喜您获得1个天狼盔甲碎片"
								Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
								Msg2Player( varMap,varPlayer,varMsg,8,3) ;			
					   		DeliverItemListSendToPlayer( varMap, varPlayer)
					  else
				    		Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
					   	
						end
						end
	elseif event == X888895_ACTIVITY_SHOUBIAN then --国家守边
					  --完成任务给纪念兑换券
						local year, month, day = GetYearMonthDay()
						local day = GetDayOfYear()
						if year == 2012 and day > 263 and day < 277 then
						StartItemTask(varMap)
						ItemAppendBind( varMap, 12110216, 3)
						local ret = StopItemTask(varMap,varPlayer)
						if ret > 0 then 
							  varMsg ="恭喜您获得3个天狼盔甲碎片"
								Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
								Msg2Player( varMap,varPlayer,varMsg,8,3) ;			
					   		DeliverItemListSendToPlayer( varMap, varPlayer)
					  else
				    		Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
					   		
						end
						end
	elseif event == X888895_ACTIVITY_QINGBAO then --敌国情报
					  --完成任务给纪念兑换券
						local year, month, day = GetYearMonthDay()
						local day = GetDayOfYear()
						if year == 2012 and day > 263 and day < 277 then
						StartItemTask(varMap)
						ItemAppendBind( varMap, 12110216, 1)
						local ret = StopItemTask(varMap,varPlayer)
						if ret > 0 then 
							  varMsg ="恭喜您获得1个天狼盔甲碎片"
								Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
								Msg2Player( varMap,varPlayer,varMsg,8,3) ;			
					   		DeliverItemListSendToPlayer( varMap, varPlayer)
					  else
				    		Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
					   		
						end
						end
	elseif event == X888895_ACTIVITY_CHUJIAN then --敌国除奸
						  --完成任务给纪念兑换券
						local year, month, day = GetYearMonthDay()
						local day = GetDayOfYear()
						if year == 2012 and day > 263 and day < 277 then
						StartItemTask(varMap)
						ItemAppendBind( varMap, 12110216, 1)
						local ret = StopItemTask(varMap,varPlayer)
						if ret > 0 then 
							  varMsg ="恭喜您获得1个天狼盔甲碎片"
								Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
								Msg2Player( varMap,varPlayer,varMsg,8,3) ;			
					   		DeliverItemListSendToPlayer( varMap, varPlayer)
					  else
				    		Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
					   		
						end
						end
	elseif event == X888895_ACTIVITY_NEIZHENG1 then --【个人】国家内政
					  --完成任务给纪念兑换券
						local year, month, day = GetYearMonthDay()
						local day = GetDayOfYear()
						if year == 2012 and day > 263 and day < 277 then
						StartItemTask(varMap)
						ItemAppendBind( varMap, 12110216, 1)
						local ret = StopItemTask(varMap,varPlayer)
						if ret > 0 then 
							  varMsg ="恭喜您获得1个天狼盔甲碎片"
								Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
								Msg2Player( varMap,varPlayer,varMsg,8,3) ;			
					   		DeliverItemListSendToPlayer( varMap, varPlayer)
					  else
				    		Msg2Player( varMap, varPlayer, "无法额外奖励物品，请整理道具栏", 8, 3)
					   		
						end
						end
	end
	local a =3847 + event
	GamePlayScriptLog( varMap, varPlayer, a)
end


--5月29日资料片上线活动
function x888895_ziliaophuodong(varMap,varPlayer,var)
	local day = GetDayOfYear()
	
	GamePlayScriptLog(varMap,varPlayer,var)
	
end


--------------------------------------------------------------------------------------


-------------------------------拉人状态检查--------------------------------------
function x888895_CheckCanJoin( mapId, playerId,msg )
	
	local sceneType = GetSceneType(mapId)
	if	sceneType == 1 or sceneType == 2 then
		StartTalkTask(mapId)
    TalkAppendString( mapId, "处于副本或战场中,"..msg );
    StopTalkTask(mapId)
    DeliverTalkTips(mapId,playerId)	
		return 1
	end
	
	--玩家变身，战场押运等状态
	local state = IsPlayerStateNormal(mapId,playerId )
  if state == 0 then
  	StartTalkTask(mapId)
    TalkAppendString( mapId, "玩家状态异常,"..msg );
    StopTalkTask(mapId)
    DeliverTalkTips(mapId,playerId)	
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_MENTALGAME )
  if state == 1 then
  	StartTalkTask(mapId)
    TalkAppendString( mapId, "处于答题状态,"..msg );
    StopTalkTask(mapId)
    DeliverTalkTips(mapId,playerId)	  
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_STALL )
  if state == 1 then
			StartTalkTask(mapId)
    	TalkAppendString( mapId, "处于摆摊状态,"..msg );
    	StopTalkTask(mapId)
    	DeliverTalkTips(mapId,playerId)	   
      return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_DIE )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于死亡状态,"..msg );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)
  	 return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_CRASHBOX )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于运镖状态,"..msg );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)  
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_AUTOPLAY )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于挂机状态,"..msg );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId) 
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_SUBTRAIN )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于代练状态,"..msg );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)   
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_BUS )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于BUS状态,"..msg );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)   
    return 1
  end
  
  if mapId == PK_PUNISH_PRISON_SCENE_ID then
    StartTalkTask(mapId)
  	TalkAppendString( mapId, "在监狱里,"..msg );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)  
  	return 1
  end
  	
	return 0	
end

---------------------------------------------------------------------------------------
--LUA删除TABLE指定位置元素
--table：需要删除值的表格，index：需要删除值的table索引
---------------------------------------------------------------------------------------
function x888895_DelTabValue(table,index)
	
	if getn(table) < 1 then
		print("table输入有误无法进行删除操作")
		return
	end
	if index > getn(table) then
		print("index大于table个数，不需要进行删除操作")
		return
	end
	
	for a,b in table do	
		if a == index then
			for val = a,getn(table)-1,1 do
			table[val] = table[val+1] 
			end
			table[getn(table)] = nil
		end
	end
	
end

---------------------------------------------------------------------------------------
--LUA向TABLE指定位置添加元素
---------------------------------------------------------------------------------------
function x888895_AddTabValue(table,index,value)

	local temptable = {}
	
	if index > getn(table) then
		
		table[index] = value
		
	else
	
		for val = getn(table) , index , -1 do
			 table[val+1] = table[val]
		end
		table[index]  = value
		
	end
	
end
