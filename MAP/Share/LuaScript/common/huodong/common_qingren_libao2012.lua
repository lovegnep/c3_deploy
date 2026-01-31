
------------------------------------------------------------------------------------------
--一般物品的默认脚本

x310846_g_scriptId 			= 310846 							--脚本号
x310846_g_ItemID				= 12260017						-- 礼包的物品ID
x310846_g_ItemList={"真爱永恒巧克力","情人节首饰碎片","钟情一生"}
--奖励的物品



function x310846_ProcEventEntry( varMap, varPlayer, bagIndex )
    --检测时间
local year, month, day = GetYearMonthDay()
if year> 2012 or month > 2 or day > 29 or day < 14 then
		
		Msg2Player( varMap, varPlayer, "现在不是活动时间，无法使用。", 8, 3)
		return 
end	




		-- 检测背包空间
		 if GetBagSpace(varMap,varPlayer) <= 0 then
			 Msg2Player( varMap,varPlayer, "背包空间已满,无法使用物品", 8, 2)
			 Msg2Player( varMap,varPlayer, "背包空间已满,无法使用物品", 8, 3)
			 return
		 end
		if GetItemIDByIndexInBag(varMap,varPlayer, bagIndex) ~= x310846_g_ItemID then
			return
		end
		local bind = IsItemBind(varMap,varPlayer, bagIndex)
		local level = GetLevel(varMap,varPlayer)		
		local bCplay =  DelItemByIndexInBag(varMap,varPlayer, bagIndex, 1)
		
		local year,month,day =GetYearMonthDay()
		if year ~= 2012 then
			if bCplay == 1 then 
				StartTalkTask(varMap)
				TalkAppendString(varMap,"礼包已过期")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end
			return
		end
    if bCplay == 1 then
      	
    local ran = random(1, 100)
		local itemname =0
		local ncount =1
		StartItemTask(varMap)
		if ran>=1 and ran<=40 then
    	ItemAppendBind( varMap, 12260016, 1 )	--真爱永恒巧克力
    itemname =1
   
	  end
	  
	  if ran>40 and ran<=80 then
    	ItemAppendBind( varMap, 12260011, 1 )	--情人节首饰碎片
      itemname =2
	  end
	  
	  if ran>80 and ran<=100 then
	  	ncount =random(1,3)
    	ItemAppendBind( varMap, 12110206, ncount )	--钟情一生
      itemname =3
	  end
	 
	  local ret = StopItemTask(varMap,varPlayer)
	  if ret > 0 then 
		
			DeliverItemListSendToPlayer(varMap,varPlayer)	
   	 Msg2Player(varMap,varPlayer,"恭喜您获得了"..ncount.."个"..x310846_g_ItemList[itemname],8,3) 
   	 else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)

		end
	end
end

function x310846_ProcIsSpellLikeScript( sceneId, selfId)
	return 0; --这个脚本需要动作支持    
	--返回0，走上面的ProcEventEntry逻辑
	--返回1，走下面的逻辑
end

function x310846_ProcCancelImpacts( sceneId, selfId )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

function x310846_ProcConditionCheck( sceneId, selfId )
	return 0
end

function x310846_ProcDeplete( sceneId, selfId )
	return 0
end

function x310846_ProcActivateOnce( sceneId, selfId )
end

function x310846_ProcActivateEachTick( sceneId, selfId)
	return 1; --不是引导性脚本, 只保留空函数.
end
