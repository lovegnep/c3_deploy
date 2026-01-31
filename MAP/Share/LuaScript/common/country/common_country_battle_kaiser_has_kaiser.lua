--皇帝战的相关脚本-----有皇帝的争夺战

x310122_var_FileId		 											= 310122

x310122_var_AssistantFileId									=	310123
x310122_var_PrintDebugLog										=	0 --debug输出
x310122_var_PrintInfoLog										=	1	--输出基本调用信息日志

x310122_var_MapID														= SCENE_BATTLE_KAISER	--皇帝战场景Id
x310122_var_DeathPlayerReliveInterval				= 0 --死亡玩家复活间隔 秒为单位
x310122_var_LoopInterval										=	1000 --循环的间隔 毫秒
x310122_var_FinishStep											=	3 --完成的总步骤,即当到达这个阶段为提前完成
x310122_var_BackroomTrasfer									=	24 --密室传送区域的Id

x310122_var_TransferToBackroom							=	"shabaketohuanggongmishi"

x310122_var_ReliveNotice										=	"皇帝战期间,只能使用皇帝战回魂丹才能原地复活" --复活提示
x310122_var_GameBattleOverBroadcast					=	"%s获得了本次皇帝战的胜利!!!"
x310122_var_GameBattleOverBroadcastNoKaiser	=	"很遗憾,本次没有皇帝产生"

x310122_var_DoorButton											=	"我要出去" --大门的Button显示
x310122_var_EnableRole									    = 1
x310122_var_ReliveItemId										=	11990401

--国家变量使用
x310122_var_IsKaiser												= {0, 2}	--标识是否为皇帝国
x310122_var_KaiserConcatenationTempCount		=	{10, 7} --皇帝连任临时次数
x310122_var_LastKaiserDay										=	{0, 15}	--上次获取皇帝的日期

x310122_var_Backroom												=	{564, 64, 115} --密室的传送点

--Npc的信息表
x310122_var_NpcInfoTable										=	
{
	--x310122_var_Tower1											=			--塔的信息
	{
		var_TypeId						=	3951,
		var_Guid							=	401111,											--做唯一标识
		var_RelatingGuid			=	0,												--相关联删除的Id
		var_RelatingArea			=	0,												--相关联的区域
		var_BaseAI						=	3,
		var_AI								=	0,
		var_Pos								=	{230, 297},
		var_AddBuff						=	{},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	-1,												--完成后的占位
		var_DynamicCreate			=	0,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	-1,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	1													--是否存在,动态改变
	},
	
	{	--影子1
		var_TypeId						=	3952,
		var_Guid							=	401112,										--做唯一标识
		var_RelatingGuid			=	401111,										--相关联删除的Id
		var_RelatingArea			=	0,												--相关联的区域
		var_BaseAI						=	22,
		var_AI								=	0,
		var_Pos								=	{230, 297},
		var_AddBuff						=	{7989,7990},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	-1,												--完成后的占位
		var_DynamicCreate			=	0,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	0,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	1													--是否存在,动态改变
	},
	
	--x310122_var_Tower2											=			--塔的信息
	{
		var_TypeId						=	3951,
		var_Guid							=	401113,											--做唯一标识
		var_RelatingGuid			=	0,												--相关联删除的Id
		var_RelatingArea			=	0,												--相关联的区域
		var_BaseAI						=	3,
		var_AI								=	0,
		var_Pos								=	{280, 296},
		var_AddBuff						=	{},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	-1,												--完成后的占位
		var_DynamicCreate			=	0,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	-1,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	1													--是否存在,动态改变
	},
	
	{	--影子2
		var_TypeId						=	3952,
		var_Guid							=	401114,											--做唯一标识
		var_RelatingGuid			=	401113,												--相关联删除的Id
		var_RelatingArea			=	0,												--相关联的区域
		var_BaseAI						=	22,
		var_AI								=	0,
		var_Pos								=	{280, 296},
		var_AddBuff						=	{7989,7990},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	-1,												--完成后的占位
		var_DynamicCreate			=	0,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	0,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	1													--是否存在,动态改变
	},
	
	--x310122_var_Tower3											=			--塔的信息
	{
		var_TypeId						=	3951,
		var_Guid							=	401115,											--做唯一标识
		var_RelatingGuid			=	0,												--相关联删除的Id
		var_RelatingArea			=	0,												--相关联的区域
		var_BaseAI						=	3,
		var_AI								=	0,
		var_Pos								=	{279, 317},
		var_AddBuff						=	{},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	-1,												--完成后的占位
		var_DynamicCreate			=	0,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	-1,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	1													--是否存在,动态改变
	},
	
	{	--影子3
		var_TypeId						=	3952,
		var_Guid							=	401116,											--做唯一标识
		var_RelatingGuid			=	401115,												--相关联删除的Id
		var_RelatingArea			=	0,												--相关联的区域
		var_BaseAI						=	22,
		var_AI								=	0,
		var_Pos								=	{279, 317},
		var_AddBuff						=	{7989,7990},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	-1,												--完成后的占位
		var_DynamicCreate			=	0,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	0,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	1													--是否存在,动态改变
	},
	
	--x310122_var_Tower4											=			--塔的信息
	{
		var_TypeId						=	3951,
		var_Guid							=	401117,											--做唯一标识
		var_RelatingGuid			=	0,												--相关联删除的Id
		var_RelatingArea			=	0,												--相关联的区域
		var_BaseAI						=	3,
		var_AI								=	0,
		var_Pos								=	{230, 317},
		var_AddBuff						=	{},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	-1,												--完成后的占位
		var_DynamicCreate			=	0,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	-1,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	1													--是否存在,动态改变
	},
	
	{	--影子4
		var_TypeId						=	3952,
		var_Guid							=	401118,											--做唯一标识
		var_RelatingGuid			=	401117,												--相关联删除的Id
		var_RelatingArea			=	0,												--相关联的区域
		var_BaseAI						=	22,
		var_AI								=	0,
		var_Pos								=	{230, 317},
		var_AddBuff						=	{7989,7990},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	-1,												--完成后的占位
		var_DynamicCreate			=	0,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	0,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	1													--是否存在,动态改变
	},

		--x310122_var_OutTower											=			--外塔的信息
	{
		var_TypeId						=	3958,
		var_Guid							=	401119,											--做唯一标识
		var_RelatingGuid			=	0,												--相关联删除的Id
		var_RelatingArea			=	0,												--相关联的区域
		var_BaseAI						=	25,
		var_AI								=	0,
		var_Pos								=	{254, 306},
		var_AddBuff						=	{7989},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	1,												--完成后的占位
		var_DynamicCreate			=	0,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	0,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	1													--是否存在,动态改变
	},
	
	
	--x310122_var_BlockNpcInfo								=    	--阻挡npc的信息,(大门)
	{
		var_TypeId						=	3965,
		var_Guid							=	401120,											--做唯一标识
		var_RelatingGuid			=	0,												--相关联删除的Id
		var_RelatingArea			=	1,												--相关联的区域
		var_BaseAI						=	3,
		var_AI								=	0,
		var_Pos								=	{254.5, 217},
		var_AddBuff						=	{7989,7990},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	-1,												--完成后的占位
		var_DynamicCreate			=	1,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	0,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	0													--是否存在,动态改变
	}	,
	
	
	--x310122_var_Pillar											=    	--柱子信息
	{
		var_TypeId						=	3973,
		var_Guid							=	401121,											--做唯一标识
		var_RelatingGuid			=	0,												--相关联删除的Id
		var_RelatingArea			=	0,												--相关联的区域
		var_BaseAI						=	25,
		var_AI								=	0,
		var_Pos								=	{254.5, 186.5},
		var_AddBuff						=	{7989},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	2,												--完成后的占位
		var_DynamicCreate			=	0,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	0,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	1													--是否存在,动态改变
	},
	
	
		--x310122_var_BlockNpcInfo1								=    	--阻挡npc的信息,(大门)1
	{
		var_TypeId						=	3979,
		var_Guid							=	401122,											--做唯一标识
		var_RelatingGuid			=	0,												--相关联删除的Id
		var_RelatingArea			=	2,												--相关联的区域
		var_BaseAI						=	3,
		var_AI								=	0,
		var_Pos								=	{210, 174},
		var_AddBuff						=	{7989,7990},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	-1,												--完成后的占位
		var_DynamicCreate			=	1,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	0,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	0													--是否存在,动态改变
	}	,
		--x310122_var_BlockNpcInfo2								=    	--阻挡npc的信息,(大门)2
	{
		var_TypeId						=	3979,
		var_Guid							=	401123,											--做唯一标识
		var_RelatingGuid			=	0,												--相关联删除的Id
		var_RelatingArea			=	3,												--相关联的区域
		var_BaseAI						=	3,
		var_AI								=	0,
		var_Pos								=	{302, 174},
		var_AddBuff						=	{7989,7990},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	-1,												--完成后的占位
		var_DynamicCreate			=	1,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	0,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	0													--是否存在,动态改变
	}	,

	--x310122_var_totem												=			--图腾信息
	{
		var_TypeId						=	3986,
		var_Guid							=	401124,											--做唯一标识
		var_RelatingGuid			=	0,												--相关联删除的Id
		var_RelatingArea			=	4,												--相关联的区域
		var_BaseAI						=	25,
		var_AI								=	0,
		var_Pos								=	{255, 114},
		var_AddBuff						=	{7989},										--给所有指定NPC添加一个免疫Buff
		var_FinishBit					=	3,												--完成后的占位
		var_DynamicCreate			=	0,												--标识是否只有战争时才存在的
		var_ChangeCampStep		=	0,												--改变阵营的步骤
		var_CampId						=	20,
		var_ObjId							=	-1,												--动态创建的ObjId
		var_IsExist						=	1													--是否存在,动态改变
	},
	

}

