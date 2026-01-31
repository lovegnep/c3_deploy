
x700193_CSP_FUBENTYPE				= 0
x700193_CSP_SCRIPTID				=	1
x700193_CSP_TICKCOUNT				= 2
x700193_CSP_FROMSCENEID			=	3
x700193_CSP_ISCLOSING				= 4
x700193_CSP_LEAVECOUNTDOWN	= 5
x700193_CSP_TEAMID					=	6
x700193_CSP_BACKSCENEX      = 7
x700193_CSP_BACKSCENEZ      = 8
x700193_CSP_FUBENLEVEL			=	9

x700193_CSP_AREA_ID					=	20
x700193_CSP_FUBEN_SCENE_ID	=	21
x700193_CSP_BOSS_ID					=	22
x700193_CSP_BOSS_FULL_HP		= 23
x700193_CSP_BOX_ID					=	24
x700193_CSP_BOSSFLAG				=	25

x700193_CSP_HUMAN_COUNT			=	240
x700193_CSP_OBJID_START			=	241
x700193_CSP_GUID_START      = 248  
x700193_CSP_FUBEN_TYPE			=	254	
x700193_CSP_FUBEN_MODE			= 255 

---------------------------------------------------------------
x700193_var_FileId 					= 700193
x700193_var_QuestId					= 6608
---------------------------------------------------------------
x700193_Define = {
								def_gatherbox_prop = 100, --箱子和BOSS的概率
								def_gatherbox_prop_next = 50, --采箱子后得到第二次机会的概率
								def_gatherbox_out = {     --采集宝箱的产出
																		{prop = 25 , item = 11000501, num = 2 }, --比例，产出，数量
																		{prop = 100, item = 11000544, num = 2 },
																		{prop = 25 , item = 11000800, num = 1 },
																		{prop = 25 , item = 11000902, num = 2 }, 
																		{prop = 25 , item = 11010001, num = 2 },
																		{prop = 20 , item = 11011241, num = 1 },
																		{prop = 25 , item = 11030620, num = 1 },
																		{prop = 50 , item = 11060002, num = 1 },
																		{prop = 25 , item = 11060003, num = 1 },
																		{prop = 25 , item = 11970018, num = 1 },
																		{prop = 25 , item = 11970023, num = 1 },
																		{prop = 50 , item = 11990011, num = 2 },
																		{prop = 60 , item = 11990018, num = 1 },
																		{prop = 60 , item = 11990114, num = 1 },
																		{prop = 60 , item = 11990115, num = 1 },
																		{prop = 100, item = 12010204, num = 10},
																		{prop = 50 , item = 12030013, num = 5 },
																		{prop = 25 , item = 12030058, num = 1 },
																		{prop = 25 , item = 12030059, num = 1 },
																		{prop = 50 , item = 12030258, num = 1 },
																		{prop = 50 , item = 12034000, num = 1 },
																		{prop = 50 , item = 12041097, num = 1 },
																		{prop = 50 , item = 12041098, num = 1 },
																		{prop = 50 , item = 12041101, num = 2 },
																		{prop = 50 , item = 12041102, num = 1 },
																		{prop = 100, item = 12041103, num = 5 },
																		{prop = 25 , item = 12250002, num = 1 },
																		{prop = 25 , item = 12250006, num = 1 },																							                           
																	},     

									def_gathermine_out = {     --矿石的产出
																		{prop = 25 , item = 12271409, num = 1 }, --比例，产出，数量
																		{prop = 50, item = 12271409, num = 2 },
																		{prop = 25 , item = 12271409, num = 3 },
																		{prop = 2 , item = 12271410, num = 1 },																			                           
																	},  
									
									          
									}
------------------------------------------------------------
x700193_BossDef = {
											say_gather = {
																			[1] = "你这家伙竟敢妄想拿走属于我的东西，你这是自寻死路！",
																			[2] = "你这家伙竟敢妄想拿走属于我的东西，你这是自寻死路！",
																			[3] = "你这家伙竟敢妄想拿走属于我的东西，你这是自寻死路！",
																			[4] = "你这家伙竟敢妄想拿走属于我的东西，你这是自寻死路！",
																			[5] = "你这家伙竟敢妄想拿走属于我的东西，你这是自寻死路！",
																		},
											say_die = {
																			[1] = "我呃……我的宝……藏……呃……",
																			[2] = "我费劲周折找到宝藏怎么会……我不甘心……",
																			[3] = "我呃……我的宝……藏……呃……",
																			[4] = "想得到宝藏的人都会死……下一个就会轮到你……",
																},
											say_tick = {
																		[1] = "呃啊……让你尝尝我的愤怒吧！",
																		[2] = "你这个不自量力的家伙，我要用你的死来让我的愤怒平静下来！",
																		[3] = "这宝藏之下一定埋藏了很多尸骸，而你，将成为其中之一！",
																		[4] = "我不可能会败……",
																}
									}
