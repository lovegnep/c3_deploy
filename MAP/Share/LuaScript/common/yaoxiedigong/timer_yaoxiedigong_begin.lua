x310030_var_FileId = 310030
x310030_str_end = "圣山地宫将在%d分钟后关闭，请各位勇士加紧杀怪"

x310030_str_pre = "圣山地宫的怪物将在%d分钟后出现，请大家做好准备"

x310030_str_shuaguai1 = "圣山地宫的怪物出现了，请大家努力消灭这些怪物吧"
x310030_str_shuaguai2 = "各位勇者请小心，新的怪物出现了"
x310030_str_shuaguai3 = "强者出现了，请大家全力以赴"

x310030_RespwanTime1 = 1000
x310030_RespwanTime2 = 10000
x310030_RespwanTime3 = 100000000

x310030_var_PreBroadCastNum = 2
x310030_var_CreateMonsterInterval = 60*1000*6
x310030_var_AfterBroadCastNum = 6


function x310030_ShowMessage1(varMap, varMsg)
	
	LuaThisScenceM2Wrold( varMap, varMsg, CHAT_PLANE_SCROLL, 1 )
	LuaThisScenceM2Wrold( varMap, varMsg, CHAT_LEFTDOWN, 1 )
	LuaThisScenceM2Wrold( varMap, varMsg, CHAT_PLUMB_SCROLL, 1 )
end


function x310030_AddObj(varMap, varObj)
	if varMap == YX_LOULAN_SCENE_ID1 then
		YX_LOULAN_MONSTER_OBJ_NUM1 = YX_LOULAN_MONSTER_OBJ_NUM1 + 1
		YX_LOULAN_MONSTER_OBJ_ID1[YX_LOULAN_MONSTER_OBJ_NUM1] = varObj
	elseif varMap == YX_LOULAN_SCENE_ID2 then
		YX_LOULAN_MONSTER_OBJ_NUM2 = YX_LOULAN_MONSTER_OBJ_NUM2 + 1
		YX_LOULAN_MONSTER_OBJ_ID2[YX_LOULAN_MONSTER_OBJ_NUM2] = varObj
	elseif varMap == YX_LOULAN_SCENE_ID3 then
		YX_LOULAN_MONSTER_OBJ_NUM3 = YX_LOULAN_MONSTER_OBJ_NUM3 + 1
		YX_LOULAN_MONSTER_OBJ_ID3[YX_LOULAN_MONSTER_OBJ_NUM3] = varObj
	elseif varMap == YX_LOULAN_SCENE_ID4 then
		YX_LOULAN_MONSTER_OBJ_NUM4 = YX_LOULAN_MONSTER_OBJ_NUM4 + 1
		YX_LOULAN_MONSTER_OBJ_ID4[YX_LOULAN_MONSTER_OBJ_NUM4] = varObj
	elseif varMap == YX_LOULAN_SCENE_ID5 then
		YX_LOULAN_MONSTER_OBJ_NUM5 = YX_LOULAN_MONSTER_OBJ_NUM5 + 1
		YX_LOULAN_MONSTER_OBJ_ID5[YX_LOULAN_MONSTER_OBJ_NUM5] = varObj
	elseif varMap == YX_LOULAN_SCENE_ID6 then
		YX_LOULAN_MONSTER_OBJ_NUM6 = YX_LOULAN_MONSTER_OBJ_NUM6 + 1
		YX_LOULAN_MONSTER_OBJ_ID6[YX_LOULAN_MONSTER_OBJ_NUM6] = varObj
	elseif varMap == YX_LOULAN_SCENE_ID7 then
		YX_LOULAN_MONSTER_OBJ_NUM7 = YX_LOULAN_MONSTER_OBJ_NUM7 + 1
		YX_LOULAN_MONSTER_OBJ_ID7[YX_LOULAN_MONSTER_OBJ_NUM7] = varObj
	elseif varMap == YX_LOULAN_SCENE_ID8 then
		YX_LOULAN_MONSTER_OBJ_NUM8 = YX_LOULAN_MONSTER_OBJ_NUM8 + 1
		YX_LOULAN_MONSTER_OBJ_ID8[YX_LOULAN_MONSTER_OBJ_NUM8] = varObj
	elseif varMap == YX_LOULAN_SCENE_ID9 then
		YX_LOULAN_MONSTER_OBJ_NUM9 = YX_LOULAN_MONSTER_OBJ_NUM9 + 1
		YX_LOULAN_MONSTER_OBJ_ID9[YX_LOULAN_MONSTER_OBJ_NUM9] = varObj
	elseif varMap == YX_LOULAN_SCENE_ID10 then
		YX_LOULAN_MONSTER_OBJ_NUM10 = YX_LOULAN_MONSTER_OBJ_NUM10 + 1
		YX_LOULAN_MONSTER_OBJ_ID10[YX_LOULAN_MONSTER_OBJ_NUM10] = varObj
	elseif varMap == YX_LOULAN_SCENE_ID11 then
		YX_LOULAN_MONSTER_OBJ_NUM11 = YX_LOULAN_MONSTER_OBJ_NUM11 + 1
		YX_LOULAN_MONSTER_OBJ_ID11[YX_LOULAN_MONSTER_OBJ_NUM11] = varObj								
	elseif varMap == YX_LOULAN_SCENE_ID12 then
		YX_LOULAN_MONSTER_OBJ_NUM12 = YX_LOULAN_MONSTER_OBJ_NUM12 + 1
		YX_LOULAN_MONSTER_OBJ_ID12[YX_LOULAN_MONSTER_OBJ_NUM12] = varObj
			
	elseif varMap == YX_LAIYIN_SCENE_ID1 then
		YX_LAIYIN_MONSTER_OBJ_NUM1 = YX_LAIYIN_MONSTER_OBJ_NUM1 + 1
		YX_LAIYIN_MONSTER_OBJ_ID1[YX_LAIYIN_MONSTER_OBJ_NUM1] = varObj
	elseif varMap == YX_LAIYIN_SCENE_ID2 then
		YX_LAIYIN_MONSTER_OBJ_NUM2 = YX_LAIYIN_MONSTER_OBJ_NUM2 + 1
		YX_LAIYIN_MONSTER_OBJ_ID2[YX_LAIYIN_MONSTER_OBJ_NUM2] = varObj
	elseif varMap == YX_LAIYIN_SCENE_ID3 then
		YX_LAIYIN_MONSTER_OBJ_NUM3 = YX_LAIYIN_MONSTER_OBJ_NUM3 + 1
		YX_LAIYIN_MONSTER_OBJ_ID3[YX_LAIYIN_MONSTER_OBJ_NUM3] = varObj
	elseif varMap == YX_LAIYIN_SCENE_ID4 then
		YX_LAIYIN_MONSTER_OBJ_NUM4 = YX_LAIYIN_MONSTER_OBJ_NUM4 + 1
		YX_LAIYIN_MONSTER_OBJ_ID4[YX_LAIYIN_MONSTER_OBJ_NUM4] = varObj
	elseif varMap == YX_LAIYIN_SCENE_ID5 then
		YX_LAIYIN_MONSTER_OBJ_NUM5 = YX_LAIYIN_MONSTER_OBJ_NUM5 + 1
		YX_LAIYIN_MONSTER_OBJ_ID5[YX_LAIYIN_MONSTER_OBJ_NUM5] = varObj
	elseif varMap == YX_LAIYIN_SCENE_ID6 then
		YX_LAIYIN_MONSTER_OBJ_NUM6 = YX_LAIYIN_MONSTER_OBJ_NUM6 + 1
		YX_LAIYIN_MONSTER_OBJ_ID6[YX_LAIYIN_MONSTER_OBJ_NUM6] = varObj
	elseif varMap == YX_LAIYIN_SCENE_ID7 then
		YX_LAIYIN_MONSTER_OBJ_NUM7 = YX_LAIYIN_MONSTER_OBJ_NUM7 + 1
		YX_LAIYIN_MONSTER_OBJ_ID7[YX_LAIYIN_MONSTER_OBJ_NUM7] = varObj
	elseif varMap == YX_LAIYIN_SCENE_ID8 then
		YX_LAIYIN_MONSTER_OBJ_NUM8 = YX_LAIYIN_MONSTER_OBJ_NUM8 + 1
		YX_LAIYIN_MONSTER_OBJ_ID8[YX_LAIYIN_MONSTER_OBJ_NUM8] = varObj
	elseif varMap == YX_LAIYIN_SCENE_ID9 then
		YX_LAIYIN_MONSTER_OBJ_NUM9 = YX_LAIYIN_MONSTER_OBJ_NUM9 + 1
		YX_LAIYIN_MONSTER_OBJ_ID9[YX_LAIYIN_MONSTER_OBJ_NUM9] = varObj
	elseif varMap == YX_LAIYIN_SCENE_ID10 then
		YX_LAIYIN_MONSTER_OBJ_NUM10 = YX_LAIYIN_MONSTER_OBJ_NUM10 + 1
		YX_LAIYIN_MONSTER_OBJ_ID10[YX_LAIYIN_MONSTER_OBJ_NUM10] = varObj
	elseif varMap == YX_LAIYIN_SCENE_ID11 then
		YX_LAIYIN_MONSTER_OBJ_NUM11 = YX_LAIYIN_MONSTER_OBJ_NUM11 + 1
		YX_LAIYIN_MONSTER_OBJ_ID11[YX_LAIYIN_MONSTER_OBJ_NUM11] = varObj				
	elseif varMap == YX_LAIYIN_SCENE_ID12 then
		YX_LAIYIN_MONSTER_OBJ_NUM12 = YX_LAIYIN_MONSTER_OBJ_NUM12 + 1
		YX_LAIYIN_MONSTER_OBJ_ID12[YX_LAIYIN_MONSTER_OBJ_NUM12] = varObj				
			
	elseif varMap == YX_KUNLUN_SCENE_ID1 then
		YX_KUNLUN_MONSTER_OBJ_NUM1 = YX_KUNLUN_MONSTER_OBJ_NUM1 + 1
		YX_KUNLUN_MONSTER_OBJ_ID1[YX_KUNLUN_MONSTER_OBJ_NUM1] = varObj
	elseif varMap == YX_KUNLUN_SCENE_ID2 then
		YX_KUNLUN_MONSTER_OBJ_NUM2 = YX_KUNLUN_MONSTER_OBJ_NUM2 + 1
		YX_KUNLUN_MONSTER_OBJ_ID2[YX_KUNLUN_MONSTER_OBJ_NUM2] = varObj
	elseif varMap == YX_KUNLUN_SCENE_ID3 then
		YX_KUNLUN_MONSTER_OBJ_NUM3 = YX_KUNLUN_MONSTER_OBJ_NUM3 + 1
		YX_KUNLUN_MONSTER_OBJ_ID3[YX_KUNLUN_MONSTER_OBJ_NUM3] = varObj
	elseif varMap == YX_KUNLUN_SCENE_ID4 then
		YX_KUNLUN_MONSTER_OBJ_NUM4 = YX_KUNLUN_MONSTER_OBJ_NUM4 + 1
		YX_KUNLUN_MONSTER_OBJ_ID4[YX_KUNLUN_MONSTER_OBJ_NUM4] = varObj
	elseif varMap == YX_KUNLUN_SCENE_ID5 then
		YX_KUNLUN_MONSTER_OBJ_NUM5 = YX_KUNLUN_MONSTER_OBJ_NUM5 + 1
		YX_KUNLUN_MONSTER_OBJ_ID5[YX_KUNLUN_MONSTER_OBJ_NUM5] = varObj
	elseif varMap == YX_KUNLUN_SCENE_ID6 then
		YX_KUNLUN_MONSTER_OBJ_NUM6 = YX_KUNLUN_MONSTER_OBJ_NUM6 + 1
		YX_KUNLUN_MONSTER_OBJ_ID6[YX_KUNLUN_MONSTER_OBJ_NUM6] = varObj
	elseif varMap == YX_KUNLUN_SCENE_ID7 then
		YX_KUNLUN_MONSTER_OBJ_NUM7 = YX_KUNLUN_MONSTER_OBJ_NUM7 + 1
		YX_KUNLUN_MONSTER_OBJ_ID7[YX_KUNLUN_MONSTER_OBJ_NUM7] = varObj
	elseif varMap == YX_KUNLUN_SCENE_ID8 then
		YX_KUNLUN_MONSTER_OBJ_NUM8 = YX_KUNLUN_MONSTER_OBJ_NUM8 + 1
		YX_KUNLUN_MONSTER_OBJ_ID8[YX_KUNLUN_MONSTER_OBJ_NUM8] = varObj	
	elseif varMap == YX_KUNLUN_SCENE_ID9 then
		YX_KUNLUN_MONSTER_OBJ_NUM9 = YX_KUNLUN_MONSTER_OBJ_NUM9 + 1
		YX_KUNLUN_MONSTER_OBJ_ID9[YX_KUNLUN_MONSTER_OBJ_NUM9] = varObj			
	elseif varMap == YX_KUNLUN_SCENE_ID10 then
		YX_KUNLUN_MONSTER_OBJ_NUM10 = YX_KUNLUN_MONSTER_OBJ_NUM10 + 1
		YX_KUNLUN_MONSTER_OBJ_ID10[YX_KUNLUN_MONSTER_OBJ_NUM10] = varObj
	elseif varMap == YX_KUNLUN_SCENE_ID11 then
		YX_KUNLUN_MONSTER_OBJ_NUM11 = YX_KUNLUN_MONSTER_OBJ_NUM11 + 1
		YX_KUNLUN_MONSTER_OBJ_ID11[YX_KUNLUN_MONSTER_OBJ_NUM11] = varObj
	elseif varMap == YX_KUNLUN_SCENE_ID12 then
		YX_KUNLUN_MONSTER_OBJ_NUM12 = YX_KUNLUN_MONSTER_OBJ_NUM12 + 1
		YX_KUNLUN_MONSTER_OBJ_ID12[YX_KUNLUN_MONSTER_OBJ_NUM12] = varObj

	elseif varMap == YX_DUNHUANG_SCENE_ID1 then
		YX_DUNHUANG_MONSTER_OBJ_NUM1 = YX_DUNHUANG_MONSTER_OBJ_NUM1 + 1
		YX_DUNHUANG_MONSTER_OBJ_ID1[YX_DUNHUANG_MONSTER_OBJ_NUM1] = varObj
	elseif varMap == YX_DUNHUANG_SCENE_ID2 then
		YX_DUNHUANG_MONSTER_OBJ_NUM2 = YX_DUNHUANG_MONSTER_OBJ_NUM2 + 1
		YX_DUNHUANG_MONSTER_OBJ_ID2[YX_DUNHUANG_MONSTER_OBJ_NUM2] = varObj
	elseif varMap == YX_DUNHUANG_SCENE_ID3 then
		YX_DUNHUANG_MONSTER_OBJ_NUM3 = YX_DUNHUANG_MONSTER_OBJ_NUM3 + 1
		YX_DUNHUANG_MONSTER_OBJ_ID3[YX_DUNHUANG_MONSTER_OBJ_NUM3] = varObj
	elseif varMap == YX_DUNHUANG_SCENE_ID4 then
		YX_DUNHUANG_MONSTER_OBJ_NUM4 = YX_DUNHUANG_MONSTER_OBJ_NUM4 + 1
		YX_DUNHUANG_MONSTER_OBJ_ID4[YX_DUNHUANG_MONSTER_OBJ_NUM4] = varObj
	elseif varMap == YX_DUNHUANG_SCENE_ID5 then
		YX_DUNHUANG_MONSTER_OBJ_NUM5 = YX_DUNHUANG_MONSTER_OBJ_NUM5 + 1
		YX_DUNHUANG_MONSTER_OBJ_ID5[YX_DUNHUANG_MONSTER_OBJ_NUM5] = varObj
	elseif varMap == YX_DUNHUANG_SCENE_ID6 then
		YX_DUNHUANG_MONSTER_OBJ_NUM6 = YX_DUNHUANG_MONSTER_OBJ_NUM6 + 1
		YX_DUNHUANG_MONSTER_OBJ_ID6[YX_DUNHUANG_MONSTER_OBJ_NUM6] = varObj
	elseif varMap == YX_DUNHUANG_SCENE_ID7 then
		YX_DUNHUANG_MONSTER_OBJ_NUM7 = YX_DUNHUANG_MONSTER_OBJ_NUM7 + 1
		YX_DUNHUANG_MONSTER_OBJ_ID7[YX_DUNHUANG_MONSTER_OBJ_NUM7] = varObj
	elseif varMap == YX_DUNHUANG_SCENE_ID8 then
		YX_DUNHUANG_MONSTER_OBJ_NUM8 = YX_DUNHUANG_MONSTER_OBJ_NUM8 + 1
		YX_DUNHUANG_MONSTER_OBJ_ID8[YX_DUNHUANG_MONSTER_OBJ_NUM8] = varObj	
	elseif varMap == YX_DUNHUANG_SCENE_ID9 then
		YX_DUNHUANG_MONSTER_OBJ_NUM9 = YX_DUNHUANG_MONSTER_OBJ_NUM9 + 1
		YX_DUNHUANG_MONSTER_OBJ_ID9[YX_DUNHUANG_MONSTER_OBJ_NUM9] = varObj
	elseif varMap == YX_DUNHUANG_SCENE_ID10 then
		YX_DUNHUANG_MONSTER_OBJ_NUM10 = YX_DUNHUANG_MONSTER_OBJ_NUM10 + 1
		YX_DUNHUANG_MONSTER_OBJ_ID10[YX_DUNHUANG_MONSTER_OBJ_NUM10] = varObj
	elseif varMap == YX_DUNHUANG_SCENE_ID11 then
		YX_DUNHUANG_MONSTER_OBJ_NUM11 = YX_DUNHUANG_MONSTER_OBJ_NUM11 + 1
		YX_DUNHUANG_MONSTER_OBJ_ID11[YX_DUNHUANG_MONSTER_OBJ_NUM11] = varObj							
	elseif varMap == YX_DUNHUANG_SCENE_ID12 then
		YX_DUNHUANG_MONSTER_OBJ_NUM12 = YX_DUNHUANG_MONSTER_OBJ_NUM12 + 1
		YX_DUNHUANG_MONSTER_OBJ_ID12[YX_DUNHUANG_MONSTER_OBJ_NUM12] = varObj							
	
	end
