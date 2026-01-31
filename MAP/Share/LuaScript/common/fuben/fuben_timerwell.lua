x490036_var_FileId = 490036

x490036_var_NpcLiveTime = 30 *60*1000 -- NPC生存时间
x490036_var_InterTime = 2*60*60*1000 -- 创建副本入口间隔时间
x490036_var_NpcNum = 60  --npc数目
x490036_var_NpcIDS								= 3647 -- 单人副本 typeID
x490036_var_NpcIDT								= 3648 -- 组队副本 typeID
x490036_var_NpcSGUID							= 141538 -- 单人副本npcguid
x490036_var_NpcTGUID							= 141539 -- 组队副本npcguid


x490036_var_LiveNpcMap = {							-- 记录场景中存在的NPC
													[1] = {varnPosX = 468, varnPosY = 475},
													[2] = {varnPosX = 469, varnPosY = 465},
													[3] = {varnPosX = 453, varnPosY = 455},
													[4] = {varnPosX = 475, varnPosY = 371},
													[5] = {varnPosX = 470, varnPosY = 370},
													[6] = {varnPosX = 441, varnPosY = 338},
													[7] = {varnPosX = 381, varnPosY = 421},
													[8] = {varnPosX = 353, varnPosY = 448},
													[9] = {varnPosX = 343, varnPosY = 477},
													[10] = {varnPosX = 471, varnPosY = 221},
													[11] = {varnPosX = 472, varnPosY = 251},
													[12] = {varnPosX = 449, varnPosY = 254},
													[13] = {varnPosX = 436, varnPosY = 279},
													[14] = {varnPosX = 391, varnPosY = 296},
													[15] = {varnPosX = 382, varnPosY = 274},
													[16] = {varnPosX = 357, varnPosY = 243},
													[17] = {varnPosX = 443, varnPosY = 274},
													[18] = {varnPosX = 313, varnPosY = 206},
													[19] = {varnPosX = 294, varnPosY = 204},
													[20] = {varnPosX = 295, varnPosY = 186},
													[21] = {varnPosX = 428, varnPosY = 87},
													[22] = {varnPosX = 420, varnPosY = 102},
													[23] = {varnPosX = 409, varnPosY = 128},
													[24] = {varnPosX = 471, varnPosY = 81},
													[25] = {varnPosX = 440, varnPosY = 40},
													[26] = {varnPosX = 394, varnPosY = 56},
													[27] = {varnPosX = 365, varnPosY = 86},
													[28] = {varnPosX = 299, varnPosY = 64},
													[29] = {varnPosX = 266, varnPosY = 229},
													[30] = {varnPosX = 229, varnPosY = 62},
													[31] = {varnPosX = 174, varnPosY = 74},
													[32] = {varnPosX = 173, varnPosY = 39},
													[33] = {varnPosX = 131, varnPosY = 66},
													[34] = {varnPosX = 168, varnPosY = 79},
													[35] = {varnPosX = 117, varnPosY = 153},
													[36] = {varnPosX = 141, varnPosY = 188},
													[37] = {varnPosX = 89, varnPosY = 116},
													[38] = {varnPosX = 62, varnPosY = 229},
													[39] = {varnPosX = 168, varnPosY = 319},
													[40] = {varnPosX = 153, varnPosY = 316},
													[41] = {varnPosX = 216, varnPosY = 302},
													[42] = {varnPosX = 213, varnPosY = 357},
													[43] = {varnPosX = 240, varnPosY = 362},
													[44] = {varnPosX = 160, varnPosY = 302},
													[45] = {varnPosX = 242, varnPosY = 141},
													[46] = {varnPosX = 305, varnPosY = 150},
													[47] = {varnPosX = 266, varnPosY = 281},
													[48] = {varnPosX = 38, varnPosY = 168},
													[49] = {varnPosX = 243, varnPosY = 38},
													[50] = {varnPosX = 350, varnPosY = 237},
													[51] = {varnPosX = 204, varnPosY = 128},
													[52] = {varnPosX = 217, varnPosY = 175},
													[53] = {varnPosX = 341, varnPosY = 451},
													[54] = {varnPosX = 126, varnPosY = 250},
													[55] = {varnPosX = 205, varnPosY = 254},
													[56] = {varnPosX = 270, varnPosY = 314},
													[57] = {varnPosX = 329, varnPosY = 314},
													[58] = {varnPosX = 279, varnPosY = 392},
													[59] = {varnPosX = 343, varnPosY = 387},
													[60] = {varnPosX = 365, varnPosY = 358},
}

x490036_var_TwellAppeared  = "【队伍】冥王秘境副本入口在后花园出现"
x490036_var_SwellAppeared  = "【个人】冥王秘境副本入口在后花园出现！"

function x490036_ProcTimerDoingStart(varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5)

	if tonumber(44) == tonumber(varMap) then

		local nRandTime = 1000
		if tonumber(1) == tonumber(varParam1) then
			nRandTime = random(1000, x490036_var_InterTime)
			SetSystemTimerTick( varMap, x490036_var_FileId, "CreateSubmitNpc", varAct, nRandTime)
		elseif tonumber(0) == tonumber(varParam1) then
			x490036_CreateSubmitNpc(varMap, 0)
		end
	end
end

function x490036_CreateSubmitNpc(varMap, varNpcGuid)
	local npcGuid = x490036_var_NpcSGUID
	local npcType = x490036_var_NpcIDS

	if nil ~= varNpcGuid and tonumber(0) == varNpcGuid then
		npcGuid = x490036_var_NpcTGUID
		npcType = x490036_var_NpcIDT
	end

	-- 添加NPC
	for i =1, x490036_var_NpcNum do
			local varObjID = CreateMonster(varMap, npcType, x490036_var_LiveNpcMap[i].varnPosX , x490036_var_LiveNpcMap[i].varnPosY , 3, -1, -1, npcGuid, 20, x490036_var_NpcLiveTime, 0, "","冥王秘境传送人")		
	end

	local strMsg = ""
	if x490036_var_NpcTGUID == npcGuid then
		strMsg = x490036_var_TwellAppeared
	elseif x490036_var_NpcSGUID == npcGuid then
		strMsg = x490036_var_SwellAppeared
	end

	LuaAllScenceM2Wrold( varMap, strMsg, 5, 1)
	LuaAllScenceM2Wrold( varMap, strMsg, CHAT_PLANE_SCROLL, 1 )
end

function x490036_DeleteNpc(varMap, varNpcId)
	DeleteMonster(varMap, varNpcId)
end