--攻防buff表,给攻击方增加的buff,根据连任次数来选择给攻击方增加哪些buff
x310122_var_AttackBuffTable									=
{
	{	 --第一次的
		{}, --给守方的buff
		{}  --给攻方的buff
	},
	{	 --第2次的
		{}, --给守方的buff
		{30561}  --给攻方的buff
	},
	{	 --第3次的
		{}, --给守方的buff
		{30562}	--给攻方的buff
	},
		{	 --第4次的
		{}, --给守方的buff
		{30563}	--给攻方的buff
	},
		{	 --第5次的
		{}, --给守方的buff
		{30564}	--给攻方的buff
	},
}

--传送区域的信息
x310122_var_TransferAreaInfo								= 		--传送区域的信息
{
	{
		var_Open	=	0,
		var_ToX		=	255,
		var_ToZ		=	211
	},
	{
		var_Open	=	0,
		var_ToX		=	209,
		var_ToZ		=	166
	},
	{
		var_Open	=	0,
		var_ToX		=	302,
		var_ToZ		=	166
	}
}

--阻挡区域的信息
x310122_var_BlockAreaInfo										=	
{
	{
		var_Left							=	247,
		var_Top								=	216,
		var_Right							=	261,
		var_Bottom						=	220, 
		var_RelatingTransfer	=	{1},												--关联的传送区域
		var_IsOpen						=	0
	},
	{
		var_Left							=	204,
		var_Top								=	171,
		var_Right							=	216,
		var_Bottom						=	175, 
		var_RelatingTransfer	=	{2},
		var_IsOpen						=	0
	},
	{
		var_Left							=	296,
		var_Top								=	171,
		var_Right							=	308,
		var_Bottom						=	175, 
		var_RelatingTransfer	=	{3},
		var_IsOpen						=	0
	}
}

x310122_var_DoorTransferAreaInfo						= 		--大门的传送区域,不同的门跟不同的NPC做索引绑定
{
	[401120] 																	=	
	{ --第一个大门的信息
		var_ToX			=	254,
		var_ToZ			=	231
	},
	[401122] 																	=	
	{ --第2个大门的信息
		var_ToX			=	210,
		var_ToZ			=	184
	},
	[401123] 																	=	
	{ --第3个大门的信息
		var_ToX			=	302,
		var_ToZ			=	184
	},	
}

--运行时变量
x310122_var_BattleStep											=	{}	--战争的阶段

--以下几个是战争开始立即要初始化的
x310122_var_IsStarted												=	0		--标识是否开始
x310122_var_KaiserId												=	-1 	--皇帝方的Id
x310122_var_MainAttack											=	-1	--主攻方的Id
x310122_var_ConcatenationCount							=	0 	--连任次数
x310122_var_BackroomOpened									=	0		--密室开启的标志

