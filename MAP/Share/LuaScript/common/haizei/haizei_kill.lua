x300551_var_BonusHonor = 10
x300551_var_BossBonusHonor = 200
x300551_var_KillNum = 0
x300551_money = 500000
x300551_var_SceneMonsterCount = 30
x300551_var_MsgFightSucess = "王城戍边军统领：捷报！十字军已经全部被消灭，国家民众士气高涨，英雄们所得战利品不计其数，国库金钱增加500两"
x300551_var_MsgBossMerge	=	"王城戍边军统领：警报！可怕的十字军领袖出现了，他正在指挥残余部队疯狂地向王城冲来，如果不及时阻止他，后果不堪设想！"
x300551_var_SceneMonsterType = 3061
x300551_var_KillScriptId = 300551
x300551_BossPos = {varX=85,	z=314}

function x300551_ProcDie ( varMap , varPlayer , idkill )
	local isInTeam = HasTeam(varMap , idkill)
	if varPlayer ~= HZ_MONSTER_BOSSOBJ then
		HZ_KILL_COUNT = HZ_KILL_COUNT + 1
		if isInTeam > 0 then
			local teamCount = GetNearTeamCount(varMap , idkill)
			for varI=0, teamCount-1 do
				local teamOther = GetNearTeamMember(varMap , idkill, varI)
				if teamOther >= 0 then
					if GetHp(varMap, teamOther) > 0 then
						local varShengWang = GetShengWang( varMap, teamOther )
						varShengWang = varShengWang + x300551_var_BonusHonor
						SetShengWang( varMap, teamOther, varShengWang )
						Msg2Player(varMap, teamOther, format("#Y获得#R声望%d点#Y的奖励", x300551_var_BonusHonor),4,2)
						Msg2Player(varMap, teamOther, format("#Y获得#R声望%d点#Y的奖励", x300551_var_BonusHonor),4,3)
					end
				end
			end
		else
			if idkill >= 0 then
					if GetHp(varMap, idkill) > 0 then
						local varShengWang = GetShengWang( varMap, idkill )
						varShengWang = varShengWang + x300551_var_BonusHonor
						SetShengWang( varMap, idkill, varShengWang )
						Msg2Player(varMap, idkill, format("#Y获得#R声望%d点#Y的奖励", x300551_var_BonusHonor),4,2)
						Msg2Player(varMap, idkill, format("#Y获得#R声望%d点#Y的奖励", x300551_var_BonusHonor),4,3)
					end
			end
		end
		if HZ_KILL_COUNT >= x300551_var_SceneMonsterCount then
			local monsterObj, monsterGuid = CreateMonster(varMap,x300551_var_SceneMonsterType, x300551_BossPos.varX,x300551_BossPos.z, 1,-1, x300551_var_KillScriptId,-1,21,1800*1000);
			HZ_MONSTER_BOSSOBJ = monsterObj
			if varMap == 50 then
				LuaAllScenceM2Country(varMap, x300551_var_MsgBossMerge, 0, 4, 1)
				LuaAllScenceM2Country(varMap, x300551_var_MsgBossMerge, 0, 1, 1)
			elseif varMap == 150 then
				LuaAllScenceM2Country(varMap, x300551_var_MsgBossMerge, 1, 4, 1)
				LuaAllScenceM2Country(varMap, x300551_var_MsgBossMerge, 1, 1, 1)
			elseif varMap == 250 then
				LuaAllScenceM2Country(varMap, x300551_var_MsgBossMerge, 2, 4, 1)
				LuaAllScenceM2Country(varMap, x300551_var_MsgBossMerge, 2, 1, 1)
			elseif varMap == 350 then
				LuaAllScenceM2Country(varMap, x300551_var_MsgBossMerge, 3, 4, 1)
				LuaAllScenceM2Country(varMap, x300551_var_MsgBossMerge, 3, 1, 1)
			end
		end 
	else
		if isInTeam > 0 then
			local teamCount = GetNearTeamCount(varMap , idkill)
			for varI=0, teamCount-1 do
				local teamOther = GetNearTeamMember(varMap , idkill, varI)
				if teamOther >= 0 then
					if GetHp(varMap, teamOther) > 0 then
						local varShengWang = GetShengWang( varMap, teamOther )
						varShengWang = varShengWang + x300551_var_BossBonusHonor
						SetShengWang( varMap, teamOther, varShengWang )
						Msg2Player(varMap, teamOther, format("#Y获得#R声望%d点#Y的奖励", x300551_var_BossBonusHonor),4,2)
						Msg2Player(varMap, teamOther, format("#Y获得#R声望%d点#Y的奖励", x300551_var_BossBonusHonor),4,3)
					end
				end
			end
		else
			if idkill >= 0 then
					if GetHp(varMap, idkill) > 0 then
						local varShengWang = GetShengWang( varMap, idkill )
						varShengWang = varShengWang + x300551_var_BossBonusHonor
						SetShengWang( varMap, idkill, varShengWang )
						Msg2Player(varMap, idkill, format("#Y获得#R声望%d点#Y的奖励", x300551_var_BossBonusHonor),4,2)
						Msg2Player(varMap, idkill, format("#Y获得#R声望%d点#Y的奖励", x300551_var_BossBonusHonor),4,3)
					end
			end
		end
		if varMap == 50 then
			LuaAllScenceM2Country(varMap, x300551_var_MsgFightSucess, 0, 4, 1)
			LuaAllScenceM2Country(varMap, x300551_var_MsgFightSucess, 0, 1, 1)
			AddCountryResourceEx(varMap, 0, 2, x300551_money)
		elseif varMap == 150 then
			LuaAllScenceM2Country(varMap, x300551_var_MsgFightSucess, 1, 4, 1)
			LuaAllScenceM2Country(varMap, x300551_var_MsgFightSucess, 1, 1, 1)
			AddCountryResourceEx(varMap, 1, 2, x300551_money)
		elseif varMap == 250 then
			LuaAllScenceM2Country(varMap, x300551_var_MsgFightSucess, 2, 4, 1)
			LuaAllScenceM2Country(varMap, x300551_var_MsgFightSucess, 2, 1, 1)
			AddCountryResourceEx(varMap, 2, 2, x300551_money)
		elseif varMap == 350 then
			LuaAllScenceM2Country(varMap, x300551_var_MsgFightSucess, 3, 4, 1)
			LuaAllScenceM2Country(varMap, x300551_var_MsgFightSucess, 3, 1, 1)
			AddCountryResourceEx(varMap, 3, 2, x300551_money)
		end
		GamePlayScriptLog(varMap, idkill, 492)
		HZ_KILL_MONSTERBOSS = 1
		HZ_MONSTER_BOSSOBJ  = -1
	end

	for varI=1,x300551_var_SceneMonsterCount do
	    if HZ_MONSTER_OBJ[varI] == varPlayer then
	    	HZ_MONSTER_OBJ[varI] = -1
	    end
  end
end

function x300551_getKillNum ( )
	return HZ_KILL_COUNT
end

function x300551_clearKillNum ( )
	HZ_KILL_COUNT = 0
	HZ_MONSTER_BOSSOBJ = -1
	for varI=1,x300551_var_SceneMonsterCount do
	    HZ_MONSTER_OBJ[varI] = -1
  end
end
