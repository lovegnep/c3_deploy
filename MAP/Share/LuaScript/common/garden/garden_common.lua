--庄园
x800200_var_FileId =	800200
x800200_var_OpenFlag = 1--庄园开启标志(优先级1)
x800200_GardenToggle = {15	,21	,23	,31	,44	,53	,62	,73	,84	,106	,114 , 121	,138	,150	,151	,156	,161	,167	,196	,201	,211	,216	,220	,241	,284	,300	,316	,321	,323	,344	,353	,364	,390	,424	,1002	,1122	,1172	,1222	,1242	,1272	,1302	,1332	,1342	,1352	,1372	,1402	,1432	,1442	,1452	,1462	,1472	,
1502	,1512	,1522	,1532	,1542	,1602	,1612	,1622	,1632	,1642	,1652	,1662	,3002	,3052	,3142	,3152	,3202	,3222	,3232	,3242	,3252	,3262	,3272	,3302	,3312	,3322	,3332	,2702,2712,2722,2732,2742,2752,2762,2772,2782,2792,2802,2812,2822,2832,2842,2852,2862,2872,2882,2892,2902,2912,2922,
2932,2942,2952,2962,2972,2982,2992,} --哪些服开放家园，如果为空，表示所有服都开放(优先级2)

----------------------------------------------------------------------------- settings
--创建需求(名称固定needxxx，如果不需要检测，直接注释本行)
x800200_var_Need = 
{
	NeedCreate = 
	{
		needLevel = 30,--等级
		--needItems = {10252304,10252314},--所要的道具
		--needMoney = {costType = 1, costNum = 100},--所要的金钱(costType=类型,costNum=数量)
	},
	NeedEnter = 
	{
		needLevel = 30,
	},	
	NeedAdd = 
	{
		needLevel = 30,
	},	
	NeedCrop = 
	{
		needLevel = 30,
	},	
	NeedBuy = 
	{
		needLevel = 30,
	},	
	NeedSpeedUp = 
	{
		needLevel = 30,
	},	
	NeedPick = 
	{
		needLevel = 30,
	},
}

--守护兽表 mon_attr_ex.tab
x800200_var_GardenAngel =
{
	[1] = {id = 61810, 
					needLevel = 40,
					--needItems = {10252304,10252314}, 
					meedMoney = {costType = 1, costNum = 50},
				},
	[2] = {id = 27057, 
				needLevel = 40,
				--needItems = {10252304,10252314}, 
				meedMoney = {costType = 1, costNum = 50},
			},
	[3] = {id = 27028, 
				needLevel = 40,
				--needItems = {10252304,10252314}, 
				meedMoney = {costType = 1, costNum = 50},
			},
}

-- 家园预定义设置
x800200_var_Define =
{
	--type define
	plant = 0,
	mine = 1,
	
	--max num define
	def_max_plant = 15,
	def_max_mine	= 0,
	def_max_monster	= 10,--家园最多怪数
	def_max_stock_cfg	= 10,--怪物库的数量
	def_max_stockmonster_cfg = 5, --每种怪物库的怪物数量
	
	--growpType/objType define
	point = {	plant = {invalid = -1, empty = 29016, crop = 159, mature = 223},
						mine	= {invalid = -1, empty = 29016, crop = 159, mature = 223},
					},
					
	--pos define
	pos = {	plant = {
								{45.016499,70.027603},{45.036598,76.017502},{45.036598,81.986702},{45.0364,88.007896},{45.0345,94.033897},
								{38.993198,70.027603},{38.9772,76.0121},{38.9916,81.990303},{38.973999,87.996101},{38.983198,94.024101},
								{33.054501,70.027603},{33.039398,76.0121},{33.009998,82.001801},{33.022999,87.999397},{33.017799,94.0177},
									},
					mine = {
									{100,55},{100,55},{100,55},{100,55},{100,55},
									},
					monster = { timer = {{87.323616,41.389969},{69.703133,75.414299},{61.013077,65.010437},{64.67981 ,87.918839},{61.983047,52.381573},{48.342617,38.13047 },{72.783119,55.882202},{90.193359,49.329559},{43.262383,43.04055 },
					{65.501472,78.005402},{62.501472,82.005402},{64.501472,68.005402},{65.501472,78.005402},{69.501472,49.005402},{79.501472,54.005402},{92.501472,52.005402},{101.501472,44.005402},{81.501472,32.005402},{60.501472,58.005402}
															},						
											gather =
											{
											[1] = {{46.073185,68.698578},{46.089615,71.170486},{45.080528,69.36721 },{44.633369,70.91011 },{43.287979,69.31971 }},
											[2] = {{46.208405,74.632744},{46.007572,77.252083},{45.17474 ,75.091492},{44.414539,76.841301},{43.303013,75.260078}},
											[3] = {{46.165096,80.543533},{46.080986,83.186615},{45.143227,81.053192},{44.295162,82.921249},{43.236847,81.169632}},
											[4] = {{46.293209,86.611176},{46.163471,89.154808},{45.068951,87.105644},{44.18224 ,88.918556},{43.303291,87.460213}},
											[5] = {{46.468369,92.679352},{46.093956,95.255409},{45.159821,93.101448},{44.124332,94.892113},{43.30854 ,93.53862 }},
											[6] = {{40.282753,68.674133},{40.275406,71.418549},{39.008774,68.982376},{38.076698,71.096931},{37.311638,69.353157}},
											[7] = {{40.343796,74.570847},{40.13353 ,77.30043 },{39.191963,75.006531},{38.05125 ,76.88633 },{37.259537,75.457634}},
											[8] = {{40.423149,80.597824},{40.15527 ,83.226006},{39.096336,80.98069 },{38.10762 ,83.005417},{37.322609,81.566727}},
											[9] = {{45.016499,70.027603},{45.036598,76.017502},{45.036598,81.986702},{45.0364,88.007896},{45.0345,94.033897}},
											[10] = {{45.016499,70.027603},{45.036598,76.017502},{45.036598,81.986702},{45.0364,88.007896},{45.0345,94.033897}},
											[11] = {{45.016499,70.027603},{45.036598,76.017502},{45.036598,81.986702},{45.0364,88.007896},{45.0345,94.033897}},
											[12] = {{45.016499,70.027603},{45.036598,76.017502},{45.036598,81.986702},{45.0364,88.007896},{45.0345,94.033897}},
											[13] = {{45.016499,70.027603},{45.036598,76.017502},{45.036598,81.986702},{45.0364,88.007896},{45.0345,94.033897}},
											[14] = {{45.016499,70.027603},{45.036598,76.017502},{45.036598,81.986702},{45.0364,88.007896},{45.0345,94.033897}},
											[15] = {{45.016499,70.027603},{45.036598,76.017502},{45.036598,81.986702},{45.0364,88.007896},{45.0345,94.033897}},
											},
											PatrolId =
											{
											[1] =  {0,1,2,3,4},
											[2] =  {5,6,7,8,9},
											[3] =  {10,11,12,13,14},
											[4] =  {15,16,17,18,19},
											[5] =  {20,21,22,23,24},
											[6] =  {25,26,27,28,29},
											[7] =  {30,11,32,33,34},
											[8] =  {35,36,37,38,39},
											[9] =  {0,1,2,3,4},
											[10] = {0,1,2,3,4},
											[11] = {0,1,2,3,4},
											[12] = {0,1,2,3,4},
											[13] = {0,1,2,3,4},
											[14] = {0,1,2,3,4},
											[15] = {0,1,2,3,4},											
											}						
									},
									},

	-- res state define
	state = {	invalid = -1, empty = 0, crop = 1, mature = 2	},
	
	--clien msg type define(see:MsgXCGarden::enum)
	msg = {add = 4, levelup =5, update = 6, speedup = 7, pick =8, subres = 11},
	
	--GardenManager::GardenErrCode
	err = {ok = 0, full = -1, nogarden = -14},
	
	--res syn type
	resfresh = {timmer = 0, crop = 1, mature = 2},
	
	award = {invalid = 0, timeropen = 1, timerflag = 2, timerclose = 3}
	
}

--允许动态re
if x800200_ObjList == nil then
x800200_ObjList = {
	plant = {},
	mine = {},
	monster = {},
	snid = {},
	worldID = {},
}
end

--------------------------------------------------------------
-- 检测当前服务器是否开放
--------------------------------------------------------------
function x800200_CheckGardenToggle()
	local nToggle = 0		
	if getn(x800200_GardenToggle) == 0 then
			nToggle = 1
	else
			for i, v in x800200_GardenToggle do 
				if GetWorldIdEx() == v then
					nToggle = 1
					break
				end
			end
	end
	return nToggle
end

--------------------------------------------------------------
-- 检测开关
--------------------------------------------------------------
function x800200_IsServerOpen()
	local nToggle = 1	
--	if x800200_var_OpenFlag ~= 1 or x800200_CheckGardenToggle() ~= 1 then
--		nToggle = 0
--	end	
	return nToggle
end
------------------------------------------------------------------------------Basic handel function
--基本逻辑处理
function x800200_DesposeCommon(varMap, varPlayer, msgType, p0, p1, p2, p3, p4)
	if x800200_IsServerOpen() ~= 1 then
		StartTalkTask(varMap)
		TalkAppendString( varMap, "庄园服务器暂未开放" )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
		return 0
	end
	
	local varRet = 0
	local varTip = ""

	if msgType == 0 then --创建
		varRet, varTip = x800200_CreateDispose(varMap, varPlayer, msgType, p0, p1, p2, p3, p4)
	elseif msgType == 1 then 	--进入
		varRet, varTip = x800200_EnterDispose(varMap, varPlayer, msgType, p0, p1, p2, p3, p4)	
	elseif msgType == 2 then 	--离开
		varRet, varTip = x800200_LeaveDispose(varMap, varPlayer, msgType, p0, p1, p2, p3, p4)	
	elseif msgType == 3 then --查看事件
		return 0	
	elseif msgType == 4 then --请求庄园数据
		return 0
	elseif msgType == 5 then --开垦
		varRet, varTip = x800200_AddDispose(varMap, varPlayer, msgType, p0)	
	elseif msgType == 6 then --升级
		return 0
	elseif msgType == 7 then --种植
		varRet, varTip = x800200_CropDispose(varMap, varPlayer, msgType, p0, p1, p2, p3, p4)		
	elseif msgType == 8 then --购买
		varRet, varTip = x800200_GetMineGift(varMap, varPlayer, msgType, p0, p1, p2, p3, p4)	
	elseif msgType == 9 then --加速
		varRet, varTip = x800200_SpeedUpDispose(varMap, varPlayer, msgType, p0, p1, p2, p3, p4)	
	elseif msgType == 10 then --采摘
		varRet, varTip = x800200_PickDispose(varMap, varPlayer, p0, p1, p2, p3, p4)	
	elseif msgType == 11 then --偷取
		return 0			
	end
	
	if varRet ~= 1 then
			x800200_DoTips(varMap, varPlayer, varTip);
	end
	
	return varRet
end
-------------------------------------------------------
-- 创建处理
-------------------------------------------------------
function x800200_CreateDispose(varMap, varPlayer, msgType)

	local varRet = 0
	local varTip = ""
	
	varRet, varTip = x800200_CommonChecker(varMap, varPlayer, msgType)
	if varRet ~= 1 then
		return 0, varTip
	end

	if x800200_CommonDispose(varMap, varPlayer, msgType) <= 0 then
		return 0, "发生错误"
	end
		
	return 1
end

