

x310403_var_FileId = 310403

function x310403_KickMonster( varMap, varAct, varTime )
	

	if varMap == QT_LOULAN_SCENE_ID then
			
			
		for varI=1, QT_LOULAN_MONSTER_OBJ_NUM do
				if QT_LOULAN_MONSTER_OBJ_ID[varI] ~= nil then
					
					DeleteMonsterEx(varMap, QT_LOULAN_MONSTER_OBJ_ID[varI])
				end
		end
		QT_LOULAN_MONSTER_OBJ_NUM = 0
		QT_LOULAN_MONSTER_OBJ_ID = {}		
	elseif varMap == QT_LAIYIN_SCENE_ID then

		for varI=1, QT_LAIYIN_MONSTER_OBJ_NUM do
				if QT_LAIYIN_MONSTER_OBJ_ID[varI] ~= nil then
					DeleteMonsterEx(varMap, QT_LAIYIN_MONSTER_OBJ_ID[varI])
				end
		end
		QT_LAIYIN_MONSTER_OBJ_NUM = 0
		QT_LAIYIN_MONSTER_OBJ_ID = {}
	elseif varMap == QT_KUNLUN_SCENE_ID then

		for varI=1, QT_KUNLUN_MONSTER_OBJ_NUM do
				if QT_KUNLUN_MONSTER_OBJ_ID[varI] ~= nil then
					DeleteMonsterEx(varMap, QT_KUNLUN_MONSTER_OBJ_ID[varI])
				end
		end
		QT_KUNLUN_MONSTER_OBJ_NUM = 0
		QT_KUNLUN_MONSTER_OBJ_ID = {}
	elseif varMap == QT_DUNHUANG_SCENE_ID then

		for varI=1, QT_DUNHUANG_MONSTER_OBJ_NUM do
				if QT_DUNHUANG_MONSTER_OBJ_ID[varI] ~= nil then
					DeleteMonsterEx(varMap, QT_DUNHUANG_MONSTER_OBJ_ID[varI])
				end
		end
		QT_DUNHUANG_MONSTER_OBJ_NUM = 0
		QT_DUNHUANG_MONSTER_OBJ_ID = {}
	end

end

function x310403_ProcMapTimerTick( varMap, varAct, varTime )

end
