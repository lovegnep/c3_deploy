--装备物品玩法总入口

x800128_var_FileId = 800128


--请和DefineItem.h EQUIP_WANFA_TYPE 定义值保持一致！
x800128_var_Wanfa_Handle_Map = {
								
								[22]  = { script=570045, fun="ProcItemWanfa", NpcCared = 1, desc="装备转职" },
								[28] =  { script=800095, fun="ProcItemWanfa", NpcCared = 0, desc="十星启动" },
								[33] =  { script=800129, fun="ProcItemWanfa", NpcCared = 1, desc="战车装备打造" },
								[34] =  { script=800130, fun="ProcItemWanfa", NpcCared = 1, desc="战车车身打造" },
								[35] =  { script=800133, fun="ProcItemWanfa", NpcCared = 1, desc="战车装备打孔" },
								[36] =  { script=800134, fun="ProcItemWanfa", NpcCared = 1, desc="战车装备镶嵌宝石" },
								[37] =  { script=800135, fun="ProcItemWanfa", NpcCared = 1, desc="战车装备拆卸宝石" },
								[38] =  { script=800136, fun="ProcItemWanfa", NpcCared = 1, desc="战车装备替换宝石" },
								[39] =  { script=800137, fun="ProcItemWanfa", NpcCared = 1, desc="战车宝石合成" },
								[40] =  { script=800138, fun="ProcItemWanfa", NpcCared = 1, desc="战车装备回收" },
								[41] =  { script=800140, fun="ProcItemWanfa", NpcCared = 0, desc="时装上色" },
								[42] =  { script=800142, fun="ProcItemWanfa", NpcCared = 0, desc="冥装升级" },
								[43] =  { script=800144, fun="ProcItemWanfa", NpcCared = 0, desc="扑克铭刻"},
								[46] =	{ script=800155, fun="ProcItemWanfa", NpcCared = 1, desc="神器升级"},
								[47] =  { script=800300, fun="ProcItemWanfa", NpcCared = 0, desc="武魂铭刻"},
								[48] =  { script=800160, fun="ProcItemWanfa", NpcCared = 0, desc="卡牌合成"},
								[49] =	{ script=800161, fun="ProcItemWanfa", NpcCared = 0, desc="卡牌升级"},
								[51] =	{ script=800164, fun="ProcItemWanfa", NpcCared = 0, desc="骑乘装备强化"},
								[52] =	{ script=800165, fun="ProcItemWanfa", NpcCared = 0, desc="骑乘装备回收"},
								[53] =	{ script=800169, fun="ProcItemWanfa", NpcCared = 0, desc="卡牌回收"},
						       }


function x800128_ProcEventEntry( varMap, varPlayer, varNpcId, varWanfaType )	
					
		
		local handler = x800128_var_Wanfa_Handle_Map[varWanfaType];
		
		if handler ~= nil and handler.script ~= -1 then
				if handler.NpcCared == 1 then
						
						if CheckNPCIsInValidDistance( varMap, varPlayer, varNpcId ) == 0 then
								return
						end	
						
				end		
		
				LuaCallNoclosure( handler.script, handler.fun, varMap, varPlayer, varWanfaType )

		else
				WriteLog(1, format("x800128_ProcEventEntry can't handle this wanfa! varMap=%d,PlayerGUID=%X,WanfaType=%d", varMap, GetGUID( varMap, varPlayer ), varWanfaType ))
		end	
		
end

function x800128_ProcSaveEquipPurpleAttr(varMap, varPlayer, ItemPos, ProType)
	local Serial, Server, World = GetItemProperty(varMap, varPlayer, ItemPos, "SNID")
	if (Serial == nil or Server == nil or World == nil) then
		return
	end
	
	x800128_ClearTmpSaveEquipPurpleAttrMD(varMap, varPlayer, ProType)
	
	x800128_SetTmpSaveEquipSnid(varMap, varPlayer, World, Server, Serial, ProType)
	
	local num = GetEquipPurpleAttrNum(varMap, varPlayer, ItemPos, ProType)
	
	--紫属性
	if (ProType == 0) then
		local Type, value;
		if (num > 0) then
			for idx = 0, num - 1 do
				Type, value = GetEquipPurpleAttrByIdx(varMap, varPlayer, ItemPos, idx);
				x800128_SetTmpSaveEquipPurpleAttr(varMap, varPlayer, idx, Type, value, 0, ProType)
			end
		end
	end
	
	--星座
	if (ProType == 1) then
		if (num > 0) then
			for idx = 0, (num * 2) - 1 do
				local ConstId,Type,Value = GetEquipConstPro(varMap, varPlayer, ItemPos, idx);

				x800128_SetTmpSaveEquipPurpleAttr(varMap, varPlayer, idx, Type, Value, ConstId, ProType)
			end
		end
	end
	
	x800128_SendTmpSaveEquipPurpleAttr(varMap, varPlayer, ProType)
