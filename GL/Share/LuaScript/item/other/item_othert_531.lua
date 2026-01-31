


x432531_var_FileId 		= 432531

x432531_var_LevelMin		=	1





function x432531_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x432531_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x432531_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x432531_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x432531_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x432531_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

local nZhiYe = GetZhiye( varMap, varPlayer);
	local varItem = 0;

	StartItemTask(varMap)
	if nZhiYe==0 then
			ItemAppendBind( varMap, 45011076, 1 )	
			ItemAppendBind( varMap, 45011306, 1 )	
			ItemAppendBind( varMap, 45012021, 1 )	
			ItemAppendBind( varMap, 45012751, 1 )	
	elseif nZhiYe==1 then
			ItemAppendBind( varMap, 45011076, 1 )	
			ItemAppendBind( varMap, 45011306, 1 )	
			ItemAppendBind( varMap, 45012021, 1 )	
			ItemAppendBind( varMap, 45012751, 1 )	
	elseif nZhiYe==2 then
			ItemAppendBind( varMap, 45011076, 1 )	
			ItemAppendBind( varMap, 45011546, 1 )	
			ItemAppendBind( varMap, 45012256, 1 )	
			ItemAppendBind( varMap, 45012966, 1 )	
	elseif nZhiYe==3 then
			ItemAppendBind( varMap, 45011076, 1 )	
			ItemAppendBind( varMap, 45011546, 1 )	
			ItemAppendBind( varMap, 45012256, 1 )	
			ItemAppendBind( varMap, 45012966, 1 )	
	elseif nZhiYe==4 then
			ItemAppendBind( varMap, 45011076, 1 )	
			ItemAppendBind( varMap, 45011791, 1 )	
			ItemAppendBind( varMap, 45012486, 1 )	
			ItemAppendBind( varMap, 45013201, 1 )	
	elseif nZhiYe==5 then
			ItemAppendBind( varMap, 45011076, 1 )	
			ItemAppendBind( varMap, 45011791, 1 )	
			ItemAppendBind( varMap, 45012486, 1 )	
			ItemAppendBind( varMap, 45013201, 1 )	
	elseif nZhiYe==6 then
			ItemAppendBind( varMap, 45011076, 1 )	
			ItemAppendBind( varMap, 45011306, 1 )	
			ItemAppendBind( varMap, 45012021, 1 )	
			ItemAppendBind( varMap, 45012751, 1 )	
	elseif nZhiYe==7 then
			ItemAppendBind( varMap, 45011076, 1 )	
			ItemAppendBind( varMap, 45011306, 1 )	
			ItemAppendBind( varMap, 45012021, 1 )	
			ItemAppendBind( varMap, 45012751, 1 )	
	elseif nZhiYe==8 then
			ItemAppendBind( varMap, 45011076, 1 )	
			ItemAppendBind( varMap, 45011546, 1 )	
			ItemAppendBind( varMap, 45012256, 1 )	
			ItemAppendBind( varMap, 45012966, 1 )	
	elseif nZhiYe==9 then
			ItemAppendBind( varMap, 45011076, 1 )	
			ItemAppendBind( varMap, 45011546, 1 )	
			ItemAppendBind( varMap, 45012256, 1 )	
			ItemAppendBind( varMap, 45012966, 1 )	
	elseif nZhiYe==10 then
			ItemAppendBind( varMap, 45011076, 1 )	
			ItemAppendBind( varMap, 45011791, 1 )	
			ItemAppendBind( varMap, 45012486, 1 )	
			ItemAppendBind( varMap, 45013201, 1 )	
	elseif nZhiYe==11 then
			ItemAppendBind( varMap, 45011076, 1 )	
			ItemAppendBind( varMap, 45011791, 1 )	
			ItemAppendBind( varMap, 45012486, 1 )	
			ItemAppendBind( varMap, 45013201, 1 )	
	end

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开蓝品质将星卡礼包，获得了礼品",8,2) ;

			Msg2Player( varMap,varPlayer,"打开蓝品质将星卡礼包，获得了礼品",8,3) ;

		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包空间不足！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end

end







function x432531_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