end

function x310030_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4, Param5 )
	

	if varMap == YX_LOULAN_SCENE_ID1 then
	
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM1 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM1 = YX_LOULAN_BROADCAST_NUM1 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LOULAN_SCENE_ID2 then
	
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM2 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM2 = YX_LOULAN_BROADCAST_NUM2 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LOULAN_SCENE_ID3 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM3 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM3 = YX_LOULAN_BROADCAST_NUM3 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 

	elseif varMap == YX_LOULAN_SCENE_ID4 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM4 )
		x310030_ShowMessage1(varMap,message        )
		YX_LOULAN_BROADCAST_NUM4 = YX_LOULAN_BROADCAST_NUM4 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LOULAN_SCENE_ID5 then
	
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM5 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM5 = YX_LOULAN_BROADCAST_NUM5 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 

	elseif varMap == YX_LOULAN_SCENE_ID6 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM6 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM6 = YX_LOULAN_BROADCAST_NUM6 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LOULAN_SCENE_ID7 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM7 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM7 = YX_LOULAN_BROADCAST_NUM7 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LOULAN_SCENE_ID8 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM8 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM8 = YX_LOULAN_BROADCAST_NUM8 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 

	elseif varMap == YX_LOULAN_SCENE_ID9 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM9 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM9 = YX_LOULAN_BROADCAST_NUM9 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LOULAN_SCENE_ID10 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM10 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM10 = YX_LOULAN_BROADCAST_NUM10 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LOULAN_SCENE_ID11 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM11 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM11 = YX_LOULAN_BROADCAST_NUM11 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	
	elseif varMap == YX_LOULAN_SCENE_ID12 then

		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM12 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM12 = YX_LOULAN_BROADCAST_NUM12 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
						
				
	elseif varMap == YX_LAIYIN_SCENE_ID1 then
	
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM1 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM1 = YX_LAIYIN_BROADCAST_NUM1 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LAIYIN_SCENE_ID2 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM2 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM2 = YX_LAIYIN_BROADCAST_NUM2 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LAIYIN_SCENE_ID3 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM3 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM3 = YX_LAIYIN_BROADCAST_NUM3 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	
	elseif varMap == YX_LAIYIN_SCENE_ID4 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM4 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM4 = YX_LAIYIN_BROADCAST_NUM4 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 

	elseif varMap == YX_LAIYIN_SCENE_ID5 then

		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM5 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM5 = YX_LAIYIN_BROADCAST_NUM5 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	
	elseif varMap == YX_LAIYIN_SCENE_ID6 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM6 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM6 = YX_LAIYIN_BROADCAST_NUM6 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LAIYIN_SCENE_ID7 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM7 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM7 = YX_LAIYIN_BROADCAST_NUM7 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LAIYIN_SCENE_ID8 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM8 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM8 = YX_LAIYIN_BROADCAST_NUM8 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	
	elseif varMap == YX_LAIYIN_SCENE_ID9 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM9 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM9 = YX_LAIYIN_BROADCAST_NUM9 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LAIYIN_SCENE_ID10 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM10 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM10 = YX_LAIYIN_BROADCAST_NUM10 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LAIYIN_SCENE_ID11 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM11 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM11 = YX_LAIYIN_BROADCAST_NUM11 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	
	elseif varMap == YX_LAIYIN_SCENE_ID12 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM12 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM12 = YX_LAIYIN_BROADCAST_NUM12 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
						
				
	elseif varMap == YX_KUNLUN_SCENE_ID1 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM1 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM1 = YX_KUNLUN_BROADCAST_NUM1 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_KUNLUN_SCENE_ID2 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM2 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM2 = YX_KUNLUN_BROADCAST_NUM2 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_KUNLUN_SCENE_ID3 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM3 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM3 = YX_KUNLUN_BROADCAST_NUM3 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	
	elseif varMap == YX_KUNLUN_SCENE_ID4 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM4 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM4 = YX_KUNLUN_BROADCAST_NUM4 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_KUNLUN_SCENE_ID5 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM5 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM5 = YX_KUNLUN_BROADCAST_NUM5 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	
	elseif varMap == YX_KUNLUN_SCENE_ID6 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM6 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM6 = YX_KUNLUN_BROADCAST_NUM6 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_KUNLUN_SCENE_ID7 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM7 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM7 = YX_KUNLUN_BROADCAST_NUM7 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_KUNLUN_SCENE_ID8 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM8 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM8 = YX_KUNLUN_BROADCAST_NUM8 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_KUNLUN_SCENE_ID9 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM9 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM9 = YX_KUNLUN_BROADCAST_NUM9 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_KUNLUN_SCENE_ID10 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM10 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM10 = YX_KUNLUN_BROADCAST_NUM10 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_KUNLUN_SCENE_ID11 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM11 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM11 = YX_KUNLUN_BROADCAST_NUM11 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	
	elseif varMap == YX_KUNLUN_SCENE_ID12 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM12 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM12 = YX_KUNLUN_BROADCAST_NUM12 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
						
				
	elseif varMap == YX_DUNHUANG_SCENE_ID1 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM1 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM1 = YX_DUNHUANG_BROADCAST_NUM1 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_DUNHUANG_SCENE_ID2 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM2 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM2 = YX_DUNHUANG_BROADCAST_NUM2 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_DUNHUANG_SCENE_ID3 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM3 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM3 = YX_DUNHUANG_BROADCAST_NUM3 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID4 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM4 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM4 = YX_DUNHUANG_BROADCAST_NUM4 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 

	elseif varMap == YX_DUNHUANG_SCENE_ID5 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM5 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM5 = YX_DUNHUANG_BROADCAST_NUM5 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_DUNHUANG_SCENE_ID6 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM6 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM6 = YX_DUNHUANG_BROADCAST_NUM6 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 

	elseif varMap == YX_DUNHUANG_SCENE_ID7 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM7 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM7 = YX_DUNHUANG_BROADCAST_NUM7 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 

    elseif varMap == YX_DUNHUANG_SCENE_ID8 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM8 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM8 = YX_DUNHUANG_BROADCAST_NUM8 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
    elseif varMap == YX_DUNHUANG_SCENE_ID9 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM9 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM9 = YX_DUNHUANG_BROADCAST_NUM9 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 

    elseif varMap == YX_DUNHUANG_SCENE_ID10 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM10 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM10 = YX_DUNHUANG_BROADCAST_NUM10 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
    elseif varMap == YX_DUNHUANG_SCENE_ID11 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM11 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM11 = YX_DUNHUANG_BROADCAST_NUM11 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	
	  elseif varMap == YX_DUNHUANG_SCENE_ID12 then
		
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM12 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM12 = YX_DUNHUANG_BROADCAST_NUM12 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
				
	end
	