end

function x800128_ProcRevertEquipPurpleAttr(varMap, varPlayer, ItemPos, ProType)
	local Serial, Server, World = GetItemProperty(varMap, varPlayer, ItemPos, "SNID")
	
	if (Serial == nil or Server == nil or World == nil) then
		return
	end
	
	local ItemWorld ,ItemServer, ItemSerial	= x800128_GetTmpSaveEquipSnid(varMap, varPlayer, ProType)

	if (Serial == ItemSerial and Server == ItemServer and World == ItemWorld) then

		local Type1,Value1,ConstId1		= x800128_GetTmpSaveEquipPurpleAttr(varMap, varPlayer, 0, ProType)
		local Type2,Value2,ConstId2		= x800128_GetTmpSaveEquipPurpleAttr(varMap, varPlayer, 1, ProType)
		local Type3,Value3,ConstId3		= x800128_GetTmpSaveEquipPurpleAttr(varMap, varPlayer, 2, ProType)
		local Type4,Value4,ConstId4		= x800128_GetTmpSaveEquipPurpleAttr(varMap, varPlayer, 3, ProType)
		
		if (ProType == 0) then
			ClearEquipPurpleAttr(varMap, varPlayer, ItemPos, ProType)
			
			AddEquipPurpleAttr(varMap, varPlayer, ItemPos, Type1,Value1)
			AddEquipPurpleAttr(varMap, varPlayer, ItemPos, Type2,Value2)
			AddEquipPurpleAttr(varMap, varPlayer, ItemPos, Type3,Value3)
		end
		
		if (ProType == 1) then
			local nCount = 0;
			if (Type1 > 0 or Value1 > 0) then
				nCount = nCount + 1;
			end
			if (Type3 > 0 or Value3 > 0) then
				nCount = nCount + 1;
			end
			--Msg2Player(varMap, varPlayer, " ConstId1 = "..ConstId1.." ConstId2 = "..ConstId2.."  ConstId3 "..ConstId3.." ConstId4 ="..ConstId4, 8,3)
			--清除星座属性
			ClearEquipConstPro(varMap, varPlayer, ItemPos, nCount)
			--增加星座属性
			AddEquipConstePro(varMap, varPlayer, ItemPos, Type1,Value1, ConstId1, 0, 0)
			AddEquipConstePro(varMap, varPlayer, ItemPos, Type2,Value2, ConstId2, 0, 1)
			AddEquipConstePro(varMap, varPlayer, ItemPos, Type3,Value3, ConstId3, 1, 0)
			AddEquipConstePro(varMap, varPlayer, ItemPos, Type4,Value4, ConstId4, 1, 1)
		end
	
		--x800128_ClearTmpSaveEquipPurpleAttrMD(varMap, varPlayer)
		x800128_SendTmpSaveEquipPurpleAttr(varMap, varPlayer, ProType)
		
		NotifyItemInfo(varMap, varPlayer, ItemPos)
	end
end

function x800128_ProcCheckToClearEquipPurpleAttr(varMap, varPlayer, ItemPos, ProType)
	local Serial, Server, World = GetItemProperty(varMap, varPlayer, ItemPos, "SNID")
	local ItemWorld ,ItemServer, ItemSerial	= x800128_GetTmpSaveEquipSnid(varMap, varPlayer, ProType)

	if (Serial ~= ItemSerial or Server ~= ItemServer or World ~= ItemWorld) then
		x800128_ClearTmpSaveEquipPurpleAttrMD(varMap, varPlayer, ProType)
		x800128_SendTmpSaveEquipPurpleAttr(varMap, varPlayer, ProType)
	end
end

