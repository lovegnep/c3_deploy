x930161_var_FileId = 930161 
x930161_var_only =0
x930161_var_SelfPos				=	{ }
x930161_var_Item1Tab = 	{
							{item = 11000202, varCount = 20, },
							{item = 11050003, varCount = 20, },
							{item = 11030501, varCount = 20, },
							{item = 11030405, varCount = 20, },
							{
								{ item = 12030254, varCount = 3, },
								{ item = 12030255, varCount = 3, },
								{ item = 12030256, varCount = 3, },
							}
						} 
x930161_var_Item2Tab = 	{
							{item = 11000501, varCount = 5, },
							{item = 12041103, varCount = 5, },
							{item = 11000902, varCount = 1, },
							{item = 19010003, varCount = 1, },
							{item = 12041110, varCount = 3, },
							{item = 12041111, varCount = 3, },
							{item = 12041112, varCount = 3, },
							{item = 11990015, varCount = 4, },
						} 
x930161_var_Item3Tab = 	{
							{item = 12033110, varCount = 1, },
							{item = 12033111, varCount = 1, },
						}
x930161_var_map=545
x930161_var_Place = {
									{varX= 81  ,varY= 209 },
									{varX= 44  ,varY= 185 },
									{varX= 94  ,varY= 154 },
									{varX= 52  ,varY= 145 },
									{varX= 52  ,varY= 113 },
									{varX= 32  ,varY= 134 },
									{varX= 40  ,varY= 48 },
									{varX= 56  ,varY= 30 },
									{varX= 46  ,varY= 83 },
									{varX= 62  ,varY= 37 },
									{varX= 172 ,varY= 71 },
									{varX= 143 ,varY= 70 },
									{varX= 202 ,varY= 110 },
									{varX= 208 ,varY= 120 },
									{varX= 142 ,varY= 231 },
									{varX= 107 ,varY= 167 },
									{varX= 114 ,varY= 185 },
									{varX= 205 ,varY= 171 },
									{varX= 190 ,varY= 62 },
									{varX= 115 ,varY= 204 },
									}

function x930161_AddItem( varMap, varPlayer, varItem, varCount, bBind )
	StartItemTask( varMap )
	if bBind == 0 then
		ItemAppendBind( varMap, varItem, varCount )
	else
		ItemAppend( varMap, varItem, varCount )
	end
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
		StartTalkTask(varMap)
		local varMsg = format( "你获得了%d个@item_%d。",varCount,varItem)
		TalkAppendString(varMap,varMsg)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		local varName = GetName(varMap,varPlayer)
		if varName == nil then
			varName = "Errorname"
		end
		if varItem == x930161_var_Item3Tab[1].item then 
			local varMsg = format(varName.."在天上人间寻宝获得%d个#G掌门牌：碰碰胡（7天）礼包",x930161_var_Item3Tab[1].varCount)
			LuaAllScenceM2Wrold (varMap,varMsg, 5, 1)
		elseif varItem == x930161_var_Item3Tab[2].item then 
			local varMsg = format(varName.."在天上人间寻宝获得%d个#G掌门牌：清一色（7天）礼包",x930161_var_Item3Tab[2].varCount)
			LuaAllScenceM2Wrold (varMap,varMsg, 5, 1)
		end
		return 1
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，请整理背包！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0
	end	
end
	
function x930161_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local bBind = 0
	if IsHaveSpecificImpact( varMap, varPlayer, 9011) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9012) == 1 or IsHaveSpecificImpact( varMap, varPlayer, 9013) == 1 then
		bBind = 1
	end

	local size = getn( x930161_var_Place)
	local guid = GetPlayerGUID( varMap,varPlayer )
	local varIndex = 1
	if x930161_var_SelfPos[guid] == nil then
		varIndex = random( 1, size)
 	else
		varIndex = x930161_var_SelfPos[guid] 
		if varIndex < 1 or varIndex > size then
			varIndex = random( 1, size)
		end 
	end
	
	x930161_var_SelfPos[guid] = varIndex
	
	
		
	
	
	local posx =x930161_var_Place[varIndex].varX
	local posy =x930161_var_Place[varIndex].varY
	local x1,y1 = GetWorldPos( varMap, varPlayer )
	local nDistance = (x1-posx)*(x1-posx) +(y1-posy)*(y1-posy)
	if nDistance >=5*5 or varMap~=x930161_var_map then
		x300334_ShowTips(varMap, varPlayer, format("寻宝图显示：宝藏在大乱斗·场景#G（%d,%d）#cffcf00附近",posx,posy))
		return
	end		
	
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此寻宝图", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此寻宝图", 0, 3)
		return
	end
	
	local varRand = random(1, 100)
	local varLevel = GetLevel(varMap, varPlayer)
	local varRet = 1
	if varRand <= 10 then		
		varRet = x930161_AddItem( varMap, varPlayer, 12035000, 1, bBind )
	elseif varRand > 10 and varRand <= 17 then
		varRet = x930161_AddItem( varMap, varPlayer, 12035001, 1, bBind )	
	elseif varRand > 17 and varRand <= 20 then
		varRet = x930161_AddItem( varMap, varPlayer, 12035002, 1, bBind )	
	elseif varRand > 20 and varRand <= 79 then 
		local varNum = getn(x930161_var_Item1Tab)
		local rate = random(1,varNum)
		if rate < varNum then
			varRet = x930161_AddItem( varMap, varPlayer, x930161_var_Item1Tab[rate].item, x930161_var_Item1Tab[rate].varCount, bBind )
		else
			if varLevel < 70 then
				varRet = x930161_AddItem( varMap, varPlayer, x930161_var_Item1Tab[varNum][1].item, x930161_var_Item1Tab[varNum][1].varCount, bBind )
			elseif varLevel < 80 then
				varRet = x930161_AddItem( varMap, varPlayer, x930161_var_Item1Tab[varNum][2].item, x930161_var_Item1Tab[varNum][2].varCount, bBind )
			else
				varRet = x930161_AddItem( varMap, varPlayer, x930161_var_Item1Tab[varNum][3].item, x930161_var_Item1Tab[varNum][3].varCount, bBind )
			end
		end
	elseif varRand >79 and varRand <= 99 then
		local varNum = getn(x930161_var_Item2Tab)
		local rate = random(1,varNum)
		varRet = x930161_AddItem( varMap, varPlayer, x930161_var_Item2Tab[rate].item, x930161_var_Item2Tab[rate].varCount, bBind )
		
	elseif varRand == 100 then
		local varNum = getn(x930161_var_Item3Tab)
		local rate = random(1,varNum)
		varRet = x930161_AddItem( varMap, varPlayer, x930161_var_Item3Tab[rate].item, x930161_var_Item3Tab[rate].varCount, bBind )
		
			
	end
	
	if varRet == 0 then
		return
	end
	
	if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
	
	x930161_var_SelfPos[guid] = nil

end

function x930161_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x930161_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x930161_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x930161_ProcDeplete( varMap, varPlayer )

	return 0
end

function x930161_ProcActivateOnce( varMap, varPlayer )
end

function x930161_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end


function x300334_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end