--战争信息表,记录攻防守方的信息 1是守方,其他是攻方
x310122_var_BattleRoleTable									=
{
	{ --适帝方信息
		campId 					= 5,
		birthPlace			=	
		{
			{255, 96, 5, 5},
			{139, 111, 5, 5},
			{139, 111, 5, 5},
			{139, 111, 5, 5},
		},
		hasAdscription 	= 0 --标识是否已经有归属,当这个角色被分配后,则改变此归属
	}, 
	{ --主攻方信息
		campId 					= 6,
		birthPlace			=	
		{	
			{380, 101, 5, 5},
			{380, 101, 5, 5},
			{380, 101, 5, 5},
			{380, 101, 5, 5},
		},
		hasAdscription 	= 0 --标识是否已经有归属,当这个角色被分配后,则改变此归属
	},
	{ --攻方信息
		campId 					= 6,
		birthPlace			=	
		{
			{380, 101, 5, 5},
			{380, 101, 5, 5},
			{380, 101, 5, 5},
			{380, 101, 5, 5},
		},
		hasAdscription 	= 0 --标识是否已经有归属,当这个角色被分配后,则改变此归属
	},
	{ --攻方信息
		campId 					= 6,
		birthPlace			=	
		{
			{380, 101, 5, 5},
			{380, 101, 5, 5},
			{380, 101, 5, 5},
			{380, 101, 5, 5},
		},
		hasAdscription 	= 0 --标识是否已经有归属,当这个角色被分配后,则改变此归属
	} 
}

x310122_var_CountryTable										=
{
	--楼兰
	{
		campId 					= 0,
		name						=	"楼兰",
		initBirthPlace	=	{437, 318, 5, 5}, --原始出生地
		role						=	0 --角色,标识是攻还是守,1是守方,其他是攻方
	},
	
	--天山的配置信息
	{
		campId 					= 1,
		name						=	"天山",
		initBirthPlace	=	{238, 462, 5, 5}, --原始出生地
		role						=	0
	},
	
	--昆仑的配置信息
	{
		campId 					= 2,
		name						=	"昆仑",
		initBirthPlace	=	{113, 417, 5, 5}, --原始出生地
		role						=	0
	},
	
	--敦煌的配置信息
	{
		campId 					= 3,
		name						=	"敦煌",
		initBirthPlace	=	{409, 434, 5, 5}, --原始出生地
		role						=	0
	}
}

--处理没有皇帝的战争
function x310122_ProcBattleKaiserProcess( varMap, varIndex )
	
	if (x310122_var_IsStarted == 0) then
		if (x310122_var_PrintInfoLog == 1) then
			WriteLog(1, format("x310122_ProcBattleKaiserProcess --- varMap = %d"
					, varMap))
		end
		
		x310122_var_IsStarted = 1
		
		x310122_ProcInitContext()
		
		x310122_var_MainAttack = x310122_GetMainAttack()
		if (x310122_var_PrintInfoLog == 1) then
			WriteLog(1, format("x310122_ProcBattleKaiserProcess Debug --- x310122_var_MainAttack = %d",
					 x310122_var_MainAttack))
		end
		
		x310122_ProcCheckContext() --检测环境变量
		
		x310122_ProcInitBattleStep() --初始化战争步骤
		
		x310122_LoadCountryRolesInfo( varMap ) --加载各国角色信息
		
		x310122_ProcLoadMapInfo(varMap) --加载Map上的信息
		
		x310122_ClearAllNpcByGuid(varMap) --清理可清理的NPC(大门)
		
		x310122_ProcNpcObjIdLoad(varMap) --先处理Npc的ObjId
		
		x310122_ProcNpcInfoLoad(varMap) --加载相应NPC
		
		OpenKaiserBackroom() --开启密室的操作
		
		x310122_ProcAllPlayerCampOnMap( varMap ) --处理玩家阵营
		
		x310122_ProcPlayerBuff(varMap, 1) --处理玩家buff
		
		x310122_ProcReSetNPCState(varMap)
		
		x310122_ProcAppendBuffToNpc(varMap) --向NPC增加指定Buff
		x310122_ProcNpcAttackableState(varMap) --处理npc的可攻击状态
	end
	
end

--处理玩家的Buff
function x310122_ProcPlayerBuff(varMap, varSingal)
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310122_ProcPlayerBuff --- varMap = %d, x310122_var_ConcatenationCount = %d, varSingal = %d"
				, varMap, x310122_var_ConcatenationCount, varSingal))
	end
	
	local buffTable = x310122_var_AttackBuffTable[x310122_var_ConcatenationCount]
	if (buffTable ~= nil) then
		local playerCount = GetScenePlayerCount( varMap )
		
		local playerObjId = -1
		for playerId = 0, (playerCount - 1) do
			playerObjId = GetScenePlayerObjId(varMap, playerId)
			if (playerObjId ~= -1) then
				x310122_ProcBuff(varMap, playerObjId, varSingal)
			end
		end
	end
end

--判断战争是否开始
function x310122_IsBattleStarted()
	return x310122_var_IsStarted
end

--获取玩家的角色信息
function x310122_GetCountryRole(varMap, varPlayer)
	local country = GetCurCountry(varMap, varPlayer)
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, 
					format("x310122_GetCountryRole Debug --- varMap = %d, varPlayer = %d, country = %d", 
					varMap, varPlayer, country))
	end
	local role = x310122_GetCountryRoleByCountry(varMap, country + 1)
	return role
end

--通过国家来获取国家角色
function x310122_GetCountryRoleByCountry(varMap, varCountryId)
	if (x310122_var_CountryTable[varCountryId] ~= nil) then
		local role = x310122_var_CountryTable[varCountryId].role
		return role
	end
	
	return -1
end

