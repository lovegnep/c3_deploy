





x418464_var_FileId 		= 418464 

x418464_var_LevelMin		=	-1




function x418464_ProcEventEntry( varMap, varPlayer, varBagIdx )

end


	



function x418464_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end











function x418464_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418464_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418464_ProcDeplete( varMap, varPlayer )

	local dayTime = GetDayTime()
	if(dayTime > 12181) then  
		if DepletingUsedItem( varMap, varPlayer) == 1 then
			TalkAppendString(varMap,"礼包已过期，自动销毁。")
			Msg2Player(varMap,varPlayer,"礼包已过期，自动销毁。",8,2)
			Msg2Player(varMap,varPlayer,"礼包已过期，自动销毁。",8,3)
			end
		return
  end	
  
    local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
    local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)

		if x418464_IsOneWeekPassed(varMap, varPlayer,varBagIdx)<=0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,format("#Y还有#R%d#Y天才可再次使用",x418464_GetNextOpenDays(varMap, varPlayer,varBagIdx)))
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			return
		end
	

    local result = 1

    if curTimes <= 1 then
        
        if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
        
        x418464_GiveBonus_secondtime( varMap,varPlayer,varBagIdx)
    else
        x418464_SaveDoTime(varMap, varPlayer,varBagIdx)
        SetBagItemMultTimes( varMap, varPlayer, varBagIdx, curTimes - 1)
        result = 0
        x418464_GiveBonus_firsttime( varMap,varPlayer)
    end

	return result
end

function x418464_GiveBonus_firsttime( varMap,varPlayer)


		StartItemTask(varMap)
	ItemAppendBind( varMap, 12250002, 2 )	--精品芝华士
	ItemAppendBind( varMap, 12041101, 5 )	--修行草
	ItemAppendBind( varMap, 11000501, 5 )	--紫檀木炭
	ItemAppendBind( varMap, 12030016, 5 )	--队伍召集令
	ItemAppendBind( varMap, 12010023, 1 )	--大生命清露
	ItemAppendBind( varMap, 14050001, 1 )	--单眼混沌天珠
	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 

			DeliverItemListSendToPlayer(varMap,varPlayer)	
			GamePlayScriptLog( varMap, varPlayer, 3023)
			Msg2Player(varMap,varPlayer," 您获得了2个精品芝华士,5个修行草，5个紫檀木炭，5个队伍召集令，1个大生命清露，1个单眼混沌天珠",8,2)
			Msg2Player(varMap,varPlayer," 您获得了2个精品芝华士,5个修行草，5个紫檀木炭，5个队伍召集令，1个大生命清露，1个单眼混沌天珠",8,3)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end	
	
	
	
end


function x418464_GiveBonus_secondtime( varMap,varPlayer,varBagIdx)
	
--	if x418464_IsOneWeekPassed(varMap, varPlayer,varBagIdx)<=0 then
--		StartTalkTask(varMap)
--		TalkAppendString(varMap,format("还有#R%d#Y天才可再次使用",x418464_GetNextOpenDays(varMap, varPlayer,varBagIdx)))
--		StopTalkTask(varMap)
--		DeliverTalkTips(varMap,varPlayer)
--		return
--	end
		StartItemTask(varMap)
	  ItemAppendBind( varMap, 11010001, 5 )	--一级皇家秘银
		ItemAppendBind( varMap, 12054300, 5 )	--还童书
    ItemAppendBind( varMap, 11000501, 5 )	--紫檀木炭
		ItemAppendBind( varMap, 12010023, 1 )	--大生命清露
		ItemAppendBind( varMap, 10310026, 1 )	--清一色（7天）

		local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 

			DeliverItemListSendToPlayer(varMap,varPlayer)	
			GamePlayScriptLog( varMap, varPlayer, 3023)
			Msg2Player(varMap,varPlayer," 5个一级皇家秘银,5个还童书，5个紫檀木炭，1个大生命清露，1个清一色（7天）",8,2)
			Msg2Player(varMap,varPlayer," 5个一级皇家秘银,5个还童书，5个紫檀木炭，1个大生命清露，1个清一色（7天）",8,3)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end	
end








function x418464_ProcActivateOnce( varMap, varPlayer, varImpact )

end







function x418464_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end





function x418464_IsOneWeekPassed(varMap, varPlayer,varBagIdx)

	
	local nowtime = (GetCurrentTime()+8*3600)/86400 - 14000;
	local lasttime = GetItemParam(varMap, varPlayer, varBagIdx,8,2);
	
	local a =nowtime-lasttime

	nowtime = format("%u", nowtime)	
	lasttime = format("%u", lasttime)
	if (nowtime-lasttime)>=7 then
		return 1;
	else
		return 0;
	end

end




function x418464_SaveDoTime(varMap, varPlayer,varBagIdx)

	local nowtime = (GetCurrentTime()+8*3600)/86400 - 14000;

	SetItemParam( varMap, varPlayer, varBagIdx, 8, 2, nowtime )
end




function x418464_GetNextOpenDays(varMap, varPlayer,varBagIdx)

	
	local nowtime = (GetCurrentTime()+8*3600)/86400 - 14000;
	local lasttime = GetItemParam(varMap, varPlayer, varBagIdx,8,2);
	nowtime = format("%u", nowtime)	
	lasttime = format("%u", lasttime)
	local Days = nowtime-lasttime
	Days = 7 - Days  
	return Days

end
