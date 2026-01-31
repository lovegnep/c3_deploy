





x203400_var_FileId 		= 203400 
x203400_var_BonusItem     = {{item = 10201001,n=1},{item = 10261001,n=1}}


function x203400_ProcEventEntry( varMap, varPlayer, varBagIdx )
local varCanPlay =  DelItem(varMap, varPlayer,13010122,1)
    if varCanPlay == 1 then
      	StartItemTask(varMap)
		ItemAppendBind( varMap, 10201001, 1 )

		ItemAppendBind( varMap, 10261001, 1 )

	local varRet = StopItemTask(varMap,varPlayer)

	if varRet>0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"你打开了新兵装备，获得了家传腰带和家传头盔！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
    end
        return varCanPlay
end

function x203400_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	

end

function x203400_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x203400_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x203400_ProcDeplete( varMap, varPlayer )
	return 0
end

function x203400_ProcActivateOnce( varMap, varPlayer )
end

function x203400_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