--添加Buff
function x310122_ProcBuff(varMap, varPlayer, varSingal)
	local countryId = GetCurCountry(varMap, varPlayer)
	local role = x310122_var_CountryTable[countryId + 1].role
	
	local buffTable = x310122_var_AttackBuffTable[x310122_var_ConcatenationCount]
	if (buffTable ~= nil) then
		if (role ~= 1) then --增加守方的Buff
			role = 2
		end
		
		if (x310122_var_PrintDebugLog == 1) then
			WriteLog(1, 
					format("x310122_ProcBuff --- varMap = %d, varPlayer = %d, role = %d, varSingal = %d", 
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

--初始化战争的环境变量
function x310122_ProcInitContext()
	
	x310122_var_KaiserId = x310122_GetKaiserCountry()
	x310122_var_ConcatenationCount = x310122_GetConcatenationCount(x310122_var_MapID, x310122_var_KaiserId) + 1
	
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, 
			format("x310122_ProcInitContext Debug x310122_var_ConcatenationCount = %d, kaiserCountryId = %d",
						 x310122_var_ConcatenationCount, x310122_var_KaiserId))
	end
	
	if (x310122_var_ConcatenationCount <= 0)	then
		WriteLog(1, 
			format("x310122_ProcInitContext ERROR!!! x310122_var_ConcatenationCount = %d", x310122_var_ConcatenationCount))
		return
	end
	
	if (x310122_var_ConcatenationCount >= getn(x310122_var_AttackBuffTable)) then
		if (x310122_var_PrintDebugLog == 1) then
				WriteLog(1, 
			format("x310122_ProcNpcInfoLoad Warning!!! npcInfoTableIndex overflow npcInfoTable count!!!"))
		end
		
		x310122_var_ConcatenationCount = getn(x310122_var_AttackBuffTable) --如果超过了最大连任次数则按照连任的最后一次来加载
	end
	
end

--获取主攻方
function x310122_GetMainAttack()
	local mark = -1
	for countryId = 0, 3 do
		mark = GetCountryParamByBit(countryId, CD_KAISER_BATTLE_INFO, x310122_var_IsKaiser[1],
					 x310122_var_IsKaiser[2])
		
		if (mark == 2) then
			return countryId
		end
					 
	end
end

--执行环境变量的数据检测,只有在调试模式下才会开启
function x310122_ProcCheckContext()
	if (x310122_var_KaiserId == -1) then
		WriteLog(1, format("x310122_ProcCheckContext Warning !!! ------ Error x310122_var_KaiserId = -1"))
	end
	
	if (x310122_var_ConcatenationCount == 0 or x310122_var_ConcatenationCount == -1) then
		WriteLog(1, format("x310122_ProcCheckContext Warning !!! ------ Error x310122_var_ConcatenationCount = %d", x310122_var_ConcatenationCount))
	end
	
	if (x310122_var_MainAttack == -1) then
		WriteLog(1, format("x310122_ProcCheckContext Warning !!! ------ Error x310122_var_MainAttack = -1"))
	end
end

--初始化战争步骤
function x310122_ProcInitBattleStep()
	
	local tempTable = {}
	for npcInfoIndex = 1, getn(x310122_var_NpcInfoTable) do
		for tempIndex = 1, getn(x310122_var_NpcInfoTable) do
			
			if (tempTable[tempIndex] == nil) then
				tempTable[tempIndex] = x310122_var_NpcInfoTable[npcInfoIndex].var_FinishBit
				break
			elseif (tempTable[tempIndex] == x310122_var_NpcInfoTable[npcInfoIndex].var_FinishBit) then
				break
			end
			
		end
	end
	
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310122_ProcInitBattleStep Debug tempTable = %d"
					, getn(tempTable)))
	end
	
	for stepIndex = 1, getn(tempTable) do
		x310122_var_BattleStep[stepIndex] = 0
	end
	
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310122_ProcInitBattleStep Debug x310122_var_BattleStep init finish, count = %d"
					, getn(x310122_var_BattleStep)))
	end
	
end

--获取战争的完成阶段,暂时使用往上累加的方式来计算
function x310122_GetBattleFinishStep()
	local step = 0
	for stepIndex = 1, getn(x310122_var_BattleStep) do
		if (x310122_var_BattleStep[stepIndex] == 1) then
			step = step + 1
		end
	end
	
	return step
end