function x800128_SendTmpSaveEquipPurpleAttr(varMap, varPlayer, ProType)
	local ItemWorld ,ItemServer, ItemSerial	= x800128_GetTmpSaveEquipSnid(varMap, varPlayer, ProType)
	
	local Type1,Value1,ConstId1 = x800128_GetTmpSaveEquipPurpleAttr(varMap, varPlayer, 0, ProType)
	local Type2,Value2,ConstId2 = x800128_GetTmpSaveEquipPurpleAttr(varMap, varPlayer, 1, ProType)
	local Type3,Value3,ConstId3 = x800128_GetTmpSaveEquipPurpleAttr(varMap, varPlayer, 2, ProType)
	local Type4,Value4,ConstId4 = x800128_GetTmpSaveEquipPurpleAttr(varMap, varPlayer, 3, ProType)
		
	if (ProType == 0) then
		SendEquipTempPurpleAttr(varMap, varPlayer, ItemServer, ItemWorld, ItemSerial, Type1, Value1, Type2, Value2, Type3, Value3)
	end
	
	if (ProType == 1) then
		SendTempConstPro(varMap, varPlayer, ItemServer, ItemWorld, ItemSerial, ConstId1, ConstId3, Type1, Value1, Type2, Value2, 
			             Type3, Value3, Type4, Value4)
	end
end

function x800128_ClearTmpSaveEquipPurpleAttrMD(varMap, varPlayer, ProType)
	x800128_SetTmpSaveEquipSnid(varMap, varPlayer, 0,0,0, ProType)
	x800128_SetTmpSaveEquipPurpleAttr(varMap,varPlayer, 0,0,0,0,ProType)
	x800128_SetTmpSaveEquipPurpleAttr(varMap,varPlayer, 1,0,0,0,ProType)
	x800128_SetTmpSaveEquipPurpleAttr(varMap,varPlayer, 2,0,0,0,ProType)
	x800128_SetTmpSaveEquipPurpleAttr(varMap,varPlayer, 3,0,0,0,ProType)
end

function x800128_GetTmpSaveEquipSnid(varMap, varPlayer, ProType)
	local ItemWorld = 0 
	local ItemServer = 0
	local ItemSerial = 0
	
	if (ProType == 0) then
		ItemWorld 	= GetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_SNID_WORLD[1], MD_TMPPURPLEATTR_SAVE_SNID_WORLD[2], MD_TMPPURPLEATTR_SAVE_SNID_WORLD[3])
		ItemServer 	= GetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_SNID_SERVER[1], MD_TMPPURPLEATTR_SAVE_SNID_SERVER[2], MD_TMPPURPLEATTR_SAVE_SNID_SERVER[3])
		ItemSerial	= GetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_SNID_SERIAL[1], MD_TMPPURPLEATTR_SAVE_SNID_SERIAL[2], MD_TMPPURPLEATTR_SAVE_SNID_SERIAL[3])
	end
	
	if (ProType == 1) then
		ItemWorld 	= GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_SNID_WORLD[1], MD_TMPCONSTEPRO_SAVE_SNID_WORLD[2], MD_TMPCONSTEPRO_SAVE_SNID_WORLD[3])
		ItemServer 	= GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_SNID_SERVER[1], MD_TMPCONSTEPRO_SAVE_SNID_SERVER[2], MD_TMPCONSTEPRO_SAVE_SNID_SERVER[3])
		ItemSerial	= GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_SNID_SERIAL[1], MD_TMPCONSTEPRO_SAVE_SNID_SERIAL[2], MD_TMPCONSTEPRO_SAVE_SNID_SERIAL[3])
	end
	
	return ItemWorld, ItemServer, ItemSerial
end

function x800128_SetTmpSaveEquipSnid(varMap, varPlayer, ItemWorld, ItemServer, ItemSerial, ProType)
	--紫属性
	if (ProType == 0) then
		SetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_SNID_WORLD[1], MD_TMPPURPLEATTR_SAVE_SNID_WORLD[2], MD_TMPPURPLEATTR_SAVE_SNID_WORLD[3], ItemWorld)
		SetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_SNID_SERVER[1], MD_TMPPURPLEATTR_SAVE_SNID_SERVER[2], MD_TMPPURPLEATTR_SAVE_SNID_SERVER[3], ItemServer)
		SetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_SNID_SERIAL[1], MD_TMPPURPLEATTR_SAVE_SNID_SERIAL[2], MD_TMPPURPLEATTR_SAVE_SNID_SERIAL[3], ItemSerial)
	end
	
	--星座属性
	if (ProType ==1) then
		SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_SNID_WORLD[1], MD_TMPCONSTEPRO_SAVE_SNID_WORLD[2], MD_TMPCONSTEPRO_SAVE_SNID_WORLD[3], ItemWorld)
		SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_SNID_SERVER[1], MD_TMPCONSTEPRO_SAVE_SNID_SERVER[2], MD_TMPCONSTEPRO_SAVE_SNID_SERVER[3], ItemServer)
		SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_SNID_SERIAL[1], MD_TMPCONSTEPRO_SAVE_SNID_SERIAL[2], MD_TMPCONSTEPRO_SAVE_SNID_SERIAL[3], ItemSerial)
	end