end

function x310030_ProcMapTimerTick( varMap, varAct, varTime )

end


function x310030_BroadCastPre(varMap, varAct, varTime)

	if varMap == YX_LOULAN_SCENE_ID1 then
		if YX_LOULAN_BROADCAST_NUM1 == x310030_var_PreBroadCastNum then
			YX_LOULAN_BROADCAST_NUM1 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM1 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM1 = YX_LOULAN_BROADCAST_NUM1 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LOULAN_SCENE_ID2 then
		if YX_LOULAN_BROADCAST_NUM2 == x310030_var_PreBroadCastNum then
			YX_LOULAN_BROADCAST_NUM2 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM2 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM2 = YX_LOULAN_BROADCAST_NUM2 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LOULAN_SCENE_ID3 then
		if YX_LOULAN_BROADCAST_NUM3 == x310030_var_PreBroadCastNum then
			YX_LOULAN_BROADCAST_NUM3 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM3 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM3 = YX_LOULAN_BROADCAST_NUM3 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LOULAN_SCENE_ID4 then
		if YX_LOULAN_BROADCAST_NUM4 == x310030_var_PreBroadCastNum then
			YX_LOULAN_BROADCAST_NUM4 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM4 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM4 = YX_LOULAN_BROADCAST_NUM4 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LOULAN_SCENE_ID5 then
		if YX_LOULAN_BROADCAST_NUM5 == x310030_var_PreBroadCastNum then
			YX_LOULAN_BROADCAST_NUM5 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM5 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM5 = YX_LOULAN_BROADCAST_NUM5 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LOULAN_SCENE_ID6 then
		if YX_LOULAN_BROADCAST_NUM6 == x310030_var_PreBroadCastNum then
			YX_LOULAN_BROADCAST_NUM6 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM6 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM6 = YX_LOULAN_BROADCAST_NUM6 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LOULAN_SCENE_ID7 then
		if YX_LOULAN_BROADCAST_NUM7 == x310030_var_PreBroadCastNum then
			YX_LOULAN_BROADCAST_NUM7 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM7 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM7 = YX_LOULAN_BROADCAST_NUM7 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
  elseif varMap == YX_LOULAN_SCENE_ID8 then
		if YX_LOULAN_BROADCAST_NUM8 == x310030_var_PreBroadCastNum then
			YX_LOULAN_BROADCAST_NUM8= 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM8 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM8 = YX_LOULAN_BROADCAST_NUM8 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
  elseif varMap == YX_LOULAN_SCENE_ID9 then
		if YX_LOULAN_BROADCAST_NUM9 == x310030_var_PreBroadCastNum then
			YX_LOULAN_BROADCAST_NUM9= 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM9 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM9 = YX_LOULAN_BROADCAST_NUM9 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
  elseif varMap == YX_LOULAN_SCENE_ID10 then
		if YX_LOULAN_BROADCAST_NUM10 == x310030_var_PreBroadCastNum then
			YX_LOULAN_BROADCAST_NUM10= 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM10 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM10 = YX_LOULAN_BROADCAST_NUM10 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
  elseif varMap == YX_LOULAN_SCENE_ID11 then
		if YX_LOULAN_BROADCAST_NUM11 == x310030_var_PreBroadCastNum then
			YX_LOULAN_BROADCAST_NUM11= 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM11 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM11 = YX_LOULAN_BROADCAST_NUM11 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 				
  elseif varMap == YX_LOULAN_SCENE_ID12 then
  


		if YX_LOULAN_BROADCAST_NUM12 == x310030_var_PreBroadCastNum then
			YX_LOULAN_BROADCAST_NUM12= 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LOULAN_BROADCAST_NUM12 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM12 = YX_LOULAN_BROADCAST_NUM12 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 				
			
	elseif varMap == YX_LAIYIN_SCENE_ID1 then
		if YX_LAIYIN_BROADCAST_NUM1 == x310030_var_PreBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM1 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM1 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM1 = YX_LAIYIN_BROADCAST_NUM1 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID2 then
		if YX_LAIYIN_BROADCAST_NUM2 == x310030_var_PreBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM2 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM2 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM2 = YX_LAIYIN_BROADCAST_NUM2 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID3 then
		if YX_LAIYIN_BROADCAST_NUM3 == x310030_var_PreBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM3 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM3 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM3 = YX_LAIYIN_BROADCAST_NUM3 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID4 then
		if YX_LAIYIN_BROADCAST_NUM4 == x310030_var_PreBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM4 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM4 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM4 = YX_LAIYIN_BROADCAST_NUM4 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_LAIYIN_SCENE_ID5 then
		if YX_LAIYIN_BROADCAST_NUM5 == x310030_var_PreBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM5 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM5 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM5 = YX_LAIYIN_BROADCAST_NUM5 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID6 then
		if YX_LAIYIN_BROADCAST_NUM6 == x310030_var_PreBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM6 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM6 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM6 = YX_LAIYIN_BROADCAST_NUM6 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID7 then
		if YX_LAIYIN_BROADCAST_NUM7 == x310030_var_PreBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM7 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM7 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM7 = YX_LAIYIN_BROADCAST_NUM7 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID8 then
		if YX_LAIYIN_BROADCAST_NUM8 == x310030_var_PreBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM8 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM8 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM8 = YX_LAIYIN_BROADCAST_NUM8 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID9 then
		if YX_LAIYIN_BROADCAST_NUM9 == x310030_var_PreBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM9 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM9 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM9 = YX_LAIYIN_BROADCAST_NUM9 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID10 then
		if YX_LAIYIN_BROADCAST_NUM10 == x310030_var_PreBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM10 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM10 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM10 = YX_LAIYIN_BROADCAST_NUM10 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID11 then
		if YX_LAIYIN_BROADCAST_NUM11 == x310030_var_PreBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM11 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM11 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM11 = YX_LAIYIN_BROADCAST_NUM11 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID12 then
		if YX_LAIYIN_BROADCAST_NUM12 == x310030_var_PreBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM12 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_LAIYIN_BROADCAST_NUM12 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM12 = YX_LAIYIN_BROADCAST_NUM12 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_KUNLUN_SCENE_ID1 then
		if YX_KUNLUN_BROADCAST_NUM1 == x310030_var_PreBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM1 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM1 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM1 = YX_KUNLUN_BROADCAST_NUM1 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID2 then
		if YX_KUNLUN_BROADCAST_NUM2 == x310030_var_PreBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM2 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM2 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM2 = YX_KUNLUN_BROADCAST_NUM2 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID3 then
		if YX_KUNLUN_BROADCAST_NUM3 == x310030_var_PreBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM3 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM3 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM3 = YX_KUNLUN_BROADCAST_NUM3 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID4 then
		if YX_KUNLUN_BROADCAST_NUM4 == x310030_var_PreBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM4 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM4 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM4 = YX_KUNLUN_BROADCAST_NUM4 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 

	elseif varMap == YX_KUNLUN_SCENE_ID5 then
		if YX_KUNLUN_BROADCAST_NUM5 == x310030_var_PreBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM5 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM5 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM5 = YX_KUNLUN_BROADCAST_NUM5 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_KUNLUN_SCENE_ID6 then
		if YX_KUNLUN_BROADCAST_NUM6 == x310030_var_PreBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM6 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM6 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM6 = YX_KUNLUN_BROADCAST_NUM6 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_KUNLUN_SCENE_ID7 then
		if YX_KUNLUN_BROADCAST_NUM7 == x310030_var_PreBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM7 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM7 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM7 = YX_KUNLUN_BROADCAST_NUM7 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID8 then
		if YX_KUNLUN_BROADCAST_NUM8 == x310030_var_PreBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM8 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM8 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM8 = YX_KUNLUN_BROADCAST_NUM8 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID9 then
		if YX_KUNLUN_BROADCAST_NUM9 == x310030_var_PreBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM9 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM9 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM9 = YX_KUNLUN_BROADCAST_NUM9 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID10 then
		if YX_KUNLUN_BROADCAST_NUM10 == x310030_var_PreBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM10 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM10 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM10 = YX_KUNLUN_BROADCAST_NUM10 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID11 then
		if YX_KUNLUN_BROADCAST_NUM11 == x310030_var_PreBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM11 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM11 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM11 = YX_KUNLUN_BROADCAST_NUM11 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID12 then
		if YX_KUNLUN_BROADCAST_NUM12 == x310030_var_PreBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM12 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_KUNLUN_BROADCAST_NUM12 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM12 = YX_KUNLUN_BROADCAST_NUM12 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 	

	elseif varMap == YX_DUNHUANG_SCENE_ID1 then
		if YX_DUNHUANG_BROADCAST_NUM1 == x310030_var_PreBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM1 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM1 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM1 = YX_DUNHUANG_BROADCAST_NUM1 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID2 then
		if YX_DUNHUANG_BROADCAST_NUM2 == x310030_var_PreBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM2 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM2 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM2 = YX_DUNHUANG_BROADCAST_NUM2 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID3 then
		if YX_DUNHUANG_BROADCAST_NUM3 == x310030_var_PreBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM3 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM3 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM3 = YX_DUNHUANG_BROADCAST_NUM3 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID4 then
		if YX_DUNHUANG_BROADCAST_NUM4 == x310030_var_PreBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM4 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM4 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM4 = YX_DUNHUANG_BROADCAST_NUM4 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
		
	elseif varMap == YX_DUNHUANG_SCENE_ID5 then
		if YX_DUNHUANG_BROADCAST_NUM5 == x310030_var_PreBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM5 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM5 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM5 = YX_DUNHUANG_BROADCAST_NUM5 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID6 then
		if YX_DUNHUANG_BROADCAST_NUM6 == x310030_var_PreBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM6 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM6 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM6 = YX_DUNHUANG_BROADCAST_NUM6 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID7 then
		if YX_DUNHUANG_BROADCAST_NUM7 == x310030_var_PreBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM7 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM7 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM7 = YX_DUNHUANG_BROADCAST_NUM7 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID8 then
		if YX_DUNHUANG_BROADCAST_NUM8 == x310030_var_PreBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM8 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM8 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM8 = YX_DUNHUANG_BROADCAST_NUM8 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID9 then
		if YX_DUNHUANG_BROADCAST_NUM9 == x310030_var_PreBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM9 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM9 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM9 = YX_DUNHUANG_BROADCAST_NUM9 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID10 then
		if YX_DUNHUANG_BROADCAST_NUM10 == x310030_var_PreBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM10 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM10 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM10 = YX_DUNHUANG_BROADCAST_NUM10 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID11 then
		if YX_DUNHUANG_BROADCAST_NUM11 == x310030_var_PreBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM11 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM11 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM11 = YX_DUNHUANG_BROADCAST_NUM11 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 				
	elseif varMap == YX_DUNHUANG_SCENE_ID12 then
		if YX_DUNHUANG_BROADCAST_NUM12 == x310030_var_PreBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM12 = 0
			x310030_CreateMonster(varMap, varAct, varTime)
			return
		end
		local message = format( x310030_str_pre, x310030_var_PreBroadCastNum-YX_DUNHUANG_BROADCAST_NUM12 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM12 = YX_DUNHUANG_BROADCAST_NUM12 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastPre", varAct, 60*1000  ) 				
		
	end
	
end


function x310030_ProcCreateMonster(varMap,nCreateFlag )

	
	local checkMonsterFlag = 0
	local nRespwanTimer = x310030_RespwanTime1
	
	if nCreateFlag == 1 then
	
		checkMonsterFlag = nCreateFlag-1
		nRespwanTimer = x310030_RespwanTime1
		
	elseif nCreateFlag == 2 then
		
		checkMonsterFlag = nCreateFlag-1
		nRespwanTimer = x310030_RespwanTime2
		
	elseif nCreateFlag == 3 then
	
		checkMonsterFlag = nCreateFlag-1
		nRespwanTimer = x310030_RespwanTime3
	end

	
	local nIndexFrom = GetFubenDataPosByScriptID(x310030_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x310030_var_FileId )
	for varI = 0,nDataCount-1 do
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x310030_var_FileId,nIndexFrom,varI)
		if idScript == x310030_var_FileId and monsterFlag == checkMonsterFlag and varMap == varFlag then
			for j=0,varCount -1 do
				
				local rx = random(-3,3)
				varX = varX + rx
				local rz = random(-3,3)
				z = z + rz
				
				local varObj, objGuid = CreateMonster(varMap, type, varX, z, 0, -1, -1, -1, 21, -1, 0, "", "", nRespwanTimer)
				if varObj ~= -1 then
					x310030_AddObj(varMap, varObj)
				end
			end
		end
	end