--向Npc身上增加Buff
function x310122_ProcAppendBuffToNpc(varMap)
	if (x310122_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310122_ProcAppendBuffToNpc Info ... "))
	end
	
	local npcBuffTable
	for index, npcInfo in x310122_var_NpcInfoTable do
		if (npcInfo.var_IsExist == 1 and npcInfo.var_ObjId ~= -1) then
			
			npcBuffTable = npcInfo.var_AddBuff
			if (npcBuffTable ~= nil) then
				
				for buffIndex, buffInfo in npcBuffTable do
					if (IsHaveSpecificImpact(varMap, npcInfo.var_ObjId, buffInfo) == 1) then
						if (x310122_var_PrintDebugLog == 0) then
							WriteLog(1, format("x310122_ProcAppendBuffToNpc Debug ... Has Buff npcId = %d, buffId = %d",
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

--加载场景信息
function x310122_ProcLoadMapInfo(varMap)
	local blockArea
	for i = 1, getn(x310122_var_BlockAreaInfo) do
		blockArea = x310122_var_BlockAreaInfo[i]
		if (blockArea ~= nil) then
			
			if (x310122_var_PrintDebugLog == 1) then
				WriteLog(1, 
					format("x310122_ProcLoadMapInfo Debug AddSceneTempImpassable, left = %d, top = %d, right = %d, bottom = %d",
						blockArea.var_Left, blockArea.var_Top, blockArea.var_Right, blockArea.var_Bottom))
			end
		
			AddSceneTempImpassable(varMap, blockArea.var_Left, blockArea.var_Top, 
						blockArea.var_Right, blockArea.var_Bottom)
			x310122_UpdateTransferArea(blockArea, 1)
			blockArea.var_IsOpen = 1
		end
	end
	
end

--处理NpcObjId的加载
function x310122_ProcNpcObjIdLoad(varMap)
	local monsterCount = GetMonsterCount(varMap)
	
	local objId = -1
	local guid = -1
	for monsterId = 0, (monsterCount - 1) do
		objId = GetMonsterObjID(varMap, monsterId)
		if (objId ~= -1) then
			guid = GetMonsterGUID(varMap, objId)
			
			local npcInfo
			for npcTableIndex = 1, getn(x310122_var_NpcInfoTable) do
				npcInfo = x310122_var_NpcInfoTable[npcTableIndex]
				
				if (npcInfo ~= nil and guid == npcInfo.var_Guid) then
					if (npcInfo.var_DynamicCreate == 0 and npcInfo.var_ObjId == -1) then
						
						npcInfo.var_ObjId = objId						
						if (x310122_var_PrintDebugLog == 1) then
							WriteLog(1, format("x310122_ProcNpcObjIdLoad --- guid = %d, objId = %d", guid, objId))	
						end
						
					end
				end
				
			end
			
		end
	end
end


--加载Npc信息
function x310122_ProcNpcInfoLoad(varMap)
	local kaiserCountryId = x310122_GetKaiserCountry()
	local npcInfo
	for npcInfoIndex = 1, getn(x310122_var_NpcInfoTable) do --加载NPC信息
		npcInfo = x310122_var_NpcInfoTable[npcInfoIndex]
		if (npcInfo ~= nil) then
			
			if (npcInfo.var_IsExist == 0) then
				local isCreate = 0
				if (npcInfo.var_DynamicCreate == 1) then
					if (x310122_var_IsStarted == 1) then
						isCreate = 1
					end	
				end
			
				if (isCreate == 1) then
					local campId = npcInfo.var_CampId
					if (var_ChangeCampStep == 0) then
						campId = x310122_var_BattleRoleTable[1].campId
					end
				
					local objId = CreateMonster(varMap, npcInfo.var_TypeId, npcInfo.var_Pos[1], npcInfo.var_Pos[2], 
								npcInfo.var_BaseAI, npcInfo.var_AI, x310122_var_FileId, npcInfo.var_Guid, campId, -1)
					npcInfo.var_ObjId = objId
					npcInfo.var_IsExist = 1
					if (x310122_var_PrintDebugLog == 1) then
							WriteLog(1, 
								format("x310122_ProcNpcInfoLoad LoadNpc, Guid = %d, objId = %d", npcInfo.var_Guid, npcInfo.var_ObjId))
					end
				end
				
			end
			
			if (GetMonsterCamp(varMap, npcInfo.var_ObjId) ~= 20) then
				npcInfo.var_CampId = 20
				SetMonsterCamp(varMap, npcInfo.var_ObjId, 20)
			end
			
		end
	end
	
end

function x310122_ProcReSetNPCState(varMap)
	for npcInfoIndex = 1, getn(x310122_var_NpcInfoTable) do
		npcInfo = x310122_var_NpcInfoTable[npcInfoIndex]
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





--清除所有NPC信息,暂时不使用,还为测试完成
function x310122_ClearAllNpcByObjId(varMap)

	local npcInfo
	
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, 
			format("x310122_ClearAllNpcByObjId Debug x310122_var_ConcatenationCount = %d", x310122_var_ConcatenationCount))
	end
	
	for npcInfoIndex = 1, getn(x310122_var_NpcInfoTable) do
		npcInfo = x310122_var_NpcInfoTable[npcInfoIndex]
		if (npcInfo ~= nil) then
			if (npcInfo.var_IsExist ~= 0) then

				DeleteMonster(varMap, npcInfo.var_ObjId)			
				if (x310122_var_PrintDebugLog == 1) then
					WriteLog(1, format("x310122_ClearAllNpc Debug DeleteMonster Guid = %d, ObjId = %d",
								 npcInfo.var_Guid, npcInfo.var_ObjId))
				end
				
			end
		end
	end
	
end

--通过Guid来清除NPC,因为这样比较耗性能
function x310122_ClearAllNpcByGuid(varMap)
	local needDelNpcTemp = {}
	local npcInfo
	
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, 
			format("x310122_ClearAllNpcByGuid Debug x310122_var_ConcatenationCount = %d", x310122_var_ConcatenationCount))
	end
	
	--将要删除的monster guid存到needDelNpcTemp里
	for npcInfoIndex = 1, getn(x310122_var_NpcInfoTable) do
		npcInfo = x310122_var_NpcInfoTable[npcInfoIndex]
		if (npcInfo ~= nil and npcInfo.var_DynamicCreate == 1) then --只清理动态创建的Npc
			--if (npcInfo.var_IsExist == 1) then --且这个NPC存在,TODO 测试先注释掉
				
				for tempI = 1, getn(x310122_var_NpcInfoTable) do
					if (needDelNpcTemp[tempI] == nil) then
						
						needDelNpcTemp[tempI] = npcInfo.var_Guid
						npcInfo.var_IsExist = 0
						if (x310122_var_PrintDebugLog == 1) then
							WriteLog(1, 
								format("x310122_ClearAllNpcByGuid Debug tempI = %d", npcInfo.var_Guid))
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
						
						if (x310122_var_PrintDebugLog == 1) then
							WriteLog(1, 
								format("x310122_ClearAllNpcByGuid Debug DeleteMonster MonsterGuid = %d", monsterGuid))
						end
						
						break
					end
					
				end
				
			end
		end
		
	end
end

--获取连任次数
function x310122_GetConcatenationCount(varMap, varCountryId)

	if (varCountryId >= 0 and varCountryId <4) then
		local count = GetCountryParamByBit(varCountryId, CD_KAISER_BATTLE_INFO, 
					x310122_var_KaiserConcatenationTempCount[1], x310122_var_KaiserConcatenationTempCount[2])
		
		return count
	end
	
	return -1
end

--战争结束
function x310122_ProcBattleKaiserOver( varMap )
	x310122_GameOver(varMap)
end

--加载攻守方相应的角色信息
function x310122_LoadCountryRolesInfo( varMap )
	local kaiserCountryId = x310122_GetKaiserCountry()
	
	if (kaiserCountry == -1) then
		WriteLog(1, "x310122_LoadCountryRolesInfo ERROR!!! --- kaiserCountry = -1")
		return 
	end
	
	for i = 0, 3 do
		if (kaiserCountryId == i) then --加载皇帝方信息

			if (x310122_var_PrintDebugLog == 1) then
				WriteLog(1, 
					format("x310122_LoadCountryRolesInfo Debug KaiserId = %d", kaiserCountryId))
			end
			
			roleId = 1
		else
			local tempRandTable = {} --构建一个临时分配表
			local tempIndex = 1
			for j = 2, 4 do
				if (x310122_var_BattleRoleTable[j].hasAdscription == 0) then --没有归属
					tempRandTable[tempIndex] = j
					tempIndex = tempIndex + 1					
				end
			end
			
			local tempRandIndex = random(1, getn(tempRandTable))
			roleId = tempRandTable[tempRandIndex]
		end
		
		x310122_var_BattleRoleTable[roleId].hasAdscription = 1
		x310122_var_CountryTable[i + 1].role = roleId
		
		if (x310122_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310122_LoadCountryRolesInfo Debug --- country = %d, role = %d", i, roleId))
		end
	end
end

--获取皇帝国家
function x310122_GetKaiserCountry()
	--for i = 0, 3 do
	--	if (GetCountryParamByBit(i, CD_KAISER_BATTLE_INFO, x310122_var_IsKaiser[1],
	--			 x310122_var_IsKaiser[2]) == 1) then
	--			 return i 
	--	end
	--end	
	
	return GetEmpireCountry()
end

--处理玩家进入的流程
function x310122_ProcPlayerEnterMap( varMap, varPlayer )
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310122_ProcPlayerEnterMap --- varMap = %d, varPlayer = %d",
							 varMap, varPlayer))
	end
	
	x310122_ChangePlayerCamp( varMap, varPlayer, 0)
	x310122_ProcBuff(varMap, varPlayer, 1)
end

--处理玩家退出的流程
function x310122_ProcPlayerLeaveMap( varMap, varPlayer)
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310122_ProcPlayerLeaveMap --- varMap = %d, varPlayer = %d",
							 varMap, varPlayer))
	end
	
	x310122_ChangePlayerCamp( varMap, varPlayer, 1)
	x310122_ProcBuff(varMap, varPlayer, 0)
end

--先处理当前Map上的所有玩家的阵营
function x310122_ProcAllPlayerCampOnMap( varMap )
	local playerCount = GetScenePlayerCount( varMap )
	
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310122_ProcAllPlayerOnMap --- playerCount = %d", playerCount))
	end
	
	for varI = 0, (playerCount - 1) do
		local varPlayer = GetScenePlayerObjId(varMap, varI)
		if (varPlayer ~= -1) then
			x310122_ChangePlayerCamp(varMap, varPlayer, 0)
		end
	end