end

function x800128_SetTmpSaveEquipPurpleAttr(varMap, varPlayer, idx, Type, Value, ConstId, ProTyp)
	--紫属性
	if (ProTyp == 0) then
		if (idx == 0) then
			SetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_TYPE1[1], MD_TMPPURPLEATTR_SAVE_TYPE1[2], MD_TMPPURPLEATTR_SAVE_TYPE1[3], Type)
			SetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_VALUE1[1], MD_TMPPURPLEATTR_SAVE_VALUE1[2], MD_TMPPURPLEATTR_SAVE_VALUE1[3], Value)
		elseif (idx == 1) then
			SetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_TYPE2[1], MD_TMPPURPLEATTR_SAVE_TYPE2[2], MD_TMPPURPLEATTR_SAVE_TYPE2[3], Type)
			SetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_VALUE2[1], MD_TMPPURPLEATTR_SAVE_VALUE2[2], MD_TMPPURPLEATTR_SAVE_VALUE2[3], Value)
		elseif (idx == 2) then
			SetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_TYPE3[1], MD_TMPPURPLEATTR_SAVE_TYPE3[2], MD_TMPPURPLEATTR_SAVE_TYPE3[3], Type)
			SetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_VALUE3[1], MD_TMPPURPLEATTR_SAVE_VALUE3[2], MD_TMPPURPLEATTR_SAVE_VALUE3[3], Value)
		end
	end
	
	--星座属性
	if (ProTyp == 1) then
		if (idx == 0) then
			SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_TYPE1[1], MD_TMPCONSTEPRO_SAVE_TYPE1[2], MD_TMPCONSTEPRO_SAVE_TYPE1[3], Type)
			SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_VALUE1[1], MD_TMPCONSTEPRO_SAVE_VALUE1[2], MD_TMPCONSTEPRO_SAVE_VALUE1[3], Value)
			SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_CONSTID1[1], MD_TMPCONSTEPRO_SAVE_CONSTID1[2], MD_TMPCONSTEPRO_SAVE_CONSTID1[3], ConstId)
		elseif (idx == 1) then
			SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_TYPE2[1], MD_TMPCONSTEPRO_SAVE_TYPE2[2], MD_TMPCONSTEPRO_SAVE_TYPE2[3], Type)
			SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_VALUE2[1], MD_TMPCONSTEPRO_SAVE_VALUE2[2], MD_TMPCONSTEPRO_SAVE_VALUE2[3], Value)
			SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_CONSTID1[1], MD_TMPCONSTEPRO_SAVE_CONSTID1[2], MD_TMPCONSTEPRO_SAVE_CONSTID1[3], ConstId)
		elseif (idx == 2) then
			SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_TYPE3[1], MD_TMPCONSTEPRO_SAVE_TYPE3[2], MD_TMPCONSTEPRO_SAVE_TYPE3[3], Type)
			SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_VALUE3[1], MD_TMPCONSTEPRO_SAVE_VALUE3[2], MD_TMPCONSTEPRO_SAVE_VALUE3[3], Value)
			SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_CONSTID2[1], MD_TMPCONSTEPRO_SAVE_CONSTID2[2], MD_TMPCONSTEPRO_SAVE_CONSTID2[3], ConstId)
		elseif (idx ==3) then
			SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_TYPE4[1], MD_TMPCONSTEPRO_SAVE_TYPE4[2], MD_TMPCONSTEPRO_SAVE_TYPE4[3], Type)
			SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_VALUE4[1], MD_TMPCONSTEPRO_SAVE_VALUE4[2], MD_TMPCONSTEPRO_SAVE_VALUE4[3], Value)
			SetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_CONSTID2[1], MD_TMPCONSTEPRO_SAVE_CONSTID2[2], MD_TMPCONSTEPRO_SAVE_CONSTID2[3], ConstId)
		end
	end
	