---------------------------------------------------------------
function x700193_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)

end

---------------------------------------------------------------
function x700193_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap)
	TalkAppendString(varMap,varStr)
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer)
end

---------------------------------------------------------------
function x700193_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap)
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI)
		StartTalkTask(varMap);
		TalkAppendString(varMap,varStr)
		StopTalkTask()
		DeliverTalkTips(varMap, humanId)
	end
end

---------------------------------------------------------------
function x700193_ProcFubenSceneCreated( varMap )
  x700193_CreateMonster( varMap )
  x700193_CreateMine( varMap )
  
  
  local nRandom = random(1, 100)
  if nRandom <= x700193_Define.def_gatherbox_prop then
  	x700193_CreateBoss(varMap)
  else
  	--x700193_ShowTipsToAll(varMap, "运气真背，矿洞没出现小林子")
  end
  
  SetFubenData_Param(varMap, x700193_CSP_BOSSFLAG, 0 )  
end

---------------------------------------------------------------
function x700193_EnterTick(varMap, nowTickCount)
	if GetFubenData_Param(varMap, x700193_CSP_BOSSFLAG) ~= 1 then
		return
	end
	
	if  mod(nowTickCount, 5) == 0 then
		local nBossID = GetFubenData_Param(varMap, x700193_CSP_BOSS_ID)
		if nBossID > 0 then
			local nMaxSay = getn(x700193_BossDef.say_tick)
			local nRandom = random(1, nMaxSay)
			local strTalk = x700193_BossDef.say_tick[nRandom]
			if strTalk == nil then
				strTalk = "取我宝箱者死！"
			end
			NpcTalk(varMap, nBossID, strTalk,  -1)
		end
	end
end

---------------------------------------------------------------
function x700193_CreateBoss(varMap)
	
	local fubenlevel = GetFubenData_Param(varMap, x700193_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700193_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700193_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700193_var_FileId )
	
	--boss 
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700193_var_FileId,nIndexFrom,varI)
		if idScript == x700193_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		  local varRet = 0
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700193_var_FileId, -1, 20,-1, facedir,  "",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700193_var_FileId, -1, 20,-1, facedir,  "","寻宝者")
			end
			
			SetFubenData_Param(varMap, x700193_CSP_BOSS_ID, varRet )
			local nFullHp = GetHp( varMap, varRet )
			SetFubenData_Param(varMap, x700193_CSP_BOSS_FULL_HP, nFullHp )
			break
    end
	end
	
	--显示箱子
	SetGrowPointIntervalContainer( varMap, 1136, 1)
end

---------------------------------------------------------------
function x700193_CreateMonster(varMap)
  local fubenlevel = GetFubenData_Param(varMap, x700193_CSP_FUBENLEVEL ) ;
	local nFubenType = GetFubenData_Param(varMap, x700193_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700193_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700193_var_FileId )
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700193_var_FileId,nIndexFrom,varI)
		if idScript == x700193_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
			for j=0,varCount -1 do
				local rx = random(-r,r)
				local varX = x1 + rx
				local rz = random(-r,r)
				local z = z1 + rz
				if title~="" then
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir,  "",title)
				else
					CreateMonster(varMap, type, varX, z, ai, aiscript, -1, -1, 21,-1,facedir)
				end
			end
		end
	end
end
--------------------------------------------------------------
function   x700193_CreateMine( varMap )
	SetGrowPointIntervalContainer( varMap, 1135, 1)
