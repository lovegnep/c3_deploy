
x300918_var_FileId                      = 300918
x300918_var_TotalBattleTime               = 60 * 30     	


x300918_var_SceneName                     = { 
											{Name="yewai_caizhoucheng/yewai_caizhoucheng.scn",				Script=300918,varMap= 6,Toggle=1,Buf = {-1,9420,9421,9422,9423}},
											{Name="yewai_suiyecheng/yewai_suiyecheng.scn",					Script=300918,varMap= 9,Toggle=1,Buf = {-1,9400,9401,9402,9403}},
											{Name="yewai_bageda/yewai_bageda.scn",							Script=300918,varMap=13,Toggle=1,Buf = {-1,9416,9417,9418,9419}},
											{Name="yewai_jifugongguo/yewai_jifugongguo.scn",				Script=300918,varMap=18,Toggle=1,Buf = {-1,9412,9413,9414,9415}},
											{Name="yewai_shenshengluomadiguo/yewai_shenshengluomadiguo.scn",Script=300918,varMap=21,Toggle=1,Buf = {-1,9428,9429,9430,9431}},
											{Name="yewai_yelusaleng/yewai_yelusaleng.scn",					Script=300918,varMap=24,Toggle=1,Buf = {-1,-1,-1,-1,-1}},
											{Name="test/test.scn",											Script=300918,varMap=27,Toggle=0,Buf = {-1,-1,-1,-1,-1}},
											{Name="test/test.scn",											Script=300918,varMap=31,Toggle=0,Buf = {-1,-1,-1,-1,-1}},
											{Name="test/test.scn",											Script=300918,varMap=34,Toggle=0,Buf = {-1,-1,-1,-1,-1}},
										  }
x300918_var_BattleType					= 2

x300918_var_Laird_Signup                  = 300     
x300918_var_Laird_WaitBattle              = 301     
x300918_var_Laird_BeginBattle             = 302     
x300918_var_Laird_EndBattle               = 303     


x300918_var_MaxScore                     = 49	     
x300918_var_BonusTips                    = "#G您获得了#R%d#G点经验,#R%d#G点帮会贡献,#R%d#G帮会经验!" 
x300918_var_BonusTips1                   = "您获得了奖励" 



x300918_var_WinPrise                     = 1000*0.5*20              
x300918_var_LosePrise                    = 1000*0.1*20              
x300918_var_DeucePrise                   = 1000*0.3*20              


x300918_var_WinBangGong                  = 25
x300918_var_DeuceBangGong                = 20


x300918_var_WinBangExp                   = 2
x300918_var_LoseBangExp                  = 2
x300918_var_DeuceBangExp                 = 2

x300918_var_Guild_Camp_A                 = 5
x300918_var_Guild_Camp_B                 = 6

x300918_var_Leader_Index                 = 5

x300918_var_Kick_Down                    = 8



x300918_var_BattleState		   		   = {}
x300918_var_BattleEnterFlag	   		   = {}
x300918_var_GuildA					   = {}
x300918_var_GuildB					   = {}
x300918_var_CountryA					   = {}
x300918_var_CountryB					   = {}
x300918_var_LairdMapID				   = {}
x300918_var_HasLaird					   = {}
x300918_var_CountDownState			   = {}
x300918_var_CountDownTime				   = {}
x300918_var_CountTime				       = {}
x300918_var_GuildAidA					   = {}
x300918_var_GuildAidB					   = {}



x300918_var_LairdSceneInfo					= {	
												{varTalkNpcGUID=123839,LairdScene=6, LairdSceneName="蔡州城  （中原）",  	Level=45, Flag0=500,Flag1=15000}, 
												{varTalkNpcGUID=123839,LairdScene=9, LairdSceneName="碎叶城  （中亚）",    Level=60, Flag0=501,Flag1=15001},
												{varTalkNpcGUID=123839,LairdScene=13,LairdSceneName="巴格达  （西亚）",	Level=60, Flag0=502,Flag1=15002},
												{varTalkNpcGUID=123839,LairdScene=18,LairdSceneName="基辅公国（斯拉夫）",  Level=70, Flag0=503,Flag1=15003},
												{varTalkNpcGUID=123839,LairdScene=21,LairdSceneName="罗马帝国（东欧）",    Level=70, Flag0=504,Flag1=15004},
												{varTalkNpcGUID=123839,LairdScene=24,LairdSceneName="耶路撒冷（阿拉伯）",	Level=70, Flag0=505,Flag1=15005},
												{varTalkNpcGUID=123839,LairdScene=27,LairdSceneName="福冈    （东瀛）",    Level=110,Flag0=506,Flag1=15006},
												{varTalkNpcGUID=123839,LairdScene=31,LairdSceneName="缅甸    （百夷）",  	Level=120,Flag0=507,Flag1=15007},
												{varTalkNpcGUID=123839,LairdScene=34,LairdSceneName="爪哇岛  （南洋）",    Level=130,Flag0=508,Flag1=15008},
												
												{varTalkNpcGUID=126139,LairdScene=6, LairdSceneName="蔡州城  （中原）",    Level=45, Flag0=1500,Flag1=25000}, 
												{varTalkNpcGUID=126139,LairdScene=9, LairdSceneName="碎叶城  （中亚）",	Level=60, Flag0=1501,Flag1=25001},
												{varTalkNpcGUID=126139,LairdScene=13,LairdSceneName="巴格达  （西亚）",	Level=60, Flag0=1502,Flag1=25002},
												{varTalkNpcGUID=126139,LairdScene=18,LairdSceneName="基辅公国（斯拉夫）",  Level=70, Flag0=1503,Flag1=22003},
												{varTalkNpcGUID=126139,LairdScene=21,LairdSceneName="罗马帝国（东欧）",    Level=70, Flag0=1504,Flag1=25004},
												{varTalkNpcGUID=126139,LairdScene=24,LairdSceneName="耶路撒冷（阿拉伯）",  Level=70, Flag0=1505,Flag1=25005},
												{varTalkNpcGUID=126139,LairdScene=27,LairdSceneName="福冈    （东瀛）",    Level=110,Flag0=1506,Flag1=25006},
												{varTalkNpcGUID=126139,LairdScene=31,LairdSceneName="缅甸    （百夷）",    Level=120,Flag0=1507,Flag1=25007},
												{varTalkNpcGUID=126139,LairdScene=34,LairdSceneName="爪哇岛  （南洋）",    Level=130,Flag0=1508,Flag1=25008},
												                                                                              
												{varTalkNpcGUID=129741,LairdScene=6, LairdSceneName="蔡州城  （中原）",   Level=45, Flag0=2500,Flag1=35000}, 
												{varTalkNpcGUID=129741,LairdScene=9, LairdSceneName="碎叶城  （中亚）",   Level=60, Flag0=2501,Flag1=35001},
												{varTalkNpcGUID=129741,LairdScene=13,LairdSceneName="巴格达  （西亚）",   Level=60, Flag0=2502,Flag1=35002},
												{varTalkNpcGUID=129741,LairdScene=18,LairdSceneName="基辅公国（斯拉夫）", Level=70, Flag0=2503,Flag1=33003},
												{varTalkNpcGUID=129741,LairdScene=21,LairdSceneName="罗马帝国（东欧）",   Level=70, Flag0=2504,Flag1=35004},
												{varTalkNpcGUID=129741,LairdScene=24,LairdSceneName="耶路撒冷（阿拉伯）", Level=70, Flag0=2505,Flag1=35005},
												{varTalkNpcGUID=129741,LairdScene=27,LairdSceneName="福冈    （东瀛）",   Level=110,Flag0=2506,Flag1=35006},
												{varTalkNpcGUID=129741,LairdScene=31,LairdSceneName="缅甸    （百夷）",   Level=120,Flag0=2507,Flag1=35007},
												{varTalkNpcGUID=129741,LairdScene=34,LairdSceneName="爪哇岛  （南洋）",   Level=130,Flag0=2508,Flag1=35008},
												                                                                              
												{varTalkNpcGUID=132165,LairdScene=6, LairdSceneName="蔡州城  （中原）",    Level=45, Flag0=3500,Flag1=45000}, 
												{varTalkNpcGUID=132165,LairdScene=9, LairdSceneName="碎叶城  （中亚）",    Level=60, Flag0=3501,Flag1=45001},
												{varTalkNpcGUID=132165,LairdScene=13,LairdSceneName="巴格达  （西亚）",	Level=60, Flag0=3502,Flag1=45002},
												{varTalkNpcGUID=132165,LairdScene=18,LairdSceneName="基辅公国（斯拉夫）",  Level=70, Flag0=3503,Flag1=44003},
												{varTalkNpcGUID=132165,LairdScene=21,LairdSceneName="罗马帝国（东欧）",    Level=70, Flag0=3504,Flag1=45004},
												{varTalkNpcGUID=132165,LairdScene=24,LairdSceneName="耶路撒冷（阿拉伯）",  Level=70, Flag0=3505,Flag1=45005},
												{varTalkNpcGUID=132165,LairdScene=27,LairdSceneName="福冈    （东瀛）",    Level=110,Flag0=3506,Flag1=45006},
												{varTalkNpcGUID=132165,LairdScene=31,LairdSceneName="缅甸    （百夷）",    Level=120,Flag0=3507,Flag1=45007},
												{varTalkNpcGUID=132165,LairdScene=34,LairdSceneName="爪哇岛  （南洋）",    Level=130,Flag0=3508,Flag1=45008},
											   }                                                                              
											   
											   

x300918_var_TempImpassable_Door1			=	{ 																		
												{ Left = 19,Top = 89,Right =  232,Bottom = 168 },
											}
											
x300918_var_TempImpassable_Door1_Effect	=   { 32, 33 }																


x300918_var_TempImpassable_Door2			=	{																		
												{Left =  46,Top = 60,Right =  54,Bottom = 68},
												{Left = 196,Top = 191,Right = 205,Bottom = 199},
											}
											