-------------------------------------------------------
--进入庄园限制
-------------------------------------------------------
function x800200_limitingarden(mapId, playerId, varReason)
	--玩庄在副本、战场内无法进入庄园
	if varReason ~= 1 then
		local sceneType = GetSceneType(mapId)
		if	sceneType ~= 0 then
			StartTalkTask(mapId)
	    TalkAppendString( mapId, "处于副本或战场中,不能进入庄园" );
	    StopTalkTask(mapId)
	    DeliverTalkTips(mapId,playerId)	
			return 1
		end
	end
	
	--玩庄变身，战场押运等状态无法搜索
	local state = IsPlayerStateNormal(mapId,playerId )
  if state == 0 then
  	StartTalkTask(mapId)
    TalkAppendString( mapId, "玩庄状态异常,不能进入庄园" );
    StopTalkTask(mapId)
    DeliverTalkTips(mapId,playerId)	
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_MENTALGAME )
  if state == 1 then
  	StartTalkTask(mapId)
    TalkAppendString( mapId, "处于答题状态,不能进入庄园" );
    StopTalkTask(mapId)
    DeliverTalkTips(mapId,playerId)	  
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_STALL )
  if state == 1 then
			StartTalkTask(mapId)
    	TalkAppendString( mapId, "处于摆摊状态,不能进入庄园" );
    	StopTalkTask(mapId)
    	DeliverTalkTips(mapId,playerId)	   
      return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_DIE )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于死亡状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)
  	 return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_CRASHBOX )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于运镖状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)  
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_AUTOPLAY )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于挂机状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId) 
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_SUBTRAIN )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于代练状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)   
    return 1
  end

  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_BUS )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于BUS状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)   
    return 1
  end
  
  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_TONGQUBUFF )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "处于童趣状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)   
    return 1
  end
  
  state = IsPlayerMutexState(mapId,playerId,PLAYER_STATE_PKMODE )
  if state == 1 then
		StartTalkTask(mapId)
  	TalkAppendString( mapId, "PK值过高或处于入魔状态,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)   
    return 1
  end
  
  if IsHideName(mapId, playerId) > 0 then
  	StartTalkTask(mapId)
  	TalkAppendString( mapId, "匿名状态下,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)  
  	return 1
  end
  
  if mapId == PK_PUNISH_PRISON_SCENE_ID then
    StartTalkTask(mapId)
  	TalkAppendString( mapId, "在监狱里,不能进入庄园" );
  	StopTalkTask(mapId)
  	DeliverTalkTips(mapId,playerId)  
  	return 1
  end
  
  	if IsHaveSpecificImpact( mapId,playerId, 7610) == 1 or IsHaveSpecificImpact( mapId,playerId, 7607) == 1 or IsHaveSpecificImpact( mapId,playerId, 7608) == 1 or IsHaveSpecificImpact( mapId,playerId, 7605) == 1 or IsHaveSpecificImpact( mapId,playerId, 7616) == 1 or IsHaveSpecificImpact( mapId,playerId, 7613) == 1 or IsHaveSpecificImpact( mapId,playerId, 7614) == 1 or IsHaveSpecificImpact( mapId,playerId, 7611) == 1 or IsHaveSpecificImpact( mapId,playerId, 7622) == 1 or IsHaveSpecificImpact( mapId,playerId, 7619) == 1 or IsHaveSpecificImpact( mapId,playerId, 7620) == 1 or IsHaveSpecificImpact( mapId,playerId, 7617) == 1 or IsHaveSpecificImpact( mapId,playerId, 7628) == 1 or IsHaveSpecificImpact( mapId,playerId, 7625) == 1 or IsHaveSpecificImpact( mapId,playerId, 7626) == 1 or IsHaveSpecificImpact( mapId,playerId, 7623) == 1 then
		Msg2Player(mapId,playerId,"很抱歉，未完成铁人三项任务时无法进入庄园",8,3)
		return 1
	end
	
	if IsHaveSpecificImpact( mapId,playerId, 32584) == 1 then
		Msg2Player(mapId,playerId,"很抱歉，那达慕赛马大赛中无法进入庄园",8,3)
		return 1
	end
	
  	if IsHaveSpecificImpact( mapId,playerId, 7702 ) > 0 then
		StartTalkTask(mapId);
		TalkAppendString(mapId, "很抱歉，您扛着旗子不能进入庄园");
		StopTalkTask(mapId);
		DeliverTalkTips(mapId,playerId);
		Msg2Player(mapId,playerId,"很抱歉，您扛着旗子不能进入庄园",8,3)
		return 1
	end
	
  	local IsHaveFlag = IsHaveSpecificImpact(mapId,playerId, 7536  )
    if IsHaveFlag ~= 0 then
    	varMsg = "在暴龙大作战期间，不能进入庄园"
    	Msg2Player(mapId,playerId,varMsg,8,3)
    	return 1
    end
    
    IsHaveFlag = IsHaveSpecificImpact(mapId,playerId, 7537 )
    if IsHaveFlag ~= 0 then
    	varMsg = "在暴龙大作战期间，不能进入庄园"
    	Msg2Player(mapId,playerId,varMsg,8,3)
    	return 1
    end
  
  
  
	return 0	
end

------------------------------------------------------
--进入
------------------------------------------------------
function x800200_EnterDispose(varMap, varPlayer, msgType, varTargetGUID, varReason)
	local varRet = 0
	local varTip = ""
	
	if x800200_limitingarden(varMap, varPlayer, varReason)==1 then
		return 0
	end	
	
	varRet, varTip = x800200_CommonChecker(varMap, varPlayer, msgType)
	if varRet ~= 1 then
		return 0, varTip
	end
	
	--是否就在本家园中
	local guid = GetGUID(varMap, varPlayer)
	local targetSaved = GetTargetGarden(varMap, varPlayer, 0)
	
	if varTargetGUID < 0 then
		varTargetGUID = varTargetGUID + 4294967296;--程序调用为Int,转成Uint
	end

	if targetSaved > 0 then
		if targetSaved == varTargetGUID then
			if guid ~= targetSaved then
				varTip = "您已经在要进入的家园中"
				return 0, varTip
			else
				varTip = "您已经在自己家园中"
				return 0, varTip
			end
		end
	end
	
	if guid ~= varTargetGUID then
		--是否是好友
		if IsOnLineFriend(varMap, varPlayer, varTargetGUID) ~= 1 then
			WriteLog(1, format("garden enter with bad guid, which is not a online friend. guid=%X, target=%X", guid, varTargetGUID))
			varTip = "不是您的线上好友，无法进入家园"
			return 0, varTip
		elseif GetFriendPointByGuid(varMap, varPlayer, varTargetGUID) < 1000 then
			varTip = "您与该好友的友好度未达到#G1000#Y，不能进入该好友的庄园。"
			return 0, varTip
		end
	end
	
	return 1
end

------------------------------------------------------
--离开
------------------------------------------------------
function x800200_LeaveDispose(varMap, varPlayer)
	--只接受家园内消息	

	local varSceName = GetBattleSceneName(varMap)
	if varSceName ~= "city_jiayuan/city_jiayuan.scn" then 
			return 1
	end
	
	local nBakSceneId, varX, varZ = GetPlayerBakSceneInfo(varMap, varPlayer)	
	 if x800200_IsGardenMap(nBakSceneId) ~= 1 then	--可能是其它场景T到家园
	 			local sceneType = GetMapConfig(nBakSceneId, "type") --如果是普通场景，传送
	 		
				if	sceneType == 0 then
					NewWorld(varMap, varPlayer, nBakSceneId, varX, varZ, x800200_var_FileId)			
					return 1
				end
				
	 end
	
   -- 没有记录合适的地图，就传送到王城
  local varCountry = GetCurCountry(varMap,varPlayer)
  if varCountry == 0 then
      NewWorld(varMap, varPlayer, 50, 251, 116, x800200_var_FileId)
  elseif varCountry == 1 then
      NewWorld(varMap, varPlayer, 150, 251, 116, x800200_var_FileId)
  elseif varCountry == 2 then
      NewWorld(varMap, varPlayer, 250, 251, 116, x800200_var_FileId)
  elseif varCountry == 3 then
      NewWorld(varMap, varPlayer, 350, 251, 116, x800200_var_FileId)
  end
	
	return 1
end
------------------------------------------------------
--开垦
------------------------------------------------------
function x800200_AddDispose(varMap, varPlayer, msgType, varIndex)
	local varRet = 0
	local varTip = ""
	local guid = GetGUID(varMap, varPlayer)
	local resPos = varIndex+1
	
	--check pos
	if x800200_IsPosValid(resPos) ~= 1 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: add garden block Kick, bad res pos. guid=%X,pos=%d", guid, resPos))
		return 0, ""
	end
	
	local targetGUID, targetWorld = GetTargetGarden(varMap, varPlayer)
	if targetGUID ~= guid then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: add garden block Kick, not self garden. guid=%X, targetGUID=%X" ,guid, targetGUID))
		return 0, ""
	end
	
	--check garden
	local gID, gLv, gViewGroup = GetGardenInfo(varMap, guid, targetWorld)
	if gID < 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: add garden block Kick, no garden exist. guid=%X" ,guid))
		return 0, ""
	end
	
	local resType = x800200_GetResTypeByPos(resPos)
	--check Block is empty state,res is invalid befor add block
	local varRet, resID, resNum, resState, resLv, resTime = GetGardenRes(varMap, targetWorld, guid, resType, varIndex)	
	if varRet > 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: add garden block Kick, garden res exist. guid=%X" ,guid))
		return 0, ""
	end
	if resState ~= x800200_var_Define.state.invalid then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: add garden block Kick, bad res state! guid=%X, pos=%d, state=%d", guid, resPos, resState))
		return 0, ""
	end
	
	--check block
	local nLv, nCostType, nCostNum, nCropMaxNum, nSubResNum =  GetGardenBlockCfg(varIndex);	
	if nLv <= 0 then
		WriteLog(1, format("garden warning: garden block cfg error. index=%d" ,varIndex))
		return 0, varTip
	end
	
	--level
	local varLevel = GetLevel(varMap, varPlayer);
	if varLevel < nLv then
		--x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden warning: add garden block Kick, try add with limit level. guid=%X, level=%d, index=%d" ,guid, varLevel,varIndex))
		Msg2Player(varMap, varPlayer, "您的等级不够！", 8, 3)
		return 0, ""
	end
	
	--money
	nCostNum = nCostNum * 1000 --单位：两
	local varMoneyRet, varMoneyTip = x800200_MoneyChecker(varMap, varPlayer, nCostType, nCostNum)
	if varMoneyRet ~= 1 then	
			varTip = varMoneyTip .. "！" .. varTip
			return 0, varTip
	end

	--update befor settings
	x800200_ClearObj(varMap, resPos, resType, gViewGroup)

	--settings
	local resType = x800200_GetResTypeByPos(resPos)
	local resState = x800200_var_Define.state.empty
	local defaultResID = -1
	if resType == x800200_var_Define.mine then
		defaultResID = x800200_GetDefaultMineResID(varIndex)
		if defaultResID <= 0 then
			WriteLog(1, format("garden warning: get mine by res id error. index=%d" ,varIndex))
			return 0, ""
		end
	end
	
	varRet = GardenBlockAdd(varMap, targetWorld, guid, varIndex, resType, nSubResNum, defaultResID)
	
	if varRet == 0 then
		WriteLog(1, format("garden error: garden block set res type. guid=%X, index=%d",guid, varIndex))
		return 0, varTip
	end

	--优先使用现银现金
	if nCostType == 0 or nCostType == 1 then
		local sillerMode = GetSillerMode(varMap, varPlayer)
		if sillerMode == 0 then
			 if CostMoney( varMap, varPlayer, 1, nCostNum) ~= 1 then
	        if CostMoney(varMap, varPlayer, 0, nCostNum) ~= 1 then
	            varTip = "您的银卡不足，无法开垦土地"
	            return 0, varTip
	        end
	    end
		else
			if CostMoney( varMap, varPlayer, 0, nCostNum) ~= 1 then
	        if CostMoney(varMap, varPlayer, 1, nCostNum) ~= 1 then
	            varTip = "您的银卡不足"
	            return 0, varTip
	        end
	    end
		end
	elseif nCostType == 2 or nCostType == 3 then
		local glodMode = GetSillerMode(varMap, varPlayer)
		if glodMode == 0 then
			 if CostMoney( varMap, varPlayer, 2, nCostNum) ~= 1 then
	        if CostMoney(varMap, varPlayer, 3, nCostNum) ~= 1 then
	            varTip = "您的金卡或现金不足"
	            return 0, varTip
	        end
	    end
		else
			if CostMoney( varMap, varPlayer, 3, nCostNum) ~= 1 then
	        if CostMoney(varMap, varPlayer, 2, nCostNum) ~= 1 then
	            varTip = "您的现金或金卡不足"
	            return 0, varTip
	        end
	    end
		end
	end

	-- update scene and data	
	x800200_UpdateObj(varMap, targetWorld, guid, resPos, resType, gViewGroup)
	
	--send message to clien
	local msg = x800200_var_Define.msg.add
	local curDayCount = x800200_GetCurCropCount(varMap, varPlayer, resType, varIndex)
	local maxDayCount = x800200_GetMaxCropCount(varMap, varPlayer, resType, varIndex)
	SendGardenRes(targetGUID, msg, resType, varIndex, x800200_var_Define.err.ok, curDayCount, maxDayCount)
	
	WriteLog(1, format("garden add ok: guid:%d, resPos:%d", guid, varIndex))
	
	return 1
end
------------------------------------------------------
--种
------------------------------------------------------
function x800200_CropDispose(varMap, varPlayer, msgType, varIndex, varResID)
		
	local varRet = 0
	local varTip = "无法种植"
	local guid = GetGUID(varMap, varPlayer)
	local resPos = varIndex + 1

	--check pos
	if x800200_IsPosValid(resPos) ~= 1 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: crop kick player, bad res pos! guid=%X, pos=%d", guid, varIndex))
		return 0, ""
	end
	
	local targetGUID, targetWorld = GetTargetGarden(varMap, varPlayer)
	if targetGUID ~= guid then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: crop kick player, not self garden. guid=%X, targetGUID=%X" ,guid, targetGUID))
		return 0, ""
	end

	--check garden
	local gID, gLv, gViewGroup = GetGardenInfo(varMap, guid, targetWorld)
	if gID < 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: crop kick player, no garden exist! guid=%X",guid))
		return 0, ""
	end
	
	local resType = x800200_GetResTypeByPos(resPos)
	if resType ~= x800200_var_Define.plant then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: crop kick player, bad res type guid=%X",guid))
		return 0, ""
	end
	--check Block is empty state
	local varRet, resID, resNum, resState, resLv, resTime = GetGardenRes(varMap, targetWorld, guid, resType, varIndex)
	if varRet < 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: crop kick player, no garden exist! guid=%X",guid))
		return 0, ""
	end
	if resState ~= x800200_var_Define.state.empty then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: crop kick player, bad res state! guid=%X, pos=%d, state=%d", guid, resPos, resState))
		return 0, ""
	end

	
	--check resID
	local nRet, nGrowModel, nMatureModel, nSeedID, nSeedNum, nSeedLv, nBlockLv, nConsumeTimes, nMatureTime = GetGardenResCfg(varResID)
	if nRet < 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: crop kick player, bad res id! guid=%X, res=%d", guid, varResID))
		return 0, ""
	end
	
	--check player level
	local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < nSeedLv then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: crop kick player, limit level: guid=%X, res=%d, Selflevel=%d,SeedLv=%d",guid, varResID, varLevel, nSeedLv))
		return 0, ""
	end
	
	--check seed
	if HaveItemInBag(varMap, varPlayer, nSeedID) < nSeedNum then
		varTip = "#Y您的#G#{_ITEM"..nSeedID.."}#Y不足#G" .. nSeedNum .. "#Y个，" .. varTip
		
		--send fial msg
		local msg = x800200_var_Define.msg.update
		local curDayCount = x800200_GetCurCropCount(varMap, varPlayer, resType, varIndex)
		local maxDayCount = x800200_GetMaxCropCount(varMap, varPlayer, resType, varIndex)
		SendGardenRes(targetGUID, msg, resType, varIndex, x800200_var_Define.err.crop_no_item, curDayCount, maxDayCount)	
		return 0, varTip
	end
	
	--check block level
	if nBlockLv > resLv then
		--return 0,  "土地等级不足" .. resLv .. "级，无法种植"
	end
	
	--check and reset day count
	x800200_CheckRestDayCount(varMap, varPlayer)
	local curDayCount = x800200_GetCurCropCount(varMap, varPlayer, resType, varIndex)
	local maxDayCount = x800200_GetMaxCropCount(varMap, varPlayer, resType, varIndex)
	
	if curDayCount > maxDayCount - nConsumeTimes then
		--@todo
		--x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden warning: max crop times: guid=%X, index=%d",guid, varIndex))
		return 0, "#Y这块土地今天种植次数已达上限 #G" .. maxDayCount .. "#Y 次"
	end
	
	

	--check money
	
	--clear befor settings
	--x800200_ClearObj(varMap, resPos, resType, gViewGroup)
	
	--settings
	varRet = GardenResCrop(targetWorld, guid, varIndex, varResID, nMatureTime)
	if varRet ~= 1  then
		WriteLog(1, format("garden error: crop error,guid=%X,varIndex=%d, varResID=%d, nMatureTime=%d",guid, varIndex, varResID, nMatureTime))
		return 0, varTip
	end

	--del seed
	if DelItemByIDInBag(varMap, varPlayer, nSeedID, nSeedNum) < 0 then
		resState = x800200_var_Define.state.empty --crop
		WriteLog(1, format("garden error: crop error, del seed: guid=%X,SeedID=%d,SeedNum=%d", guid, nSeedID, nSeedNum))
		return 0, ""
	end
	
	--save crop count
	x800200_AddCropCount(varMap, varPlayer, resType, varIndex, nConsumeTimes)
	
	--update scene
	
	WriteLog(1, format("garden crop :guid:%d, type:%d, pos:%d, id=%d", guid, resType, resPos, varResID))	
	GamePlayScriptLog(varMap, varPlayer, 3799)
	
	return 1
end

------------------------------------------------------
--买
------------------------------------------------------
function x800200_BuyDispose(varMap, varPlayer, msgType, varType, varTool, varNum)
	local varRet = 0
	local varTip = "购买失败"
	local guid = GetGUID(varMap, varPlayer)
	
	
	--todo现在只有植物
	varType = x800200_var_Define.plant	
	local gID, gLv, gViewGroup = GetGardenInfo(varMap, varPlayer)
	if gID < 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("Garden: bue kick player, No Garden!!: guid=%X" ,guid))
		return 0, ""
	end	
	
	return 1
end

------------------------------------------------------
--加速
------------------------------------------------------
function x800200_SpeedUpDispose(varMap, varPlayer, msgType, varIndex, varToolIndex)
	local varRet = 0
	local varTip = "无法加速"
	local guid = GetGUID(varMap, varPlayer)
	local resPos = varIndex+1	
	
	--check pos
	if x800200_IsPosValid(resPos) ~= 1 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: speedup kick player, bad pos! guid=%X,index:%d", guid, varIndex))
		return 0, ""
	end
	
	local targetGUID, targetWorld = GetTargetGarden(varMap, varPlayer)
	if targetGUID ~= guid then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: speedup kick player, not self garden. guid=%X, targetGUID=%X" ,guid, targetGUID))
		return 0, ""
	end
	
	--check garden
	local gID, gLv, gViewGroup = GetGardenInfo(varMap, guid, targetWorld)
	if gID < 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: speedup kick player, garden not exist! guid=%X", guid))
		return 0, ""
	end

	local resType = x800200_GetResTypeByPos(resPos)
	--check Block is crop state
	local varRet, resID, resNum, resState, resLv, resTime = GetGardenRes(varMap, targetWorld, guid, resType, varIndex) --resID is invalid
	if varRet < 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: speedup kick player, garden res not exist! guid=%X", guid))
		return 0, ""
	end
	
	if resState ~= x800200_var_Define.state.crop then
		--x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden error: speedup error, bad res state!: guid=%X, index=%d",guid, varIndex))
		if resType == x800200_var_Define.plant then
			return 0, "您的作物已经成熟，不需要加速了"
		elseif	resType == x800200_var_Define.mine then
			return 0, "您的矿物已经可以开采，不需要加速了"
		end
	end
	
	local varTool = x800200_GetSpeedUpTool(resType, varToolIndex)
	if varTool <= 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: speedup kick player, bad speed tool ID, guid=%X, ToolIndex=%d",guid,varToolIndex))
		return 0, ""
	end
	
	--is tool legal
	local useToolFlag = 0 --检查道具开关
	local usetMoneyFlag = 1 --检查现金开关
	
	local nToolNum = 1
	local nSpeedTime, nSpeedMoney = x800200_GetSpeedUpTime(varTool, resType)
	
	if useTool == 1 then
		if nSpeedTime <= 0 then
			x800200_KickPlayer(varMap, varPlayer)
			WriteLog(1, format("garden kick: speedup kick player, bad speed tool! guid=%X, tool=%d",guid,varTool))
			return 0, ""
		end
		
		--check tool
		if HaveItemInBag(varMap, varPlayer, varTool) < nToolNum then
			varTip = "#Y您的#G#{_ITEM"..varTool.."}#Y不足#G" .. nToolNum .. "#Y个，" .. varTip
			return 0, varTip
		end		
	end
	
	if usetMoneyFlag == 1 then
		if GetMoney(varMap, varPlayer, 2) < nSpeedMoney then
			varTip = format("您的现金不足")		
			return 0, varTip	
		end
	end
	--settings
	varRet = GardenResTimeReduce(varMap, targetWorld, guid, varIndex, nSpeedTime, 1)
	if varRet ~= 1 then
		WriteLog(1, format("garden error: speedup error, set res time error! guid=%X, nSpeedTime=%d, tool=%d", guid, nSpeedTime, varTool))
		return 0, varTip
	end


	--cost money
	if usetMoneyFlag == 1 then
			if CostMoney( varMap, varPlayer, 2, nSpeedMoney ) ~= 1 then
          varTip = "您的现金不足"
	        return 0, varTip
	    end
	end

	
	--del seed
	if useToolFlag == 1 then
		if DelItemByIDInBag(varMap, varPlayer, varTool, nToolNum) < 0 then
			x800200_KickPlayer(varMap, varPlayer)
			WriteLog(1, format("garden kick: speedup kick player, del item error! guid=%X,tool=%d",guid,varTool))
			return 0, ""
		end
	end

	--send msg to client
	local msg = x800200_var_Define.msg.speedup
	local curDayCount = x800200_GetCurCropCount(varMap, varPlayer, resType, varIndex)
	local maxDayCount = x800200_GetMaxCropCount(varMap, varPlayer, resType, varIndex)
	SendGardenRes(targetGUID, msg, resType, varIndex,x800200_var_Define.err.ok, curDayCount, maxDayCount)
	--Msg2Player(varMap, varPlayer, "加速挖掘成功!", 8, 3)
	--Msg2Player(varMap, varPlayer, "加速成功!", 8, 3)
	WriteLog(1, format("garden speedup ok: guid:%d, type:%d, pos:%d, tool=%d, toolNum=%d", guid, resType, resPos, varTool, nToolNum))
	

	return 1
end
------------------------------------------------------
--采
------------------------------------------------------
function x800200_PickDispose(varMap, varPlayer, varIndex, varSubIndex)

	local resPos = varIndex + 1
	local subResPos = varSubIndex + 1

	local nLevel = GetLevel(varMap, varPlayer)
	if nLevel < 75 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: pick kick player, limit level guid=%X,level=%d", guid, nLevel))
		return 0, ""
	end

	--check pos
	if x800200_IsPosValid(resPos) ~= 1 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: pick kick player, bad pos! guid=%X,resPos:%d", guid, resPos))
		return 0, ""
	end
	
	--check type 
	local resType = x800200_GetResTypeByPos(resPos)
	if resType ~= x800200_var_Define.mine then
		return 0, ""
	end
	
	--检查背包
	if GetBagSpace(varMap, varPlayer) <= 2 then
		Msg2Player(varMap, varPlayer, "背包剩余空间不足！", 8, 3)
		return 1
	end
	
	local guid = GetGUID(varMap, varPlayer)
	local targetGUID, targetWorld = GetTargetGarden(varMap, varPlayer)
	if targetGUID ~= guid then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: pick kick player, not self garden. guid=%X, targetGUID=%X" ,guid, targetGUID))
		return 0, ""
	end
	
	--check garden
	local gID, gLv, gViewGroup = GetGardenInfo(varMap, guid, targetWorld)
	if gID < 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: speedup kick player, garden not exist! guid=%X", guid))
		return 0, ""
	end

	--check Block state
	local varRet, resID, resNum, resState, resLv, resTime, validSubNum = GetGardenRes(varMap, targetWorld, guid, resType, varIndex) --resID is invalid
	if varRet < 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: pick kick player, garden res not exist! guid=%X", guid))
		return 0, ""
	end
	
	--check state
	if resState ~= x800200_var_Define.state.crop and  resState ~= x800200_var_Define.state.mature then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: pick kick player, garden res state error! guid=%X, resState=%d", guid, resState))
		return 0, ""
	end
		
	--check day
	--check and reset day count
	x800200_CheckRestDayCount(varMap, varPlayer)
	local curDayCount = x800200_GetCurCropCount(varMap, varPlayer, resType, varIndex)
	local maxDayCount = x800200_GetMaxCropCount(varMap, varPlayer, resType, varIndex)
	WriteLog(1, format("garden pick check day: guid:%X, resNum:%d, validSubNum=%d, curDayCount=%d, maxDayCount=%d", 
									guid, resNum, validSubNum, curDayCount, maxDayCount))
	if resState == x800200_var_Define.state.mature then --第一次采		
		if curDayCount >= maxDayCount then
			WriteLog(1, format("garden pick warning: max pick times: guid=%X, index=%d",guid, varIndex))
			return 0, "#Y矿洞的开采次数已达上限 #G" .. maxDayCount .. "#Y 次，等待再生，无法开采。"
		end
	else
		if curDayCount > maxDayCount then
			WriteLog(1, format("garden pick warning: max pick times: guid=%X, index=%d",guid, varIndex))
			return 0, "#Y矿洞的开采次数已达上限 #G" .. maxDayCount .. "#Y 次，等待再生，无法开采。"
		end
	end

	--check number
	if subResPos > resNum then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: pick kick player, garden res sub pos error! guid=%X, resPos=%d, subResPos=%d", guid ,resPos, subResPos))
		return 0, ""
	end
		
	--
	local nOutItem = -1
	local nItemNum = 0
	local nBoxPercent = 0
	if subResPos == 0 then --全部采集
		if validSubNum == 0 then
			WriteLog(1, format("garden warning: pick no valid sub res! guid=%X, resPos=%d, resState=%d, resID=%d", guid ,resPos,resState,resID))
			return 0, "#Y您已经没有矿可以开采了。"
		end
		
		local nItemAllList = {}
		local nItemAllNum = {}
		local nItemAllIndex = 1
		for nIndex = 1, resNum do
			local nSubState = GetGardenSubRes(varMap, targetWorld, targetGUID, resType, varIndex, nIndex-1)
			if nSubState == 0 then--只采集正常状态
				local nGetBox = 0
				nItemAllList[nItemAllIndex], nItemAllNum[nItemAllIndex], nGetBox = x800200_SubResPicked(varMap, varPlayer, targetWorld, targetGUID, varIndex, nIndex-1, resType, gLv, resID, 1)
				nItemAllIndex = nItemAllIndex + 1
				if nGetBox > 0 then
					nItemAllList[nItemAllIndex] = -1 --箱子的ID默认使用-1
					nItemAllNum[nItemAllIndex] = nGetBox
					nItemAllIndex = nItemAllIndex + 1
				end
				
			end			
		end

		if nItemAllIndex == 2 then
			SendGardenBoxAward(varMap, varPlayer, nItemAllList[1], nItemAllNum[1])
		elseif nItemAllIndex == 3 then
			SendGardenBoxAward(varMap, varPlayer, nItemAllList[1], nItemAllNum[1], nItemAllList[2], nItemAllNum[2])
		elseif nItemAllIndex == 4 then
			SendGardenBoxAward(varMap, varPlayer, nItemAllList[1], nItemAllNum[1], nItemAllList[2], nItemAllNum[2], nItemAllList[3], nItemAllNum[3])
		elseif nItemAllIndex == 5 then
			SendGardenBoxAward(varMap, varPlayer, nItemAllList[1], nItemAllNum[1], nItemAllList[2], nItemAllNum[2], nItemAllList[3], nItemAllNum[3], nItemAllList[4], nItemAllNum[4])
		elseif nItemAllIndex == 6 then
			SendGardenBoxAward(varMap, varPlayer, nItemAllList[1], nItemAllNum[1], nItemAllList[2], nItemAllNum[2], nItemAllList[3], nItemAllNum[3], nItemAllList[4], nItemAllNum[4], nItemAllList[5], nItemAllNum[5])
		elseif nItemAllIndex == 7 then
			SendGardenBoxAward(varMap, varPlayer, nItemAllList[1], nItemAllNum[1], nItemAllList[2], nItemAllNum[2], nItemAllList[3], nItemAllNum[3], nItemAllList[4], nItemAllNum[4], nItemAllList[5], nItemAllNum[5], nItemAllList[6], nItemAllNum[6])
		elseif nItemAllIndex == 8 then
			SendGardenBoxAward(varMap, varPlayer, nItemAllList[1], nItemAllNum[1], nItemAllList[2], nItemAllNum[2], nItemAllList[3], nItemAllNum[3], nItemAllList[4], nItemAllNum[4], nItemAllList[5], nItemAllNum[5], nItemAllList[6], nItemAllNum[6], nItemAllList[7], nItemAllNum[7])
		elseif nItemAllIndex == 9 then
			SendGardenBoxAward(varMap, varPlayer, nItemAllList[1], nItemAllNum[1], nItemAllList[2], nItemAllNum[2], nItemAllList[3], nItemAllNum[3], nItemAllList[4], nItemAllNum[4], nItemAllList[5], nItemAllNum[5], nItemAllList[6], nItemAllNum[6], nItemAllList[7], nItemAllNum[7], nItemAllList[8], nItemAllNum[8])
		end
			
		--发送资源信息
		local msg = x800200_var_Define.msg.update
		local curDayCount = x800200_GetCurCropCount(varMap, varPlayer, resType, varIndex)
		local maxDayCount = x800200_GetMaxCropCount(varMap, varPlayer, resType, varIndex)
		SendGardenRes(guid, msg, resType, varIndex, x800200_var_Define.err.ok, curDayCount, maxDayCount)
	else --只采集其中一个
		local nSubState = GetGardenSubRes(varMap, targetWorld, targetGUID, resType, varIndex, varSubIndex)
		if nSubState == -1 then--不正常状态
			x800200_KickPlayer(varMap, varPlayer)
			WriteLog(1, format("garden kick: pick kick player, garden res sub pos state error! guid=%X, resPos=%d, subResPos=%d, resID=%d", guid ,resPos, subResPos, resID))
			return 0, ""
		end			
			
		x800200_SubResPicked(varMap, varPlayer, targetWorld, targetGUID, varIndex, varSubIndex, resType, gLv ,resID)
	end
	
	if resState == x800200_var_Define.state.mature then --第一次采
		--全部采集次数加1
		x800200_AddCropCount(varMap, varPlayer, resType, varIndex, 1)
		
		--开始CD
		local nMatureTime, nOutItem, nItemNum, nBoxPercent = GetGardenResOutPutCfg(resID, resType, gLv)
		if nMatureTime <= 0 then
			WriteLog(1, format("garden error: garden pick get mature time error,guid=%X,varIndex=%d, varResID=%d, nMatureTime=%d",guid, varIndex, resID, nMatureTime))
			nMatureTime = x800200_GetDefaultMineTime(varIndex)
		end
		
		varRet = GardenResCrop(targetWorld, guid, varIndex, resID, nMatureTime)
		if varRet ~= 1  then
			WriteLog(1, format("garden error: garden pick mine crop error,guid=%X,varIndex=%d, varResID=%d, nMatureTime=%d",guid, varIndex, resID, nMatureTime))
		end
		--crop回来会自动更新资源
	end
		
	WriteLog(1, format("garden pick ok: guid:%X, type:%d, pos:%d, subResPos=%d, resState=%d, resID=%d", guid, resType, resPos, subResPos, resState, resID))
	return 1
end
------------------------------------------------------
-- 子资源采集后事件 
------------------------------------------------------
function x800200_SubResPicked(varMap, varPlayer, varWorld, varGUID, varIndex, varSubIndex, varType, varGardenLv, varResID, varPickAll)
	GardenResRecycle(varMap, varWorld, varGUID, varIndex, varSubIndex)
	local nMatureTime, nOutItem, nItemNum, nBoxPercent = GetGardenResOutPutCfg(varResID, x800200_var_Define.mine, varGardenLv)

	--得到一次
	local nGetBox = 0
	local nRandomBox = random(0, 100)
	if nRandomBox < nBoxPercent then--add box num				
		local curMD = MD_GARDEN_COUNT_AWARD_BOX
		local nRemGiftTimes = GetPlayerGameData(varMap, varPlayer, curMD[1], curMD[2], curMD[3])
		if nRemGiftTimes < 0 then 
			nRemGiftTimes = 0 
		end

		nRemGiftTimes = nRemGiftTimes + 1	
		if nRemGiftTimes <= 15 then
			SetPlayerGameData(varMap, varPlayer, curMD[1], curMD[2], curMD[3], nRemGiftTimes)	
			if varPickAll ~= 1 then
				SendGardenSubRes(varMap, varGUID, varWorld, varIndex, varSubIndex, 1, 0, nRemGiftTimes)
			end
			Msg2Player(varMap, varPlayer, "意外发现了一个深埋于地下的宝箱！", 8, 3)
			nGetBox = 1			
		else
			Msg2Player(varMap, varPlayer, "宝箱数量已达上限", 8, 3)
			nGetBox = 0		
		end
	end
	
	if nOutItem > 0 and nItemNum > 0 then
		--give item
		StartItemTask(varMap)
		ItemAppendBind(varMap, nOutItem, nItemNum)			
		local ret = StopItemTask(varMap,varPlayer)
		if ret <= 0 then
			WriteLog(1, format("garden: add pick result error! guid:%X,id:%d,num:%d",varGUID, nOutItem, nItemNum));
			Msg2Player(varMap, varPlayer, "#Y您的背包已满，未能获得#G#{_ITEM" .. nOutItem .. "}", 8, 3)
			return
		end
		DeliverItemListSendToPlayer(varMap, varPlayer)
		local varStr = "#Y您获得了：#G#{_ITEM".. nOutItem .."}" .. nItemNum .. "#Y个！"
		Msg2Player(varMap, varPlayer, varStr, 8, 3)	
		WriteLog(1, format("garden: give exoutput to player. guid:%X,out:%d,num:%d", varGUID, nOutItem, nItemNum))
		if varPickAll ~= 1 then
			SendGardenSubRes(varMap, varGUID, varWorld, varIndex, varSubIndex, 0, nOutItem, nItemNum)
		end
	end

	return nOutItem, nItemNum, nGetBox
		
end
------------------------------------------------------
--领取奖励
------------------------------------------------------
function x800200_GetMineGift(varMap, varPlayer)
	
	
	local guid = GetGUID(varMap, varPlayer)
	local nWorldID = GetWorldIdEx()
	local curMD = MD_GARDEN_COUNT_AWARD_BOX
	local nRemGiftTimes = GetPlayerGameData(varMap, varPlayer, curMD[1], curMD[2], curMD[3])
	if nRemGiftTimes <= 0 then	
		return 0
	end
	
	--检查背包
	if GetBagSpace(varMap, varPlayer) <= 2 then
		Msg2Player(varMap, varPlayer, "背包已满，请整理您的背包", 8, 3)
		return 1
	end

	OpenRndomBox ( varMap, varPlayer,-1, 2, 6, 3, 2, 4, 6, 5, 2, 6, 4)
	nRemGiftTimes = nRemGiftTimes - 1
	SetPlayerGameData(varMap, varPlayer, curMD[1], curMD[2], curMD[3], nRemGiftTimes)	
	SendGardenSubRes(varMap, guid, nWorldID, 0, 0, 2, 0, nRemGiftTimes) --用0，0资源发过去
	Msg2Player(varMap, varPlayer, "#Y您打开了宝箱！", 8, 3)
	return 1
end
-------------------------------------------------------
-- 创建守护
-------------------------------------------------------
function x800200_CreateAngel(varMap, varPlayer, index)
	local varRet = 1
	local varTipDefault = "发生错误"
	local varTip = ""
	
	local checkerRet, checkerTip = x800200_CreateAngelChecker(varMap, varPlayer, index)
	if checkerRet ~= 1 then
		varRet = 0
		varTip = checkerTip
	end
	
	--扣东西
	if varRet == 1 then
		varRet = x800200_CreateAngelDispose(varMap, varPlayer, index)
	end
 
	--创建
	if varRet == 1 then
		checkerRet = CreateGardenAngel(varMap, varPlayer, x800200_var_GardenAngel[index].id)
		if checkerRet ~= 1 then
			varRet = 0
			varTip = varTipDefault
			--不能在这里还道具
		end
	end
	
	WriteLog(1, varRet .. varTip)
	if varRet ~= 1 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, varTip)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	end
