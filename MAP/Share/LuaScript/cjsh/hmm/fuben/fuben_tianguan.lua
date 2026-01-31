

-- 脚本ID
x700500_var_FileId = 700500

-- 场景参数索引定义
x700500_CSP_FUBENTYPE		= 0
x700500_CSP_SCRIPTID		= 1
x700500_CSP_TICKCOUNT		= 2
x700500_CSP_FROMSCENEID		= 3
x700500_CSP_ISCLOSING		= 4
x700500_CSP_LEAVECOUNTDOWN	= 5
x700500_CSP_TEAMID			= 6
x700500_CSP_BACKSCENEX		= 7
x700500_CSP_BACKSCENEZ		= 8
x700500_CSP_FUBENLEVEL		= 9

x700500_CSP_KILLCOUNT		= 20		-- 击杀小怪数量
x700500_CSP_BOSS_KILLED		= 21		-- Boss是否被击杀
x700500_CSP_BOSS_OBJID		= 22		-- Boss对象ID

x700500_CSP_FUBEN_TYPE		= 254
x700500_CSP_FUBEN_MODE		= 255

-- 副本配置
x700500_var_FubenName		= "天关"
x700500_var_TotalTime		= 1800		-- 副本总时间（秒）= 30分钟
x700500_var_TickTime		= 1000		-- 心跳间隔（毫秒）

-- 怪物配置 (使用夏王墓穴现有的怪物类型)
-- 小怪配置: {type=怪物类型ID, x=X坐标, z=Z坐标, ai=AI类型, count=数量, radius=随机半径}
x700500_var_MonsterList = {
	-- 第一波小怪 (入口附近)
	{type = 22494, x = 111, z = 43, ai=9,aiscript=962,count = 5, radius = 2},
	{type = 22494, x = 114, z = 73, ai=9,aiscript=962,count = 5, radius = 1},
	{type = 22494, x = 114, z = 106, ai=9,aiscript=962,count = 5, radius = 1},
	{type = 22494, x = 114, z = 118, ai=9,aiscript=962,count = 5, radius = 1},
	{type = 22494, x = 84, z = 109, ai=9,aiscript=962,count = 5, radius = 1},
	{type = 22494, x = 111, z = 89, ai=9,aiscript=962,count = 5, radius = 2},
	{type = 22494, x = 87, z = 78, ai=9,aiscript=962,count = 10, radius = 2},
	{type = 22494, x = 87, z = 65, ai=9,aiscript=962,count = 10, radius = 2},
	{type = 22494, x = 62, z = 63, ai=9,aiscript=962,count = 5, radius = 2},
	{type = 22494, x = 44, z = 63, ai=9,aiscript=962,count = 5, radius = 2},
	{type = 22494, x = 55, z = 92, ai=9,aiscript=962,count = 20, radius = 2},
	{type = 22494, x = 15, z = 113, ai=9,aiscript=962,count = 5, radius = 2},
	{type = 22494, x = 13, z = 95, ai=9,aiscript=962,count = 5, radius = 2},
	{type = 22494, x = 13, z = 75, ai=9,aiscript=962,count = 5, radius = 2},
	{type = 22494, x = 26, z = 29, ai=9,aiscript=962,count = 15, radius = 2},


	{type = 22494, x = 101, z = 109, ai=9,aiscript=962,count = 5, radius = 2},
	-- 第二波小怪 (中间区域)
	{type = 22494, x = 81, z = 97, ai=9,aiscript=962,count = 18, radius = 2},
	-- 第三波小怪 (Boss区域附近)
	{type = 22494, x = 16, z = 60, ai=9,aiscript=962,count = 4, radius = 2},
}
x700500_var_NPC =
{
    { type = 18080, guid = 600401, facedir = 20, name = "天关传送人", title = "" },
}

-- Boss配置: {type=怪物类型ID, x=X坐标, z=Z坐标, ai=AI类型, title=头顶称号}
x700500_var_BossConfig = {
	type = 22539,		-- Boss怪物类型ID
	x = 65,
	z = 30,
	ai = 9,
    aiscript=962,
	title = "天关守护者"
}

-- 通关奖励配置
x700500_var_RewardExp = 100000		-- 经验奖励
x700500_var_RewardMoney = 15000		-- 金币奖励
x700500_var_RewardItems = {
	-- {itemId = 道具ID, count = 数量}
	-- {itemId = 11000001, count = 1},
}