x300918_var_TempImpassable_Door2_Effect	=   { 34, 35 }																
x300918_var_TempImpassable_Door2_State	=	{} 																		


x300918_var_DoorGrowPointA				=	730																		
x300918_var_DoorGrowPointB				=	731																		

x300918_var_DoorGrowPointA_LairdState		=	{}																		
x300918_var_DoorGrowPointB_LairdState		=	{}																		


x300918_var_BossA							=	{}																		
x300918_var_BossB							=	{}																		


x300918_var_ScoreA						=	{}																		
x300918_var_ScoreB						=	{}																		
x300918_var_IntervalScoreA				=	{}																		
x300918_var_IntervalScoreB				=	{}																		


x300918_var_PlayerAidList					=	{}																		




function x300918_InitPlayerAidList(varMap)
	
	x300918_var_PlayerAidList[varMap]		= {
												[6]  = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1},
												[9]  = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1},
												[13] = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1},
												[18] = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1},
												[21] = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1},
												[24] = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1},
												[27] = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1},
												[31] = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1},
												[34] = {-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,  -1,-1,-1,-1,-1,-1,-1,-1,-1,-1},
											  }	
end




function x300918_ResetPlayerAidListAByCustom(varMap,nLairdMapId )
	
	if nLairdMapId ~= 6  and nLairdMapId ~= 9  and nLairdMapId ~= 13 and 
	   nLairdMapId ~= 18 and nLairdMapId ~= 21 and nLairdMapId ~= 24 and 
	   nLairdMapId ~= 27 and nLairdMapId ~= 31 and nLairdMapId ~= 34 then
		return
	end 

	for varI = 1,10 do
		x300918_var_PlayerAidList[varMap][nLairdMapId][varI] = -1	
	end
end




function x300918_ResetPlayerAidListBByCustom(varMap,nLairdMapId )
	
	if nLairdMapId ~= 6  and nLairdMapId ~= 9  and nLairdMapId ~= 13 and 
	   nLairdMapId ~= 18 and nLairdMapId ~= 21 and nLairdMapId ~= 24 and 
	   nLairdMapId ~= 27 and nLairdMapId ~= 31 and nLairdMapId ~= 34 then
		return
	end 

	for varI = 11,20 do
		x300918_var_PlayerAidList[varMap][nLairdMapId][varI] = -1	
	end
end




function x300918_AddPlayerAidAByCustom(varMap,nLairdMapid,GUID)
	
	if nLairdMapId ~= 6  and nLairdMapId ~= 9  and nLairdMapId ~= 13 and 
	   nLairdMapId ~= 18 and nLairdMapId ~= 21 and nLairdMapId ~= 24 and 
	   nLairdMapId ~= 27 and nLairdMapId ~= 31 and nLairdMapId ~= 34 then
		return
	end 

	for varI = 1,10 do
		if x300918_var_PlayerAidList[varMap][nLairdMapId][varI] == -1 then
			x300918_var_PlayerAidList[varMap][nLairdMapId][varI] = GUID
			return
		end
	end
end




function x300918_AddPlayerAidBByCustom(varMap,nLairdMapid,GUID)
	
	if nLairdMapId ~= 6  and nLairdMapId ~= 9  and nLairdMapId ~= 13 and 
	   nLairdMapId ~= 18 and nLairdMapId ~= 21 and nLairdMapId ~= 24 and 
	   nLairdMapId ~= 27 and nLairdMapId ~= 31 and nLairdMapId ~= 34 then
		return
	end 

	for varI = 11,20 do
		if x300918_var_PlayerAidList[varMap][nLairdMapId][varI] == -1 then
			x300918_var_PlayerAidList[varMap][nLairdMapId][varI] = GUID
			return
		end
	end
end




function x300918_RemovePlayerAidByCustom(varMap,nLairdMapId,GUID)
	
	if nLairdMapId ~= 6  and nLairdMapId ~= 9  and nLairdMapId ~= 13 and 
	   nLairdMapId ~= 18 and nLairdMapId ~= 21 and nLairdMapId ~= 24 and 
	   nLairdMapId ~= 27 and nLairdMapId ~= 31 and nLairdMapId ~= 34 then
		return
	end 
	
	for varI,item in x300918_var_PlayerAidList[varMap][nLairdMapId] do
		if item == GUID then
			item = -1
			return
		end
	end
end




function x300918_IsPlayerInPlayerAidList(varMap,varPlayer)

	local nGUID = GetGUID(varMap,varPlayer)
	for varI,PlayerAidList in x300918_var_PlayerAidList[varMap] do
		for j,PlayerAid in PlayerAidList do
			if PlayerAid == nGUID then
				return 1
			end
		end
	end

	return 0
end




function x300918_ProcPlayerAidSyncLw(varMap,nLairdMapId,nCampFlag,nGUID1,nGUID2,nGUID3,nGUID4,nGUID5 )
	
	if nLairdMapId ~= 6  and nLairdMapId ~= 9  and nLairdMapId ~= 13 and 
	   nLairdMapId ~= 18 and nLairdMapId ~= 21 and nLairdMapId ~= 24 and 
	   nLairdMapId ~= 27 and nLairdMapId ~= 31 and nLairdMapId ~= 34 then
		return
	end 
	
	if nCampFlag == 0 then
		
		x300918_var_PlayerAidList[varMap][nLairdMapId][1] = nGUID1
		x300918_var_PlayerAidList[varMap][nLairdMapId][2] = nGUID2
		x300918_var_PlayerAidList[varMap][nLairdMapId][3] = nGUID3
		x300918_var_PlayerAidList[varMap][nLairdMapId][4] = nGUID4
		x300918_var_PlayerAidList[varMap][nLairdMapId][5] = nGUID5
	else
		
		x300918_var_PlayerAidList[varMap][nLairdMapId][11] = nGUID1
		x300918_var_PlayerAidList[varMap][nLairdMapId][12] = nGUID2
		x300918_var_PlayerAidList[varMap][nLairdMapId][13] = nGUID3
		x300918_var_PlayerAidList[varMap][nLairdMapId][14] = nGUID4
		x300918_var_PlayerAidList[varMap][nLairdMapId][15] = nGUID5
		
	end
	
end

function x300918_ProcPlayerAidSyncHi(varMap,nLairdMapId,nCampFlag,nGUID6,nGUID7,nGUID8,nGUID9,nGUID10 )
	
	if nLairdMapId ~= 6  and nLairdMapId ~= 9  and nLairdMapId ~= 13 and 
	   nLairdMapId ~= 18 and nLairdMapId ~= 21 and nLairdMapId ~= 24 and 
	   nLairdMapId ~= 27 and nLairdMapId ~= 31 and nLairdMapId ~= 34 then
		return
	end 
	
	if nCampFlag == 0 then
		
		x300918_var_PlayerAidList[varMap][nLairdMapId][6]  = nGUID6
		x300918_var_PlayerAidList[varMap][nLairdMapId][7]  = nGUID7
		x300918_var_PlayerAidList[varMap][nLairdMapId][8]  = nGUID8
		x300918_var_PlayerAidList[varMap][nLairdMapId][9]  = nGUID9
		x300918_var_PlayerAidList[varMap][nLairdMapId][10] = nGUID10
	else
		
		x300918_var_PlayerAidList[varMap][nLairdMapId][16] = nGUID6
		x300918_var_PlayerAidList[varMap][nLairdMapId][17] = nGUID7
		x300918_var_PlayerAidList[varMap][nLairdMapId][18] = nGUID8
		x300918_var_PlayerAidList[varMap][nLairdMapId][19] = nGUID9
		x300918_var_PlayerAidList[varMap][nLairdMapId][20] = nGUID10
		
	end
	
end




function x300918_ProcMapCreate(varMap)
	
	
	x300918_var_BattleState[varMap]				   	= -1
	x300918_var_BattleEnterFlag[varMap]			   	= 0
	x300918_var_GuildA[varMap]					   	= -1
	x300918_var_GuildB[varMap]					   	= -1
	x300918_var_CountryA[varMap]					   	= -1
	x300918_var_CountryB[varMap]					   	= -1
	x300918_var_LairdMapID[varMap]				   	= -1
	x300918_var_HasLaird[varMap]					   	= 0
	x300918_var_CountDownState[varMap]			   	= -1
	x300918_var_CountDownTime[varMap]			   	= -1
	x300918_var_CountTime[varMap]				   	= -1
	
	x300918_var_GuildAidA[varMap]					= {}
	x300918_var_GuildAidB[varMap]					= {}
	
	x300918_var_TempImpassable_Door2_State[varMap]	= {  0,  0 } 																
	
	x300918_var_DoorGrowPointA_LairdState[varMap]	= { LairdCountDownState = 0,LairdCountDownTime = -1,LairdCamp = -1 }		
	x300918_var_DoorGrowPointB_LairdState[varMap]	= { LairdCountDownState = 0,LairdCountDownTime = -1,LairdCamp = -1 }		

	
	
	x300918_var_BossA[varMap]						=	nil																		
	x300918_var_BossB[varMap]						=	nil																		
	
	
	x300918_var_ScoreA[varMap]						=	0																		
	x300918_var_ScoreB[varMap]						=	0																		
	x300918_var_IntervalScoreA[varMap]				=	0																		
	x300918_var_IntervalScoreB[varMap]				=	0																		
	
	
	x300918_InitPlayerAidList(varMap)
	
end




function x300918_ProcSyncLairdInfo(varMap,nGuildId,nCountryId)
	
	local nObjId = 1
	if IsObjValid(varMap,nObjId) ~=1 then
		return
	end
	
	if nCountryId < 0 or nCountryId > 3 then
		return
	end
	
	local nCamp = nCountryId + 16
	SetMonsterCamp(varMap,nObjId,nCamp)
end




function x300918_GetMatchGuild(varMap)
	return x300918_var_GuildA[varMap],x300918_var_GuildB[varMap]
end											   
										
										
function x300918_GetCountTime(varMap)
	return x300918_var_CountTime[varMap]