end

--创建守护兽检查
function x800200_CreateAngelChecker(varMap, varPlayer, index)
	local varRet = 1
	local varTipDefault = "无法创建守护兽"
	local varTip = ""
	local varChcker = x800200_var_GardenAngel[index]
	
	local guid = GetGUID(varMap, varPlayer)
	
	if varChcker == nil then
		WriteLog(1, format("err! x800200_CreateAngelChecker index is nil, GUID=%u, index=%d", guid, index))
		varRet = 0
		return varRet, varTip;
	end
	
	if varChcker.id == nil then
		return 0
	end
	
	--没有庄园(todo.只能进入庄园后判断)
	local gardenID = 1 --GetGarden(varMap, varPlayer)
	if gardenID < 0 then
		WriteLog(1, format("err! x800200_CreateAngelChecker no Garden, GUID=%u", guid))
		varRet = 0
		return varRet, varTip
	end
	
	--其它检查
	local checkerRet, checkerTip = x800200_CommonChecker(varMap, varPlayer, msgType)
	if checkerRet ~= 1 then
		varRet = 0
		varTip = format("%s,%s", checkerTip, varTipDefault)
		return varRet, varTip
	end	
	return varRet, varTip
end

--创建守护兽扣除
function x800200_CreateAngelDispose(varMap, varPlayer, index)
	local varDispose = x800200_var_GardenAngel[index]
	if varDispose == nil then
		return 0
	end
	
	if x800200_CommonDispose(varMap, varPlayer,  varDispose) <= 0 then
		return 0
	end	
	return 1
