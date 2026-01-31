

x310031_var_FileId = 310031

function x310031_KickMonster( varMap, varAct, varTime )
	

	if varMap == YX_LOULAN_SCENE_ID1 then
			
			
		for varI=1, YX_LOULAN_MONSTER_OBJ_NUM1 do
				if YX_LOULAN_MONSTER_OBJ_ID1[varI] ~= nil then
					
					DeleteMonsterEx(varMap, YX_LOULAN_MONSTER_OBJ_ID1[varI])
				end
		end
		YX_LOULAN_MONSTER_OBJ_NUM1 = 0
		YX_LOULAN_MONSTER_OBJ_ID1 = {}		
	elseif varMap == YX_LOULAN_SCENE_ID2 then
		for varI=1, YX_LOULAN_MONSTER_OBJ_NUM2 do
				if YX_LOULAN_MONSTER_OBJ_ID2[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LOULAN_MONSTER_OBJ_ID2[varI])
				end
		end

		YX_LOULAN_MONSTER_OBJ_NUM2 = 0
		YX_LOULAN_MONSTER_OBJ_ID2 = {}		
	elseif varMap == YX_LOULAN_SCENE_ID3 then
		for varI=1, YX_LOULAN_MONSTER_OBJ_NUM3 do
				if YX_LOULAN_MONSTER_OBJ_ID3[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LOULAN_MONSTER_OBJ_ID3[varI])
				end
		end
		YX_LOULAN_MONSTER_OBJ_NUM3 = 0
		YX_LOULAN_MONSTER_OBJ_ID3 ={}	
	elseif varMap == YX_LOULAN_SCENE_ID4 then
		for varI=1, YX_LOULAN_MONSTER_OBJ_NUM4 do
				if YX_LOULAN_MONSTER_OBJ_ID4[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LOULAN_MONSTER_OBJ_ID4[varI])
				end
		end
		YX_LOULAN_MONSTER_OBJ_NUM4 = 0
		YX_LOULAN_MONSTER_OBJ_ID4 ={}	

	elseif varMap == YX_LOULAN_SCENE_ID5 then
		for varI=1, YX_LOULAN_MONSTER_OBJ_NUM5 do
				if YX_LOULAN_MONSTER_OBJ_ID5[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LOULAN_MONSTER_OBJ_ID5[varI])
				end
		end
		YX_LOULAN_MONSTER_OBJ_NUM5 = 0
		YX_LOULAN_MONSTER_OBJ_ID5 ={}	

	elseif varMap == YX_LOULAN_SCENE_ID6 then
		for varI=1, YX_LOULAN_MONSTER_OBJ_NUM6 do
				if YX_LOULAN_MONSTER_OBJ_ID6[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LOULAN_MONSTER_OBJ_ID6[varI])
				end
		end
		YX_LOULAN_MONSTER_OBJ_NUM6 = 0
		YX_LOULAN_MONSTER_OBJ_ID6 ={}	
	elseif varMap == YX_LOULAN_SCENE_ID7 then
		for varI=1, YX_LOULAN_MONSTER_OBJ_NUM7 do
				if YX_LOULAN_MONSTER_OBJ_ID7[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LOULAN_MONSTER_OBJ_ID7[varI])
				end
		end
		YX_LOULAN_MONSTER_OBJ_NUM7 = 0
		YX_LOULAN_MONSTER_OBJ_ID7 ={}	
	elseif varMap == YX_LOULAN_SCENE_ID8 then
		for varI=1, YX_LOULAN_MONSTER_OBJ_NUM8 do
				if YX_LOULAN_MONSTER_OBJ_ID8[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LOULAN_MONSTER_OBJ_ID8[varI])
				end
		end
		YX_LOULAN_MONSTER_OBJ_NUM8 = 0
		YX_LOULAN_MONSTER_OBJ_ID8 ={}		
	elseif varMap == YX_LOULAN_SCENE_ID9 then
		for varI=1, YX_LOULAN_MONSTER_OBJ_NUM9 do
				if YX_LOULAN_MONSTER_OBJ_ID9[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LOULAN_MONSTER_OBJ_ID9[varI])
				end
		end
		YX_LOULAN_MONSTER_OBJ_NUM9 = 0
		YX_LOULAN_MONSTER_OBJ_ID9 ={}		
	elseif varMap == YX_LOULAN_SCENE_ID10 then
		for varI=1, YX_LOULAN_MONSTER_OBJ_NUM10 do
				if YX_LOULAN_MONSTER_OBJ_ID10[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LOULAN_MONSTER_OBJ_ID10[varI])
				end
		end
		YX_LOULAN_MONSTER_OBJ_NUM10 = 0
		YX_LOULAN_MONSTER_OBJ_ID10 ={}		
	elseif varMap == YX_LOULAN_SCENE_ID11 then
		for varI=1, YX_LOULAN_MONSTER_OBJ_NUM11 do
				if YX_LOULAN_MONSTER_OBJ_ID11[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LOULAN_MONSTER_OBJ_ID11[varI])
				end
		end
		YX_LOULAN_MONSTER_OBJ_NUM11 = 0
		YX_LOULAN_MONSTER_OBJ_ID11 ={}						
	elseif varMap == YX_LOULAN_SCENE_ID12 then
		for varI=1, YX_LOULAN_MONSTER_OBJ_NUM12 do
				if YX_LOULAN_MONSTER_OBJ_ID12[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LOULAN_MONSTER_OBJ_ID12[varI])
				end
		end
		YX_LOULAN_MONSTER_OBJ_NUM12 = 0
		YX_LOULAN_MONSTER_OBJ_ID12 ={}				
		
	elseif varMap == YX_LAIYIN_SCENE_ID1 then

		for varI=1, YX_LAIYIN_MONSTER_OBJ_NUM1 do
				if YX_LAIYIN_MONSTER_OBJ_ID1[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LAIYIN_MONSTER_OBJ_ID1[varI])
				end
		end
		YX_LAIYIN_MONSTER_OBJ_NUM1 = 0
		YX_LAIYIN_MONSTER_OBJ_ID1 = {}
	elseif varMap == YX_LAIYIN_SCENE_ID2 then
		for varI=1, YX_LAIYIN_MONSTER_OBJ_NUM2 do
				if YX_LAIYIN_MONSTER_OBJ_ID2[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LAIYIN_MONSTER_OBJ_ID2[varI])
				end
		end
		YX_LAIYIN_MONSTER_OBJ_NUM2 = 0
	elseif varMap == YX_LAIYIN_SCENE_ID3 then
		
		for varI=1, YX_LAIYIN_MONSTER_OBJ_NUM3 do
				if YX_LAIYIN_MONSTER_OBJ_ID3[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LAIYIN_MONSTER_OBJ_ID3[varI])
				end
		end
		YX_LAIYIN_MONSTER_OBJ_NUM3 = 0
		YX_LAIYIN_MONSTER_OBJ_ID3 = {}
	elseif varMap == YX_LAIYIN_SCENE_ID4 then
		
		for varI=1, YX_LAIYIN_MONSTER_OBJ_NUM4 do
				if YX_LAIYIN_MONSTER_OBJ_ID4[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LAIYIN_MONSTER_OBJ_ID4[varI])
				end
		end
		YX_LAIYIN_MONSTER_OBJ_NUM4 = 0
		YX_LAIYIN_MONSTER_OBJ_ID4 = {}

	elseif varMap == YX_LAIYIN_SCENE_ID5 then
		for varI=1, YX_LAIYIN_MONSTER_OBJ_NUM5 do
				if YX_LAIYIN_MONSTER_OBJ_ID5[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LAIYIN_MONSTER_OBJ_ID5[varI])
				end
		end
		YX_LAIYIN_MONSTER_OBJ_NUM5 = 0
		YX_LAIYIN_MONSTER_OBJ_ID5 ={}	

	elseif varMap == YX_LAIYIN_SCENE_ID6 then
		for varI=1, YX_LAIYIN_MONSTER_OBJ_NUM6 do
				if YX_LAIYIN_MONSTER_OBJ_ID6[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LAIYIN_MONSTER_OBJ_ID6[varI])
				end
		end
		YX_LAIYIN_MONSTER_OBJ_NUM6 = 0
		YX_LAIYIN_MONSTER_OBJ_ID6 ={}	
	elseif varMap == YX_LAIYIN_SCENE_ID7 then
		for varI=1, YX_LAIYIN_MONSTER_OBJ_NUM7 do
				if YX_LAIYIN_MONSTER_OBJ_ID7[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LAIYIN_MONSTER_OBJ_ID7[varI])
				end
		end
		YX_LAIYIN_MONSTER_OBJ_NUM7 = 0
		YX_LAIYIN_MONSTER_OBJ_ID7 ={}	
	elseif varMap == YX_LAIYIN_SCENE_ID8 then
		for varI=1, YX_LAIYIN_MONSTER_OBJ_NUM8 do
				if YX_LAIYIN_MONSTER_OBJ_ID8[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LAIYIN_MONSTER_OBJ_ID8[varI])
				end
		end
		YX_LAIYIN_MONSTER_OBJ_NUM8 = 0
		YX_LAIYIN_MONSTER_OBJ_ID8 ={}
	elseif varMap == YX_LAIYIN_SCENE_ID9 then
		for varI=1, YX_LAIYIN_MONSTER_OBJ_NUM9 do
				if YX_LAIYIN_MONSTER_OBJ_ID9[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LAIYIN_MONSTER_OBJ_ID9[varI])
				end
		end
		YX_LAIYIN_MONSTER_OBJ_NUM9 = 0
		YX_LAIYIN_MONSTER_OBJ_ID9 ={}
	elseif varMap == YX_LAIYIN_SCENE_ID10 then
		for varI=1, YX_LAIYIN_MONSTER_OBJ_NUM10 do
				if YX_LAIYIN_MONSTER_OBJ_ID10[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LAIYIN_MONSTER_OBJ_ID10[varI])
				end
		end
		YX_LAIYIN_MONSTER_OBJ_NUM10 = 0
		YX_LAIYIN_MONSTER_OBJ_ID10 ={}
	elseif varMap == YX_LAIYIN_SCENE_ID11 then
		for varI=1, YX_LAIYIN_MONSTER_OBJ_NUM11 do
				if YX_LAIYIN_MONSTER_OBJ_ID11[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LAIYIN_MONSTER_OBJ_ID11[varI])
				end
		end
		YX_LAIYIN_MONSTER_OBJ_NUM11 = 0
		YX_LAIYIN_MONSTER_OBJ_ID11 ={}							
	elseif varMap == YX_LAIYIN_SCENE_ID12 then
		for varI=1, YX_LAIYIN_MONSTER_OBJ_NUM12 do
				if YX_LAIYIN_MONSTER_OBJ_ID12[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_LAIYIN_MONSTER_OBJ_ID12[varI])
				end
		end
		YX_LAIYIN_MONSTER_OBJ_NUM12 = 0
		YX_LAIYIN_MONSTER_OBJ_ID12 ={}							
		
	elseif varMap == YX_KUNLUN_SCENE_ID1 then

		for varI=1, YX_KUNLUN_MONSTER_OBJ_NUM1 do
				if YX_KUNLUN_MONSTER_OBJ_ID1[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_KUNLUN_MONSTER_OBJ_ID1[varI])
				end
		end
		YX_KUNLUN_MONSTER_OBJ_NUM1 = 0
		YX_KUNLUN_MONSTER_OBJ_ID1 = {}
	elseif varMap == YX_KUNLUN_SCENE_ID2 then

		for varI=1, YX_KUNLUN_MONSTER_OBJ_NUM2 do
				if YX_KUNLUN_MONSTER_OBJ_ID2[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_KUNLUN_MONSTER_OBJ_ID2[varI])
				end
		end
		YX_KUNLUN_MONSTER_OBJ_NUM2 = 0
		YX_KUNLUN_MONSTER_OBJ_ID2 = {}
	elseif varMap == YX_KUNLUN_SCENE_ID3 then

		for varI=1, YX_KUNLUN_MONSTER_OBJ_NUM3 do
				if YX_KUNLUN_MONSTER_OBJ_ID3[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_KUNLUN_MONSTER_OBJ_ID3[varI])
				end
		end
		YX_KUNLUN_MONSTER_OBJ_NUM3 = 0
		YX_KUNLUN_MONSTER_OBJ_ID3 = {}
	elseif varMap == YX_KUNLUN_SCENE_ID4 then

		for varI=1, YX_KUNLUN_MONSTER_OBJ_NUM4 do
				if YX_KUNLUN_MONSTER_OBJ_ID4[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_KUNLUN_MONSTER_OBJ_ID4[varI])
				end
		end
		YX_KUNLUN_MONSTER_OBJ_NUM4 = 0
		YX_KUNLUN_MONSTER_OBJ_ID4 = {}

	elseif varMap == YX_KUNLUN_SCENE_ID5 then
		for varI=1, YX_KUNLUN_MONSTER_OBJ_NUM5 do
				if YX_KUNLUN_MONSTER_OBJ_ID5[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_KUNLUN_MONSTER_OBJ_ID5[varI])
				end
		end
		YX_KUNLUN_MONSTER_OBJ_NUM5 = 0
		YX_KUNLUN_MONSTER_OBJ_ID5 ={}	

	elseif varMap == YX_KUNLUN_SCENE_ID6 then
		for varI=1, YX_KUNLUN_MONSTER_OBJ_NUM6 do
				if YX_KUNLUN_MONSTER_OBJ_ID6[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_KUNLUN_MONSTER_OBJ_ID6[varI])
				end
		end
		YX_KUNLUN_MONSTER_OBJ_NUM6 = 0
		YX_KUNLUN_MONSTER_OBJ_ID6 ={}	

	elseif varMap == YX_KUNLUN_SCENE_ID7 then
		for varI=1, YX_KUNLUN_MONSTER_OBJ_NUM7 do
				if YX_KUNLUN_MONSTER_OBJ_ID7[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_KUNLUN_MONSTER_OBJ_ID7[varI])
				end
		end
		YX_KUNLUN_MONSTER_OBJ_NUM7 = 0
		YX_KUNLUN_MONSTER_OBJ_ID7 ={}
	
	elseif varMap == YX_KUNLUN_SCENE_ID8 then
		for varI=1, YX_KUNLUN_MONSTER_OBJ_NUM8 do
				if YX_KUNLUN_MONSTER_OBJ_ID8[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_KUNLUN_MONSTER_OBJ_ID8[varI])
				end
		end
		YX_KUNLUN_MONSTER_OBJ_NUM8 = 0
		YX_KUNLUN_MONSTER_OBJ_ID8 ={}

	elseif varMap == YX_KUNLUN_SCENE_ID9 then
		for varI=1, YX_KUNLUN_MONSTER_OBJ_NUM9 do
				if YX_KUNLUN_MONSTER_OBJ_ID9[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_KUNLUN_MONSTER_OBJ_ID9[varI])
				end
		end
		YX_KUNLUN_MONSTER_OBJ_NUM9 = 0
		YX_KUNLUN_MONSTER_OBJ_ID9 ={}		
	elseif varMap == YX_KUNLUN_SCENE_ID10 then
		for varI=1, YX_KUNLUN_MONSTER_OBJ_NUM10 do
				if YX_KUNLUN_MONSTER_OBJ_ID10[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_KUNLUN_MONSTER_OBJ_ID10[varI])
				end
		end
		YX_KUNLUN_MONSTER_OBJ_NUM10 = 0
		YX_KUNLUN_MONSTER_OBJ_ID10 ={}	
	elseif varMap == YX_KUNLUN_SCENE_ID11 then
		for varI=1, YX_KUNLUN_MONSTER_OBJ_NUM11 do
				if YX_KUNLUN_MONSTER_OBJ_ID11[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_KUNLUN_MONSTER_OBJ_ID11[varI])
				end
		end
		YX_KUNLUN_MONSTER_OBJ_NUM11 = 0
		YX_KUNLUN_MONSTER_OBJ_ID11 ={}			
	elseif varMap == YX_KUNLUN_SCENE_ID12 then
		for varI=1, YX_KUNLUN_MONSTER_OBJ_NUM12 do
				if YX_KUNLUN_MONSTER_OBJ_ID12[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_KUNLUN_MONSTER_OBJ_ID12[varI])
				end
		end
		YX_KUNLUN_MONSTER_OBJ_NUM12 = 0
		YX_KUNLUN_MONSTER_OBJ_ID12 ={}			
		
	elseif varMap == YX_DUNHUANG_SCENE_ID1 then	

		for varI=1, YX_DUNHUANG_MONSTER_OBJ_NUM1 do
				if YX_DUNHUANG_MONSTER_OBJ_ID1[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_DUNHUANG_MONSTER_OBJ_ID1[varI])
				end
		end
		YX_DUNHUANG_MONSTER_OBJ_NUM1 = 0
		YX_DUNHUANG_MONSTER_OBJ_ID1 = {}
	elseif varMap == YX_DUNHUANG_SCENE_ID2 then

		for varI=1, YX_DUNHUANG_MONSTER_OBJ_NUM2 do
				if YX_DUNHUANG_MONSTER_OBJ_ID2[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_DUNHUANG_MONSTER_OBJ_ID2[varI])
				end
		end
		YX_DUNHUANG_MONSTER_OBJ_NUM2 = 0
		YX_DUNHUANG_MONSTER_OBJ_ID2 = {}

	elseif varMap == YX_DUNHUANG_SCENE_ID3 then

		for varI=1, YX_DUNHUANG_MONSTER_OBJ_NUM3 do
				if YX_DUNHUANG_MONSTER_OBJ_ID3[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_DUNHUANG_MONSTER_OBJ_ID3[varI])
				end
		end
		YX_DUNHUANG_MONSTER_OBJ_NUM3 =0
		YX_DUNHUANG_MONSTER_OBJ_ID3 = {}
	elseif varMap == YX_DUNHUANG_SCENE_ID4 then

		for varI=1, YX_DUNHUANG_MONSTER_OBJ_NUM4 do
				if YX_DUNHUANG_MONSTER_OBJ_ID4[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_DUNHUANG_MONSTER_OBJ_ID4[varI])
				end
		end
		YX_DUNHUANG_MONSTER_OBJ_NUM4 =0
		YX_DUNHUANG_MONSTER_OBJ_ID4 = {}

	elseif varMap == YX_DUNHUANG_SCENE_ID5 then
		for varI=1, YX_DUNHUANG_MONSTER_OBJ_NUM5 do
				if YX_DUNHUANG_MONSTER_OBJ_ID5[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_DUNHUANG_MONSTER_OBJ_ID5[varI])
				end
		end
		YX_DUNHUANG_MONSTER_OBJ_NUM5 = 0
		YX_DUNHUANG_MONSTER_OBJ_ID5 ={}	

	elseif varMap == YX_DUNHUANG_SCENE_ID6 then
		for varI=1, YX_DUNHUANG_MONSTER_OBJ_NUM6 do
				if YX_DUNHUANG_MONSTER_OBJ_ID6[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_DUNHUANG_MONSTER_OBJ_ID6[varI])
				end
		end
		YX_DUNHUANG_MONSTER_OBJ_NUM6 = 0
		YX_DUNHUANG_MONSTER_OBJ_ID6 ={}	
	elseif varMap == YX_DUNHUANG_SCENE_ID7 then
		for varI=1, YX_DUNHUANG_MONSTER_OBJ_NUM7 do
				if YX_DUNHUANG_MONSTER_OBJ_ID7[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_DUNHUANG_MONSTER_OBJ_ID7[varI])
				end
		end
		YX_DUNHUANG_MONSTER_OBJ_NUM7 = 0
		YX_DUNHUANG_MONSTER_OBJ_ID7 ={}	
	elseif varMap == YX_DUNHUANG_SCENE_ID8 then
		for varI=1, YX_DUNHUANG_MONSTER_OBJ_NUM8 do
				if YX_DUNHUANG_MONSTER_OBJ_ID8[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_DUNHUANG_MONSTER_OBJ_ID8[varI])
				end
		end
		YX_DUNHUANG_MONSTER_OBJ_NUM8 = 0
		YX_DUNHUANG_MONSTER_OBJ_ID8 ={}	
	elseif varMap == YX_DUNHUANG_SCENE_ID9 then
		for varI=1, YX_DUNHUANG_MONSTER_OBJ_NUM9 do
				if YX_DUNHUANG_MONSTER_OBJ_ID9[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_DUNHUANG_MONSTER_OBJ_ID9[varI])
				end
		end
		YX_DUNHUANG_MONSTER_OBJ_NUM9 = 0
		YX_DUNHUANG_MONSTER_OBJ_ID9 ={}	
	elseif varMap == YX_DUNHUANG_SCENE_ID10 then
		for varI=1, YX_DUNHUANG_MONSTER_OBJ_NUM10 do
				if YX_DUNHUANG_MONSTER_OBJ_ID10[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_DUNHUANG_MONSTER_OBJ_ID10[varI])
				end
		end
		YX_DUNHUANG_MONSTER_OBJ_NUM10 = 0
		YX_DUNHUANG_MONSTER_OBJ_ID10 ={}	
	elseif varMap == YX_DUNHUANG_SCENE_ID11 then
		for varI=1, YX_DUNHUANG_MONSTER_OBJ_NUM11 do
				if YX_DUNHUANG_MONSTER_OBJ_ID11[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_DUNHUANG_MONSTER_OBJ_ID11[varI])
				end
		end
		YX_DUNHUANG_MONSTER_OBJ_NUM11 = 0
		YX_DUNHUANG_MONSTER_OBJ_ID11 ={}					
	elseif varMap == YX_DUNHUANG_SCENE_ID12 then
		for varI=1, YX_DUNHUANG_MONSTER_OBJ_NUM12 do
				if YX_DUNHUANG_MONSTER_OBJ_ID12[varI] ~= nil then
					DeleteMonsterEx(varMap, YX_DUNHUANG_MONSTER_OBJ_ID12[varI])
				end
		end
		YX_DUNHUANG_MONSTER_OBJ_NUM12 = 0
		YX_DUNHUANG_MONSTER_OBJ_ID12 ={}					
						
	end

end

function x310031_ProcMapTimerTick( varMap, varAct, varTime )

end