end
	   



function x300918_GetLairdSceneCount(varMap)
	return getn(x300918_var_LairdSceneInfo)
end




function x300918_GetLairdSceneInfo(varMap,varIndex)

	if varIndex < 1 or varIndex > getn(x300918_var_LairdSceneInfo) then
		return
	end
	
	local item = x300918_var_LairdSceneInfo[varIndex]
	return item.varTalkNpcGUID,item.LairdScene,item.LairdSceneName,item.Level,item.Flag0,item.Flag1
end




function x300918_GetLairdSceneInfo_Name(nLairdMapId)
	
	local strName = ""
	for varI,item in x300918_var_LairdSceneInfo do
		if item.LairdScene == nLairdMapId then
			strName = item.LairdSceneName
			break
		end
	end
	
	return strName
	
end





function x300918_GetBattleState(varMap)
	
	return x300918_var_BattleState[varMap]
	
end




function x300918_GetBattleEnterSceneFlag(varMap)
	return x300918_var_BattleEnterFlag[varMap];
end




function x300918_SetBattleEnterSceneFlag(varMap,nEnterSceneFlag)
	x300918_var_BattleEnterFlag[varMap] = nEnterSceneFlag
end




function x300918_GetLairdBattleSceneScript( varMap )

    local varName = GetBattleSceneName(varMap)
    for varI,item in x300918_var_SceneName do
        if varName == item.Name and item.Toggle == 1 then
            return item.Script
        end
    end

    return 0
end




function x300918_IsPlayerAidA(varMap,varPlayer)
	
	local nGUID = GetGUID(varMap,varPlayer)
	
	for varI,item in x300918_var_GuildAidA[varMap] do
		if item == nGUID then
			return 1
		end
	end
	
	
	return 0
	
end




function x300918_IsPlayerAidB(varMap,varPlayer)
	
	local nGUID = GetGUID(varMap,varPlayer)
	
	for varI,item in x300918_var_GuildAidB[varMap] do
		if item == nGUID then
			return 1
		end
	end
	
	
	return 0
	
end






function x300918_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,nExtId )
	StartTalkTask(varMap)
		TalkAppendString( varMap, "\t感谢你为领地图腾升级所做的贡献！" )
    	LuaCallNoclosure(300950,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 0)
    	LuaCallNoclosure(300951,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 0)
    	LuaCallNoclosure(300952,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 0)
		LuaCallNoclosure(300953,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 0)
		LuaCallNoclosure(300954,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 0)
		LuaCallNoclosure(300955,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 0)
		LuaCallNoclosure(300956,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 0)
		LuaCallNoclosure(300957,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 0)
		LuaCallNoclosure(300958,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 0)
		
		LuaCallNoclosure(302506,"CallbackEnumEvent", varMap, varPlayer, varTalknpc, 0)
    	
    StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end





function x300918_ProcBattleStateEvent( varMap, varState  )

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_LAIRDGBATTLELITE ) == 0 then
        return
    end


	local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
	if  varScriptFileId == 0 then

		
		
		
		
        if varState == x300918_var_Laird_Signup then

            
            if x300918_var_BattleState[varMap] ~= x300918_var_Laird_Signup then
                local varMsg = format("LBL:x300918_var_Laird_Signup,varMap=%d ",varMap  )
                WriteLog(1,varMsg)
            end

            
            x300918_var_BattleState[varMap] = x300918_var_Laird_Signup
            
        elseif varState == x300918_var_Laird_WaitBattle then

            
            if x300918_var_BattleState[varMap] ~= x300918_var_Laird_WaitBattle then
                local varMsg = format("LBL:x300918_var_Laird_WaitBattle,varMap=%d ",varMap )
                WriteLog(1,varMsg)
            end
            
            
            x300918_var_BattleState[varMap] = x300918_var_Laird_WaitBattle
            
        elseif varState == x300918_var_Laird_BeginBattle then

            
            if x300918_var_BattleState[varMap] == x300918_var_Laird_BeginBattle then
                local varMsg = format("LBL:x300918_var_Laird_BeginBattle,varMap=%d ",varMap )
                WriteLog(1,varMsg)
            end
            
            
            x300918_var_BattleState[varMap] = x300918_var_Laird_BeginBattle
            x300918_var_BattleEnterFlag[varMap] = 1

        elseif varState == x300918_var_Laird_EndBattle then
            
            
            x300918_var_BattleState[varMap] = x300918_var_Laird_EndBattle

            local varMsg = format("LBL:x300918_var_Laird_EndBattle, varMap=%d",varMap )
            WriteLog(1,varMsg)

        end

	elseif varScriptFileId == 300918 then
	
		
		
		

        if varState == x300918_var_Laird_Signup then

            
            if x300918_var_BattleState[varMap] ~= x300918_var_Laird_Signup then
                
                
                local varMsg = format("LBL:x300918_var_Laird_Signup,varMap=%d,2 ",varMap  )
                WriteLog(1,varMsg)

            end

            
            x300918_var_BattleState[varMap] = x300918_var_Laird_Signup		                      	

        elseif varState == x300918_var_Laird_WaitBattle then

            
            if x300918_var_BattleState[varMap] ~= x300918_var_Laird_WaitBattle then
                local varMsg = format("LBL:x300918_var_Laird_WaitBattle,varMap=%d,2",varMap )
                WriteLog(1,varMsg)
            end

            
            x300918_var_BattleState[varMap] = x300918_var_Laird_WaitBattle
            
        elseif varState == x300918_var_Laird_BeginBattle then

            
            if x300918_var_BattleState[varMap] ~= x300918_var_Laird_BeginBattle then
                local varMsg = format("LBL:x300918_var_Laird_BeginBattle,varMap=%d,2",varMap )
                WriteLog(1,varMsg)
            end

            
            x300918_var_BattleState[varMap] = x300918_var_Laird_BeginBattle
            x300918_ProcBattleSceneReady( varMap,( x300918_var_TotalBattleTime) )

        elseif varState == x300918_var_Laird_EndBattle then

            if x300918_var_BattleState[varMap] > x300918_var_Laird_BeginBattle or x300918_var_BattleState[varMap] < x300918_var_Laird_Signup then
                
                local varMsg = format("LBL:x300918_var_Laird_EndBattle,Result:nState > x300918_var_Laird_BeginBattle or nState < x300918_var_Laird_Signup  varMap=%d,varState=%d,2",varMap, varState )
                WriteLog(1,varMsg)

                
                x300918_ProcBattleSceneClose( varMap )

                local varMsg = format("LBL:x300918_var_Laird_EndBattle, varMap=%d,2",varMap )
                WriteLog(1,varMsg)
                return
            end

            
    		x300918_var_BattleState[varMap] = x300918_var_Laird_EndBattle 
            x300918_ProcBattleSceneClose( varMap )

            local varMsg = format("LBL:x300918_var_Laird_EndBattle, varMap=%d,3",varMap )
            WriteLog(1,varMsg)
        end
	end
end




function x300918_ProcMapTimerTick( varMap,varTime )

    
    local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end
       
    x300918_ProcBattleSceneTimer( varMap, varTime)
end





function x300918_ProcPlayerEnter( varMap, varPlayer )

    
    local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

    local varStatus = x300918_var_BattleState[varMap]
    if varStatus ~= x300918_var_Laird_BeginBattle then
    
        
        
        
        
        return
    end


    
    local nGuildA = x300918_var_GuildA[varMap]
    local nGuildB = x300918_var_GuildB[varMap]

    local nGuildId = GetGuildID( varMap,varPlayer )

    
    local nSendCCamp = -1
    if nGuildId == nGuildA or x300918_IsPlayerAidA(varMap,varPlayer) == 1 then
        nSendCCamp = 0
    elseif nGuildId == nGuildB or x300918_IsPlayerAidB(varMap,varPlayer) == 1 then
        nSendCCamp = 1
    else




        return

    end

    
    

    local strGuildA = GetGuildName( nGuildA )
    local strGuildB = GetGuildName( nGuildB )

    
    

    
    SetPlayerRuntimeData(varMap,varPlayer,RD_KING_BATTLE_BEKILLED,0)

    
    if nGuildId == nGuildA or x300918_IsPlayerAidA(varMap,varPlayer) == 1 then
        
        

    elseif nGuildId == nGuildB or x300918_IsPlayerAidB(varMap,varPlayer) == 1 then
        
        
    end

    SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN,-1)

    
    local scenePre = GetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_SCENE_PRE ) - 1
    if scenePre >= 0 then
        
        local CurX = GetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSX_PRE)
        local CurZ = GetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSZ_PRE)

        SetPlayerBakSceneInfo(varMap,varPlayer,scenePre,CurX,CurZ)

        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_SCENE_PRE,0)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSX_PRE,0)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSZ_PRE,0)

    end






	
end




function x300918_ProcPlayerLeave( varMap, varPlayer )

    
    local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

    local nCountryId = GetCurCountry(varMap,varPlayer )
    SetCurCamp( varMap,varPlayer,nCountryId )

    GameBattleSetDisable(varMap, varPlayer,1,-1,2)
end




function x300918_ProcPlayerLeaveGuild( varMap,varPlayer )










end




function x300918_ProcSetLairdBattleMatchInfo( varMap,nGuildA,nGuildB,nCountryA,nCountryB,nLairdMapId,nHasLaird )

    
    local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

	
    x300918_var_GuildA[varMap] = nGuildB 
    x300918_var_GuildB[varMap] = nGuildA
    x300918_var_LairdMapID[varMap] = nLairdMapId
    x300918_var_HasLaird[varMap] = nHasLaird
    
    x300918_var_CountryA[varMap] = nCountryB 
    x300918_var_CountryB[varMap] = nCountryA

    
    local a = x300918_var_GuildA[varMap]
    local b = x300918_var_GuildB[varMap]
    local ca = x300918_var_CountryA[varMap]
    local cb = x300918_var_CountryB[varMap]
    local c = x300918_var_LairdMapID[varMap]
    local d = x300918_var_HasLaird[varMap]

    local varMsg = format( "LBL:LAIRD_BATTLE_MATCHINFO:varMap=%d,A=%d,B=%d,CA=%d,CB=%d,LairdMap=%d,HasLaird=%d", varMap, a, b,ca,cb, c, d )
    WriteLog(1,varMsg)