end

--------------------------------------------------------------------------- common function
-----------------------------------------------
-- clear
-----------------------------------------------
function x800200_Clear(varMap, varWorld, varGUID, resPos, resType, objGroup)

	local varIndex = resPos-1
	local nRet, resID, resNum, resState, resLv, resTime = GetGardenRes(varMap, varWorld, varGUID, resType, varIndex)
	if nRet < 0 then
		return
	end
	
	local objType = -1
	if resState == x800200_var_Define.state.invalid then
			x800200_ClearObj(varMap, resPos, resType, objGroup)
	elseif resState == x800200_var_Define.state.empty then
			x800200_ClearObj(varMap, resPos, resType, objGroup)
	elseif resState == x800200_var_Define.state.crop then
			x800200_ClearObj(varMap, resPos, resType, objGroup)
	elseif resState == x800200_var_Define.state.mature then
			x800200_ClearGP(varMap, resPos, resType, objGroup)
	end
end

-----------------------------------------------
-- clear obj
-----------------------------------------------
function x800200_ClearObj(varMap, resPos, resType, objGroup)

	--update scene, delete old obj
	local objID = x800200_ObjList.plant[objGroup][resPos]
	if objID ~= nil and objID ~= -1 then
		DeleteMonster(varMap, objID)
		x800200_ObjList.plant[objGroup][resPos] = -1
		WriteLog(1, format("garden deleteobj : viewgroup=%d, index=%d, objID=%d", objGroup, resPos-1, objID))
	end