end
---------------------------------------------------------------
function x700193_ProcDie(varMap, varPlayer, varKiller)

	local nBossID = GetFubenData_Param(varMap, x700193_CSP_BOSS_ID)
	
	if nBossID == varPlayer then
		SetFubenData_Param(varMap, x700193_CSP_BOSS_ID, -1)
		local nMaxSay = getn(x700193_BossDef.say_die)
		local nRandom = random(1, nMaxSay)
		local strTalk = x700193_BossDef.say_die[nRandom]
		if strTalk == nil then
			strTalk = "我呃……我的宝……藏……呃……"
		end
			
		NpcTalk(varMap, nBossID, strTalk,  -1)
	end
end

----------------------------------------------------------------	
function 	x700193_ProcGpCreate(varMap,growPointType,varX,varY)
		
	local varBoxId = ItemBoxEnterScene(varX, varY, growPointType, varMap, 0, -1)
	SetGrowPointObjID(varMap, growPointType, varX, varY, varBoxId)
	
	if growPointType == 1136 then
		SetFubenData_Param(varMap, x700193_CSP_BOX_ID, varBoxId )
	end
	
	return 1
end

----------------------------------------------------------------
function x700193_ProcGpOpen(varMap,varPlayer,varTalknpc)
	local nBoxID = GetFubenData_Param(varMap, x700193_CSP_BOX_ID)
	if varTalknpc == nBoxID then
		local nBossID = GetFubenData_Param(varMap, x700193_CSP_BOSS_ID)
		if nBossID > 0 then
			local nMaxSay = getn(x700193_BossDef.say_gather)
			local nRandom = random(1, nMaxSay)
			local strTalk = x700193_BossDef.say_gather[nRandom]
			if strTalk == nil then
				strTalk = "你这家伙竟敢妄想拿走属于我的东西，你这是自寻死路！"
			end

			NpcTalk(varMap, nBossID, strTalk,  varPlayer)
			SetMonsterCamp(varMap,nBossID, 21);
			SetFubenData_Param(varMap, x700193_CSP_BOSSFLAG, 1)  
		end
	end	
	
		--检查背包
		if GetBagSpace(varMap, varPlayer) <= 2 then
			Msg2Player(varMap, varPlayer, "背包剩余空间不足！", 8, 3)
			return 1
		end
		
	SetGrowPointIntervalContainer( varMap, 1136, -1)
	SetGrowPointIntervalContainer( varMap, 1135, -1)
	return 0
end
---------------------------------------------------------------
-- 得到随机宝箱产出
---------------------------------------------------------------
function x700193_GetRandomBoxItem()
	local nTotleProp = 0
	for varI, varOut in x700193_Define.def_gatherbox_out do	
		nTotleProp = nTotleProp + varOut.prop
	end
	
	local nOutID = 0
	local nOutNum = 0
	local nCurRandom = 0
	local nRandom = random(1, nTotleProp)
	for varI, varOut in x700193_Define.def_gatherbox_out do	
		nCurRandom = nCurRandom + varOut.prop
		if nCurRandom >= nRandom then
			nOutID = varOut.item
			nOutNum = varOut.num			
			break
		end
	end
	return nOutID, nOutNum
end
---------------------------------------------------------------
-- 得到随机矿石产出
---------------------------------------------------------------
function x700193_GetRandomMineItem()
	local nTotleProp = 0
	for varI, varOut in x700193_Define.def_gathermine_out do	
		nTotleProp = nTotleProp + varOut.prop
	end
	
	local nOutID = 0
	local nOutNum = 0
	local nCurRandom = 0
	local nRandom = random(1, nTotleProp)
	for varI, varOut in x700193_Define.def_gathermine_out do	
		nCurRandom = nCurRandom + varOut.prop
		if nCurRandom >= nRandom then
			nOutID = varOut.item
			nOutNum = varOut.num			
			break
		end
	end
	return nOutID, nOutNum
end
---------------------------------------------------------------
function x700193_ProcGpRecycle( varMap, varPlayer, varTalknpc )
	return 1 
end