end





function x300918_ProcSetLairdBattleMatchInfo_PlayerAid0( varMap,guildtype,GUID0,GUID1,GUID2,GUID3,GUID4)

    
    local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

	
	if guildtype == 0 then
	    x300918_var_GuildAidB[varMap][1] = GUID0 
	    x300918_var_GuildAidB[varMap][2] = GUID1
	    x300918_var_GuildAidB[varMap][3] = GUID2
	    x300918_var_GuildAidB[varMap][4] = GUID3
	    x300918_var_GuildAidB[varMap][5] = GUID4
	else
		x300918_var_GuildAidA[varMap][1] = GUID0 
	    x300918_var_GuildAidA[varMap][2] = GUID1
	    x300918_var_GuildAidA[varMap][3] = GUID2
	    x300918_var_GuildAidA[varMap][4] = GUID3
	    x300918_var_GuildAidA[varMap][5] = GUID4
	end
    
end





function x300918_ProcSetLairdBattleMatchInfo_PlayerAid1( varMap,guildtype,GUID5,GUID6,GUID7,GUID8,GUID9)

    
    local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

	
	if guildtype == 0 then
	    x300918_var_GuildAidB[varMap][6]  = GUID5
	    x300918_var_GuildAidB[varMap][7]  = GUID6
	    x300918_var_GuildAidB[varMap][8]  = GUID7
	    x300918_var_GuildAidB[varMap][9]  = GUID8
	    x300918_var_GuildAidB[varMap][10] = GUID9
	else
		x300918_var_GuildAidA[varMap][6]  = GUID5 
	    x300918_var_GuildAidA[varMap][7]  = GUID6
	    x300918_var_GuildAidA[varMap][8]  = GUID7
	    x300918_var_GuildAidA[varMap][9]  = GUID8
	    x300918_var_GuildAidA[varMap][10] = GUID9
	end
end




function x300918_ProcPlayerNewConnectEnter( varMap, varPlayer )

    
    local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

    local BattleSceneFlag = GetPlayerRuntimeData(varMap,varPlayer,RD_BATTLESCENE_ENTER_FLAG)
    if BattleSceneFlag == 0 then

        
        SetPlayerRuntimeData( varMap,varPlayer,RD_BATTLE_SCENE_KICK_DOWN,x300918_var_Kick_Down)

        local varName = GetName(varMap,varPlayer)
        if varName == nil then
            varName = "ErrorName"
        end
        local varMsg = format( "LBL:x300918_ProcPlayerNewConnectEnter 0,need kick,varMap=%d,varPlayer=%d,varName=%s", varMap, varPlayer, varName )
        WriteLog(1,varMsg)

    else

        
        
        
        local varName = GetName(varMap,varPlayer)
        if varName == nil then
            varName = "ErrorName"
        end
        local varMsg = format( "LBL:x300918_ProcPlayerNewConnectEnter 1,varMap=%d,varPlayer=%d,varName=%s", varMap, varPlayer, varName )
        WriteLog(1,varMsg)

        SetPlayerRuntimeData(varMap,varPlayer,RD_BATTLESCENE_ENTER_FLAG,0)

    end
end




function x300918_ProcPlayerDie( varMap, varPlayer, varKiller  )

    
    local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end
    
    
    local varStatus = x300918_var_BattleState[varMap]
    if varStatus ~= x300918_var_Laird_BeginBattle then
        return
    end
    
    
    local nGuildId = GetGuildID(varMap,varPlayer)
    if nGuildId ~= x300918_var_GuildA[varMap] and x300918_IsPlayerAidA(varMap,varPlayer) ~= 1 and
       nGuildId ~= x300918_var_GuildB[varMap] and x300918_IsPlayerAidB(varMap,varPlayer) ~= 1 then
        return
    end
    
    
    if GetCurCamp(varMap,varPlayer) == x300918_var_Guild_Camp_A then
    	x300918_var_ScoreB[varMap] = x300918_var_ScoreB[varMap] + 1
    end
    
    
    if GetCurCamp(varMap,varPlayer) == x300918_var_Guild_Camp_B then
    	x300918_var_ScoreA[varMap] = x300918_var_ScoreA[varMap] + 1
    end
    
    
    x300918_LairdSyncGuildScore(varMap)

    
    local nBeKilled = GetPlayerRuntimeData(varMap,varPlayer,RD_KING_BATTLE_BEKILLED ) + 1
    SetPlayerRuntimeData(varMap,varPlayer,RD_KING_BATTLE_BEKILLED,nBeKilled)

    
    

    











    
    

        local varStr = format("#G%s在【国家】领地争夺战中被杀死",GetName(varMap,varPlayer ) )
        LuaThisScenceM2Wrold(varMap,varStr,3,1)
        LuaThisScenceM2Wrold(varMap,varStr,2,1)
    

    















end




function x300918_CheckPlayerState( varMap,varPlayer )
    

    local varState
    local ErrorMsg

    varState = IsPlayerStateNormal(varMap,varPlayer )
    if varState == 0 then
        ErrorMsg = "状态异常"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_MENTALGAME )
    if varState == 1 then
        ErrorMsg = "处于答题状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_STALL )
    if varState == 1 then
        ErrorMsg = "处于设摊状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE )
    if varState == 1 then
        ErrorMsg = "处于死亡状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_CRASHBOX )
    if varState == 1 then
        ErrorMsg = "处于运镖状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_AUTOPLAY )
    if varState == 1 then
        ErrorMsg = "处于挂机状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_SUBTRAIN )
    if varState == 1 then
        ErrorMsg = "处于代练状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_BUS )
    if varState == 1 then
        ErrorMsg = "处于bus状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_TONGQUBUFF )
    if varState == 1 then
        ErrorMsg = "处于童趣状态，不能进入战场"
        return 1,ErrorMsg
    end

    varState = IsPlayerMutexState(varMap,varPlayer,PLAYER_STATE_PKMODE )
    if varState == 1 then
        ErrorMsg = "pk值过高或处于狂暴模式，不能进入战场"
        return 1,ErrorMsg
    end

    return 0

end




function x300918_ProcLairdBattleChangeScene( varMap,varPlayer,newSceneID,Flag )
    

    
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
		    SetPos( varMap , varPlayer , 68 ,76 )
        else
            SetPos( varMap , varPlayer , 182,181 )
        end
	else
        
        
        local varState,varMsg = x300918_CheckPlayerState( varMap,varPlayer )
        if varState == 1 then
            
            StartTalkTask(varMap)
            TalkAppendString( varMap, varMsg );
            StopTalkTask(varMap)
            DeliverTalkTips(varMap,varPlayer)
            return
        end

        
        local nCurX,nCurZ = GetWorldPos( varMap,varPlayer )
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_SCENE_PRE,varMap + 1)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSX_PRE,nCurX)
        SetPlayerRuntimeData(varMap,varPlayer,RD_HUMAN_POSZ_PRE,nCurZ)
        SetPlayerRuntimeData(varMap,varPlayer,RD_BATTLESCENE_ENTER_FLAG,1)

		NewWorld( varMap , varPlayer , newSceneID , PosX , PosZ,300918 )
	end
end

function x300918_DoPlayerRelive( varMap, varPlayer )
	
	if GetHp(varMap,varPlayer) > 0 then
		return
	end
	
    RestoreHp(varMap, varPlayer,0)
	RestoreRage(varMap, varPlayer,100)
	ClearMutexState(varMap, varPlayer, 6)
	SendReliveResult(varMap, varPlayer,1)	

    
    RelivePlayerNM(varMap,varPlayer,2)	
    SetPlayerMutexState(varMap,varPlayer,PLAYER_STATE_DIE,0)
end


function x300918_ProcPlayerRelive( varMap, varPlayer )







































end





function x300918_ProcBattleSceneReady( varMap,totalTime )

	local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

    
    x300918_var_CountDownState[varMap] = -1
    x300918_var_CountDownTime[varMap] = 10

    
    x300918_var_CountTime[varMap] = totalTime
    
    
    x300918_var_TempImpassable_Door2_State[varMap]	=	{  1,  1 }
    
    
    
    
    
    
    
    
    
    
    x300918_var_ScoreA[varMap] =	0
	x300918_var_ScoreB[varMap] =	0
	x300918_var_IntervalScoreA[varMap] =	0
	x300918_var_IntervalScoreB[varMap] =	0
    
    
end




function x300918_ShowLairdSceneInfo( varMap )
	
	local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end
    
    local nGuildId = GetSceneLairdGuildId(varMap)    
    if nGuildId < 0 then
    	return
    end
    
    local nCountryId = GetSceneLairdCountryId(varMap)
    if nCountryId < 0 or nCountryId > 3 then
    	return
    end
    
    local strGuildName = GetGuildName(nGuildId)
    local strGuildLeaderName = GetGuildLeaderName(nGuildId)
    local strCountryName = LuaCallNoclosure(888894,"GetCountryName",varMap,nCountryId)
    local strLairdSceneName = x300918_GetLairdSceneInfo_Name(varMap)
    
    local strMsg = format("领地争夺战结束，#G%s#o的#R%s#o占领了%s",strCountryName,strGuildName,strLairdSceneName)
    
    LuaAllScenceM2Wrold(varMap, strMsg, 2, 1)
	LuaAllScenceM2Wrold(varMap, strMsg, 3, 1)
    
end




function x300918_ProcBattleSceneClose( varMap )

	x300918_ShowLairdSceneInfo( varMap )
	
    if x300918_var_CountDownState[varMap] == 1 then
        return
    end

    local varStatus = x300918_var_BattleState[varMap]
	if varStatus == x300918_var_Laird_EndBattle then
		x300918_BattleGenResult( varMap,0 )
	end