end
-----------------------------------------------
-- clear groppoint
-----------------------------------------------
function x800200_ClearGP(varMap, resPos, resType, objGroup)

	--update scene, delete old obj
	local objID = x800200_ObjList.plant[objGroup][resPos]
	if objID ~= nil and objID ~= -1 then
		--RecycleGrowPointByObjId(varMap, objID)
		ItemBoxExitScene(varMap, objID)
		x800200_ObjList.plant[objGroup][resPos] = -1
		WriteLog(1, format("garden deletegatherbox : viewgroup=%d, index=%d", objGroup, resPos-1))
	end
end
-----------------------------------------------
-- update obj
-----------------------------------------------
function x800200_UpdateObj(varMap, varWorld, varGUID, resPos, resType, objGroup)

	if resType == x800200_var_Define.mine then
		return
	end
	
	--get obj type by state
	resType = x800200_var_Define.plant --only plant
	local varIndex = resPos-1
	local nRet, resID, resNum, resState, resLv, resTime = GetGardenRes(varMap, varWorld, varGUID, resType, varIndex)
	if nRet < 0 then
		return
	end
	
	local objType = -1
	if resState == x800200_var_Define.state.invalid then
			objType = x800200_var_Define.point.plant.invalid
	elseif resState == x800200_var_Define.state.empty then
			objType = x800200_var_Define.point.plant.empty
	elseif resState == x800200_var_Define.state.crop then
			local nRet, nGrowModel, nMatureModel, nSeedID, nSeedNum, nSeedLv, nBlockLv, nConsumeTimes, nMatureTime = GetGardenResCfg(resID)
			objType = nGrowModel
	elseif resState == x800200_var_Define.state.mature then
			local nRet, nGrowModel, nMatureModel, nSeedID, nSeedNum, nSeedLv, nBlockLv, nConsumeTimes, nMatureTime = GetGardenResCfg(resID)
			objType = nMatureModel
	end

	--update scene, create new empty obj
	local posX = x800200_var_Define.pos.plant[resPos][1]
	local posZ = x800200_var_Define.pos.plant[resPos][2]
	local objID = -1
	if objType ~= nil and objType ~= -1 then
		if resState == x800200_var_Define.state.mature then
			objID = ItemBoxEnterScene(posX, posZ, objType, varMap, 0, resID, 3600000000, objGroup)
			--SetGrowPointObjID(varMap, objType, posX, posZ, objID)
			WriteLog(1, format("garden creategatherbox updateobj: guid=%X, viewgroup=%d, index=%d, objID=%d",varGUID, objGroup, varIndex, objID))
		else
			objID = CreateMonster( varMap, objType, posX, posZ, 3, -1, x800200_var_FileId, -1, 12, -1, 0, "", "", -1, objGroup)
			WriteLog(1, format("garden createmonster updateobj: guid=%X, viewgroup=%d, index=%d, objID=%d",varGUID, objGroup, varIndex, objID))
		end	
	end
	
	--save record
	if resType == x800200_var_Define.plant then
		x800200_ObjList.plant[objGroup][resPos] = objID
	else
		x800200_ObjList.mine[objGroup][resPos] = objID
	end
end

-----------------------------------------------
--检测钱数
-----------------------------------------------
function x800200_MoneyChecker(varMap, varPlayer, varCostMode, varCostNum)
	local varRet = 1
	local varTip = ""
	
	--优先使用现银现金
	local varCostName = ""
	local costType = 1
	if varCostMode == 0 or varCostMode == 1 then
		if GetMoney(varMap, varPlayer, 0) < varCostNum and GetMoney(varMap, varPlayer, 1) < varCostNum then
			varRet = 0
			varTip = format("您的银卡不足")			
		end
	elseif varCostMode == 2 or varCostMode == 3 then
		if GetMoney(varMap, varPlayer, 2) < varCostNum and GetMoney(varMap, varPlayer, 3) < varCostNum then
			varRet = 0
			varTip = format("您的现金或金卡不足")
		end
	end

	return varRet, varTip
end
-----------------------------------------------
--等级，道具，金钱检查
-----------------------------------------------
function x800200_CommonChecker(varMap, varPlayer, msgType)
	local varRet = 0
	local varTipDefault = ""
	local varTip = ""
	local varChecker

	if msgType == 0 then --创建
		varChecker = x800200_var_Need.NeedCreate
		varTipDefault = "无法创建"
	elseif msgType == 1 then 	--进入
		varChecker = x800200_var_Need.NeedEnter
		varTipDefault = "无法进入"
	elseif msgType == 2 then --查看事件
		return 0	
	elseif msgType == 3 then --请求庄园数据
		return 0
	elseif msgType == 4 then --开垦
		varChecker = x800200_var_Need.NeedAdd
		varTipDefault = ""
	elseif msgType == 5 then --升级
		return 0
	elseif msgType == 6 then --种植
		varChecker = x800200_var_Need.NeedCrop
		varTipDefault = "无法种植"
	elseif msgType == 7 then --购买
		varChecker = x800200_var_Need.NeedBuy
		varTipDefault = "无法加速"
	elseif msgType == 8 then --加速
		varChecker = x800200_var_Need.NeedSpeedUp
		varTipDefault = "无法加速"
	elseif msgType == 9 then --采摘
		varChecker = x800200_var_Need.NeedPick
		varTipDefault = "无法采摘"
	elseif msgType == 10 then --偷取
		return 0		
	end
	
	local varRet = 1
	local varTip = ""
	
	--level
	if varChecker.needLevel ~= nil then
		local varLevel = GetLevel(varMap, varPlayer);
		if varLevel < varChecker.needLevel then
			varRet = 0
			varTip = format("您的等级不足%d级", varChecker.needLevel)
			return varRet, varTip .. "！" .. varTipDefault
		end
	end
		
	--item
	if varChecker.needItems ~= nil then
		local varLackItem
		local bFind = 0
		
		for varI,item in varChecker.needItems do
			if HaveItemInBag(item) < 0 then --HaveItemInBag
				varLackItem = item
				bFind = 1
				break
			end
		end
		
		--need tool
		if bFind == 1 then
			varRet = 0
				varTip = format("#Y您没有#G#{_ITEM"..varLackItem.."}#Y")
			return varRet, varTip .. "," .. varTipDefault
		end
	end
	
	--money
	if varChecker.needMoney ~= nil then
		local varMoneyRet, varMoneyTip = x800200_MoneyChecker(varMap, varPlayer, varChecker.needMoney.costType, varChecker.needMoney.costNum)
		if varMoneyRet ~= 1 then
			varRet = 0
			varTip = varMoneyTip;
			return varRet, varTip .. "," .. varTipDefault
		end	
	end
		
	return varRet, varTip .. "," .. varTipDefault
end

-----------------------------------------------
-- 道具，金钱扣除
-----------------------------------------------
function x800200_CommonDispose(varMap, varPlayer, msgType)
	local varRet = 1
	local varDispose
	if msgType == 0 then --创建
		varDispose = x800200_var_Need.NeedCreate
	elseif msgType == 1 then 	--进入
		varDispose = x800200_var_Need.NeedEnter
	elseif msgType == 2 then --查看事件
		return 0	
	elseif msgType == 3 then --请求庄园数据
		return 0
	elseif msgType == 4 then --开垦
		varDispose = x800200_var_Need.NeedAdd
	elseif msgType == 5 then --升级
		return 0
	elseif msgType == 6 then --种植
		varDispose = x800200_var_Need.NeedCrop
	elseif msgType == 7 then --加速
		varDispose = x800200_var_Need.NeedBuy
	elseif msgType == 8 then --加速
		varDispose = x800200_var_Need.NeedSpeedUp
	elseif msgType == 9 then --采摘
		varDispose = x800200_var_Need.NeedPick
	elseif msgType == 10 then --偷取
		return 0		
	else 
		return 0
	end

	--item
	if varDispose.needItems ~= nil then
		for varI,item in varDispose.needItems do
			if DelItem(item) < 0 then --HaveItemInBag
				varRet = 0
				break
			end
		end
	end
	
	if varRet == 0 then
		return varRet
	end
	
	--money
	if varDispose.needMoney ~= nil then
		if CostMoney(sceneId, selfId, varDispose.needMoney.costType, varDispose.needMoney.costNum) < 1 then
			varRet = 0
		end
	end
		
	return varRet
end
---------------------------------------------------------
-- 提示
---------------------------------------------------------
function x800200_DoTips(varMap, varPlayer, varText)
		if varText == nil then
			return
		end
		
		StartTalkTask(varMap)
		TalkAppendString( varMap, varText )
		StopTalkTask( varMap )
		DeliverTalkTips( varMap, varPlayer )
end
---------------------------------------------------------------------------- GL return function
function x800200_GardenRetCommon(varMap, varPlayer, msgType, p0, p1, p2)
	local varRet = 0
	local varTip = ""

	 --创建
	if msgType == 0 then
		x800200_GardenRetCreate(varMap, varPlayer, p0, p1, p2)--ret
	--进入
	elseif msgType == 1 then 
		x800200_GardenRetEnter(varMap, varPlayer, p0, p1, p2) --mapid, ret
	end	

	return 1
end

--------------------------------------------------------------
-- 创建结果
--------------------------------------------------------------
function x800200_GardenRetCreate(varMap, varPlayer, errCode)
	if errCode ~= x800200_var_Define.err.ok then --发生错误
	end
	
	--切天，MD初始化
	x800200_CheckRestDayCount(varMap, varPlayer)
		
	local guid = GetGUID(varMap, varPlayer)
	WriteLog(1, format("garden create : guid=%X, ret=%d", guid, errCode))
	return 1
end
--------------------------------------------------------------
-- 直接进入
--------------------------------------------------------------
function x800200_EnterGarden(varMap, varPlayer, newSceneId, varReasion)
	local errCode = x800200_var_Define.err.ok
	x800200_GardenRetEnter(varMap, varPlayer, newSceneId, errCode, varReasion)
	return 1
end
--------------------------------------------------------------
-- 进入结果
--------------------------------------------------------------
function x800200_GardenRetEnter(varMap, varPlayer, newSceneId, errCode, varReason)
	if errCode ~= x800200_var_Define.err.ok then --发生错误	
		if errCode == x800200_var_Define.err.nogarden then
			Msg2Player(varMap, varPlayer, "您的好友还没有开通庄园", 8, 3)
		elseif  errCode == x800200_var_Define.err.full then
			if varReason == 0 then
				Msg2Player(varMap, varPlayer, "全服庄园已达上限，排队进入中，请稍后再试", 8, 3)
			elseif varReason == 1 then
				--副本的进入家园人满了，T王城
				x800200_KickPlayer(varMap, varPlayer)
				WriteLog(1, format("garden retenter: garden is full, fuben to dest map, guid=%X", guid))
			end
		end		
		return				
	else --成功后 在新场景创建npc，镜像什么的一堆
		--拉人
		local nPosX = 65
		local nPosY = 47
		if varReason == 0 then --普通进入时的坐标
			nPosX = 65
			nPosY = 47
		elseif varReason == 1 then --家园副本退出时，到npc位置 
			nPosX = 90
			nPosY = 84
		end
		x800200_RansToGarden(varMap, varPlayer, newSceneId, nPosX, nPosY)
	end
	
	--处理切天
	x800200_CheckRestDayCount(varMap, varPlayer)
	
	local guid = GetGUID(varMap, varPlayer)
	WriteLog(1, format("garden enter : guid=%X, ret=%d, curMap=%d, destMap=%d", guid, errCode, varMap, newSceneId))
	return 1