x700500_var_randboss = {
	{id=22564,name="虚空", x = 81, z = 97, ai=9,aiscript=962,title="天关御卫"},
	{id=22565,name="虚空", x = 81, z = 97, ai=9,aiscript=962,title="天关御卫"},
	{id=22566,name="虚空", x = 81, z = 97, ai=9,aiscript=962,title="天关御卫"},
}


function x700500_getmonstercnt()
	local cnt = 0
	for k, item in x700500_var_MonsterList do
		cnt = cnt + item.count
	end
	return cnt
end
function x700500_ProcEventEntry(varMap,varPlayer,varTalknpc)

end
-----------------------------------------------------------
-- 当副本创建成功时, (初始化操作在这进行)
-----------------------------------------------------------
function x700500_ProcFubenSceneCreated(varMap)
    WriteLog(1,"x700500_OnFubenSceneCreated: 天关副本创建成功")
	
	-- 初始化副本参数
	SetFubenData_Param(varMap, x700500_CSP_KILLCOUNT, 0)
	SetFubenData_Param(varMap, x700500_CSP_BOSS_KILLED, 0)
	SetFubenData_Param(varMap, x700500_CSP_BOSS_OBJID, -1)
	
	-- 创建小怪
	x700500_CreateMonsters(varMap)


	-- 创建随机boss，掉落马装
	if random(1,100) < 20 then
		local randboss = x700500_var_randboss[random(1,getn(x700500_var_randboss))]
		CreateMonster(varMap, randboss.id, randboss.x, randboss.z, randboss.ai, 0, x700500_var_FileId, -1, 21, -1, 0, "", randboss.title)
	end

	-- 创建Boss
	--x700500_CreateBoss(varMap)
	
	-- 通知所有玩家副本开始
	x700500_MsgToAllPlayers(varMap, "#Y【天关副本】#W副本开始！击杀所有怪物后才会刷新出BOSS！")
end

-----------------------------------------------------------
-- 副本心跳接口
-----------------------------------------------------------
function x700500_EnterTick(varMap, nowTickCount)
    WriteLog(1,"x700500_EnterTick: nowTickCount====")
	-- 检查是否通关
	local bossKilled = GetFubenData_Param(varMap, x700500_CSP_BOSS_KILLED)
	
	if bossKilled == 1 then
		-- Boss已被击杀，副本通关
		x700500_OnFubenCompleted(varMap)
	end
	
	-- 每60个心跳（约1分钟）提示剩余时间
	if mod(nowTickCount, 60) == 0 then
		local totalTicks = x700500_var_TotalTime
		local remainTicks = totalTicks - nowTickCount
		if remainTicks > 0 then
			local remainMinutes = floor(remainTicks / 60)
			if remainMinutes > 0 then
				x700500_MsgToAllPlayers(varMap, "#Y【天关副本】#W剩余时间: " .. remainMinutes .. "分钟")
			end
		end
	end
end

-----------------------------------------------------------
-- 点NPC时的DefaultEvent
-----------------------------------------------------------
function x700500_OnDefaultEvent(varMap, selfId, NPCId, nScriptId, nIndex)
	-- 空实现
end

-----------------------------------------------------------
-- 怪物死亡事件
-----------------------------------------------------------
function x700500_ProcDie(varMap, selfId, killerId)
	WriteLog(1,"x700500_OnDie: 怪物死亡, selfId=" .. selfId .. ", killerId=" .. killerId)
	
	-- 检查是否是Boss
	local bossObjId = GetFubenData_Param(varMap, x700500_CSP_BOSS_OBJID)
	
	if selfId == bossObjId then
		-- Boss被击杀
		SetFubenData_Param(varMap, x700500_CSP_BOSS_KILLED, 1)
		x700500_MsgToAllPlayers(varMap, "#G【天关副本】#WBOSS已被击杀！副本即将通关！")
	else
		-- 普通怪物被击杀
		local killCount = GetFubenData_Param(varMap, x700500_CSP_KILLCOUNT)
		killCount = killCount + 1
		SetFubenData_Param(varMap, x700500_CSP_KILLCOUNT, killCount)
		
		-- 每杀10只怪物提示一次
		if mod(killCount, 10) == 0 then
			x700500_MsgToAllPlayers(varMap, "#Y【天关副本】#W已击杀" .. killCount .. "只怪物")
		end
		if killCount >= x700500_getmonstercnt() then
			x700500_CreateBoss(varMap)
		end
	end