end

function x800128_GetTmpSaveEquipPurpleAttr(varMap, varPlayer, idx, ProType)
	local Type = 0
	local value = 0
	local ConstId = 0
	--紫属性
	if (ProType == 0) then
		if (idx == 0) then
			Type 	= GetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_TYPE1[1], MD_TMPPURPLEATTR_SAVE_TYPE1[2], MD_TMPPURPLEATTR_SAVE_TYPE1[3])
			value 	= GetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_VALUE1[1], MD_TMPPURPLEATTR_SAVE_VALUE1[2], MD_TMPPURPLEATTR_SAVE_VALUE1[3])
		elseif (idx == 1) then
			Type 	= GetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_TYPE2[1], MD_TMPPURPLEATTR_SAVE_TYPE2[2], MD_TMPPURPLEATTR_SAVE_TYPE2[3])
			value 	= GetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_VALUE2[1], MD_TMPPURPLEATTR_SAVE_VALUE2[2], MD_TMPPURPLEATTR_SAVE_VALUE2[3])
		elseif (idx == 2) then
			Type 	= GetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_TYPE3[1], MD_TMPPURPLEATTR_SAVE_TYPE3[2], MD_TMPPURPLEATTR_SAVE_TYPE3[3])
			value 	= GetPlayerGameData(varMap, varPlayer, MD_TMPPURPLEATTR_SAVE_VALUE3[1], MD_TMPPURPLEATTR_SAVE_VALUE3[2], MD_TMPPURPLEATTR_SAVE_VALUE3[3])
		end
	end
	
	--星座属性
	if (ProType == 1) then
		if (idx == 0) then
			Type 	= GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_TYPE1[1], MD_TMPCONSTEPRO_SAVE_TYPE1[2], MD_TMPCONSTEPRO_SAVE_TYPE1[3])
			value 	= GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_VALUE1[1], MD_TMPCONSTEPRO_SAVE_VALUE1[2], MD_TMPCONSTEPRO_SAVE_VALUE1[3])
			ConstId = GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_CONSTID1[1], MD_TMPCONSTEPRO_SAVE_CONSTID1[2], MD_TMPCONSTEPRO_SAVE_CONSTID1[3])
		elseif (idx == 1) then
			Type 	= GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_TYPE2[1], MD_TMPCONSTEPRO_SAVE_TYPE2[2], MD_TMPCONSTEPRO_SAVE_TYPE2[3])
			value 	= GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_VALUE2[1], MD_TMPCONSTEPRO_SAVE_VALUE2[2], MD_TMPCONSTEPRO_SAVE_VALUE2[3])
			ConstId = GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_CONSTID1[1], MD_TMPCONSTEPRO_SAVE_CONSTID1[2], MD_TMPCONSTEPRO_SAVE_CONSTID1[3])
		elseif (idx == 2) then
			Type 	= GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_TYPE3[1], MD_TMPCONSTEPRO_SAVE_TYPE3[2], MD_TMPCONSTEPRO_SAVE_TYPE3[3])
			value 	= GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_VALUE3[1], MD_TMPCONSTEPRO_SAVE_VALUE3[2], MD_TMPCONSTEPRO_SAVE_VALUE3[3])
			ConstId = GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_CONSTID2[1], MD_TMPCONSTEPRO_SAVE_CONSTID2[2], MD_TMPCONSTEPRO_SAVE_CONSTID2[3])
		elseif (idx == 3) then
			Type 	= GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_TYPE4[1], MD_TMPCONSTEPRO_SAVE_TYPE4[2], MD_TMPCONSTEPRO_SAVE_TYPE4[3])
			value 	= GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_VALUE4[1], MD_TMPCONSTEPRO_SAVE_VALUE4[2], MD_TMPCONSTEPRO_SAVE_VALUE4[3])
			ConstId = GetPlayerGameData(varMap, varPlayer, MD_TMPCONSTEPRO_SAVE_CONSTID2[1], MD_TMPCONSTEPRO_SAVE_CONSTID2[2], MD_TMPCONSTEPRO_SAVE_CONSTID2[3])
		end
	end
	
	return Type, value, ConstId
end