end

--设置阵营
function x310122_ChangePlayerCamp( varMap, varPlayer, varIsLeave )
	
	local varCountry = GetCurCountry(varMap, varPlayer)
	if (varIsLeave == 1 and x310122_var_IsStarted == 1) then --如果是战斗状态且玩家离开地图,则将其阵营回归
		
		if (x310122_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310122_ChangePlayerCamp --- Player Leave Battle.. varPlayer = %d, varCountry = %d, initCamp = %d",
					 varPlayer, varCountry, GetCurCamp(varMap, varPlayer)))
		end
		
		x310122_ResetPlayerCamp(varMap, varPlayer)
		
		if (x310122_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310122_ChangePlayerCamp --- Player CurrentCamp = %d",
						 GetCurCamp(varMap, varPlayer)))
		end
		
	else
		
		if (x310122_var_IsStarted == 1) then --设置战斗已开始的阵营编号
			
			if (x310122_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310122_ChangePlayerCamp --- The Battle is start. Enter varPlayer = %d, varCountry = %d, initCamp = %d",
							 varPlayer, varCountry, GetCurCamp(varMap, varPlayer)))
			end
			
			local roleId = x310122_var_CountryTable[varCountry + 1].role
			local campId = x310122_var_BattleRoleTable[roleId].campId
			SetCurCamp(varMap, varPlayer, campId)
			if (roleId == 1) then --防守方
				SetMPVP6v6BattleDisable(varMap, varPlayer, 0, 1)  --阵营玩家颜色
			elseif (roleId > 1) then
				SetMPVP6v6BattleDisable(varMap, varPlayer, 0, 0)
			end
			if (x310122_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310122_ChangePlayerCamp --- Player CurrentCamp = %d",
							 GetCurCamp(varMap, varPlayer)))
			end
			
		else	--设置战斗已结束的阵营编号
			
			if (x310122_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310122_ChangePlayerCamp --- The Battle is over. Enter varPlayer = %d, varCountry = %d,  initCamp = %d",
				varPlayer, varCountry, GetCurCamp(varMap, varPlayer)))
			end
			
			x310122_ResetPlayerCamp(varMap, varPlayer)
			
			if (x310122_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310122_ChangePlayerCamp --- Player CurrentCamp = %d",
							 GetCurCamp(varMap, varPlayer)))
			end
			
		end
		
	end
	
end

--清楚阻隔和传送的区域
function x310122_ClearBlockTransferArea(varMap)

	local blockArea
	for i = 1, getn(x310122_var_BlockAreaInfo) do
		blockArea = x310122_var_BlockAreaInfo[i]
		if (blockArea ~= nil) then
			if (blockArea.var_IsOpen == 1) then
				DelSceneTempImpassable(varMap, blockArea.var_Left, blockArea.var_Top, blockArea.var_Right, blockArea.var_Bottom)
			end
		end
	end
	
	local transferArea
	for i = 1, getn(x310122_var_TransferAreaInfo) do
		transferArea = x310122_var_TransferAreaInfo[i]
		if (transferArea ~= nil) then
			transferArea.var_Open = 0
		end
	end
end

--重置玩家原始阵营
function x310122_ResetPlayerCamp(varMap, varPlayer)
	local varCountry = GetCurCountry(varMap, varPlayer)
	local campId = x310122_var_CountryTable[varCountry + 1].campId
	SetCurCamp(varMap, varPlayer, campId)
	SetMPVP6v6BattleDisable(varMap, varPlayer, 1, 0)
end

--游戏结束的处理
function x310122_GameOver( varMap )
	if (x310122_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310122_GameOver Info --- varMap = %d", varMap))
	end

	if (x310122_var_IsStarted == 1) then
		
		local broadcast, countryName
		
		if (x310122_GetBattleFinishStep() == x310122_var_FinishStep) then
			if (x310122_var_MainAttack == -1) then --没有皇帝产生
				WriteLog(1, format("x310122_GameOver ERROR!!! varMap = %d, x310122_var_MainAttack = %d",
						 varMap, x310122_var_MainAttack))
				
			else
				--向国家变量设置相关信息
				LuaCallNoclosure( BATTLE_KAISER_MAIN_SCRIPT, "SetCountryFreeParam", varMap, x310122_var_MainAttack)
				broadcast = x310122_var_GameBattleOverBroadcast
				
				BattleKaiserOverNotice(x310122_var_MainAttack)
				
				countryName = x310122_var_CountryTable[x310122_var_MainAttack + 1].name
				LuaAllScenceM2Wrold(varMap, format(broadcast, countryName), 5, 1)
			end
		end
	
		x310122_ClearAllNpcByGuid(varMap)
		x310122_ClearBlockTransferArea(varMap)
		
		x310122_ReleaseMapTable() --释放全局变量
		
		x310122_ProcAllPlayerCampOnMap(varMap)
		
		x310122_ProcInitContext()
		
		x310122_ProcPlayerBuff(varMap, 0) --处理玩家buff
		--x310122_ProcNpcInfoLoad(varMap)
	end
end

--重置场景中的表数据
function x310122_ReleaseMapTable()
	if (x310122_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310122_ReleaseMapTable --- Kaiser Battle Over!!! Excute Relase Table..."))
	end

	for tableIndex = 1, getn(x310122_var_NpcInfoTable) do
		local npcInfo = x310122_var_NpcInfoTable[tableIndex]
		if (npcInfo ~= nil) then
			npcInfo.var_CampId = 20
			npcInfo.var_ObjId = -1
			npcInfo.var_IsExist = 0
		end
	end

	for i = 1, 4 do
		x310122_var_BattleRoleTable[i].hasAdscription = 0
		x310122_var_CountryTable[i].role = 0
	end
	
	x310122_var_BattleStep											=	{}	--战争的阶段
	x310122_var_IsStarted												=	0		--标识是否开始
	x310122_var_KaiserId												=	-1 	--皇帝方的Id
	x310122_var_MainAttack											=	-1	--主攻方的Id
	x310122_var_ConcatenationCount								=	0 	--使用的NPC阶段的索引
	x310122_var_BackroomOpened									=	0		--密室开启的标志
	
end

--处理玩家进入检测区域的处理
function x310122_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

	local curCountry = GetCurCountry(varMap, varPlayer)
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310122_ProcAreaEntered Debug --- varMap = %d, varPlayer = %d, varArea = %d, curCountry = %d", 
						varMap, varPlayer, varArea, curCountry))
	end
	
	if (varArea >= 19 and varArea <= 21) then --在门传送区域内
		
		if (x310122_var_CountryTable[curCountry + 1].role == 1) then
			local transferInfo = x310122_var_TransferAreaInfo[varArea - 18]
			if (x310122_var_PrintDebugLog == 1) then
					WriteLog(1, format("x310122_ProcAreaEntered Debug --- Process transfer... varArea = %d, open = %d, toX = %d, toZ = %d", 
								varArea, transferInfo.var_Open, transferInfo.var_ToX, transferInfo.var_ToZ))
			end
			
			if (transferInfo.var_Open == 1) then
				SetPos( varMap, varPlayer, transferInfo.var_ToX, transferInfo.var_ToZ)
			end
		end
		
	elseif (varArea == x310122_var_BackroomTrasfer) then --传送,验证是否符合传送条件
		
		if (x310122_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310122_ProcAreaEntered Debug --- x310122_GetBattleFinishStep = %d", 
							x310122_GetBattleFinishStep()))
		end
		
		if (x310122_var_BackroomOpened == 1) then
			LuaCallNoclosure(COMMON_CHUANSONG_NORMAL, "TransferToWorld", varMap, varPlayer, x310122_var_TransferToBackroom)
		end
	end
	
