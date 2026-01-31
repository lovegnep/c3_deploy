






x432534_var_FileId = 432534 

x432534_var_ItemId = -1  

x432534_var_Bonus = {itemid = 10296075 , count = 1}  --仲夏狂欢手镯                                                                     
                                                                     



function x432534_ProcEventEntry( varMap, varPlayer, varBagIdx )         

end                                                                  
                                                                     





function x432534_ProcIsSpellLikeScript( varMap, varPlayer)                 
	return 1; 
end






function x432534_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x432534_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x432534_ProcDeplete( varMap, varPlayer )
	return 1;
end



function x432534_ProcAddItemByRandom(varMap, varPlayer)
	local Min = 1
	local Max = 1
	local item = nil
	local varName = nil         
         
		local allitem = x432534_var_ItemList
		local probability = random(1,200000)
	  for varI, iter in allitem do
        Max = Max + iter.probability
        if probability >= Min and probability < Max then
            item = iter.varId
						 varName = iter.varName
            break
        end
    end
	x432534_ProcAddItem(varMap, varPlayer, item ,varName) 
end

function x432534_ProcAddItem(varMap, varPlayer, varItem ,iname)                               
  local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)

	StartItemTask(varMap)   
	if IsItemBind(varMap,varPlayer,varBagIdx) == 0 then
		ItemAppend( varMap,varItem, 1 )	
	else
		ItemAppendBind( varMap,varItem, 1 )
	end	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			StartTalkTask(varMap)
			local varStr =format( "您开启了1个@item_%d#cffcf00，获得了1个@item_%d", 12035212,varItem)
			if varItem == 12030059 or varItem == 12030511 or varItem == 12030203 or varItem == 12030503 or varItem == 12030504 or varItem == 12030512 or varItem == 11000300 then
				local varName = GetName(varMap,varPlayer)
				if varName == nil then
					varName = "Errorname"
				end
				local varMsg1 =format(varName.."打开宾利大礼包获得了"..iname)
				LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
			end
			TalkAppendString(varMap,varStr)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
      
      GamePlayScriptLog( varMap, varPlayer, 2503)			
		end

	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	
end








function x432534_ProcActivateOnce( varMap, varPlayer, varImpact )   
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法使用此道具", 0, 3)
		return
	end		
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		GamePlayScriptLog( varMap, varPlayer, 2654)
		x432534_GiveBonus(varMap, varPlayer)
		local varRandom = random(1,1000)							--1/1000奖励3%的经验手镯
		if varRandom == 1 then
			StartItemTask( varMap)
				ItemAppendBind( varMap, x432534_var_Bonus.itemid, x432534_var_Bonus.count)
				if StopItemTask( varMap, varPlayer) <= 0 then
						Msg2Player( varMap, varPlayer, "你的背包已满，无法获得道具奖励。", 8, 2)
				else
						local msg  = format("打开仲夏庆典大礼包，你意外获得了%d个#R#{_ITEM%d}" ,x432534_var_Bonus.count, x432534_var_Bonus.itemid)
						local msg1 =	format("%s打开仲夏庆典大礼包意外获得#R#{_ITEM%d}", GetName( varMap, varPlayer),  x432534_var_Bonus.itemid )
						local msg2 =	format("%s打开仲夏庆典大礼包意外获得一个增加经验获得%s的#R#{_ITEM%d}", GetName( varMap, varPlayer),"3%",x432534_var_Bonus.itemid )
						LuaAllScenceM2Wrold(varMap, msg2, CHAT_PLANE_SCROLL, 1)
						LuaAllScenceM2Wrold(varMap, msg1, CHAT_MAIN_RIGHTDOWN, 1) 
				    DeliverItemListSendToPlayer( varMap, varPlayer)
				end 
		end   
	end
	
end







function x432534_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end


function x432534_GiveBonus(varMap, varPlayer)
local level = GetLevel(varMap,varPlayer)
local i = 1
	while i == 1 do 
	local varRate = random (1,100)
		i = 2 
		if varRate <= 30 then
			local value = GetPlayerGoodBadValue(varMap, varPlayer)
			local bonus = level*20
			SetPlayerGoodBadValue(varMap, varPlayer, value + bonus)
			local varMsg = format("获得威望值#R%d#o点",bonus)
			Msg2Player(varMap,varPlayer,varMsg,8,2)
			Msg2Player(varMap,varPlayer,varMsg,8,3)
		elseif varRate <= 40 then 
			if level >= 80 then
				local inh = level * 10 
				local refixInh = AddInherenceExp(varMap, varPlayer, inh)
				local varMsg = format("获得天赋值#R%d#o点。",refixInh)
				Msg2Player(varMap, varPlayer, varMsg, 8, 2)
				Msg2Player(varMap, varPlayer, varMsg, 8, 3) 
			else 
				i = 1
			end
		elseif varRate <= 50 then 
			local guildId = GetGuildID(varMap,varPlayer)
			if guildId > 0 then
				local guildvalue = GetLevel(varMap, varPlayer) * 3
				AddGuildUserPoint(varMap, varPlayer, guildvalue)
				local varMsg = format( "获得帮贡值#R%d#o点", guildvalue)
				Msg2Player( varMap, varPlayer, varMsg, 8, 2)
				Msg2Player( varMap, varPlayer, varMsg, 8, 3)
			else 
				i = 1
			end
		elseif varRate <= 60 then
			local honor = level * 2.5        
			AddHonor(varMap, varPlayer, honor)                   
			local varMsg = format( "获得荣誉值#R%d#o点", honor)  
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)         
			Msg2Player( varMap, varPlayer, varMsg, 8, 3)   
		elseif varRate <= 80 then
			local money = level * 1500
			AddMoney( varMap, varPlayer,1, money )
			local varMsg = format( "获得银卡#R#{_MONEY%d}#o", money)
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)
			Msg2Player( varMap, varPlayer, varMsg, 8, 3)		
		elseif varRate <= 100 then  
			local shengwang =  GetShengWang( varMap, varPlayer)
			local bonus = level * 5 
			SetShengWang( varMap, varPlayer, shengwang + bonus)
			local varMsg = format( "获得声望值#R%d#o点", bonus)  
			Msg2Player( varMap, varPlayer, varMsg, 8, 2)         
			Msg2Player( varMap, varPlayer, varMsg, 8, 3) 
		end
	end
	return 1
end
