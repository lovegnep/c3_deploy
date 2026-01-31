
------------------------------------------------------------------------------------------
--一般物品的默认脚本

x418797_g_scriptId 			= 418797 							--脚本号
x418797_g_ItemID				= 12032028						-- 礼包的物品ID
x418797_g_ItemList={"灵魂印","复苏的天龙魂"}
--奖励的物品



function x418797_ProcEventEntry( varMap, varPlayer, bagIndex )
    --检测时间





		-- 检测背包空间
		local num = GetBagSpace(varMap, varPlayer, 0)
	if num < 5 then
		Msg2Player( varMap,varPlayer, "背包剩余空间不足,无法获得", 8, 2)
	  Msg2Player( varMap,varPlayer, "背包剩余空间不足,无法获得", 8, 3)
		return
	end	
		
		
		
		
		
		
		
		local bind = IsItemBind(varMap,varPlayer, bagIndex)
		local level = GetLevel(varMap,varPlayer)		
		local bCplay =  DelItemByIndexInBag(varMap,varPlayer, bagIndex, 1)
		

    if bCplay == 1 then
      	
    local ran = random(1, 5)
		local itemname =0
		local ncount =1
		StartItemTask(varMap)
		if ran ==1  then
    	ItemAppendBind( varMap, 11000300, 1 )
    itemname =1
   
	  end
	  
	  if ran>1  then
	  	ncount =5	  
    	ItemAppendBind( varMap, 12030108, 5 )	
      itemname =2
	  end
	  

	 
	  local ret = StopItemTask(varMap,varPlayer)
	  if ret > 0 then 
		
			DeliverItemListSendToPlayer(varMap,varPlayer)	
   	 Msg2Player(varMap,varPlayer,"恭喜您获得了"..ncount.."个"..x418797_g_ItemList[itemname],8,3) 
   	 else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

		end
	end
end

function x418797_ProcIsSpellLikeScript( sceneId, selfId)
	return 0; --这个脚本需要动作支持    
	--返回0，走上面的ProcEventEntry逻辑
	--返回1，走下面的逻辑
end

function x418797_ProcCancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

function x418797_ProcConditionCheck( sceneId, selfId )
	return 0
end

function x418797_ProcDeplete( sceneId, selfId )
	return 0
end

function x418797_ProcActivateOnce( sceneId, selfId )
end

function x418797_ProcActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
