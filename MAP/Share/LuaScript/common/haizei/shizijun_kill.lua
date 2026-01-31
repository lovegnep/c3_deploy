x300561_var_BonusHonor = 10
x300561_var_BossBonusHonor = 200
x300561_var_KillNum = 0
x300561_money = 500000
x300561_var_SceneMonsterCount = 30
x300561_var_MsgFightSucess = "捷报!在金戈马场出现的十字军已经被我国将士消灭，国家民众士气高涨，英雄们所得战利品不计其数，国库金钱增加500两。"
x300561_var_MsgBossMerge	=	"警报！可怕的十字军之王出现在了金戈马场（128，128），如果不及时阻止他，后果不堪设想！"
x300561_var_SceneMonsterType = 3061
x300561_var_KillScriptId = 300561
x300561_BossPos = {varX=128,	z=128}

function x300561_ProcDie ( varMap , varPlayer , idkill )
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
						varShengWang = varShengWang + x300561_var_BonusHonor
						SetShengWang( varMap, teamOther, varShengWang )
						Msg2Player(varMap, teamOther, format("#Y获得#R声望%d点#Y的奖励", x300561_var_BonusHonor),4,2)
						Msg2Player(varMap, teamOther, format("#Y获得#R声望%d点#Y的奖励", x300561_var_BonusHonor),4,3)
					end
				end
			end
		else
			if idkill >= 0 then
					if GetHp(varMap, idkill) > 0 then
						local varShengWang = GetShengWang( varMap, idkill )
						varShengWang = varShengWang + x300561_var_BonusHonor
						SetShengWang( varMap, idkill, varShengWang )
						Msg2Player(varMap, idkill, format("#Y获得#R声望%d点#Y的奖励", x300561_var_BonusHonor),4,2)
						Msg2Player(varMap, idkill, format("#Y获得#R声望%d点#Y的奖励", x300561_var_BonusHonor),4,3)
					end
			end
		end
		if HZ_KILL_COUNT >= x300561_var_SceneMonsterCount then
			local monsterObj, monsterGuid = CreateMonster(varMap,x300561_var_SceneMonsterType, x300561_BossPos.varX,x300561_BossPos.z, 1,-1, x300561_var_KillScriptId,-1,21, 1800*1000);
			HZ_MONSTER_BOSSOBJ = monsterObj
			if varMap == 19 then
				LuaAllScenceM2Wrold(varMap, x300561_var_MsgBossMerge, 4, 1)
				LuaAllScenceM2Wrold(varMap, x300561_var_MsgBossMerge, 1, 1)
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
						varShengWang = varShengWang + x300561_var_BossBonusHonor
						SetShengWang( varMap, teamOther, varShengWang )
						Msg2Player(varMap, teamOther, format("#Y获得#R声望%d点#Y的奖励", x300561_var_BossBonusHonor),4,2)
						Msg2Player(varMap, teamOther, format("#Y获得#R声望%d点#Y的奖励", x300561_var_BossBonusHonor),4,3)
					end
				end
			end
		else
			if idkill >= 0 then
					if GetHp(varMap, idkill) > 0 then
						local varShengWang = GetShengWang( varMap, idkill )
						varShengWang = varShengWang + x300561_var_BossBonusHonor
						SetShengWang( varMap, idkill, varShengWang )
						Msg2Player(varMap, idkill, format("#Y获得#R声望%d点#Y的奖励", x300561_var_BossBonusHonor),4,2)
						Msg2Player(varMap, idkill, format("#Y获得#R声望%d点#Y的奖励", x300561_var_BossBonusHonor),4,3)
					end
			end
		end
		if varMap == 19 then
		  if idkill >= 0 then
				local varCountry = GetCurCountry(varMap, idkill)
				local varStr = ""
				if varCountry == 0 then
					varStr = "楼兰王国"
				elseif varCountry == 1 then
					varStr = "天山王国"
				elseif varCountry == 2 then
				  varStr = "昆仑王国"
				elseif varCountry == 3 then
				  varStr = "敦煌王国"
				end
				local varText = format( "在金戈马场出现的十字军已经被%s将士消灭,其国库金钱增加500两。", varStr )
				LuaAllScenceM2Wrold(varMap, varText, 4, 1)
				LuaAllScenceM2Wrold(varMap, varText, 1, 1)
				AddCountryResourceEx(varMap, varCountry, 2, x300561_money)
			end
		end
		GamePlayScriptLog(varMap, idkill, 492)
		HZ_KILL_MONSTERBOSS = 1
		HZ_MONSTER_BOSSOBJ  = -1
	end

	for varI=1,x300561_var_SceneMonsterCount do
	    if HZ_MONSTER_OBJ[varI] == varPlayer then
	    	HZ_MONSTER_OBJ[varI] = -1
	    end
  end
end

function x300561_getKillNum ( )
	return HZ_KILL_COUNT
end

function x300561_clearKillNum ( )
	HZ_KILL_COUNT = 0
	HZ_MONSTER_BOSSOBJ = -1
	for varI=1,x300561_var_SceneMonsterCount do
	    HZ_MONSTER_OBJ[varI] = -1
  end
end