end

--处理玩家复活的流程
function x310122_ProcPlayerRelive( varMap, varPlayer, varReliveOp)
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310122_ProcPlayerRelive Debug --- varMap = %d, varPlayer = %d, varReliveOp = %d",
							 varMap, varPlayer, varReliveOp))
	end

	if (varReliveOp == 0) then --原地复活
		local itemCount = GetItemCount(varMap, varPlayer, x310122_var_ReliveItemId)
		if (x310122_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310122_ProcPlayerRelive Debug --- itemCount = %d, varPlayer = %d",
							 itemCount, varPlayer))
		end
		
		
		if 	varMap == 472 or varMap == 550 or varMap == 551 or varMap == 552 or varMap == 553 or varMap == 554 or varMap == 555 or varMap == 556 or varMap == 557 or varMap == 558 or varMap == 559 or varMap == 560 or varMap == 561 or varMap == 562 or varMap == 563 or varMap == 564  or varMap == 565  or varMap == 566    then  
			if (itemCount > 0) then
				if (DelItem(varMap, varPlayer, x310122_var_ReliveItemId, 1) == 1) then
				
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
				Msg2Player(varMap, varPlayer, x310122_var_ReliveNotice, 8, 3)
			end
		else
					Msg2Player(varMap, varPlayer, "很抱歉,当前场景无法原地复活", 8, 3)
		end		
	elseif (varReliveOp == 1 or varReliveOp == 2) then --场景复活
	
		local curCountry = GetCurCountry(varMap, varPlayer)
		if (curCountry < 0 or curCountry > 3) then
			WriteLog(1, 
				format("x310122_ProcPlayerRelive ERRROR!!! --- varMap = %d, varPlayer = %d, curCountry = %d",
							 varMap, varPlayer, curCountry))
			return 
		end
		
		if (x310122_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310122_ProcPlayerRelive Debug --- BattleStep = %d, curCountry = %d",
							 x310122_GetBattleFinishStep(), curCountry))
		end
		
		local birthTable
		if (x310122_GetBattleFinishStep() == 0) then
			
			local kaiserCountry = x310122_GetKaiserCountry()
			if (kaiserCountry == curCountry) then --皇帝方
				birthTable = x310122_var_BattleRoleTable[1].birthPlace[1]
			else
				birthTable = x310122_var_CountryTable[curCountry + 1].initBirthPlace
			end
		
		elseif (x310122_GetBattleFinishStep() >= 1 and x310122_GetBattleFinishStep() <= x310122_var_FinishStep) then
			local roleIndex = x310122_var_CountryTable[curCountry + 1].role
			birthTable = x310122_var_BattleRoleTable[roleIndex].birthPlace[x310122_GetBattleFinishStep() + 1]
		end
		
		local birX = birthTable[1]
		if (birthTable[3] ~= 0) then
			birX = birX + random( 1, birthTable[3])
		end
		
		local birZ = birthTable[2]
		if (birthTable[4] ~= 0) then
			birZ = birZ + random( 1, birthTable[4])
		end
		
		if (x310122_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310122_ProcPlayerRelive Debug --- birX = %d, birZ = %d",
							 birX, birZ))
		end
		
		SetPos( varMap, varPlayer, birX, birZ)
		ClearRageRecoverTick( varMap, varPlayer)
    RestoreHp( varMap, varPlayer, 100)
    RestoreRage( varMap, varPlayer, 100)
    ClearMutexState( varMap, varPlayer, 6)
    SendReliveResult( varMap, varPlayer, 1)
    ClearPlayerNextSceneInfo(varMap, varPlayer) 
	end
end

--变更阻隔区域相关联的传送区域
function x310122_UpdateTransferArea(varBlockArea, varIsOpen)
	local transInfo = varBlockArea.var_RelatingTransfer
	for transI, value in transInfo do
		
		if (x310122_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310122_UpdateTransferArea Debug --- transI = %d, value = %d", 
					transI, value))
		end
		
		if (x310122_var_TransferAreaInfo[value] ~= nil) then
			x310122_var_TransferAreaInfo[value].var_Open = varIsOpen
		end
	end
end

--更改Npc的可攻击状态
function x310122_ProcNpcAttackableState(varMap)
	local kaiserCamp = x310122_var_BattleRoleTable[1].campId
	local npcInfo
	for tableIndex = 1, getn(x310122_var_NpcInfoTable) do
		npcInfo = x310122_var_NpcInfoTable[tableIndex]
		if (npcInfo ~= nil) then
		
			if (npcInfo.var_ChangeCampStep == x310122_GetBattleFinishStep()) then
				
				if (npcInfo.var_CampId ~= kaiserCamp) then --与攻方阵营不一致,更改阵营
					if (x310122_var_PrintDebugLog == 1) then
						WriteLog(1, format("x310122_ProcNpcAttackableState Debug --- BattleStep = %d, npcGuid = %d, objId = %d, kaiserCamp = %d, npcInfo.var_CampId = %d",
									 x310122_GetBattleFinishStep(), npcInfo.var_Guid, npcInfo.var_ObjId, kaiserCamp, npcInfo.var_CampId))
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