end
--------------------------------------------------------------
-- 资源更新
--------------------------------------------------------------
function x800200_GardenResUpdate(varMap, varWorld, varGUID, varIndex)
	local resPos = varIndex + 1
	local resType = x800200_GetResTypeByPos(resPos)
	if resType < 0 then
		return 0
	end	

	local gID, gLv, varViewGroup = GetGardenInfo(varMap, varGUID, varWorld)
	if gID < 0 then
		return 0
	end

	--clear
	local nRet, resID, resNum, resState, resLv, resTime = GetGardenRes(varMap, varWorld, varGUID, resType, varIndex)
	if nRet < 0 then
		return 0
	end
	
	local objType = -1
	if resState == x800200_var_Define.state.invalid then
			x800200_ClearObj(varMap, resPos, resType, varViewGroup)
	elseif resState == x800200_var_Define.state.empty then
			--x800200_ClearGP(varMap, resPos, resType, varViewGroup)
			x800200_ClearObj(varMap, resPos, resType, varViewGroup)
	elseif resState == x800200_var_Define.state.crop then
			x800200_ClearObj(varMap, resPos, resType, varViewGroup)
	elseif resState == x800200_var_Define.state.mature then
			x800200_ClearObj(varMap, resPos, resType, varViewGroup)
	end

	x800200_UpdateObj(varMap, varWorld, varGUID, resPos, resType, varViewGroup)
	
	--if player online,send res fresh
	local varPlayer =  Guid2ObjId(varMap, varGUID)
	if varPlayer > 0 then 
		local msg = x800200_var_Define.msg.update
		local curDayCount = x800200_GetCurCropCount(varMap, varPlayer, resType, varIndex)
		local maxDayCount = x800200_GetMaxCropCount(varMap, varPlayer, resType, varIndex)
		SendGardenRes(varGUID, msg, resType, varIndex, x800200_var_Define.err.ok, curDayCount, maxDayCount)
	end
end
--------------------------------------------------------------
-- 怪物更新
--------------------------------------------------------------
function x800200_GardenMonsterUpdate(varMap, varWorld, varGUID, varIndex, msgType)

	local nMonsterIndex = varIndex + 1
	local varID, varLv, varViewGroup = GetGardenInfo(varMap, varGUID, varWorld)
	if varID < 0 then
		return
	end
	
	if x800200_ObjList.monster[varViewGroup] == nil then
		return	
	end
	
	local nMaxPos = getn(x800200_var_Define.pos.monster.timer)
	if nMaxPos < 1 then
		return
	end
	
	if msgType == 0 then --clear
		local objID = x800200_ObjList.monster[varViewGroup][nMonsterIndex]
		if objID == nil or objID < 0 then
				return
		end
		
		DeleteMonster( varMap, objID)
		x800200_ObjList.monster[varViewGroup][nMonsterIndex] = -1
		SendGardenMonster(varMap, varGUID, varWorld, varIndex)
		WriteLog(1, format("garden deletemonster : guid=%X, viewgroup=%d, index=%d,objID=%d",varGUID, varViewGroup, varIndex, objID))

		local existMonster = 0
		for nIndex = 1, x800200_var_Define.def_max_monster do	
			if x800200_ObjList.monster[varViewGroup][nIndex] > 0 then
				existMonster = 1 
				break
			end
		end
		
		--all monster have recycled
		if existMonster <= 0 then
			Msg2Garden(varMap, varWorld, varGUID, "入侵者撤退了，庄园恢复了安宁", 5, 5)	
		end	
	elseif msgType == 1 then --create
		local nMonsterID, nClearTime = GetGardenMonster(varMap, varWorld, varGUID, varIndex)
		if nMonsterID > 0 then

			local nMonsterPos = random(1, nMaxPos)
			local xPos = x800200_var_Define.pos.monster.timer[nMonsterPos][1]
			local zPos = x800200_var_Define.pos.monster.timer[nMonsterPos][2]
			local nBaseAI, nAIScript = GetMonsterExtAttr(nMonsterID)
			if nBaseAI >= 0 then
				local objID = CreateMonster(varMap, nMonsterID, xPos, zPos, nBaseAI, nAIScript, x800200_var_FileId, -1, 21,-1,0, "","", -1, varViewGroup)
				x800200_ObjList.monster[varViewGroup][nMonsterIndex] = objID
				SendGardenMonster(varMap, varGUID, varWorld, varIndex)
				
				WriteLog(1, format("garden createmonster system: guid=%X, viewgroup=%d, index=%d, objID=%d",varGUID, varViewGroup, varIndex, objID))

			end
		end
	end
end

--------------------------------------------------------------
-- 其它操作结果
--------------------------------------------------------------
function x800200_GardenRetXXX(varMap, varPlayer, errCode)
	if errCode ~= x800200_var_Define.err.ok then --发生错误返还
		
		--WriteLog
	end
end

---------------------------------------------------------------------------- ServerCallFunction

function x800200_RansToGarden(varMap,varPlayer, newSceneId, posX, posZ )

	if varMap == newSceneId then	
		--mark.调用清理和进入的处理，由于处理逻辑一样，直接脚本调用这两个函数完成
		x800200_ProcPlayerLeave(varMap, varPlayer)
		x800200_ProcPlayerEnterFinished(varMap, varPlayer)
		
		SetPos( varMap , varPlayer , posX , posZ ) --SetPos
			
	else
		--if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,newSceneId) == 0 then
			--return
		--end
		
		--从非家园场景进入时，才设置，防止从家园进家园后记录成前一个家园
		if x800200_IsGardenMap(varMap) ~= 1 then
			local nCurX,nCurZ = GetWorldPos(varMap, varPlayer)
			SetPlayerBakSceneInfo(varMap, varPlayer, varMap, nCurX, nCurZ)
		end
		
		NewWorld( varMap , varPlayer , newSceneId , posX , posZ, 800200) --传送
	end
end


--------------------------------------------------------------------------------- ScriptSelfFunction
--数据初始化
------------------------------------------------
function x800200_OnMapInit(varMap)
	
end

function x800200_InitObjList(resGroup, targetGUID, targetWorld)	
	x800200_ObjList.plant[resGroup] = {}
	for pos = 1, x800200_var_Define.def_max_plant do
		x800200_ObjList.plant[resGroup][pos] = -1
	end
	
	x800200_ObjList.monster[resGroup] = {}
	for pos = 1, x800200_var_Define.def_max_monster do
		x800200_ObjList.monster[resGroup][pos] = -1
	end	
	
	x800200_ObjList.snid[resGroup] = targetGUID
	x800200_ObjList.worldID[resGroup] = targetWorld	
	

end

function x800200_ClearObjList(varMap, varWorld, varGUID, resGroup, resType)
	if resGroup == -1 then
		return
	end
	if resType ~= x800200_var_Define.plant then
		return
	end
	
	for resPos = 1, x800200_var_Define.def_max_plant do	
		local varIndex = resPos-1
		local nRet, resID, resNum, resState, resLv, resTime = GetGardenRes(varMap, varWorld, varGUID, resType, varIndex)
		if nRet > 0 then
			if resState == x800200_var_Define.state.invalid then
				-- monster del last
			elseif resState == x800200_var_Define.state.empty then
				-- monster del last
			elseif resState == x800200_var_Define.state.crop then
				-- monster del last
			elseif resState == x800200_var_Define.state.mature then
					local nRet, nGrowModel, nMatureModel, nSeedID, nSeedNum, nSeedLv, nBlockLv, nConsumeTimes, nMatureTime = GetGardenResCfg(resID)
					--clear befor setting
					x800200_ClearGP(varMap, resPos, resType, resGroup)
			end
		end
	end
	
	--all mirror obj
	DeleteViewGroupMonster(varMap, resGroup)
	
	--clear record
	x800200_ObjList.plant[resGroup] = {}
	x800200_ObjList.monster[resGroup] = {}
	x800200_ObjList.snid[resGroup] = -1
	x800200_ObjList.worldID[resGroup] = -1
end
-----------------------------------------------
-- 庄园数据刷新
-----------------------------------------------
function x800200_FreshGarden(varMap, varPlayer, gViewGroup)	

	local resType = x800200_var_Define.plant	
	local targetGUID, targetWorld = GetTargetGarden(varMap, varPlayer)
	x800200_InitObjList(gViewGroup, targetGUID, targetWorld)
	
	--创建模型
	for resPos = 1, x800200_var_Define.def_max_plant do	
		x800200_Clear(varMap, targetWorld, targetGUID, resPos, resType, gViewGroup)		
		x800200_UpdateObj(varMap, targetWorld, targetGUID, resPos, resType, gViewGroup)
	end	

	x800200_CreateGardenMonster(varMap, targetWorld, targetGUID,varPlayer, gViewGroup )
	local objNumAllGroup, objNumViewGroup = GetMonsterCount(varMap, gViewGroup)
	local objNumAll, objNumDefaultGroup = GetMonsterCount(varMap, -1)
	WriteLog(1, format("garden fresh OK : guid=%X, viewgroup=%d, allObjNum=%d, ViewGroupObjNum=%d, DefaultObjNum=%d", targetGUID, gViewGroup, objNumAllGroup, objNumViewGroup, objNumDefaultGroup))
end

----------------------------------------------------------------
-- 
----------------------------------------------------------------	
function 	x800200_ProcGpCreate(varMap,growPointType,varX,varY)
	return 1
end
----------------------------------------------------------------
-- 
----------------------------------------------------------------
function x800200_ProcGpOpen(varMap,varPlayer,varTalknpc)

	local guid = GetGUID(varMap, varPlayer)
	local targetGUID, targetWorld = GetTargetGarden(varMap, varPlayer)
	if guid ~= targetGUID then
		Msg2Player(varMap, varPlayer, "这是您好友庄园中种植的作物，请不要私自采摘！", 8, 3)	
		return 1 --失败
	end
	
	local gID, gLv, gViewGroup = GetGardenInfo(varMap, targetGUID, targetWorld)
	if gID < 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: gp kick, no garden! guid=%X", guid))
		return 1
	end

	--检查背包
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包剩余空间不足！", 8, 3)
		return 1
	end
	return 0	
end
-------------------------------------------------------------
-- 采集额外事件
-------------------------------------------------------------
function x800200_PickExEvent(varMap, varPlayer, resType, resPos, resID)

	--bag is full
	if GetBagSpace(varMap, varPlayer) <= 0 then
		return
	end
	
	--额外采集
	local nOutID, nOutNum, nExOutRandom =	GetGardenResOutPutCfg(resID, x800200_var_Define.plant)
	if nOutID <= 0 then
		return
	end
	
	--大于概率数，说明不在概率范围（一样概率）
	local nRandom = random(1, 100)
	if nRandom > nExOutRandom then
		return
	end
	
	local guid = GetGUID(varMap, varPlayer)
	--give item
	local nExOutNum = 1 --
	StartItemTask(varMap)
	ItemAppendBind(varMap, nOutID, nExOutNum)			
	local ret = StopItemTask(varMap,varPlayer)
	if ret <= 0 then
		WriteLog(1, format("garden: add exoutput error!! guid:%X,id:%d,num:%d",guid, nOutID, nExOutNum));
		Msg2Player(varMap, varPlayer, "#Y您的背包已满，未能获得#G" .. nExOutNum .. "#Y个意外获得的果实", 8, 3)
		return
	end

	DeliverItemListSendToPlayer(varMap, varPlayer)
	local varStr = "#Y地公送福！意外获得了：#G#{_ITEM"..nOutID.."}" .. nOutNum .. "#Y个！"
	Msg2Player(varMap, varPlayer, varStr, 8, 3)	
	WriteLog(1, format("garden: give exoutput to player. guid:%X,out:%d,num:%d", guid, nOutID, nExOutNum))	
	
	return
end

