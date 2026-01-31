

x310335_var_GrowpointId = 240 
x310335_var_ItemIndex = 10018001 

x310335_var_GameId = 1042


function 	x310335_ProcGpCreate(varMap,growPointType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x310335_var_GrowpointId, varMap, 0, x310335_var_ItemIndex)
end




function	 x310335_ProcGpOpen(varMap,varPlayer,varTalknpc)
	if GetGameOpenById(x310335_var_GameId) <= 0 then
		Msg2Player(varMap,varPlayer,"此活动已关闭",8,3)
		return 1
	end
--    if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 65 then
--		Msg2Player(varMap,varPlayer,"很抱歉，等级排行榜最后一名玩家未到65级，无法采集",8,3)
  --      return 1
  --  end
	return 0
end




function	 x310335_ProcGpRecycle(varMap,varPlayer,varTalknpc)
	GamePlayScriptLog(varMap, varPlayer, 1621)
	local varHumanCount = GetScenePlayerCount(varMap)
	for varI=0,varHumanCount do
  		local varObj = GetScenePlayerObjId(varMap,varI)
  		if IsPlayerStateNormal(varMap,varObj) == 1 then
  			local varLevel = GetLevel(varMap,varObj)
  				if varPlayer == varObj then
  					if varLevel >64 then
  						AddExp(varMap,varPlayer, varLevel*500)
  						Msg2Player( varMap, varPlayer, format("您搜寻到魔女的水晶球，获得%d点经验",varLevel*500), 8, 2) 
  					else	                                                                                   
  						Msg2Player( varMap, varObj, format("您还不到65级，无法采集魔女的水晶球"), 8, 2)
  					end	
  				else
  					if varLevel >64 then
  						AddExp(varMap,varObj, varLevel*100)
  						Msg2Player( varMap, varObj, format("有玩家搜寻到了魔女的水晶球，每人获得%d点经验",varLevel*100), 8, 2)
  					end	
  				end
  		end
	end
        
	return 1
end





function	x310335_ProcGpProcOver(varMap,varPlayer,varTalknpc)
	
end




function	x310335_OpenCheck(varMap,varPlayer,AbilityId,AblityLevel)
	
end