--NPC相关死亡处理
function x310122_ProcDie(varMap, varDie, varKiller)
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310122_ProcDie Debug --- varMap = %d, varDie = %d, varKiller = %d",
					 varMap, varDie, varKiller))
	end
	
	local relatingGuid = -1
	local index = -1
	for tableIndex = 1, getn(x310122_var_NpcInfoTable) do
		if (varDie == x310122_var_NpcInfoTable[tableIndex].var_ObjId) then
			index = tableIndex
			relatingGuid = x310122_var_NpcInfoTable[tableIndex].var_RelatingGuid
			
			if (x310122_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310122_ProcDie Debug --- dieGuid = %d", 
										x310122_var_NpcInfoTable[tableIndex].var_Guid))
			end
			
			if (x310122_var_NpcInfoTable[tableIndex].var_RelatingArea ~= 0) then
				local blockArea = x310122_var_BlockAreaInfo[x310122_var_NpcInfoTable[tableIndex].var_RelatingArea]
				if (blockArea ~= nil) then
					DelSceneTempImpassable(varMap, blockArea.var_Left, blockArea.var_Top, blockArea.var_Right, blockArea.var_Bottom)
					
					if (x310122_var_PrintDebugLog == 1) then
						WriteLog(1, format("x310122_ProcDie Debug --- Delete Relating Area --- left = %d, top = %d, right = %d, bottom = %d"
											, blockArea.var_Left, blockArea.var_Top, blockArea.var_Right, blockArea.var_Bottom))
					end
					
					x310122_UpdateTransferArea(blockArea, 0)
					blockArea.var_IsOpen = 0
				end
			end
			
			break
		end
	end
	
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310122_ProcDie --- varDie = %d, relatingGuid = %d", varDie, relatingGuid))
	end
	
	if (relatingGuid ~= -1 and relatingGuid ~= 0) then
		for tableIndex = 1, getn(x310122_var_NpcInfoTable) do
			if (relatingGuid == x310122_var_NpcInfoTable[tableIndex].var_Guid) then
				
				if (x310122_var_PrintDebugLog == 1) then
					WriteLog(1, format("x310122_ProcDie --- varDie = %d, relatingObj = %d", 
								varDie, x310122_var_NpcInfoTable[tableIndex].var_ObjId))
				end
				
				SetHp(varMap, x310122_var_NpcInfoTable[tableIndex].var_ObjId, -9999999)
				x310122_var_NpcInfoTable[tableIndex].var_IsExist = 0
				break
			end
		end
	end
	
	if (index ~= -1) then
		local npcInfo = x310122_var_NpcInfoTable[index]
		if (npcInfo ~= nil) then
			local finishBit = npcInfo.var_FinishBit
			
			if (x310122_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310122_ProcDie Debug --- npcGuid = %d, finishBit = %d",
							 npcInfo.var_Guid, finishBit))
			end
			npcInfo.var_IsExist = 0
			
			if (finishBit > 0 and finishBit <= x310122_var_FinishStep) then
				x310122_var_BattleStep[finishBit] = 1 --阶段转换
			end
		end
	end
	
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310122_ProcDie Debug --- BattleStep = %d",
					 x310122_GetBattleFinishStep()))
	end
	
	--判断是否已经到了结束的步骤
	--if (x310122_GetBattleFinishStep() == x310122_var_FinishStep) then
		--OpenKaiserBackroom() --开启密室的操作 ,流程修改,不在此处开启
	--end
	if (x310122_GetBattleFinishStep() == x310122_var_FinishStep) then
		x310122_GameOver(varMap)
	end
	
	x310122_ProcNpcAttackableState(varMap)
end

--密室开启的处理
function x310122_ProcOpenBackroom(varMap)
	if (x310122_var_PrintInfoLog == 1) then
		WriteLog(1, format("x310122_ProcOpenBackroom Info --- varMap = %d",
						 varMap))
	end
	
	x310122_var_BackroomOpened = 1
end

--处理玩家死亡
function x310122_ProcPlayerDie(varMap, varPlayer, varKiller)

	if (x310122_var_IsStarted == 1) then

		if (GetObjType(varMap, varKiller) == 1
					and GetObjType(varMap, varPlayer) == 1) then
					
			local killerCamp = GetCurCamp(varMap, varKiller)
			local dierCamp = GetCurCamp(varMap, varPlayer)
		
			if (x310122_var_PrintDebugLog == 1) then
				WriteLog(1, 
					format("x310122_ProcPlayerDie Debug --- varMap = %d, varPlayer = %d, varKiller= %d, dierCamp = %d, killerCamp = %d",
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

function x310122_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310122_ProcEventEntry --- Debug varMap = %d varPlayer = %d varTalknpc = %d"
				,	varMap, varPlayer, varTalknpc))
	end
	
	if (idExt ~= nil) then
		if (x310122_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310122_ProcEventEntry --- idExt = %d"
				,	idExt))
		end
	
		if (idExt == 1) then --传送
			if (x310122_var_IsStarted ~= 1) then
				return	
			end
			
			local role = x310122_GetCountryRole(varMap, varPlayer)
			if (x310122_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310122_ProcEventEntry Debug --- role = %d", 
							role))
			end
			
			if (role ~= x310122_var_EnableRole) then
				return 
			end
		
			local monsterGuid = GetMonsterGUID(varMap, varTalknpc)
			if (x310122_var_PrintDebugLog == 1) then
				WriteLog(1, format("x310122_ProcEventEntry Debug --- monsterGuid = %d", 
							monsterGuid))
			end
			
			local transInfo = x310122_var_DoorTransferAreaInfo[monsterGuid]
			if (transInfo ~= nil) then
				SetPos(varMap, varPlayer, transInfo.var_ToX, transInfo.var_ToZ)		
			end
		end
	
	else
		
		local monsterGuid = GetMonsterGUID(varMap, varTalknpc)
		if (x310122_var_DoorTransferAreaInfo[monsterGuid] == nil) then
			return
		end
		
		if (x310122_var_IsStarted ~= 1) then
			return	
		end
		
		local role = x310122_GetCountryRole(varMap, varPlayer)
		if (x310122_var_PrintDebugLog == 1) then
			WriteLog(1, format("x310122_ProcEnumEvent Debug ---role = %d", 
						role))
		end
		
		if (role == x310122_var_EnableRole) then --防守方
			StartTalkTask(varMap)
			TalkAppendButton(varMap, x310122_var_FileId, x310122_var_DoorButton, 3, 1)
			StopTalkTask(varMap)
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		end
		
	end
end

function x310122_ProcEnumEvent(varMap, varPlayer, varTalknpc)
	if (x310122_var_PrintDebugLog == 1) then
		WriteLog(1, format("x310122_ProcEnumEvent --- varMap = %d, varPlayer = %d, varTalknpc = %d"
			,	varMap, varPlayer, varTalknpc))
	end
end

--处理玩家离开区域
function x310122_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )
end

function x310122_ProcMapTimerTick(varMap, varPlayer)
end