---------------------------------------------------------------
-- 采集成功，回收相关物品
---------------------------------------------------------------
function x800200_ProcGpRecycle( varMap, varPlayer, varTalknpc )	
	local guid = GetGUID(varMap, varPlayer)
	local targetGUID, targetWorld = GetTargetGarden(varMap, varPlayer)
	if targetGUID ~= guid then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("garden kick: gp kick, not self garden. guid=%X, targetGUID=%X" ,guid, targetGUID))
		return 0, ""
	end
	
	local gID, gLv, gViewGroup = GetGardenInfo(varMap, targetGUID, targetWorld)
	if gID < 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("Garde: gp kick, guid=%X", guid))
		return 0
	end

	--检查背包
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，请整理您的背包", 8, 3)
		return 0
	end
	
	local resType = x800200_var_Define.plant
	for pos = 1, x800200_var_Define.def_max_plant do	
		if x800200_ObjList.plant[gViewGroup][pos] == varTalknpc then

			local nRet, resID, resNum, resState, resLv, resTime = GetGardenRes(varMap, targetWorld, targetGUID, resType, pos-1)
			if resID < 0 or resState ~= x800200_var_Define.state.mature then
					x800200_KickPlayer(varMap, varPlayer)
					WriteLog(1, format("Garden: gp kick player, res state error!! guid=%X,resState:%d", guid, resState))
					return 0
			end
			
			--output
			local nOutID, nOutNum, nExOutRandom= GetGardenResOutPutCfg(resID, x800200_var_Define.plant)
			if nOutID <= 0 then
					x800200_KickPlayer(varMap, varPlayer)
					WriteLog(1, format("Garden: gp kick player, outID state error!! guid=%X,nOutID:%d", guid, nOutID))
					return 0	
			end
			
			--give item
			StartItemTask(varMap)
			ItemAppendBind(varMap, nOutID, nOutNum)			
			local ret = StopItemTask(varMap,varPlayer)
			if ret <= 0 then
				WriteLog(1, format("garden: add output error!! guid:%X,id:%d,num:%d",guid, nOutID, nOutNum));
				Msg2Player(varMap, varPlayer, "背包已满，请整理您的背包", 8, 3)
				return 0
			end

			DeliverItemListSendToPlayer(varMap, varPlayer)
			local varStr = "#Y您采集到：#G#{_ITEM"..nOutID.."}" .. nOutNum .. "#Y个"
			Msg2Player(varMap, varPlayer, varStr, 8, 3)	
			WriteLog(1, format("garden: give output to player. guid:%X,out:%d,num:%d", guid, nOutID, nOutNum))	

			--clear befor setting
			--自己回收
			x800200_ClearGP(varMap, pos, resType, gViewGroup)
			
			--setting
			GardenResRecycle(varMap, targetWorld, targetGUID, pos-1)

			--update scene and data
			x800200_UpdateObj(varMap, targetWorld, targetGUID, pos, resType, gViewGroup)
			
			--ex event			
			x800200_PickExEvent(varMap, varPlayer, resType, pos, resID)
			
			--monster event
			x800200_MonsterEvent(varMap, varPlayer, targetWorld, gViewGroup, pos)			
			
			--send message to clien
			local msg = x800200_var_Define.msg.pick
			local curDayCount = x800200_GetCurCropCount(varMap, varPlayer, resType, pos-1)
			local maxDayCount = x800200_GetMaxCropCount(varMap, varPlayer, resType, pos-1)
			SendGardenRes(targetGUID, msg, resType, pos-1, x800200_var_Define.err.ok, curDayCount, maxDayCount)	
		end
	end
	
	return 0 --自己回收
end
----------------------------------------------------------------
-- 
----------------------------------------------------------------
function	x800200_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	local guid = GetGUID(varMap, varPlayer)
	local targetGUID = GetTargetGarden(varMap, varPlayer)
	if guid ~= targetGUID then
		return 1 --失败
	end
	return 0
end
--------------------------------------------------------------
-- 家园回收
--------------------------------------------------------------
function x800200_GardenRecycle(varMap, varWorld, varGUID, varViewGroup)
	local resType = x800200_var_Define.plant
		x800200_ClearObjList(varMap,varWorld, varGUID, varViewGroup, resType)
end

--------------------------------------------------------------
-- 离开庄园
--------------------------------------------------------------
function x800200_ProcPlayerLeave(varMap, varPlayer)

	--设置默认镜像
	SetViewGroup(varMap,varPlayer,0)
	
	local guid = GetGUID(varMap, varPlayer)
	--必须减少数量
	local curCount = SetGardenEnterFlag(varMap, varPlayer, 0, guid);	
	
	
	local targetGUID, targetWorld = GetTargetGarden(varMap, varPlayer)

	--无此庄园
	local gID, gLv, gViewGroup = GetGardenInfo(varMap, targetGUID, targetWorld)
	if gID < 0 then
		WriteLog(1, format("Garden Leave Warning: Self Garden No Exist, guid=%X", guid))
		return
	end

	WriteLog(1, format("Garden Leave. GUID=%X, curCount=%d", guid, curCount))	
	
	--SetTargetGardenGUID(varMap, varPlayer)--还原目标家园为空(在进入其它图后处理)
end
--------------------------------------------------------------
-- 切图前
--------------------------------------------------------------
function x800200_ProcMapBeforChange(varMap, varPlayer, curMap, destMap)
	local guid = GetGUID(varMap, varPlayer)	
	SetViewGroup(varMap, varPlayer, 0)
	WriteLog(1, format("client request player garden leave, GUID:%u, curMap:%d, destMap:%d", guid, curMap, destMap))	
end
--------------------------------------------------------------
-- 进入庄园后
--------------------------------------------------------------
function x800200_ProcPlayerEnterFinished(varMap, varPlayer)
	
	--无此庄园
	local guid = GetGUID(varMap, varPlayer)
	local targetGUID, targetWorld = GetTargetGarden(varMap, varPlayer, 0) --得到目标家园

	if targetGUID < 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("Garden Enter kick: No Target Garden, guid=%X", guid))
		return
	end

	SetTargetGardenGUID(varMap, varPlayer, 0)--还原目标家园为空
	SetTargetGardenGUID(varMap, varPlayer, 1, targetGUID)--设置当前所在家园
	
	local gID, gLv, gViewGroup = GetGardenInfo(varMap, targetGUID, targetWorld)
	if gID < 0 then
		x800200_KickPlayer(varMap, varPlayer)
		WriteLog(1, format("Garden Enter kick: Target Garden No Exist, GUID=%X, TargetGUID=%X", guid, targetGUID))
		return
	end

	--
	if GetGardenFreshFlag(varMap, varPlayer) == 0 then
		x800200_FreshGarden(varMap, varPlayer, gViewGroup)
		SetGardenFreshFlag(varMap, varPlayer, 1)
	end

	SetViewGroup(varMap, varPlayer, gViewGroup)	
	
	--enter flag
	local curCount = SetGardenEnterFlag(varMap, varPlayer, 1, guid)
	WriteLog(1, format("Garden Enter Finish: GUID=%X, curCount=%d", guid, curCount))
	
	GamePlayScriptLog(varMap, varPlayer, 3798)
end

--------------------------------------------------------------
-- T人
--------------------------------------------------------------
function x800200_KickPlayer(varMap, varPlayer)

 SetViewGroup(varMap, varPlayer, 0)	

 -- 没有记录合适的地图，就传送到王城
  local varCountry = GetCurCountry(varMap,varPlayer)
  if varCountry == 0 then
      NewWorld(varMap, varPlayer, 50, 251, 116, x800200_var_FileId)
  elseif varCountry == 1 then
      NewWorld(varMap, varPlayer, 150, 251, 116, x800200_var_FileId)
  elseif varCountry == 2 then
      NewWorld(varMap, varPlayer, 250, 251, 116, x800200_var_FileId)
  elseif varCountry == 3 then
      NewWorld(varMap, varPlayer, 350, 251, 116, x800200_var_FileId)
  end
end

--------------------------------------------------------------- SysCall function
function x800200_GetCurCropCount(varMap, varPlayer, varType, varIndex)

	local defaultMaxCount = 0
	if varIndex < 0 or varIndex >= 18 then
		return defaultMaxCount
	end
	
	varIndex = varIndex + 1
	local curMD = x800200_GetCountMD(varType, varIndex)
	if curMD == nil then
		return defaultMaxCount
	end
	
	local dayCount = GetPlayerGameData(varMap, varPlayer, curMD[1], curMD[2], curMD[3])
	if dayCount < 0 then
		dayCount = 0
	end
	
	return dayCount	
end
----------------------------------------------------------------
-- 设置当前次数
----------------------------------------------------------------
function x800200_AddCropCount(varMap, varPlayer, varType, varIndex, varCount)

	varIndex = varIndex + 1
	local curMD = x800200_GetCountMD(varType, varIndex)
	if curMD == nil then
		return
	end
	
	local dayCount = GetPlayerGameData(varMap, varPlayer, curMD[1], curMD[2], curMD[3])
	if dayCount < 0 then
		dayCount = 0
	end
	
	dayCount = dayCount + varCount

	SetPlayerGameData(varMap, varPlayer, curMD[1], curMD[2], curMD[3], dayCount)
end
-------------------------------------------------------------
--最大次数
-------------------------------------------------------------
function x800200_GetMaxCropCount(varMap, varPlayer, varType, varIndex)

	local defaultMaxCount = 0
	if varIndex < 0 or varIndex >= 18 then
		return defaultMaxCount
	end
	local nLv, nCostType, nCostNum, nCropMaxNum =  GetGardenBlockCfg(varIndex)
	local peerVipValue = GetPeerVipBenefit(varMap, varPlayer, 6)
	if peerVipValue == nil then
		peerVipValue =0
	end
	nCropMaxNum = nCropMaxNum + peerVipValue
	
	return nCropMaxNum
end
-----------------------------------------------------------
-- 得到MD
-----------------------------------------------------------
function x800200_GetCountMD(resType, resPos)
	
	local curMD
	if resType == x800200_var_Define.plant then
		if resPos == 1 then
			curMD = MD_GARDEN_COUNT_1
		elseif resPos == 2 then
			curMD = MD_GARDEN_COUNT_2
		elseif resPos == 3 then
			curMD = MD_GARDEN_COUNT_3
		elseif resPos == 4 then
			curMD = MD_GARDEN_COUNT_4
		elseif resPos == 5 then
			curMD = MD_GARDEN_COUNT_5
		elseif resPos == 6 then
			curMD = MD_GARDEN_COUNT_6
		elseif resPos == 7 then
			curMD = MD_GARDEN_COUNT_7
		elseif resPos == 8 then
			curMD = MD_GARDEN_COUNT_8
		elseif resPos == 9 then
			curMD = MD_GARDEN_COUNT_9
		elseif resPos == 10 then
			curMD = MD_GARDEN_COUNT_10
		elseif resPos == 11 then
			curMD = MD_GARDEN_COUNT_11
		elseif resPos == 12 then
			curMD = MD_GARDEN_COUNT_12
		elseif resPos == 13 then
			curMD = MD_GARDEN_COUNT_13
		elseif resPos == 14 then
			curMD = MD_GARDEN_COUNT_14
		elseif resPos == 15 then
			curMD = MD_GARDEN_COUNT_15
		end
	elseif resType == x800200_var_Define.mine then
		if resPos == 16 then
			curMD = MD_GARDEN_COUNT_MINE_1
		elseif resPos == 17 then
			curMD = MD_GARDEN_COUNT_MINE_2
		elseif resPos == 18 then
			curMD = MD_GARDEN_COUNT_MINE_3
		end
	end
	return curMD
end
---------------------------------------------------------
-- 类型是否合法
--------------------------------------------------------
function x800200_GetResTypeByPos(resPos)
		local resType = -1
		if resPos <= 0 or resPos > 18 then
			resType = -1
		elseif resPos <= 15 then
			resType = x800200_var_Define.plant
		elseif resPos > 15 and resPos <= 18 then
			resType = x800200_var_Define.mine
		end
		return resType
end
-------------------------------------------------------
-- 位置是否合法
-------------------------------------------------------
function x800200_IsPosValid(resPos)
	local resType = x800200_GetResTypeByPos(resPos)
	if resType == -1 then
		return 0
	else
		return 1
	end
end
-------------------------------------------------------
-- 切天检查
-------------------------------------------------------
function x800200_CheckRestDayCount(varMap, varPlayer)
	local nDayNow = GetDayOfYear()
	local nDayRecord = GetPlayerGameData(varMap, varPlayer, MD_GARDEN_DAY[1], MD_GARDEN_DAY[2], MD_GARDEN_DAY[3]);
	if nDayNow ~= nDayRecord then 
		SetPlayerGameData(varMap, varPlayer, MD_GARDEN_DAY[1], MD_GARDEN_DAY[2], MD_GARDEN_DAY[3], nDayNow)	
		
		--初始化MD
		local resType = x800200_var_Define.plant
		for pos = 1, x800200_var_Define.def_max_plant do
			local curMD = x800200_GetCountMD(resType, pos)
			if curMD ~= nil then
				SetPlayerGameData(varMap, varPlayer, curMD[1], curMD[2], curMD[3], 0)
			end		
		end
		
		resType = x800200_var_Define.mine
		for pos = 16, 18 do	
			local curMD = x800200_GetCountMD(resType,pos)
			if curMD ~= nil then
				SetPlayerGameData(varMap, varPlayer, curMD[1], curMD[2], curMD[3], 0)
			end		
		end
	
	end	