end


function x310030_CreateMonster(varMap, varAct, varTime)

	if varMap == YX_LOULAN_SCENE_ID1 then
		if YX_LOULAN_CREATE_ROUNDS1 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)			
			x310030_ProcCreateMonster(varMap,1)

			YX_LOULAN_CREATE_ROUNDS1 = YX_LOULAN_CREATE_ROUNDS1 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
			
		elseif YX_LOULAN_CREATE_ROUNDS1 == 1 then
		
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LOULAN_CREATE_ROUNDS1 = YX_LOULAN_CREATE_ROUNDS1 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
			
		elseif YX_LOULAN_CREATE_ROUNDS1 == 2 then
		
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)	

			YX_LOULAN_CREATE_ROUNDS1 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM1 )
			x310030_ShowMessage1(varMap,message)
			
			YX_LOULAN_BROADCAST_NUM1 = YX_LOULAN_BROADCAST_NUM1 + 1
		end
		
	elseif varMap == YX_LOULAN_SCENE_ID2 then
	
		if YX_LOULAN_CREATE_ROUNDS2 == 0 then
		
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)

			YX_LOULAN_CREATE_ROUNDS2 = YX_LOULAN_CREATE_ROUNDS2 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS2 == 1 then

			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LOULAN_CREATE_ROUNDS2 = YX_LOULAN_CREATE_ROUNDS2 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval ) 
		elseif YX_LOULAN_CREATE_ROUNDS2 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LOULAN_CREATE_ROUNDS2 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM2 )
			x310030_ShowMessage1(varMap,message)
			YX_LOULAN_BROADCAST_NUM2 = YX_LOULAN_BROADCAST_NUM2 + 1
		end
		
	elseif varMap == YX_LOULAN_SCENE_ID3 then
		if YX_LOULAN_CREATE_ROUNDS3 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LOULAN_CREATE_ROUNDS3 = YX_LOULAN_CREATE_ROUNDS3 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS3 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LOULAN_CREATE_ROUNDS3 = YX_LOULAN_CREATE_ROUNDS3 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS3 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LOULAN_CREATE_ROUNDS3 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM3 )
			x310030_ShowMessage1(varMap,message)
			YX_LOULAN_BROADCAST_NUM3 = YX_LOULAN_BROADCAST_NUM3 + 1
		end
	elseif varMap == YX_LOULAN_SCENE_ID4 then
		if YX_LOULAN_CREATE_ROUNDS4 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LOULAN_CREATE_ROUNDS4 = YX_LOULAN_CREATE_ROUNDS4 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS4 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LOULAN_CREATE_ROUNDS4 = YX_LOULAN_CREATE_ROUNDS4 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS4 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LOULAN_CREATE_ROUNDS4 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM4 )
			x310030_ShowMessage1(varMap,message)
			YX_LOULAN_BROADCAST_NUM4 = YX_LOULAN_BROADCAST_NUM4 + 1
		end

	elseif varMap == YX_LOULAN_SCENE_ID5 then
		
		if YX_LOULAN_CREATE_ROUNDS5 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LOULAN_CREATE_ROUNDS5 = YX_LOULAN_CREATE_ROUNDS5 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS5 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LOULAN_CREATE_ROUNDS5 = YX_LOULAN_CREATE_ROUNDS5 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS5 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LOULAN_CREATE_ROUNDS5 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM5 )
			x310030_ShowMessage1(varMap,message)
			YX_LOULAN_BROADCAST_NUM5 = YX_LOULAN_BROADCAST_NUM5 + 1
		end
	
	elseif varMap == YX_LOULAN_SCENE_ID6 then
		if YX_LOULAN_CREATE_ROUNDS6 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LOULAN_CREATE_ROUNDS6 = YX_LOULAN_CREATE_ROUNDS6 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS6 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LOULAN_CREATE_ROUNDS6 = YX_LOULAN_CREATE_ROUNDS6 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS6 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LOULAN_CREATE_ROUNDS6 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM6 )
			x310030_ShowMessage1(varMap,message)
			YX_LOULAN_BROADCAST_NUM6 = YX_LOULAN_BROADCAST_NUM6 + 1
		end
	elseif varMap == YX_LOULAN_SCENE_ID7 then
		if YX_LOULAN_CREATE_ROUNDS7 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LOULAN_CREATE_ROUNDS7 = YX_LOULAN_CREATE_ROUNDS7 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS7 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LOULAN_CREATE_ROUNDS7 = YX_LOULAN_CREATE_ROUNDS7 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS7 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LOULAN_CREATE_ROUNDS7 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM7 )
			x310030_ShowMessage1(varMap,message)
			YX_LOULAN_BROADCAST_NUM7 = YX_LOULAN_BROADCAST_NUM7 + 1
		end
	elseif varMap == YX_LOULAN_SCENE_ID8 then
		if YX_LOULAN_CREATE_ROUNDS8 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LOULAN_CREATE_ROUNDS8 = YX_LOULAN_CREATE_ROUNDS8 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS8 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LOULAN_CREATE_ROUNDS8 = YX_LOULAN_CREATE_ROUNDS8 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS8 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LOULAN_CREATE_ROUNDS8 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM8 )
			x310030_ShowMessage1(varMap,message)
			YX_LOULAN_BROADCAST_NUM8 = YX_LOULAN_BROADCAST_NUM8 + 1
		end
	elseif varMap == YX_LOULAN_SCENE_ID9 then
		if YX_LOULAN_CREATE_ROUNDS9 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LOULAN_CREATE_ROUNDS9 = YX_LOULAN_CREATE_ROUNDS9 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS9 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LOULAN_CREATE_ROUNDS9 = YX_LOULAN_CREATE_ROUNDS9 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS9 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LOULAN_CREATE_ROUNDS9 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM9 )
			x310030_ShowMessage1(varMap,message)
			YX_LOULAN_BROADCAST_NUM9 = YX_LOULAN_BROADCAST_NUM9 + 1
		end		
	elseif varMap == YX_LOULAN_SCENE_ID10 then
		if YX_LOULAN_CREATE_ROUNDS10 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LOULAN_CREATE_ROUNDS10 = YX_LOULAN_CREATE_ROUNDS10 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS10 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LOULAN_CREATE_ROUNDS10 = YX_LOULAN_CREATE_ROUNDS10 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS10 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LOULAN_CREATE_ROUNDS10 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM10 )
			x310030_ShowMessage1(varMap,message)
			YX_LOULAN_BROADCAST_NUM10 = YX_LOULAN_BROADCAST_NUM10 + 1
		end		
	elseif varMap == YX_LOULAN_SCENE_ID11 then
		if YX_LOULAN_CREATE_ROUNDS11 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LOULAN_CREATE_ROUNDS11 = YX_LOULAN_CREATE_ROUNDS11 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS11 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LOULAN_CREATE_ROUNDS11 = YX_LOULAN_CREATE_ROUNDS11 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS11 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LOULAN_CREATE_ROUNDS11 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM11 )
			x310030_ShowMessage1(varMap,message)
			YX_LOULAN_BROADCAST_NUM11 = YX_LOULAN_BROADCAST_NUM11 + 1
		end				
	elseif varMap == YX_LOULAN_SCENE_ID12 then
	
		if YX_LOULAN_CREATE_ROUNDS12 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LOULAN_CREATE_ROUNDS12 = YX_LOULAN_CREATE_ROUNDS12 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS12 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LOULAN_CREATE_ROUNDS12 = YX_LOULAN_CREATE_ROUNDS12 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LOULAN_CREATE_ROUNDS12 == 2 then
			

			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LOULAN_CREATE_ROUNDS12 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM12 )
			x310030_ShowMessage1(varMap,message)
			YX_LOULAN_BROADCAST_NUM12 = YX_LOULAN_BROADCAST_NUM12 + 1
		end					
		
	elseif varMap == YX_LAIYIN_SCENE_ID1 then
		if YX_LAIYIN_CREATE_ROUNDS1 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)

			YX_LAIYIN_CREATE_ROUNDS1 = YX_LAIYIN_CREATE_ROUNDS1 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS1 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LAIYIN_CREATE_ROUNDS1 = YX_LAIYIN_CREATE_ROUNDS1 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS1 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)
			
			YX_LAIYIN_CREATE_ROUNDS1 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM1 )
			x310030_ShowMessage1(varMap,message)
			YX_LAIYIN_BROADCAST_NUM1 = YX_LAIYIN_BROADCAST_NUM1 + 1
		end
	elseif varMap == YX_LAIYIN_SCENE_ID2 then
		if YX_LAIYIN_CREATE_ROUNDS2 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)

			YX_LAIYIN_CREATE_ROUNDS2 = YX_LAIYIN_CREATE_ROUNDS2 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS2 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LAIYIN_CREATE_ROUNDS2 = YX_LAIYIN_CREATE_ROUNDS2 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS2 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LAIYIN_CREATE_ROUNDS2 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM2 )
			x310030_ShowMessage1(varMap,message)
			YX_LAIYIN_BROADCAST_NUM2 = YX_LAIYIN_BROADCAST_NUM2 + 1
		end
	elseif varMap == YX_LAIYIN_SCENE_ID3 then
		if YX_LAIYIN_CREATE_ROUNDS3 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)

			YX_LAIYIN_CREATE_ROUNDS3 = YX_LAIYIN_CREATE_ROUNDS3 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS3 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LAIYIN_CREATE_ROUNDS3 = YX_LAIYIN_CREATE_ROUNDS3 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS3 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LAIYIN_CREATE_ROUNDS3 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM3 )
			x310030_ShowMessage1(varMap,message)
			YX_LAIYIN_BROADCAST_NUM3 = YX_LAIYIN_BROADCAST_NUM3 + 1
		end
	elseif varMap == YX_LAIYIN_SCENE_ID4 then
		if YX_LAIYIN_CREATE_ROUNDS4 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)

			YX_LAIYIN_CREATE_ROUNDS4 = YX_LAIYIN_CREATE_ROUNDS4 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS4 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LAIYIN_CREATE_ROUNDS4 = YX_LAIYIN_CREATE_ROUNDS4 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS4 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LAIYIN_CREATE_ROUNDS4 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM4 )
			x310030_ShowMessage1(varMap,message)
			YX_LAIYIN_BROADCAST_NUM4 = YX_LAIYIN_BROADCAST_NUM4 + 1
		end


	elseif varMap == YX_LAIYIN_SCENE_ID5 then
		if YX_LAIYIN_CREATE_ROUNDS5 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LAIYIN_CREATE_ROUNDS5 = YX_LAIYIN_CREATE_ROUNDS5 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS5 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LAIYIN_CREATE_ROUNDS5 = YX_LAIYIN_CREATE_ROUNDS5 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS5 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LAIYIN_CREATE_ROUNDS5 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM5 )
			x310030_ShowMessage1(varMap,message)
			YX_LAIYIN_BROADCAST_NUM5 = YX_LAIYIN_BROADCAST_NUM5 + 1
		end
	
	elseif varMap == YX_LAIYIN_SCENE_ID6 then
		if YX_LAIYIN_CREATE_ROUNDS6 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LAIYIN_CREATE_ROUNDS6 = YX_LAIYIN_CREATE_ROUNDS6 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS6 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LAIYIN_CREATE_ROUNDS6 = YX_LAIYIN_CREATE_ROUNDS6 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS6 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LAIYIN_CREATE_ROUNDS6 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM6 )
			x310030_ShowMessage1(varMap,message)
			YX_LAIYIN_BROADCAST_NUM6 = YX_LAIYIN_BROADCAST_NUM6 + 1
		end
	elseif varMap == YX_LAIYIN_SCENE_ID7 then
		if YX_LAIYIN_CREATE_ROUNDS7 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LAIYIN_CREATE_ROUNDS7 = YX_LAIYIN_CREATE_ROUNDS7 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS7 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LAIYIN_CREATE_ROUNDS7 = YX_LAIYIN_CREATE_ROUNDS7 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS7 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LAIYIN_CREATE_ROUNDS7 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM7 )
			x310030_ShowMessage1(varMap,message)
			YX_LAIYIN_BROADCAST_NUM7 = YX_LAIYIN_BROADCAST_NUM7 + 1
		end
	elseif varMap == YX_LAIYIN_SCENE_ID8 then
		if YX_LAIYIN_CREATE_ROUNDS8 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LAIYIN_CREATE_ROUNDS8 = YX_LAIYIN_CREATE_ROUNDS8 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS8 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LAIYIN_CREATE_ROUNDS8 = YX_LAIYIN_CREATE_ROUNDS8 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS8 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LAIYIN_CREATE_ROUNDS8 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM8 )
			x310030_ShowMessage1(varMap,message)
			YX_LAIYIN_BROADCAST_NUM8 = YX_LAIYIN_BROADCAST_NUM8 + 1
		end
	elseif varMap == YX_LAIYIN_SCENE_ID9 then
		if YX_LAIYIN_CREATE_ROUNDS9 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LAIYIN_CREATE_ROUNDS9 = YX_LAIYIN_CREATE_ROUNDS9 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS9 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LAIYIN_CREATE_ROUNDS9 = YX_LAIYIN_CREATE_ROUNDS9 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS9 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LAIYIN_CREATE_ROUNDS9 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM9 )
			x310030_ShowMessage1(varMap,message)
			YX_LAIYIN_BROADCAST_NUM9 = YX_LAIYIN_BROADCAST_NUM9 + 1
		end		
	elseif varMap == YX_LAIYIN_SCENE_ID10 then
		if YX_LAIYIN_CREATE_ROUNDS10 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LAIYIN_CREATE_ROUNDS10 = YX_LAIYIN_CREATE_ROUNDS10 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS10 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LAIYIN_CREATE_ROUNDS10 = YX_LAIYIN_CREATE_ROUNDS10 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS10 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LAIYIN_CREATE_ROUNDS10 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM10 )
			x310030_ShowMessage1(varMap,message)
			YX_LAIYIN_BROADCAST_NUM10 = YX_LAIYIN_BROADCAST_NUM10 + 1
		end	
	elseif varMap == YX_LAIYIN_SCENE_ID11 then
		if YX_LAIYIN_CREATE_ROUNDS11 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LAIYIN_CREATE_ROUNDS11 = YX_LAIYIN_CREATE_ROUNDS11 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS11 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LAIYIN_CREATE_ROUNDS11 = YX_LAIYIN_CREATE_ROUNDS11 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS11 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LAIYIN_CREATE_ROUNDS11 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM11 )
			x310030_ShowMessage1(varMap,message)
			YX_LAIYIN_BROADCAST_NUM11 = YX_LAIYIN_BROADCAST_NUM11 + 1
		end	
	elseif varMap == YX_LAIYIN_SCENE_ID12 then
		if YX_LAIYIN_CREATE_ROUNDS12 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_LAIYIN_CREATE_ROUNDS12 = YX_LAIYIN_CREATE_ROUNDS12 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS12 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_LAIYIN_CREATE_ROUNDS12 = YX_LAIYIN_CREATE_ROUNDS12 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_LAIYIN_CREATE_ROUNDS12 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_LAIYIN_CREATE_ROUNDS12 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM12 )
			x310030_ShowMessage1(varMap,message)
			YX_LAIYIN_BROADCAST_NUM12 = YX_LAIYIN_BROADCAST_NUM12 + 1
		end	

	elseif varMap == YX_KUNLUN_SCENE_ID1 then
		if YX_KUNLUN_CREATE_ROUNDS1 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)

			YX_KUNLUN_CREATE_ROUNDS1 = YX_KUNLUN_CREATE_ROUNDS1 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS1 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_KUNLUN_CREATE_ROUNDS1 = YX_KUNLUN_CREATE_ROUNDS1 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS1 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_KUNLUN_CREATE_ROUNDS1 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM1 )
			x310030_ShowMessage1(varMap,message)
			YX_KUNLUN_BROADCAST_NUM1 = YX_KUNLUN_BROADCAST_NUM1 + 1
		end
	elseif varMap == YX_KUNLUN_SCENE_ID2 then
		if YX_KUNLUN_CREATE_ROUNDS2 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)

			YX_KUNLUN_CREATE_ROUNDS2 = YX_KUNLUN_CREATE_ROUNDS2 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS2 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_KUNLUN_CREATE_ROUNDS2 = YX_KUNLUN_CREATE_ROUNDS2 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS2 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)
			
			YX_KUNLUN_CREATE_ROUNDS2 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM2 )
			x310030_ShowMessage1(varMap,message)
			YX_KUNLUN_BROADCAST_NUM2 = YX_KUNLUN_BROADCAST_NUM2 + 1
		end
	elseif varMap == YX_KUNLUN_SCENE_ID3 then
		if YX_KUNLUN_CREATE_ROUNDS3 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)

			YX_KUNLUN_CREATE_ROUNDS3 = YX_KUNLUN_CREATE_ROUNDS3 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS3 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_KUNLUN_CREATE_ROUNDS3 = YX_KUNLUN_CREATE_ROUNDS3 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS3 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_KUNLUN_CREATE_ROUNDS3 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM3 )
			x310030_ShowMessage1(varMap,message)
			YX_KUNLUN_BROADCAST_NUM3 = YX_KUNLUN_BROADCAST_NUM3 + 1
		end
	elseif varMap == YX_KUNLUN_SCENE_ID4 then
		if YX_KUNLUN_CREATE_ROUNDS4 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)

			YX_KUNLUN_CREATE_ROUNDS4 = YX_KUNLUN_CREATE_ROUNDS4 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS4 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_KUNLUN_CREATE_ROUNDS4 = YX_KUNLUN_CREATE_ROUNDS4 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS4 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_KUNLUN_CREATE_ROUNDS4 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM4 )
			x310030_ShowMessage1(varMap,message)
			YX_KUNLUN_BROADCAST_NUM4 = YX_KUNLUN_BROADCAST_NUM4 + 1
		end


	elseif varMap == YX_KUNLUN_SCENE_ID5 then
		if YX_KUNLUN_CREATE_ROUNDS5 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_KUNLUN_CREATE_ROUNDS5 = YX_KUNLUN_CREATE_ROUNDS5 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS5 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_KUNLUN_CREATE_ROUNDS5 = YX_KUNLUN_CREATE_ROUNDS5 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS5 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_KUNLUN_CREATE_ROUNDS5 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM5 )
			x310030_ShowMessage1(varMap,message)
			YX_KUNLUN_BROADCAST_NUM5 = YX_KUNLUN_BROADCAST_NUM5 + 1
		end
	
	elseif varMap == YX_KUNLUN_SCENE_ID6 then
		if YX_KUNLUN_CREATE_ROUNDS6 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_KUNLUN_CREATE_ROUNDS6 = YX_KUNLUN_CREATE_ROUNDS6 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS6 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_KUNLUN_CREATE_ROUNDS6 = YX_KUNLUN_CREATE_ROUNDS6 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS6 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_KUNLUN_CREATE_ROUNDS6 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM6 )
			x310030_ShowMessage1(varMap,message)
			YX_KUNLUN_BROADCAST_NUM6 = YX_KUNLUN_BROADCAST_NUM6 + 1
		end
		
	elseif varMap == YX_KUNLUN_SCENE_ID7 then
		if YX_KUNLUN_CREATE_ROUNDS7 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_KUNLUN_CREATE_ROUNDS7 = YX_KUNLUN_CREATE_ROUNDS7 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS7 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_KUNLUN_CREATE_ROUNDS7 = YX_KUNLUN_CREATE_ROUNDS7 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS7 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_KUNLUN_CREATE_ROUNDS7 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM7 )
			x310030_ShowMessage1(varMap,message)
			YX_KUNLUN_BROADCAST_NUM7 = YX_KUNLUN_BROADCAST_NUM7 + 1
		end
	elseif varMap == YX_KUNLUN_SCENE_ID8 then
		if YX_KUNLUN_CREATE_ROUNDS8 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_KUNLUN_CREATE_ROUNDS8 = YX_KUNLUN_CREATE_ROUNDS8 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS8 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_KUNLUN_CREATE_ROUNDS8 = YX_KUNLUN_CREATE_ROUNDS8 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS8 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_KUNLUN_CREATE_ROUNDS8 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM8 )
			x310030_ShowMessage1(varMap,message)
			YX_KUNLUN_BROADCAST_NUM8 = YX_KUNLUN_BROADCAST_NUM8 + 1
		end
	elseif varMap == YX_KUNLUN_SCENE_ID9 then
		if YX_KUNLUN_CREATE_ROUNDS9 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_KUNLUN_CREATE_ROUNDS9 = YX_KUNLUN_CREATE_ROUNDS9 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS9 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_KUNLUN_CREATE_ROUNDS9 = YX_KUNLUN_CREATE_ROUNDS9 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS9 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_KUNLUN_CREATE_ROUNDS9 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM9 )
			x310030_ShowMessage1(varMap,message)
			YX_KUNLUN_BROADCAST_NUM9 = YX_KUNLUN_BROADCAST_NUM9 + 1
		end		
	elseif varMap == YX_KUNLUN_SCENE_ID10 then
		if YX_KUNLUN_CREATE_ROUNDS10 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_KUNLUN_CREATE_ROUNDS10 = YX_KUNLUN_CREATE_ROUNDS10 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS10 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_KUNLUN_CREATE_ROUNDS10 = YX_KUNLUN_CREATE_ROUNDS10 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS10 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_KUNLUN_CREATE_ROUNDS10 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM10 )
			x310030_ShowMessage1(varMap,message)
			YX_KUNLUN_BROADCAST_NUM10 = YX_KUNLUN_BROADCAST_NUM10 + 1
		end		
	elseif varMap == YX_KUNLUN_SCENE_ID11 then
		if YX_KUNLUN_CREATE_ROUNDS11 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_KUNLUN_CREATE_ROUNDS11 = YX_KUNLUN_CREATE_ROUNDS11 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS11 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_KUNLUN_CREATE_ROUNDS11 = YX_KUNLUN_CREATE_ROUNDS11 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS11 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_KUNLUN_CREATE_ROUNDS11 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM11 )
			x310030_ShowMessage1(varMap,message)
			YX_KUNLUN_BROADCAST_NUM11 = YX_KUNLUN_BROADCAST_NUM11 + 1
		end						
	elseif varMap == YX_KUNLUN_SCENE_ID12 then
		if YX_KUNLUN_CREATE_ROUNDS12 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_KUNLUN_CREATE_ROUNDS12 = YX_KUNLUN_CREATE_ROUNDS12 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS12 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_KUNLUN_CREATE_ROUNDS12 = YX_KUNLUN_CREATE_ROUNDS12 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_KUNLUN_CREATE_ROUNDS12 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_KUNLUN_CREATE_ROUNDS12 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM12 )
			x310030_ShowMessage1(varMap,message)
			YX_KUNLUN_BROADCAST_NUM12 = YX_KUNLUN_BROADCAST_NUM12 + 1
		end						
	
	
	elseif varMap == YX_DUNHUANG_SCENE_ID1 then
		if YX_DUNHUANG_CREATE_ROUNDS1 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)

			YX_DUNHUANG_CREATE_ROUNDS1 = YX_DUNHUANG_CREATE_ROUNDS1 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS1 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_DUNHUANG_CREATE_ROUNDS1 = YX_DUNHUANG_CREATE_ROUNDS1 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS1 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_DUNHUANG_CREATE_ROUNDS1 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM1 )
			x310030_ShowMessage1(varMap,message)
			YX_DUNHUANG_BROADCAST_NUM1 = YX_DUNHUANG_BROADCAST_NUM1 + 1
		end
	elseif varMap == YX_DUNHUANG_SCENE_ID2 then
		if YX_DUNHUANG_CREATE_ROUNDS2 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)

			YX_DUNHUANG_CREATE_ROUNDS2 = YX_DUNHUANG_CREATE_ROUNDS2 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS2 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_DUNHUANG_CREATE_ROUNDS2 = YX_DUNHUANG_CREATE_ROUNDS2 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS2 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_DUNHUANG_CREATE_ROUNDS2 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM2 )
			x310030_ShowMessage1(varMap,message)
			YX_DUNHUANG_BROADCAST_NUM2 = YX_DUNHUANG_BROADCAST_NUM2 + 1
		end
	elseif varMap == YX_DUNHUANG_SCENE_ID3 then
		if YX_DUNHUANG_CREATE_ROUNDS3 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)

			YX_DUNHUANG_CREATE_ROUNDS3 = YX_DUNHUANG_CREATE_ROUNDS3 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS3 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_DUNHUANG_CREATE_ROUNDS3 = YX_DUNHUANG_CREATE_ROUNDS3 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS3 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_DUNHUANG_CREATE_ROUNDS3 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM3 )
			x310030_ShowMessage1(varMap,message)
			YX_DUNHUANG_BROADCAST_NUM3 = YX_DUNHUANG_BROADCAST_NUM3 + 1
		end
	elseif varMap == YX_DUNHUANG_SCENE_ID4 then
		if YX_DUNHUANG_CREATE_ROUNDS4 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)

			YX_DUNHUANG_CREATE_ROUNDS4 = YX_DUNHUANG_CREATE_ROUNDS4 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS4 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_DUNHUANG_CREATE_ROUNDS4 = YX_DUNHUANG_CREATE_ROUNDS4 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS4 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_DUNHUANG_CREATE_ROUNDS4 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM4 )
			x310030_ShowMessage1(varMap,message)
			YX_DUNHUANG_BROADCAST_NUM4 = YX_DUNHUANG_BROADCAST_NUM4 + 1
		end


	elseif varMap == YX_DUNHUANG_SCENE_ID5 then
		if YX_DUNHUANG_CREATE_ROUNDS5 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_DUNHUANG_CREATE_ROUNDS5 = YX_DUNHUANG_CREATE_ROUNDS5 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS5 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_DUNHUANG_CREATE_ROUNDS5 = YX_DUNHUANG_CREATE_ROUNDS5 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS5 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_DUNHUANG_CREATE_ROUNDS5 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM5 )
			x310030_ShowMessage1(varMap,message)
			YX_DUNHUANG_BROADCAST_NUM5 = YX_DUNHUANG_BROADCAST_NUM5 + 1
		end
	
	elseif varMap == YX_DUNHUANG_SCENE_ID6 then
		if YX_DUNHUANG_CREATE_ROUNDS6 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_DUNHUANG_CREATE_ROUNDS6 = YX_DUNHUANG_CREATE_ROUNDS6 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS6 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_DUNHUANG_CREATE_ROUNDS6 = YX_DUNHUANG_CREATE_ROUNDS6 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS6 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_DUNHUANG_CREATE_ROUNDS6 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM6 )
			x310030_ShowMessage1(varMap,message)
			YX_DUNHUANG_BROADCAST_NUM6 = YX_DUNHUANG_BROADCAST_NUM6 + 1
		end
	elseif varMap == YX_DUNHUANG_SCENE_ID7 then
		if YX_DUNHUANG_CREATE_ROUNDS7 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_DUNHUANG_CREATE_ROUNDS7 = YX_DUNHUANG_CREATE_ROUNDS7 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS7 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_DUNHUANG_CREATE_ROUNDS7 = YX_DUNHUANG_CREATE_ROUNDS7 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS7 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_DUNHUANG_CREATE_ROUNDS7 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM7 )
			x310030_ShowMessage1(varMap,message)
			YX_DUNHUANG_BROADCAST_NUM7 = YX_DUNHUANG_BROADCAST_NUM7 + 1
		end
	elseif varMap == YX_DUNHUANG_SCENE_ID8 then
		if YX_DUNHUANG_CREATE_ROUNDS8 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_DUNHUANG_CREATE_ROUNDS8 = YX_DUNHUANG_CREATE_ROUNDS8 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS8 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_DUNHUANG_CREATE_ROUNDS8 = YX_DUNHUANG_CREATE_ROUNDS8 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS8 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_DUNHUANG_CREATE_ROUNDS8 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM8 )
			x310030_ShowMessage1(varMap,message)
			YX_DUNHUANG_BROADCAST_NUM8 = YX_DUNHUANG_BROADCAST_NUM8 + 1
		end
	elseif varMap == YX_DUNHUANG_SCENE_ID9 then
		if YX_DUNHUANG_CREATE_ROUNDS9 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_DUNHUANG_CREATE_ROUNDS9 = YX_DUNHUANG_CREATE_ROUNDS9 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS9 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_DUNHUANG_CREATE_ROUNDS9 = YX_DUNHUANG_CREATE_ROUNDS9 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS9 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_DUNHUANG_CREATE_ROUNDS9 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM9 )
			x310030_ShowMessage1(varMap,message)
			YX_DUNHUANG_BROADCAST_NUM9 = YX_DUNHUANG_BROADCAST_NUM9 + 1
		end		
	elseif varMap == YX_DUNHUANG_SCENE_ID10 then
		if YX_DUNHUANG_CREATE_ROUNDS10 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_DUNHUANG_CREATE_ROUNDS10 = YX_DUNHUANG_CREATE_ROUNDS10 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS10 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_DUNHUANG_CREATE_ROUNDS10 = YX_DUNHUANG_CREATE_ROUNDS10 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS10 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_DUNHUANG_CREATE_ROUNDS10 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM10 )
			x310030_ShowMessage1(varMap,message)
			YX_DUNHUANG_BROADCAST_NUM10 = YX_DUNHUANG_BROADCAST_NUM10 + 1
		end		
	elseif varMap == YX_DUNHUANG_SCENE_ID11 then
		if YX_DUNHUANG_CREATE_ROUNDS11 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_DUNHUANG_CREATE_ROUNDS11 = YX_DUNHUANG_CREATE_ROUNDS11 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS11 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_DUNHUANG_CREATE_ROUNDS11 = YX_DUNHUANG_CREATE_ROUNDS11 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS11 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_DUNHUANG_CREATE_ROUNDS11 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM11 )
			x310030_ShowMessage1(varMap,message)
			YX_DUNHUANG_BROADCAST_NUM11 = YX_DUNHUANG_BROADCAST_NUM11 + 1
		end						
		
	elseif varMap == YX_DUNHUANG_SCENE_ID12 then
		if YX_DUNHUANG_CREATE_ROUNDS12 == 0 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai1)
			x310030_ProcCreateMonster(varMap,1)
			

			YX_DUNHUANG_CREATE_ROUNDS12 = YX_DUNHUANG_CREATE_ROUNDS12 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS12 == 1 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai2)
			x310030_ProcCreateMonster(varMap,2)

			YX_DUNHUANG_CREATE_ROUNDS12 = YX_DUNHUANG_CREATE_ROUNDS12 + 1
			SetSystemTimerTick( varMap, x310030_var_FileId, "CreateMonster", varAct, x310030_var_CreateMonsterInterval  ) 
		elseif YX_DUNHUANG_CREATE_ROUNDS12 == 2 then
			
			x310030_ShowMessage1(varMap,x310030_str_shuaguai3)
			x310030_ProcCreateMonster(varMap,3)

			YX_DUNHUANG_CREATE_ROUNDS12 = 0
			SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
			local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM12 )
			x310030_ShowMessage1(varMap,message)
			YX_DUNHUANG_BROADCAST_NUM12 = YX_DUNHUANG_BROADCAST_NUM12 + 1
		end						

	end