end




function x300918_ProcBattleSceneTimer( varMap,varTime )
	
	
    x300918_FixBossCampOp( varMap )
    
    
    x300918_UpdateBossState(varMap)

    
    

    local BattleStatus = x300918_var_BattleState[varMap]
    if BattleStatus ~= x300918_var_Laird_BeginBattle then
    	
    	x300918_FullBossHp(varMap)
        return
    end

    
    
    local nTime = x300918_var_CountTime[varMap] - 1
    x300918_var_CountTime[varMap] = nTime

    
    
    if x300918_var_CountDownState[varMap] == 1 then

	    
	    local time = x300918_var_CountDownTime[varMap]
	    if time > 0 then

		    x300918_var_CountDownTime[varMap] = time - 1






		else

            
            
	    	

			
			x300918_var_BattleState[varMap]				   = -1
			x300918_var_GuildA[varMap]					   = -1
			x300918_var_GuildB[varMap]					   = -1
			x300918_var_CountryA[varMap]					   = -1
			x300918_var_CountryB[varMap]					   = -1
			x300918_var_LairdMapID[varMap]				   = -1
			x300918_var_HasLaird[varMap]					   = 0
			x300918_var_CountDownState[varMap]			   = -1
			x300918_var_CountDownTime[varMap]			   = -1
			x300918_var_CountTime[varMap]			       = -1
			x300918_var_GuildAidA[varMap]					= {}
			x300918_var_GuildAidB[varMap]					= {}
			
			
		    x300918_var_ScoreA[varMap] =	0
			x300918_var_ScoreB[varMap] =	0
			x300918_var_IntervalScoreA[varMap] =	0
			x300918_var_IntervalScoreB[varMap] =	0
            
            
            local varMsg = format("LBL:x300918_ProcBattleSceneTimer LairdBattleFinished,varMap=%d,LeaveTime h= %d,m=%d",varMap, floor(nTime/60),mod(nTime,60) )
            WriteLog(1,varMsg)

	    end

	    return

	end
	
	
	local nMod = mod(nTime,600)
	if nMod == 0 then
		
		x300918_FixBossHp(varMap)		
	end
	
































end




function x300918_FixBossCampOp( varMap )
	
	
	local nObjId = 1
	if IsObjValid(varMap,nObjId ) ~= 1 or GetHp(varMap,nObjId) <= 0 then
		return
	end
	
	
	
    local varStatus = x300918_var_BattleState[varMap]
    if varStatus ~= x300918_var_Laird_BeginBattle then
    
    	
        local nCurCamp = GetMonsterCamp(varMap,nObjId)		
		if nCurCamp == 20 then
			return
		end
		
		SetMonsterCamp(varMap,nObjId,20)
		return
		
    else
    	
    	
    	local nGuildId = GetSceneLairdGuildId( varMap )
		if nGuildId < 0 then
			
			
			local nCurCamp = GetMonsterCamp(varMap,nObjId)		
			if nCurCamp == 21 then
				return
			end
			
			SetMonsterCamp(varMap,nObjId,21)
			return
		else
			
			
			local nCountryId = GetSceneLairdCountryId(varMap)
			if nCountryId < 0 or nCountryId > 3 then
				return
			end
			
			local nToSetCamp = nCountryId + 16
			local nCurCamp = GetMonsterCamp(varMap,nObjId)		
			if nToSetCamp == nCurCamp then
				return
			end
			
			SetMonsterCamp(varMap,nObjId,nToSetCamp)
			return
		end
    end
		
end




function x300918_UpdateBossState(varMap)
	
	
	
	local nObjId = 1
	if IsObjValid(varMap,nObjId ) ~= 1 or GetHp(varMap,nObjId) <= 0 then
		return
	end
	
	
	if IsHaveSpecificImpact(varMap,nObjId,13524)~=1 then
		SendSpecificImpactToUnit(varMap, nObjId, nObjId, nObjId, 13524, 0)	
	end
	
	
	if IsHaveSpecificImpact(varMap,nObjId,8354)~=1 then
		SendSpecificImpactToUnit(varMap, nObjId, nObjId, nObjId, 8354, 0)	
	end
	
	
	
	for varI,item in x300918_var_SceneName do
		
		if item.Toggle == 1 and item.varMap == varMap then
			
			
			local nLairdLevel = GetSceneLairdLevel(varMap)
			if nLairdLevel == 1 then
				
				
				if item.Buf[1] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[1])~=1 then
					SendSpecificImpactToUnit(varMap, nObjId, nObjId, nObjId, item.Buf[1], 0)	
				end
				
				
				if item.Buf[2] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[2])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[2], 0)	
				end		
				
				if item.Buf[3] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[3])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[3], 0)	
				end
				
				if item.Buf[4] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[4])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[4], 0)	
				end
				
				if item.Buf[5] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[4])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[5], 0)	
				end
				
			elseif nLairdLevel == 2 then
				
				
				if item.Buf[2] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[2])~=1 then
					SendSpecificImpactToUnit(varMap, nObjId, nObjId, nObjId, item.Buf[2], 0)	
				end
				
				
				if item.Buf[1] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[1])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[1], 0)	
				end	
				
				if item.Buf[3] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[3])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[3], 0)	
				end
				
				if item.Buf[4] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[4])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[4], 0)	
				end
				
				if item.Buf[5] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[4])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[5], 0)	
				end
			elseif nLairdLevel == 3 then
				
				
				if item.Buf[3] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[3])~=1 then
					SendSpecificImpactToUnit(varMap, nObjId, nObjId, nObjId, item.Buf[3], 0)	
				end
				
				
				if item.Buf[1] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[1])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[1], 0)	
				end		
				
				if item.Buf[2] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[2])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[2], 0)	
				end
				
				if item.Buf[4] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[4])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[4], 0)	
				end
				
				if item.Buf[5] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[4])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[5], 0)	
				end
			elseif nLairdLevel == 4 then
				
				
				if item.Buf[4] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[4])~=1 then
					SendSpecificImpactToUnit(varMap, nObjId, nObjId, nObjId, item.Buf[4], 0)	
				end
				
				
				if item.Buf[1] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[1])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[1], 0)	
				end		
				
				if item.Buf[2] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[2])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[2], 0)	
				end		
				
				if item.Buf[3] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[3])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[3], 0)	
				end
				
				if item.Buf[5] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[4])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[5], 0)	
				end
				
			elseif nLairdLevel == 5 then
				
				
				if item.Buf[5] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[5])~=1 then
					SendSpecificImpactToUnit(varMap, nObjId, nObjId, nObjId, item.Buf[5], 0)	
				end
				
				
				
				if item.Buf[1] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[1])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[1], 0)	
				end		
				
				if item.Buf[2] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[2])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[2], 0)	
				end		
				
				if item.Buf[3] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[3])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[3], 0)	
				end
				
				if item.Buf[4] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[4])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[4], 0)	
				end
			
			else
				
				
				if item.Buf[1] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[1])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[1], 0)	
				end		
				
				if item.Buf[2] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[2])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[2], 0)	
				end		
				
				if item.Buf[3] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[3])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[3], 0)	
				end
				
				if item.Buf[4] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[4])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[4], 0)	
				end
				
				if item.Buf[5] ~= -1 and IsHaveSpecificImpact(varMap,nObjId,item.Buf[4])==1 then
					CancelSpecificImpact(varMap, nObjId,item.Buf[5], 0)	
				end
			
			end
			
			return
			
		end
		
	end

end




function x300918_FixBossHp(varMap)
	
	local nObjId = 1
	if IsObjValid(varMap,nObjId ) ~= 1 or GetHp(varMap,nObjId) <= 0 then
		return
	end
	
	
	local nHp = floor(GetMaxHp(varMap,nObjId)* 0.05)
	SetHp(varMap,nObjId,nHp)
end




function x300918_FullBossHp(varMap)

	local nObjId = 1
	if IsObjValid(varMap,nObjId ) ~= 1 then
		return
	end
	
	
	local nCurHp = GetHp(varMap,nObjId)
	if nCurHp <= 0 then
		return
	end
	
	
	if nCurHp == GetMaxHp(varMap,nObjId) then
		return
	end
	
	
	SetHp(varMap,nObjId,GetMaxHp(varMap,nObjId))
end




function x300918_CheckIsFinished( varMap )

    
    
    local nGuildA = x300918_var_GuildA[varMap]
    local nGuildB = x300918_var_GuildB[varMap]


	
    local nGuildA_MemberCount = 0
    local nGuildB_MemberCount = 0


    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local nGuildId = GetGuildID( varMap,varObj )
            if nGuildId == nGuildA or x300918_IsPlayerAidA(varMap,varObj) == 1 then		
                nGuildA_MemberCount = nGuildA_MemberCount + 1
            elseif nGuildId == nGuildB  or x300918_IsPlayerAidB(varMap,varObj) == 1  then
                nGuildB_MemberCount = nGuildB_MemberCount + 1
            end
        end
    end

    if nGuildA_MemberCount == 0 and nGuildB_MemberCount == 0 then
        return 1
    end

    
    if nGuildA_MemberCount == 0 and nGuildB_MemberCount > 0 then
        return 1
    end

    if nGuildB_MemberCount == 0 and nGuildA_MemberCount > 0 then
        return 1
    end

    return 0

end





