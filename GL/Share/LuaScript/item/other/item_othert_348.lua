





x432348_var_FileId 		= 432348

x432348_var_LevelMin		=	1
x432348_var_SelfPos     = {}
x432348_var_BonusTable = {
[12500056] = {{varid = 11000838, varnum = 1 , varbind = 1}}, 	--主手图谱·生命
[12500057] = {{varid = 11000839, varnum = 1 , varbind = 1}}, 	--副手图谱·生命
[12500058] = {{varid = 11000840, varnum = 1 , varbind = 1}}, 	--战甲图谱·生命
[12500059] = {                                            	
						 {varid = 12041091, varnum = 1 , varbind = 1},	--极速神水
						 {varid = 12041090, varnum = 1 , varbind = 1},	--免伤神水
						 {varid = 12041093, varnum = 1 , varbind = 1},	--命中神水
						 {varid = 12041094, varnum = 1 , varbind = 1},	--无敌神水
							                                            }, 
}
x432348_var_BonusPlace = {
{varX= 134  ,varY= 189 },
{varX= 134  ,varY= 197 },
{varX= 122  ,varY= 189 },
{varX= 122  ,varY= 197 },
{varX= 127  ,varY= 192 },
}





function x432348_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x432348_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x432348_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x432348_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x432348_ProcDeplete( varMap, varPlayer )
	return 1;
end








function x432348_ProcActivateOnce( varMap, varPlayer, varImpact )

	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
	if GetLevel(varMap, varPlayer)< x432348_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end  
	
	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
	local itemid = GetItemIDByIndexInBag( varMap , varPlayer , varBagIdx );
	local size = getn( x432348_var_BonusPlace)
	local guid = GetPlayerGUID( varMap,varPlayer )
	local varIndex = 1
	
	if x432348_var_SelfPos[guid] == nil then
		x432348_var_SelfPos[guid] ={}
		x432348_var_SelfPos[guid][itemid] = {}
		varIndex = random( 1, size)
	elseif nil == x432348_var_SelfPos[guid][itemid] then
		x432348_var_SelfPos[guid][itemid] = {}
		varIndex = random( 1, size)
 	else
		varIndex = x432348_var_SelfPos[guid][itemid] 
		if varIndex < 1 or varIndex > size then
			varIndex = random( 1, size)
		end 
	end
	
	x432348_var_SelfPos[guid][itemid] = varIndex
	
	local posx =x432348_var_BonusPlace[varIndex].varX
	local posy =x432348_var_BonusPlace[varIndex].varY
	local x1,y1 = GetWorldPos( varMap, varPlayer )
	local nDistance = (x1-posx)*(x1-posx) +(y1-posy)*(y1-posy)
	if varMap~=0 then
		local varmsg = format("#{_ITEM%d}显示：宝物在#G大都·中心城#cffcf00场景",itemid)
		Msg2Player(varMap, varPlayer, varmsg, 0, 3)
		return
	end
	
	if nDistance >=3*3  then
		local varmsg = format("#{_ITEM%d}显示：宝物在大都·中心城#G（%d,%d）#cffcf00附近",itemid,posx,posy)
		Msg2Player(varMap, varPlayer, varmsg, 0, 3)
		return
	end		
	
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此寻宝券", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此寻宝券", 0, 3)
		return
	end
	
	local rand = random (1,100)
	if rand <= 20 then
		for i , item in x432348_var_BonusTable do 
			if i == itemid then
				local num = getn(item)
				local index = random(num) 
				
				StartItemTask(varMap)
				if item[index].varbind == 1 then
					ItemAppendBind( varMap, item[index].varid, item[index].varnum )
				else
					ItemAppend( varMap, item[index].varid, item[index].varnum )
				end
				local ret = StopItemTask(varMap,varPlayer)
				if ret > 0 then
					if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
					local varMsg = format("在#{_ITEM%d}的指引下，你幸运的获得了#R%d个#{_ITEM%d}#cffcf00",itemid,item[index].varnum,item[index].varid)
					Msg2Player(varMap, varPlayer, varMsg, 0, 3)
					DeliverItemListSendToPlayer(varMap,varPlayer)
					local varName = GetName(varMap, varPlayer)
					local varMsg = format("%s在寻宝券的指引下，幸运的获得了#R%d个#{_ITEM%d}#cffcf00",varName,item[index].varnum,item[index].varid)
					LuaAllScenceM2Wrold( varMap, varMsg, 5, 1 )
				else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"背包空间不足！")	
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				end
			end		
		end	
	else
		if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
		local message = format("#{_ITEM%d}化为泡影，什么都没有发生！",itemid)   
		Msg2Player( varMap, varPlayer, message, 8, 2)
		Msg2Player( varMap, varPlayer, message, 8, 3)
	end
	
	x432348_var_SelfPos[guid][itemid] = nil
	GamePlayScriptLog( varMap, varPlayer, 2570)
end	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	






function x432348_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