end

function x310030_BroadCastAfter(varMap, varAct, varTime)
	if varMap == YX_LOULAN_SCENE_ID1 then
		if YX_LOULAN_BROADCAST_NUM1 == x310030_var_AfterBroadCastNum then
			YX_LOULAN_BROADCAST_NUM1 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM1 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM1 = YX_LOULAN_BROADCAST_NUM1 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LOULAN_SCENE_ID2 then
		if YX_LOULAN_BROADCAST_NUM2 == x310030_var_AfterBroadCastNum then
			YX_LOULAN_BROADCAST_NUM2 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM2 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM2 = YX_LOULAN_BROADCAST_NUM2 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LOULAN_SCENE_ID3 then
		if YX_LOULAN_BROADCAST_NUM3 == x310030_var_AfterBroadCastNum then
			YX_LOULAN_BROADCAST_NUM3 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM3 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM3 = YX_LOULAN_BROADCAST_NUM3 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LOULAN_SCENE_ID4 then
		if YX_LOULAN_BROADCAST_NUM4 == x310030_var_AfterBroadCastNum then
			YX_LOULAN_BROADCAST_NUM4 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM4 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM4 = YX_LOULAN_BROADCAST_NUM4 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 

	elseif varMap == YX_LOULAN_SCENE_ID5 then
		if YX_LOULAN_BROADCAST_NUM5 == x310030_var_AfterBroadCastNum then
			YX_LOULAN_BROADCAST_NUM5 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM5 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM5 = YX_LOULAN_BROADCAST_NUM5 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LOULAN_SCENE_ID6 then
		if YX_LOULAN_BROADCAST_NUM6 == x310030_var_AfterBroadCastNum then
			YX_LOULAN_BROADCAST_NUM6 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM6 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM6 = YX_LOULAN_BROADCAST_NUM6 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LOULAN_SCENE_ID7 then
		if YX_LOULAN_BROADCAST_NUM7 == x310030_var_AfterBroadCastNum then
			YX_LOULAN_BROADCAST_NUM7 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM7 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM7 = YX_LOULAN_BROADCAST_NUM7 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
  elseif varMap == YX_LOULAN_SCENE_ID8 then
		if YX_LOULAN_BROADCAST_NUM8 == x310030_var_AfterBroadCastNum then
			YX_LOULAN_BROADCAST_NUM8 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM8 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM8 = YX_LOULAN_BROADCAST_NUM8 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
  elseif varMap == YX_LOULAN_SCENE_ID9 then
		if YX_LOULAN_BROADCAST_NUM9 == x310030_var_AfterBroadCastNum then
			YX_LOULAN_BROADCAST_NUM9 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM9 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM9 = YX_LOULAN_BROADCAST_NUM9 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
 elseif varMap == YX_LOULAN_SCENE_ID10 then
		if YX_LOULAN_BROADCAST_NUM10 == x310030_var_AfterBroadCastNum then
			YX_LOULAN_BROADCAST_NUM10 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM10 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM10 = YX_LOULAN_BROADCAST_NUM10 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
 elseif varMap == YX_LOULAN_SCENE_ID11 then
		if YX_LOULAN_BROADCAST_NUM11 == x310030_var_AfterBroadCastNum then
			YX_LOULAN_BROADCAST_NUM11 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM11 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM11 = YX_LOULAN_BROADCAST_NUM11 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 				
 elseif varMap == YX_LOULAN_SCENE_ID12 then
		if YX_LOULAN_BROADCAST_NUM12 == x310030_var_AfterBroadCastNum then
			YX_LOULAN_BROADCAST_NUM12 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LOULAN_BROADCAST_NUM12 )
		x310030_ShowMessage1(varMap,message)
		YX_LOULAN_BROADCAST_NUM12 = YX_LOULAN_BROADCAST_NUM12 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 				

	elseif varMap == YX_LAIYIN_SCENE_ID1 then
		if YX_LAIYIN_BROADCAST_NUM1 == x310030_var_AfterBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM1 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM1 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM1 = YX_LAIYIN_BROADCAST_NUM1 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID2 then
		if YX_LAIYIN_BROADCAST_NUM2 == x310030_var_AfterBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM2 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM2 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM2 = YX_LAIYIN_BROADCAST_NUM2 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID3 then
		if YX_LAIYIN_BROADCAST_NUM3 == x310030_var_AfterBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM3 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM3 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM3 = YX_LAIYIN_BROADCAST_NUM3 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID4 then
		if YX_LAIYIN_BROADCAST_NUM4 == x310030_var_AfterBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM4 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM4 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM4 = YX_LAIYIN_BROADCAST_NUM4 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 

	elseif varMap == YX_LAIYIN_SCENE_ID5 then
		if YX_LAIYIN_BROADCAST_NUM5 == x310030_var_AfterBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM5 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM5 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM5 = YX_LAIYIN_BROADCAST_NUM5 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID6 then
		if YX_LAIYIN_BROADCAST_NUM6 == x310030_var_AfterBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM6 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM6 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM6 = YX_LAIYIN_BROADCAST_NUM6 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID7 then
		if YX_LAIYIN_BROADCAST_NUM7 == x310030_var_AfterBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM7 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM7 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM7 = YX_LAIYIN_BROADCAST_NUM7 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID8 then
		if YX_LAIYIN_BROADCAST_NUM8 == x310030_var_AfterBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM8 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM8 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM8 = YX_LAIYIN_BROADCAST_NUM8 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID9 then
		if YX_LAIYIN_BROADCAST_NUM9 == x310030_var_AfterBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM9 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM9 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM9 = YX_LAIYIN_BROADCAST_NUM9 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID10 then
		if YX_LAIYIN_BROADCAST_NUM10 == x310030_var_AfterBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM10 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM10 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM10 = YX_LAIYIN_BROADCAST_NUM10 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_LAIYIN_SCENE_ID11 then
		if YX_LAIYIN_BROADCAST_NUM11 == x310030_var_AfterBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM11 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM11 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM11 = YX_LAIYIN_BROADCAST_NUM11 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 		
	elseif varMap == YX_LAIYIN_SCENE_ID12 then
		if YX_LAIYIN_BROADCAST_NUM12 == x310030_var_AfterBroadCastNum then
			YX_LAIYIN_BROADCAST_NUM12 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_LAIYIN_BROADCAST_NUM12 )
		x310030_ShowMessage1(varMap,message)
		YX_LAIYIN_BROADCAST_NUM12 = YX_LAIYIN_BROADCAST_NUM12 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 		

	elseif varMap == YX_KUNLUN_SCENE_ID1 then
		if YX_KUNLUN_BROADCAST_NUM1 == x310030_var_AfterBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM1 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM1 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM1 = YX_KUNLUN_BROADCAST_NUM1 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID2 then
		if YX_KUNLUN_BROADCAST_NUM2 == x310030_var_AfterBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM2 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM2 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM2 = YX_KUNLUN_BROADCAST_NUM2 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID3 then
		if YX_KUNLUN_BROADCAST_NUM3 == x310030_var_AfterBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM3 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM3 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM3 = YX_KUNLUN_BROADCAST_NUM3 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID4 then
		if YX_KUNLUN_BROADCAST_NUM4 == x310030_var_AfterBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM4 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM4 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM4 = YX_KUNLUN_BROADCAST_NUM4 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 

	elseif varMap == YX_KUNLUN_SCENE_ID5 then
		if YX_KUNLUN_BROADCAST_NUM5 == x310030_var_AfterBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM5 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM5 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM5 = YX_KUNLUN_BROADCAST_NUM5 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID6 then
		if YX_KUNLUN_BROADCAST_NUM6 == x310030_var_AfterBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM6 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM6 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM6 = YX_KUNLUN_BROADCAST_NUM6 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID7 then
		if YX_KUNLUN_BROADCAST_NUM7 == x310030_var_AfterBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM7 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM7 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM7 = YX_KUNLUN_BROADCAST_NUM7 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID8 then
		if YX_KUNLUN_BROADCAST_NUM8 == x310030_var_AfterBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM8 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM8 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM8 = YX_KUNLUN_BROADCAST_NUM8 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID9 then
		if YX_KUNLUN_BROADCAST_NUM9 == x310030_var_AfterBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM9 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM9 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM9 = YX_KUNLUN_BROADCAST_NUM9 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID10 then
		if YX_KUNLUN_BROADCAST_NUM10 == x310030_var_AfterBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM10 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM10 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM10 = YX_KUNLUN_BROADCAST_NUM10 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_KUNLUN_SCENE_ID11 then
		if YX_KUNLUN_BROADCAST_NUM11 == x310030_var_AfterBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM11 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM11 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM11 = YX_KUNLUN_BROADCAST_NUM11 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 				
	elseif varMap == YX_KUNLUN_SCENE_ID12 then
		if YX_KUNLUN_BROADCAST_NUM12 == x310030_var_AfterBroadCastNum then
			YX_KUNLUN_BROADCAST_NUM12 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_KUNLUN_BROADCAST_NUM12 )
		x310030_ShowMessage1(varMap,message)
		YX_KUNLUN_BROADCAST_NUM12 = YX_KUNLUN_BROADCAST_NUM12 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 				

	elseif varMap == YX_DUNHUANG_SCENE_ID1 then
		if YX_DUNHUANG_BROADCAST_NUM1 == x310030_var_AfterBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM1 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM1 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM1 = YX_DUNHUANG_BROADCAST_NUM1 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID2 then
		if YX_DUNHUANG_BROADCAST_NUM2 == x310030_var_AfterBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM2 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM2 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM2 = YX_DUNHUANG_BROADCAST_NUM2 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID3 then
		if YX_DUNHUANG_BROADCAST_NUM3 == x310030_var_AfterBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM3 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM3 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM3 = YX_DUNHUANG_BROADCAST_NUM3 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID4 then
		if YX_DUNHUANG_BROADCAST_NUM4 == x310030_var_AfterBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM4 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM4 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM4 = YX_DUNHUANG_BROADCAST_NUM4 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 

	elseif varMap == YX_DUNHUANG_SCENE_ID5 then
		if YX_DUNHUANG_BROADCAST_NUM5 == x310030_var_AfterBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM5 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM5 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM5 = YX_DUNHUANG_BROADCAST_NUM5 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID6 then
		if YX_DUNHUANG_BROADCAST_NUM6 == x310030_var_AfterBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM6 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM6 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM6 = YX_DUNHUANG_BROADCAST_NUM6 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID7 then
		if YX_DUNHUANG_BROADCAST_NUM7 == x310030_var_AfterBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM7 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM7 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM7 = YX_DUNHUANG_BROADCAST_NUM7 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID8 then
		if YX_DUNHUANG_BROADCAST_NUM8 == x310030_var_AfterBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM8 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM8 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM8 = YX_DUNHUANG_BROADCAST_NUM8 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID9 then
		if YX_DUNHUANG_BROADCAST_NUM9 == x310030_var_AfterBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM9 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM9 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM9 = YX_DUNHUANG_BROADCAST_NUM9 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID10 then
		if YX_DUNHUANG_BROADCAST_NUM10 == x310030_var_AfterBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM10 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM10 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM10 = YX_DUNHUANG_BROADCAST_NUM10 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 
	elseif varMap == YX_DUNHUANG_SCENE_ID11 then
		if YX_DUNHUANG_BROADCAST_NUM11 == x310030_var_AfterBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM11 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM11 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM11 = YX_DUNHUANG_BROADCAST_NUM11 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 				
	elseif varMap == YX_DUNHUANG_SCENE_ID12 then
		if YX_DUNHUANG_BROADCAST_NUM12 == x310030_var_AfterBroadCastNum then
			YX_DUNHUANG_BROADCAST_NUM12 = 0
			LuaCallNoclosure( 310032, "KickHuman", varMap, varAct, varTime)
			return 
		end
		local message = format( x310030_str_end, x310030_var_AfterBroadCastNum-YX_DUNHUANG_BROADCAST_NUM12 )
		x310030_ShowMessage1(varMap,message)
		YX_DUNHUANG_BROADCAST_NUM12 = YX_DUNHUANG_BROADCAST_NUM12 + 1
		SetSystemTimerTick( varMap, x310030_var_FileId, "BroadCastAfter", varAct, 60*1000  ) 				
		
	end
end