function x300918_GetWinner(varMap)

	local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

    
    local nGuildA = x300918_var_GuildA[varMap]
    local nGuildB = x300918_var_GuildB[varMap]

    local nGuildA_MemberCount = 0
    local nGuildB_MemberCount = 0

    local nGuildA_GuildIn = 0
    local nGuildB_GuildIn = 0

    local nGuildA_GuilderDie = 0
    local nGuildB_GuilderDie = 0

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local nGuildId = GetGuildID( varMap,varObj )
            if nGuildId == nGuildA or x300918_IsPlayerAidA(varMap,varObj) == 1  then
                nGuildA_MemberCount = nGuildA_MemberCount + 1
            elseif nGuildId == nGuildB or x300918_IsPlayerAidB(varMap,varObj) == 1 then
                nGuildB_MemberCount = nGuildB_MemberCount + 1
            end

            local pos = GetGuildOfficial(varMap, varObj)
	        if pos == x300918_var_Leader_Index then
                if nGuildId == nGuildA then
                    nGuildA_GuildIn = 1
                    nGuildA_GuilderDie = GetPlayerRuntimeData(varMap,varObj,RD_KING_BATTLE_BEKILLED )
                else
                    nGuildB_GuildIn = 1
                    nGuildB_GuilderDie = GetPlayerRuntimeData(varMap,varObj,RD_KING_BATTLE_BEKILLED )
                end
            end
        end
    end


    
    local nScoreA = x300918_var_ScoreA[varMap] + x300918_var_IntervalScoreA[varMap]
    local nScoreB = x300918_var_ScoreB[varMap] + x300918_var_IntervalScoreB[varMap]
    
    
    if ( nGuildA_MemberCount == 0 and nGuildB_MemberCount == 0 ) or
       ( nGuildA_MemberCount ~= 0 and nGuildB_MemberCount ~= 0 ) then
       
    	
    	
    	
    	if nScoreA > nScoreB then
	    	
	    	return 0
	    elseif nScoreA < nScoreB then
	    	
	    	return 1
	    else
	    	
	    	
		    if nGuildA_MemberCount > 0 and nGuildB_MemberCount > 0 then
		    	
		    	
		    	
		    	
		        if nGuildA_MemberCount > nGuildB_MemberCount then
		        	
		            return 0
		        elseif nGuildA_MemberCount < nGuildB_MemberCount then
		        	
		            return 1
		        else
		        	
		        	
		            
		            if nGuildA_GuildIn == 1 and nGuildB_GuildIn == 0 then
		                
		                return 0
		            elseif nGuildA_GuildIn == 0 and nGuildB_GuildIn == 1 then
		                
		                return 1
		            else
		                
		                if nGuildA_GuilderDie > nGuildB_GuilderDie then
		                    return 1
		
		                elseif nGuildA_GuilderDie < nGuildB_GuilderDie then
		                    return 0
		                else
		                
		                	
		                	local nRandWin = random(0,1)
		                	if nRandWin < 0 then nRandWin = 0 end
		                	if nRandWin > 1 then nRandWin = 1 end
		                
		                    return nRandWin
		                end
		            end
		        end
		    else
		    	
		    	
		    	
		    	
            	local nRandWin = random(0,1)
            	if nRandWin < 0 then nRandWin = 0 end
            	if nRandWin > 1 then nRandWin = 1 end
            
                return nRandWin
		    end
	    end
    else
    	
    
	    
	    if nGuildA_MemberCount == 0 and nGuildB_MemberCount > 0 then
	        return 1
	    else
	        return 0
	    end
	end

    return 1
end




function x300918_BattleBonus( varMap,varPlayer,battleResult )

	local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

end




function x300918_LairdBattleBonus( varMap ,battleResult )

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            x300918_BattleBonus( varMap,varObj,battleResult)
        end
    end
end





function x300918_RestorePlayerCamp( varMap,varPlayer )
    local nCountryId = GetCurCountry( varMap,varPlayer )
    SetCurCamp(varMap,varPlayer,nCountryId )
end




function x300918_RestoreAllPlayerCamp( varMap )

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local nCountryId = GetCurCountry( varMap,varObj )
            SetCurCamp(varMap,varObj,nCountryId )
        end
    end
end





function x300918_BattleGenResult( varMap, callerId  )
    
    local nGuildA = x300918_var_GuildA[varMap]
    local nGuildB = x300918_var_GuildB[varMap]

    local nLairdMapId = x300918_var_LairdMapID[varMap]

    if nGuildA == nGuildB then
        return
    end































    
    x300918_var_CountDownState[varMap] = 1
    x300918_var_CountDownTime[varMap] = 10

    local nTime = x300918_var_CountTime[varMap]
        
    
    local varMsg = format("LBL:x300918_BattleGenResult varMap=%d,LeaveTime h= %d,m=%d,CallerId=%d",varMap, floor(nTime/60),mod(nTime,60), callerId )
    WriteLog(1,varMsg)

    x300918_var_GuildA[varMap] = -1
    x300918_var_GuildB[varMap] = -1
    
    x300918_var_CountryA[varMap] = -1
    x300918_var_CountryB[varMap] = -1
    
    x300918_var_GuildAidA[varMap]					= {}
	x300918_var_GuildAidB[varMap]					= {}

    
    
    
end




function x300918_LairdBattleKickPlayer( varMap,varPlayer )

    x300918_DoPlayerRelive( varMap,varPlayer )

    x300918_RestorePlayerCamp( varMap,varPlayer)

    
    SetPlayerRuntimeData(varMap,varPlayer,RD_BATTLESCENE_ENTER_FLAG,0)

    
    local nBakSceneId,varX,z = GetPlayerBakSceneInfo(varMap,varPlayer )
    if nBakSceneId >= 0 then
        NewWorld(varMap,varPlayer,nBakSceneId,varX,z,300918)
        return
    end

    
    local varCountry = GetCurCountry(varMap,varPlayer)
    if varCountry == 0 then
        
        
        local nDestSceneId = 50
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,300918)

    elseif varCountry == 1 then
        
        
        local nDestSceneId = 150
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,300918)

    elseif varCountry == 2 then

        
        local nDestSceneId = 250
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,300918)

    elseif varCountry == 3 then
        
        
        local nDestSceneId = 350
        local nPosX = 123
        local nPosZ = 57

        NewWorld(varMap,varPlayer,nDestSceneId,nPosX,nPosZ,300918)

    end
end




function x300918_LairdBattleKickAllPlayer( varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            
            x300918_LairdBattleKickPlayer( varMap,varObj)

        end
    end
end





function x300918_SyncBattleTimeToAllPlayer( varMap ,nTime )

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then

            TimerCommand( varMap, varObj, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, GUILDBATTLE_SCRIPTID,-1,-1);                 

            if nTime > 0 then
                TimerCommand( varMap, varObj, 2, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, GUILDBATTLE_SCRIPTID, nTime, nTime );
            end
        end
    end    
end




function x300918_SyncBattleTimeCloseToAllPlayer(varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then

            TimerCommand( varMap, varObj, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, GUILDBATTLE_SCRIPTID,-1,-1);                 
        end
    end    

end




function x300918_SyncGuildPower( varMap )
    
    local nGuildA = x300918_var_GuildA[varMap]
    local nGuildB = x300918_var_GuildB[varMap]

    local nGuildA_Count = 0
    local nGuildB_Count = 0

    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local nGuildId = GetGuildID( varMap,varObj )
            if nGuildId == nGuildA or x300918_IsPlayerAidA(varMap,varObj) == 1 then
                nGuildA_Count = nGuildA_Count + 1
            elseif nGuildId == nGuildB or x300918_IsPlayerAidB(varMap,varObj) == 1 then
                nGuildB_Count = nGuildB_Count + 1
            end
        end
    end

    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            GameBattleSyncPowerInfo(varMap,varObj,nGuildA_Count,nGuildB_Count,2)
        end
    end

end




function x300918_UpdateSceneDataFlag( varMap )

    local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end
    
    ClearSceneMapDataFlag( varMap )

	
	

    
    local GuildLeaderA = -1
    local GuildLeaderB = -1
    
    local nGuildA = x300918_var_GuildA[varMap]
    local nGuildB = x300918_var_GuildB[varMap]

    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            
            local pos = GetGuildOfficial(varMap, varObj)
	        if pos == x300918_var_Leader_Index then
                local nGuild = GetGuildID( varMap,varObj )
                if nGuild == nGuildA then
                    GuildLeaderA = varObj
                elseif nGuild == nGuildB then
                    GuildLeaderB = varObj
                end
            end
        end
    end


    local a_leader_name = ""
    local a_leader_x = 0
    local a_leader_z = 0
    
    if GuildLeaderA > 0 then
        
        a_leader_name = GetName(varMap,GuildLeaderA)
        a_leader_x,a_leader_z = GetWorldPos(varMap,GuildLeaderA)
    end

    local b_leader_name = ""
    local b_leader_x = 0
    local b_leader_z = 0
    
    if GuildLeaderB > 0 then

        b_leader_name = GetName(varMap,GuildLeaderB)
        b_leader_x,b_leader_z = GetWorldPos(varMap,GuildLeaderB)
    end

    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            
            if GuildLeaderA > 0 and GuildLeaderA ~= varObj then
                SetSceneMapDataFlagToPlayer( varMap,varObj,12,8,a_leader_name,a_leader_x,a_leader_z,-1)
            end

            if GuildLeaderB > 0 and GuildLeaderB ~= varObj then
                SetSceneMapDataFlagToPlayer( varMap,varObj,13,8,b_leader_name,b_leader_x,b_leader_z,-1)
            end
        end
    end
end




function x300918_ProcSyncLairdBattleTime( varMap,nTime )
    
    if x300918_GetLairdBattleSceneScript( varMap ) == 0 then
        return
    end

    local nTime_new = x300918_var_TotalBattleTime - NumberCastIntToUInt( nTime )
    x300918_var_CountTime[varMap] = nTime_new
    
    if x300918_var_GuildA[varMap] ~= -1 then
    	WriteLog(1,"LBL:x300918_ProcSyncLairdBattleTime x300918_var_CountTime[varMap]=%d",x300918_var_CountTime[varMap])
    end

    
    
    
end




function x300918_SetAllPlayerNeedKick( varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local KickDown = GetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ) 
            if KickDown <= 0 or KickDown > x300918_var_Kick_Down then                
                SetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ,x300918_var_Kick_Down) 
            end
        end
    end
end




function x300918_UpdatePlayerKickState( varMap )
    
    local varHumanCount = GetScenePlayerCount( varMap )
    local varI = 0
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local KickDown = GetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ) 
            if KickDown > 0 then                
                KickDown = KickDown - 1 
                if KickDown == 0 then
                    
                    SetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ,-1) 
                    x300918_LairdBattleKickPlayer( varMap,varObj )                    
                else
                    
                    SetPlayerRuntimeData( varMap,varObj,RD_BATTLE_SCENE_KICK_DOWN ,KickDown) 
                end
            end
        end
    end