---------------------------------------------------------------
function	x700193_ProcGpProcOver(varMap,varPlayer,varTalknpc)	
	local nBoxID = GetFubenData_Param(varMap, x700193_CSP_BOX_ID)
	--如果采集的是箱子
	if varTalknpc == nBoxID then
		local nOutID, nOutNum = x700193_GetRandomBoxItem()
		if nOutID > 0 then
			StartItemTask(varMap)
			ItemAppend(varMap, nOutID, nOutNum)			
			local ret = StopItemTask(varMap,varPlayer)
			if ret <= 0 then
				Msg2Player(varMap, varPlayer, "背包剩余空间不足！", 8, 3)
				return 0
			end
		
			DeliverItemListSendToPlayer(varMap, varPlayer)
			local varStr = "#Y打开宝箱获得了：#G#{_ITEM"..nOutID.."}" .. nOutNum .. "#Y个"
			Msg2Player(varMap, varPlayer, varStr, 8, 3)	
			WriteLog(1, format("garden fuben: player gather box:  guid:%X,out:%d,num:%d", GetGUID(varMap, varPlayer), nOutID, nOutNum))	
			
			--有机会得到第二个
			local nRandom = random(0, 100)
			if nRandom < x700193_Define.def_gatherbox_prop_next then
				nOutID, nOutNum = x700193_GetRandomBoxItem()
				if nOutID > 0 then
					StartItemTask(varMap)
					ItemAppend(varMap, nOutID, nOutNum)			
					ret = StopItemTask(varMap,varPlayer)
					if ret <= 0 then
						Msg2Player(varMap, varPlayer, "背包剩余空间不足！", 8, 3)
						return 0
					end
				
					DeliverItemListSendToPlayer(varMap, varPlayer)
					varStr = "#Y打开宝箱获得了：#G#{_ITEM"..nOutID.."}" .. nOutNum .. "#Y个"
					Msg2Player(varMap, varPlayer, varStr, 8, 3)	
					WriteLog(1, format("garden fuben: player gather box next:  guid:%X,out:%d,num:%d", GetGUID(varMap, varPlayer), nOutID, nOutNum))	
				end
			end
		end
		
		--ItemBoxExitScene(varMap, nBoxID)
		return 0
	else --主矿石的采集
		local nOutID, nOutNum = x700193_GetRandomMineItem()
		if nOutID > 0 then
			StartItemTask(varMap)
			ItemAppendBind(varMap, nOutID, nOutNum)			
			local ret = StopItemTask(varMap,varPlayer)
			if ret <= 0 then
				Msg2Player(varMap, varPlayer, "背包剩余空间不足！", 8, 3)
				return 0
			end
		
			DeliverItemListSendToPlayer(varMap, varPlayer)
			local varStr = "#Y您采集到：#G#{_ITEM"..nOutID.."}" .. nOutNum .. "#Y个"
			Msg2Player(varMap, varPlayer, varStr, 8, 3)	
			WriteLog(1, format("garden fuben: gather mine:  guid:%X,out:%d,num:%d", GetGUID(varMap, varPlayer), nOutID, nOutNum))	

		--ItemBoxExitScene(varMap, varTalknpc)
		end		
		return 0
	end

	return 0
end
---------------------------------------------------------------

--BOSS说话内容
function x700193_ProcEventEntry( varMap, varPlayer,varTalknpc )
	
	StartTalkTask(varMap)
	TalkAppendString(varMap,"\t我和我兄弟发现宝藏秘密的那一天起，他就注定了要因宝藏而丧命，他太愚蠢了，居然妄想与我分享宝藏。\n\t我将他那血洗过的身躯埋在了荒原之中，孤身找寻宝藏直到这座矿山前，宝藏的诱惑为我骗来了一群蠢货挖掘山洞。\n\t如今，我终于如愿找到了宝藏，哈哈，属于我一个人的宝藏！至于那些贪财的蠢货矿工我会将他们永远的留在这里与宝藏的残骸做伴！")
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	ShowNpcQuestEventList(varMap,varPlayer,varTalknpc)
end

--

function x700193_ProcAreaEntered(varMap, varPlayer, varArea, varQuest)
	SetFubenData_Param(varMap, x700193_CSP_AREA_ID, varArea)
	if varArea == 1 then  
		LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700193_var_QuestId, x700193_var_FileId, 1 )
	end
end


function x700193_ProcAreaLeaved(varMap, varPlayer, varArea, varQuest)
	EnterAreaEventListHideNM(varMap, varPlayer)
	SetFubenData_Param(varMap, x700193_CSP_AREA_ID, -1)
end

function x700193_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
end

function x700193_ProcFubenEnd( varMap)
end

---------------------------------------------------------
function x700193_ProcPlayerLeave(varMap, varPlayer)
	
end