end

-----------------------------------------------------------
-- 创建小怪
-----------------------------------------------------------
function x700500_CreateMonsters(varMap)
	WriteLog(1,"x700500_CreateMonsters: 开始创建小怪")
	
	for i, monster in x700500_var_MonsterList do
		for j = 1, monster.count do
			-- 随机位置偏移
			local rx = random(-monster.radius, monster.radius)
			local rz = random(-monster.radius, monster.radius)
			local posX = monster.x + rx
			local posZ = monster.z + rz


			-- 创建怪物
			local monsterId = CreateMonster(varMap, monster.type, posX, posZ, monster.ai, monster.aiscript, x700500_var_FileId, -1, 21, -1, 0, "巨人","天关守卫")
			
			if monsterId and monsterId > 0 then
				WriteLog(1,"x700500_CreateMonsters: 创建怪物成功, type=" .. monster.type .. ", id=" .. monsterId)
			end
		end
	end
end

-----------------------------------------------------------
-- 创建Boss
-----------------------------------------------------------
function x700500_CreateBoss(varMap)
	WriteLog(1,"x700500_CreateBoss: 开始创建Boss")
	
	local boss = x700500_var_BossConfig
	

	local bossId = CreateMonster(varMap, boss.type, boss.x, boss.z, boss.ai, 0, x700500_var_FileId, -1, 21, -1, 0, "", boss.title)

	if bossId and bossId > 0 then
		SetFubenData_Param(varMap, x700500_CSP_BOSS_OBJID, bossId)
		WriteLog(1,"x700500_CreateBoss: Boss创建成功, id=" .. bossId)
		x700500_MsgToAllPlayers(varMap, "成功击杀所有小怪，一个更强大的怪物出现了！！！")
	else
		WriteLog(1,"x700500_CreateBoss: Boss创建失败!")
	end
end

-----------------------------------------------------------
-- 副本通关处理
-----------------------------------------------------------
function x700500_OnFubenCompleted(varMap)
	WriteLog(1,"x700500_OnFubenCompleted: 副本通关!")
	
	-- 检查是否已经处理过通关
	local isClosing = GetFubenData_Param(varMap, x700500_CSP_ISCLOSING)
	if isClosing == 1 then
		return
	end
	SetFubenData_Param(varMap, x700500_CSP_ISCLOSING, 1)
	
	-- 给所有玩家发放奖励
	local humancount = GetFuben_PlayerCount(varMap)
	
	for i = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, i)
		if humanId and humanId >= 0 then
			x700500_GiveReward(varMap, humanId)
		end
	end
	
	-- 通知所有玩家
	x700500_MsgToAllPlayers(varMap, "#G【天关副本】#W恭喜通关！奖励已发放！30秒后将离开副本。")
	
	-- 调用通用副本通关回调
	LuaCallNoclosure(700103, "ProcFubuenCompleted", varMap)


    local npc =x700500_var_NPC[1]
    local ret1 = CreateMonster(varMap, npc.type, 65, 30, 3, -1, -1, npc.guid, 20, -1, npc.facedir, npc.name, npc.title, -1)
    if ret1 == -1 then
        WriteLog(1, "x700136_CreateNPC  ERR ==============")
    else
        NpcTalk(varMap, ret1,"哈哈哈，多谢你们！来我这里，我可以送你们出去",-1)
    end
end

-----------------------------------------------------------
-- 发放奖励
-----------------------------------------------------------
function x700500_GiveReward(varMap, humanId)
	-- 发放经验
	if x700500_var_RewardExp > 0 then
		AddExp(varMap, humanId, x700500_var_RewardExp)
	end
	
	-- 发放金币
	if x700500_var_RewardMoney > 0 then
		AddMoney(varMap, humanId, 3, x700500_var_RewardMoney)
	end
	
	-- 发放道具
	for i, item in x700500_var_RewardItems do
		if item.itemId and item.count then
			AddItem(varMap, humanId, item.itemId, item.count)
		end
	end
	
	-- 发送奖励提示
	local msg = "#G【天关副本】#W获得奖励: 经验" .. x700500_var_RewardExp .. ", 金币" .. x700500_var_RewardMoney
	Msg2Player(varMap, humanId, msg, 8, 2)