end




function x300918_CreateBoss(varMap)

	x300918_DestroyBoss(varMap)

	x300918_var_BossA[varMap] = {}
	x300918_var_BossB[varMap] = {}

	
	local nIndexFrom = GetFubenDataPosByScriptID( x300918_var_FileId )
	local nDataCount = GetFubenDataCountByScriptID( x300918_var_FileId )
	
	
	local varMsg = format("LBL:x300918_CreateBoss before varMap=%d,varMonsterCount=%d,si = %d,sc = %d",varMap,GetMonsterCount(varMap),nIndexFrom,nDataCount)
	WriteLog(1,varMsg)
	
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x300918_var_FileId,nIndexFrom,varI)
		
		
		
		if idScript == x300918_var_FileId then
			
            for j=0,varCount -1 do
            
            	local lx = varX + random(-r,r)
            	local lz = z + random(-r,r)
            	
            	if varFlag == 0 and varFlag1 >= 1 and varFlag1 <= 3  then
            	
            		
					if title~="" then
						local varObj = CreateMonster(varMap, type, lx, lz, ai, aiscript, x300918_var_FileId, -1, camp, -1,facedir, "", title)
						x300918_var_BossA[varMap][varFlag1] = varObj
					else
						local varObj = CreateMonster(varMap, type, lx, lz, ai, aiscript, x300918_var_FileId, -1, camp, -1,facedir)
						x300918_var_BossA[varMap][varFlag1] = varObj
					end
					
				elseif varFlag == 1 and varFlag1 >= 1 and varFlag1 <= 3 then
					
					
					if title~="" then
						local varObj = CreateMonster(varMap, type, lx, lz, ai, aiscript, x300918_var_FileId, -1, camp, -1,facedir, "", title)
						x300918_var_BossB[varMap][varFlag1] = varObj
					else
						local varObj = CreateMonster(varMap, type, lx, lz, ai, aiscript, x300918_var_FileId, -1, camp, -1,facedir)
						x300918_var_BossB[varMap][varFlag1] = varObj
					end
				end
			end
        end
	end
	
	
	varMsg = format("LBL:x300918_CreateBoss after varMap=%d,varMonsterCount=%d",varMap,GetMonsterCount(varMap))
	WriteLog(1,varMsg)
end




function x300918_DestroyBoss(varMap)
	
	if x300918_var_BossA[varMap] ~= nil then
	
		
		for varI,item in x300918_var_BossA[varMap] do
			
			if item >=0 and IsObjValid(varMap,item) == 1 and GetHp(varMap,item) > 0 then
				DeleteMonster(varMap,item)
			end
		end
		
		x300918_var_BossA[varMap] = nil
	
	end
	
	
	if x300918_var_BossB[varMap] ~= nil then
	
		
		for varI,item in x300918_var_BossB[varMap] do
			
			if item >=0 and IsObjValid(varMap,item) == 1 and GetHp(varMap,item) > 0 then
				DeleteMonster(varMap,item)
			end
		end
		
		x300918_var_BossB[varMap] = nil
		
	end
	
end





function x300918_ProcGenerateLaird(varMap,nResult,nGuildA,nGuildB )
	
	GameBattleSendResultToGL( x300918_var_BattleType,nResult,x300918_var_LairdMapID[varMap],nGuildA,nGuildB)
	
end




function x300918_ProcLairdLevelup(varMap,nLairdMapId)
	
	local nRandom = random(1,100)
	if nRandom > 10 then
		return
	end
	
	local _,strLairdSceneName = GetBattleSceneNameNM(nLairdMapId)
	local nLairdSceneLevel = GetSceneLairdLevel(nLairdMapId)
	local strMsg = nil
	
	if varMap == 76 then
		
		
		CreateMonster(varMap, 3059, 211, 203, 24, -1, -1, -1, 21, -1, 0, "", "" )
		strMsg = format("%s图腾升级，触发天变，楼兰暗道出现天龙之魂",strLairdSceneName)
		
	elseif varMap == 176 then
	
		CreateMonster(varMap, 3059,  43,  35, 24, -1, -1, -1, 21, -1, 0, "", "" )
		strMsg = format("%s图腾升级，触发天变，天山暗道出现天龙之魂",strLairdSceneName)

	elseif varMap == 276 then
	
		CreateMonster(varMap, 3059, 211, 203, 24, -1, -1, -1, 21, -1, 0, "", "" )
		strMsg = format("%s图腾升级，触发天变，昆仑暗道出现天龙之魂",strLairdSceneName)

	elseif varMap == 376 then
	
		CreateMonster(varMap, 3059,  43,  35, 24, -1, -1, -1, 21, -1, 0, "", "" )
		strMsg = format("%s图腾升级，触发天变，敦煌暗道出现天龙之魂",strLairdSceneName)
		
	end
	
	if strMsg ~= nil then
	
		
	
		LuaAllScenceM2Wrold(varMap,strMsg,CHAT_PLANE_SCROLL,1)
		LuaAllScenceM2Wrold(varMap,strMsg,CHAT_LEFTDOWN,1)
		LuaAllScenceM2Wrold(varMap,strMsg,CHAT_MAIN_RIGHTDOWN,1)
	end
	
	
end




function x300918_ProcDie(varMap,varPlayer,varKiller)
	
	
	local ObjType = GetObjType(varMap, varKiller)
	if ObjType == 3 then
		ObjType = 1
		varKiller = GetOwnerID(varMap, varKiller)
	end
	
	
	if varKiller < 0 or IsPlayerStateNormal(varMap,varKiller) ~= 1 then
		
		return
	end

    
    local varScriptFileId = x300918_GetLairdBattleSceneScript( varMap )
    if  varScriptFileId == 0 then
        return
    end

	
    local varStatus = x300918_var_BattleState[varMap]
    if varStatus ~= x300918_var_Laird_BeginBattle then
        return
    end

	
	local nGuildId = GetGuildID(varMap,varKiller)
	local nGuildA = x300918_var_GuildA[varMap]
	local nGuildB = x300918_var_GuildB[varMap]
	
	if nGuildA == nGuildB then
		return
	end
	
	local varCountryID = GetCurCountry(varMap,varKiller)
	
	if varCountryID == x300918_var_CountryA[varMap]  then
		x300918_ProcGenerateLaird(varMap,0,nGuildA,nGuildB )
		
        local strGuildName = GetGuildName(nGuildA)
        local strGuildLeaderName = GetGuildLeaderName(nGuildA)
        local strLairdSceneName = x300918_GetLairdSceneInfo_Name(varMap)
        
        local varStr = format("#G%s帮会在帮主%s的带领下占领了%s。",strGuildName,strGuildLeaderName,strLairdSceneName)
        LuaAllScenceM2Wrold(varMap, varStr, 2, 1)
        LuaAllScenceM2Wrold(varMap, varStr, 3, 1)
        
        local nCampId = GetCurCountry(varMap,varKiller) + 16
        SetMonsterCamp(varMap,varPlayer,nCampId)
		
	elseif varCountryID == x300918_var_CountryB[varMap]  then
		x300918_ProcGenerateLaird(varMap,1,nGuildA,nGuildB )
		
		local strGuildName = GetGuildName(nGuildB)
        local strGuildLeaderName = GetGuildLeaderName(nGuildB)
        local strLairdSceneName = x300918_GetLairdSceneInfo_Name(varMap)
        
        local varStr = format("#G%s帮会在帮主%s的带领下占领了%s。",strGuildName,strGuildLeaderName,strLairdSceneName)
        LuaAllScenceM2Wrold(varMap, varStr, 2, 1)
        LuaAllScenceM2Wrold(varMap, varStr, 3, 1)
        
        local nCampId = GetCurCountry(varMap,varKiller) + 16
        SetMonsterCamp(varMap,varPlayer,nCampId)
	end
	


































































end




function x300918_ProcBossDie(varMap, varFlag )

	if varFlag == 0 then
		
		local nBossACount = getn(x300918_var_BossA[varMap])
		local nBossADieCount = 0
		for varI,item in x300918_var_BossA[varMap] do
			if x300918_var_BossA[varMap][varI] == -1 then
				nBossADieCount = nBossADieCount + 1
			end			
		end
		
		if nBossADieCount == nBossACount -1 then
			
			local varObj = x300918_var_BossA[varMap][nBossACount]
			if varObj >=0 and IsObjValid(varMap,varObj) == 1 and GetHp(varMap,varObj) > 0 then
				SetMonsterCamp(varMap,varObj,x300918_var_Guild_Camp_A)
			end
		end
		
	elseif varFlag == 1 then
		
		local nBossBCount = getn(x300918_var_BossB[varMap])
		local nBossBDieCount = 0
		for varI,item in x300918_var_BossB[varMap] do
			if x300918_var_BossB[varMap][varI] == -1 then
				nBossBDieCount = nBossBDieCount + 1
			end			
		end
		
		if nBossBDieCount == nBossBCount -1 then
			
			local varObj = x300918_var_BossB[varMap][nBossBCount]
			if varObj >=0 and IsObjValid(varMap,varObj) == 1 and GetHp(varMap,varObj) > 0 then
				SetMonsterCamp(varMap,varObj,x300918_var_Guild_Camp_B)
			end
		end
	end	
end




function x300918_GetDoorA(varMap)
	return x300918_var_DoorGrowPointA
end




function x300918_GetDoorB(varMap)	
	return x300918_var_DoorGrowPointB
end