end
-----------------------------------------------------
-- 加速道具to时间,金钱
-----------------------------------------------------
function x800200_GetSpeedUpTime(varTool, varType)
	local retMoney = 0
	local retTime = 0
	if varType == x800200_var_Define.plant then
		if varTool == 12271300 then
			retTime = 30 * 60
			retMoney = 2 * 1000
		elseif varTool == 12271301  then
			retTime = 2 * 60 * 60
			retMoney = 5 * 1000
		end
	elseif varType == x800200_var_Define.mine then
		if varTool == 12271300 then
			retTime = 15 * 60
			retMoney = 2 * 1000
		elseif varTool == 12271301  then
			retTime = 30 * 60
			retMoney = 3 * 1000
		end
	end
	
	return retTime, retMoney
end
-----------------------------------------------------
-- 加速类型toID
-----------------------------------------------------
function x800200_GetSpeedUpTool(resType, varIndex)
	if resType == x800200_var_Define.plant then
		if varIndex == 0 then
			return 12271300 
		elseif varIndex == 1 then
			return 12271301
		end
	elseif resType == x800200_var_Define.mine then
		if varIndex == 0 then
			return 12271300 
		elseif varIndex == 1 then
			return 12271301
		end
	end	
	return -1
end

----------------------------------------------------
-- 是否是家园场景
----------------------------------------------------
function x800200_IsGardenMap(varMap)
	if varMap < 600  or  varMap >= 650 then
		return 0
	end	
	return 1
end

----------------------------------------------------
-- 升级
----------------------------------------------------
function x800200_ProcPlayerLevelUp(varMap, varPlayer, varLevel)
	if varLevel == 30 then
		local guid = GetGUID(varMap, varPlayer)
		
		--达到30级创建家园，这里发送进入消息，第一次进入默认表示创建
		EnterGarden(varMap, varPlayer, guid);
	end
end

-------------------------------------------------------------
-- 怪物额外事件
-------------------------------------------------------------
function x800200_MonsterEvent(varMap, varPlayer, varWorld, varViewGroup, resPos)

	local guid = GetGUID(varMap, varPlayer)
	
	--是否出怪概率
	local nRandom = random(1, 100)
	if nRandom < 90 then
		return
	end
	
	--已经有怪
	local bExistMonster = 0
	for nIndex = 1, x800200_var_Define.def_max_monster do	
		local nMonsterID = GetGardenMonster(varMap,  varWorld, guid, nIndex - 1)

		if nMonsterID > 0 then
			bExistMonster = 1
			break
		end
	end	
	if bExistMonster ~= 0 then
		return
	end	
	
	--选择随机怪库
	local nSelectType = -1
	local	nMonsterID, nBaseAI, nAIScript, nDir, nMinMum, nMaxNum, nStayTime, nGatherProp, nTimerProp
	local totleRandom = 0	
	nRandom = random(1, 100)
	for nType = 1, x800200_var_Define.def_max_stock_cfg do
		nGatherProp, nTimerProp, nMonsterID, nBaseAI, nAIScript, nDir, nMinMum, nMaxNum, nStayTime = GetGardenMonsterCfg(nType-1, 0, 30) --根据第一个怪物取库的信息
		if nMonsterID > 0 then
			totleRandom = totleRandom + nGatherProp
			if totleRandom > nRandom then
				nSelectType = nType
				break
			end
		end
	end
	
	if nSelectType < 0 then
		return
	end
	
	local nMaxPos = getn(x800200_var_Define.pos.monster.gather[resPos])
	if nMaxPos < 1 then
		return
	end
	
	--取一个随机路径
	local pathNumMax = getn(x800200_var_Define.pos.monster.PatrolId[resPos])
	local readomPathIndex = random(1, pathNumMax)

	--创建怪	
	local nCreatedCount = 0
	local playerLv = GetLevel(varMap, varPlayer)	
	for nIndex = 1, x800200_var_Define.def_max_stockmonster_cfg do		--所有怪index
		--不大于最大数量
		if nCreatedCount >= x800200_var_Define.def_max_monster  then
				break
		end
			
		nGatherProp, nTimerProp, nMonsterID, nBaseAI, nAIScript, nDir, nMinMum, nMaxNum, nStayTime = GetGardenMonsterCfg(nSelectType-1, nIndex - 1, playerLv)
		if nMonsterID > 0 then			
			local nMonsterNum = random(nMinMum, nMaxNum)	--随机数量		
			local nClearTime = GetWorldCTime() + nStayTime
			
			
			for i = 1, nMonsterNum do		--怪的数量
				--不大于最大数量
				if nCreatedCount >= x800200_var_Define.def_max_monster  then
						break
				end

				local nRet = GardenMonsterAdd(varMap, varWorld, guid, nCreatedCount, nMonsterID, nClearTime)
				if nRet > 0 then
					nCreatedCount = nCreatedCount + 1		

					local nMonsterPos = random(1, nMaxPos)
					local xPos = x800200_var_Define.pos.monster.gather[resPos][nMonsterPos][1]
					local zPos = x800200_var_Define.pos.monster.gather[resPos][nMonsterPos][2]
					
					x800200_ObjList.monster[varViewGroup][nCreatedCount] = -1
					if GetGardenFreshFlag(varMap, varPlayer) ~= 0 then --如果家园有人才创建
						local objID = CreateMonster(varMap, nMonsterID, xPos, zPos, nBaseAI, nAIScript, x800200_var_FileId, -1, 21,-1,nDir, "","", -1, varViewGroup)
						x800200_ObjList.monster[varViewGroup][nCreatedCount] = objID
						SendGardenMonster(varMap, guid, varWorld, i-1)
						WriteLog(1, format("garden createmonster gather: guid=%X, viewgroup=%d, index=%d, objID=%d",guid, varViewGroup, i, objID))
						
						
						--大于2只怪物就使用巡逻路径
						if nMonsterNum >= 2 then
							if readomPathIndex > pathNumMax then
								readomPathIndex = 1
							end
	
							SetPatrolId(varMap, objID, x800200_var_Define.pos.monster.PatrolId[resPos][readomPathIndex])
							readomPathIndex = readomPathIndex + 1
						end
					end				
				end
			end
		end		
	end
		
		--提示包装
	if nSelectType == 1 or nSelectType == 2 or nSelectType == 3 then
		Msg2Player(varMap, varPlayer, "忽然几只蜘蛛从土中钻了出来！", 8, 3)
	elseif nSelectType == 4 or nSelectType ==5 or nSelectType == 6 then
		Msg2Player(varMap, varPlayer, "采集时惊动了地下深处沉睡的地魔！", 8, 3)
	end
end
----------------------------------------------------
-- 创建家园怪物
----------------------------------------------------
function x800200_CreateGardenMonster(varMap, varWorld, varSNID, varPlayer, varViewGroup)		
	--已经创建过
	if GetGardenFreshFlag(varMap, varPlayer) ~= 0 then
		return
	end
	
	local nMaxPos = getn(x800200_var_Define.pos.monster.timer)
	if nMaxPos < 1 then
		return
	end

	for i = 1, x800200_var_Define.def_max_monster do
		local nMonsterID, nClearTime = GetGardenMonster(varMap, varWorld, varSNID, i-1)
		if nMonsterID > 0 then
			local nMonsterPos = random(1, nMaxPos)
			local xPos = x800200_var_Define.pos.monster.timer[nMonsterPos][1]
			local zPos = x800200_var_Define.pos.monster.timer[nMonsterPos][2]
			local nBaseAI, nAIScript = GetMonsterExtAttr(nMonsterID)
			if nBaseAI >= 0 then
				local objID = CreateMonster(varMap, nMonsterID, xPos, zPos, nBaseAI, nAIScript, x800200_var_FileId, -1, 21,-1,0, "","", -1, varViewGroup)
				x800200_ObjList.monster[varViewGroup][i] = objID
				--SendGardenMonster(varMap, varSNID, varWorld, i-1) --客户端已有数据，不必通知
				WriteLog(1, format("garden createmonster entergarden: guid=%X, viewgroup=%d, index=%d, objID=%d",varSNID, varViewGroup, i, objID))
			end
		end
	end
end
----------------------------------------------------
-- 死亡事件
----------------------------------------------------
function x800200_ProcDie(varMap, varPlayer, varKiller)
	--DeleteMonster( varMap, varPlayer)
	local viewGroup = GetViewGroup(varMap, varPlayer)
	local snid = x800200_ObjList.snid[viewGroup]
	local worldID = x800200_ObjList.worldID[viewGroup]
	
	local gID, gLv, gViewGroup, gPlayerName = GetGardenInfo(varMap, snid, worldID)
	for pos = 1, x800200_var_Define.def_max_monster do
		
		if x800200_ObjList.monster[viewGroup][pos] == varPlayer then --如果是怪物死亡
			local liveNum = GardenMonsterRecycle(varMap, worldID, snid, pos-1)
			x800200_ObjList.monster[viewGroup][pos] = -1
			SendGardenMonster(varMap, snid, worldID, pos-1)
			WriteLog(1, format("garden deletemonster die: guid=%X, viewgroup=%d, index=%d,objID=%d",snid, viewGroup, pos-1, varPlayer))
			
			if liveNum > 0 then
				--通知客户端
				Msg2Garden(varMap, worldID, snid, "#Y剩余入侵者数量:#G" .. liveNum .. "#Y", 5, 7)
				if IsPlayerInGarden(varMap, worldID, snid) == 0 then
					LuaScenceM2Player( varMap,varKiller,"#Y您庄园内的入侵者被好友击杀,入侵者还有#G" .. liveNum .. "#Y只",gPlayerName,2, 1 )
					LuaScenceM2Player( varMap,varKiller,"#Y您庄园内的入侵者被好友击杀,入侵者还有#G" .. liveNum .. "#Y只",gPlayerName,3, 1 )
				end
				
			elseif liveNum == 0 then
				Msg2Garden(varMap, worldID, snid, "#Y剩余入侵者数量:#G" .. liveNum .. "#Y", 5, 7)
				Msg2Garden(varMap, worldID, snid, "顺利消灭了全部入侵者！",  5, 5)
				
				--领奖Flag
				local giftFlag = GetGardenGiftFlag(varMap, worldID, snid)
				if giftFlag == x800200_var_Define.award.timeropen then --只有定时刷怪才可领奖
					SetGardenGiftFlag(varMap, worldID, snid, x800200_var_Define.award.timerflag)	--设置领奖标记

					if IsPlayerInGarden(varMap, worldID, snid) == 1  then
						SendSystemPost(varMap, gPlayerName, "#Y经过奋勇战斗，庄园入侵者已经被击退，#G庄园看护员[李虎]#Y那里准备了一份慰劳的礼物，请及时前往领取。" )
					else	
						SendSystemPost(varMap, gPlayerName, "#Y您的好友帮您击退了庄园入侵者，您的庄园未遭到破坏！#G庄园看护员[李虎]#Y那里准备了一份慰劳的礼物，请及时前往领取。" )
					end
				end	

			elseif liveNum < 0 then
				--error
			end
		end
	end
end
--------------------------------------------------------
-- 得到默认的矿山资源ID
--------------------------------------------------------
function x800200_GetDefaultMineResID(resPos)
	local mineDefaultID = 0
	if resPos == 15 then
		mineDefaultID = 19000402
	elseif resPos == 16 then
		mineDefaultID = 19000403	
	elseif resPos == 17 then
		mineDefaultID = 19000404
	end
	return mineDefaultID;
end
---------------------------------------------------
-- 得到默认的矿山资源的时间
----------------------------------------------------
function x800200_GetDefaultMineTime(resPos)
	local mineDefaultTime = 3600
	if resPos == 15 then
		mineDefaultTime = 1800
	elseif resPos == 16 then
		mineDefaultTime = 2700	
	elseif resPos == 17 then
		mineDefaultTime = 3600
	end
	return mineDefaultTime;
end

---------------------------------------------------
-- 检查家园开箱子的次数
----------------------------------------------------
function x800200_GetGardenBoxTimes(varMap, varPlayer)
	local curMD = MD_GARDEN_COUNT_AWARD_BOX
	local nRemGiftTimes = GetPlayerGameData(varMap, varPlayer, curMD[1], curMD[2], curMD[3])
	if nRemGiftTimes < 0 then
		nRemGiftTimes = 0
	end
	return nRemGiftTimes
end

-----------------------------------------------------
-- 是不是在自己的家园(有其它脚本调用)
-----------------------------------------------------
function x800200_IsPlayerSelfGarden(varMap, varPlayer)
	local snid = GetGUID(varMap, varPlayer)
	local worldID = GetWorldIdEx()
	if IsPlayerInGarden(varMap, worldID, snid) == 1  then
		return 1
	end
	return 0
end