end

-----------------------------------------------------------
-- 向副本内所有玩家发送消息
-----------------------------------------------------------
function x700500_MsgToAllPlayers(varMap, strMsg)
	local humancount = GetFuben_PlayerCount(varMap)
	for i = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, i)
		if humanId and humanId >= 0 then
			Msg2Player(varMap, humanId, strMsg, 8, 2)
		end
	end
end

-----------------------------------------------------------
-- 向副本内所有玩家显示Tips
-----------------------------------------------------------
function x700500_ShowTipsToAll(varMap, varStr)
	local humancount = GetFuben_PlayerCount(varMap)
	for i = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, i)
		StartTalkTask(varMap)
		TalkAppendString(varMap, varStr)
		StopTalkTask()
		DeliverTalkTips(varMap, humanId)
	end
end

-----------------------------------------------------------
-- 玩家进入副本事件
-----------------------------------------------------------
function x700500_OnPlayerEnter(varMap, humanId)
	WriteLog(1,"x700500_OnPlayerEnter: 玩家进入副本, humanId=" .. humanId)
	Msg2Player(varMap, humanId, "#Y【天关副本】#W欢迎进入天关！击杀所有怪物和Boss即可通关！", 8, 2)
end

-----------------------------------------------------------
-- 玩家离开副本事件
-----------------------------------------------------------
function x700500_OnPlayerLeave(varMap, humanId)
	WriteLog(1,"x700500_OnPlayerLeave: 玩家离开副本, humanId=" .. humanId)
end

function x700500_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	--SetFubenData_Param(varMap, x700500_CSP_AREA_ID, varArea)
	--if varArea == 18 then
	--	local BossId = GetFubenData_Param(varMap, x700500_CSP_FINAL_BOSS2_ID)
	--	if BossId ~= -2 then
	--		return
	--	end
	--	SetFubenData_Param(varMap, x700500_CSP_AREA_FLAG,1)
	--	LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, 0, x700500_var_QuestId, x700500_var_FileId,1)
	--
	--elseif varArea == 19 then
	--	LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, 1, x700500_var_QuestId, x700500_var_FileId)
	--end
	--local varScriptFileId = GetFubenData_Param(varMap, x700500_CSP_SCRIPTID);
	--
	--if varScriptFileId~=x700500_var_FileId then
	--	LuaCallNoclosure( varScriptFileId, "ProcAreaEntered", varMap, varPlayer, varArea, varQuest)
	--	return
	--end
	--
	--local humancount = GetFuben_PlayerCount(varMap);
	--
	--local varIndex = x700500_CSP_OBJID_AREA
	--for varI=0, 5 do
	--	local idx = varIndex+varI*2
	--	local varObj = GetFubenData_Param(varMap, idx )
	--	if varObj == varPlayer then
	--
	--		SetFubenData_Param(varMap, idx, varPlayer )
	--		SetFubenData_Param(varMap, idx+1, varArea )
	--
	--		break
	--	elseif varObj == -1 then
	--
	--		SetFubenData_Param(varMap, idx, varPlayer )
	--		SetFubenData_Param(varMap, idx+1, varArea )
	--		break
	--	end
	--end
	--
	--if varArea ==0 then
	--	SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, x700500_var_Buff_Id,0 )
	--elseif varArea >=1 and varArea<=9 then
	--	x700500_ProcEnterShuaguaiArea(varMap, varPlayer, varArea)
	--elseif varArea == 17 then
	--	SetFubenData_Param(varMap, x700500_CSP_BOSS1_SUB_MONSTER_FLAG, 1)
	--end

end




function x700500_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	--EnterAreaEventListHideNM(varMap, varPlayer)
	--local varIndex = x700500_CSP_OBJID_AREA
	--for varI=0, 5 do
	--	local idx = varIndex+varI*2
	--	local varObj = GetFubenData_Param(varMap, idx )
	--	local varArea = GetFubenData_Param(varMap, idx + 1 )
	--	if varObj == varPlayer then
	--		SetFubenData_Param(varMap, idx, -1 )
	--		SetFubenData_Param(varMap, idx+1, -1 )
	--	end
	--end
	--SetFubenData_Param(varMap, x700500_CSP_AREA_ID, -1)
end