function x300918_ResetDoorA(varMap)

	x300918_var_DoorGrowPointA_LairdState[varMap] = { LairdCountDownState = 0,LairdCountDownTime = -1,LairdCamp = -1 }
	RecycleGrowPointByType(varMap,x300918_var_DoorGrowPointA,1000)
	
	local varMsg = format("LBL:x300918_ResetDoorA varMap=%d",varMap)
	WriteLog(1,varMsg)
end




function x300918_ResetDoorB(varMap)
	x300918_var_DoorGrowPointB_LairdState[varMap] = { LairdCountDownState = 0,LairdCountDownTime = -1,LairdCamp = -1 }
	RecycleGrowPointByType(varMap,x300918_var_DoorGrowPointB,1000)
	
	local varMsg = format("LBL:x300918_ResetDoorB varMap=%d",varMap)
	WriteLog(1,varMsg)
end





function x300918_ProcGpOpenDoorA_Check(varMap,varPlayer)
	
	
	local nCampId = GetCurCamp(varMap,varPlayer)
	if nCampId ~= x300918_var_Guild_Camp_B then
		return 1
	end

	return 0	
end




function x300918_ProcGpOpenDoorB_Check(varMap,varPlayer)

	
	local nCampId = GetCurCamp(varMap,varPlayer)
	if nCampId ~= x300918_var_Guild_Camp_A then
		return 1
	end
	
	return 0
end




function x300918_ProcGpOpenDoorA(varMap,varPlayer)
	
	
	local nCampId = GetCurCamp(varMap,varPlayer)
	if nCampId ~= x300918_var_Guild_Camp_B then
		return 0
	end

	
	x300918_var_TempImpassable_Door2_State[varMap][1] = 0
	
	
	x300918_ClearTempImpassable_Door2(varMap,1)
	
	
	SetGrowPointIntervalContainer(varMap,x300918_var_DoorGrowPointA,-1)
	
	
	local varMsg = "斯拉夫联军内城大门被亚洲联军攻破"
	LuaThisScenceM2Wrold( varMap,varMsg,3,1)
	LuaThisScenceM2Wrold( varMap,varMsg,2,1)
	
	local varMsg = format("LBL:x300918_ProcGpOpenDoorA varMap=%d",varMap)
	WriteLog(1,varMsg)
	
	return 1	
end




function x300918_ProcGpOpenDoorB(varMap,varPlayer)

	
	local nCampId = GetCurCamp(varMap,varPlayer)
	if nCampId ~= x300918_var_Guild_Camp_A then
		return 0
	end

	
	x300918_var_TempImpassable_Door2_State[varMap][2] = 0
	
	
	x300918_ClearTempImpassable_Door2(varMap,2)
	
	
	SetGrowPointIntervalContainer(varMap,x300918_var_DoorGrowPointB,-1)
	
	
	local varMsg = "亚洲联军内城大门被斯拉夫联军攻破"
	LuaThisScenceM2Wrold( varMap,varMsg,3,1)
	LuaThisScenceM2Wrold( varMap,varMsg,2,1)
	
	local varMsg = format("LBL:x300918_ProcGpOpenDoorB varMap=%d",varMap)
	WriteLog(1,varMsg)
	
	return 1
end




function x300918_SetTempImpassable_Door1_Effect(varMap,varPlayer)
	
	if x300918_var_CountTime[varMap] <= 18*60 then
		return
	end
	
	for varI,itm in x300918_var_TempImpassable_Door1_Effect do
		LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,varPlayer,itm )		
	end
	
	
	local varMsg = format("LBL:x300918_SetTempImpassable_Door1_Effect varMap=%d varName=%s",varMap,GetName(varMap,varPlayer))
	WriteLog(1,varMsg)
	
end




function x300918_ClearTempImpassable_Door1_Effect(varMap,varPlayer)
	for varI,itm in x300918_var_TempImpassable_Door1_Effect do
		LuaCallNoclosure(UTILITY_SCRIPT,"StopEffect",varMap,varPlayer,itm )		
	end
	
	local varMsg = format("LBL:x300918_ClearTempImpassable_Door1_Effect varMap=%d varName=%s",varMap,GetName(varMap,varPlayer))
	WriteLog(1,varMsg)
end





function x300918_SetTempImpassable_Door1(varMap)
	for varI,itm in x300918_var_TempImpassable_Door1 do
		AddSceneTempImpassable(varMap,itm.Left,itm.Top,itm.Right,itm.Bottom)
	end
	
	local varMsg = format("LBL:x300918_SetTempImpassable_Door1 varMap=%d",varMap)
	WriteLog(1,varMsg)
end




function x300918_ClearTempImpassable_Door1(varMap)
	
	
	LuaThisScenceM2Wrold( varMap,"战斗开始",5,1)
	
	
	for varI,itm in x300918_var_TempImpassable_Door1 do
		DelSceneTempImpassable(varMap,itm.Left,itm.Top,itm.Right,itm.Bottom)
	end
	
	
	local varHumanCount = GetScenePlayerCount( varMap )
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 and IsPlayerStateNormal(varMap,varObj) == 1 then
            x300918_ClearTempImpassable_Door1_Effect(varMap,varObj)
        end
    end
    
    
    x300918_CreateBoss(varMap)
    
    local varMsg = format("LBL:x300918_ClearTempImpassable_Door1 varMap=%d",varMap)
	WriteLog(1,varMsg)
end




function x300918_SetTempImpassable_Door2_Effect(varMap,varPlayer)
	for varI,itm in x300918_var_TempImpassable_Door2_State[varMap] do
		if itm == 1 then
			LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,varPlayer,x300918_var_TempImpassable_Door2_Effect[varI] )		
		end
	end	
	
	local varMsg = format("LBL:x300918_SetTempImpassable_Door2_Effect varMap=%d varName=%s",varMap,GetName(varMap,varPlayer))
	WriteLog(1,varMsg)
end




function x300918_ClearTempImpassable_Door2_Effect(varMap,varPlayer,varIndex)

	if varIndex < 1 or varIndex > getn(x300918_var_TempImpassable_Door2_Effect) then
		return
	end
	
	local itm = x300918_var_TempImpassable_Door2_Effect[varIndex]
	LuaCallNoclosure(UTILITY_SCRIPT,"StopEffect",varMap,varPlayer,itm )
	
	local varMsg = format("LBL:x300918_ClearTempImpassable_Door2_Effect varMap=%d varName=%s varIndex=%d",varMap,GetName(varMap,varPlayer),varIndex)
	WriteLog(1,varMsg)
end





function x300918_SetTempImpassable_Door2(varMap)
	
	for varI,itm in x300918_var_TempImpassable_Door2 do
		AddSceneTempImpassable(varMap,itm.Left,itm.Top,itm.Right,itm.Bottom)
	end
	
	local varMsg = format("LBL:x300918_SetTempImpassable_Door2 varMap=%d",varMap)
	WriteLog(1,varMsg)
end




function x300918_ClearTempImpassable_Door2(varMap,varIndex)
	
	if varIndex < 1 or varIndex > getn(x300918_var_TempImpassable_Door2) then
		return
	end
	
	
	local itm = x300918_var_TempImpassable_Door2[varIndex]
	DelSceneTempImpassable(varMap,itm.Left,itm.Top,itm.Right,itm.Bottom)
	
	
	local varHumanCount = GetScenePlayerCount( varMap )
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 and IsPlayerStateNormal(varMap,varObj) == 1 then
            x300918_ClearTempImpassable_Door2_Effect(varMap,varObj,varIndex)
        end
    end
    
    local varMsg = format("LBL:x300918_ClearTempImpassable_Door2_Effect varMap=%d varIndex=%d",varMap,varIndex)
	WriteLog(1,varMsg)
end




function x300918_LairdSyncGuildScore(varMap)
	







	
	
end




function x300918_TransGuildMemberToAround(varMap,varPlayer,campId,varX,z)

	
	if IsPlayerStateNormal(varMap,varPlayer) ~= 1 or GetHp(varMap,varPlayer) <= 0 then
		return
	end
	
	
	local nSelfCamp = GetCurCamp(varMap,varPlayer)
	if nSelfCamp ~= campId then
		return
	end
	
	local varMsg = "帮主使用了领主战场召集,将你召唤到他的身边!"

	
	local varHumanCount = GetScenePlayerCount( varMap )
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj ~=  varPlayer and IsPlayerStateNormal(varMap,varObj) == 1 and GetHp(varMap,varObj) > 0 and GetCurCamp(varMap,varObj) == campId then
        	
        	local tx = varX + random(-3,3)
        	local tz = z + random(-3,3)
        	
            SetPos(varMap,varObj,tx,tz)
            
            Msg2Player(varMap, varObj, varMsg, 8, 2)
            Msg2Player(varMap, varObj, varMsg, 8, 3)
        end
    end	
	
end




function x300918_GetBattleScoreA(varMap)
	return x300918_var_ScoreA[varMap]
end




function x300918_GetBattleScoreB(varMap)
	return x300918_var_ScoreB[varMap]
end




function x300918_SetBattleScoreA(varMap,nScore)
	
	x300918_var_ScoreA[varMap] = nScore
	
	if x300918_var_ScoreA[varMap] < 0 then
		x300918_var_ScoreA[varMap] = 0 
	end
	
	x300918_LairdSyncGuildScore(varMap)	
end




function x300918_SetBattleScoreB(varMap,nScore)
	x300918_var_ScoreB[varMap] = nScore
	
	if x300918_var_ScoreB[varMap] < 0 then
		x300918_var_ScoreB[varMap] = 0 
	end
	
	x300918_LairdSyncGuildScore(varMap)	
end





function x300918_ProcAreaEnteredA(varMap, varPlayer, varArea, varQuest)
end




function x300918_ProcAreaLeavedA(varMap,varPlayer,varArea,varQuest)
end




function x300918_ProcAreaEnteredB(varMap, varPlayer, varArea, varQuest)
end




function x300918_ProcAreaLeavedB(varMap,varPlayer,varArea,varQuest)
end
