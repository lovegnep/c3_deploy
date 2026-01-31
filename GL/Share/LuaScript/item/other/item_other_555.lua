
--横扫千军大礼包





x418555_var_FileId 		= 418555

x418555_var_LevelMin		=	1





function x418555_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418555_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418555_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418555_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418555_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418555_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	

local nZhiYe = GetZhiye( varMap, varPlayer);
	local varItem = 0;

	StartItemTask(varMap)
	if nZhiYe==0 then
			ItemAppendBind( varMap, 10014004, 1 )	
			ItemAppendBind( varMap, 10074004, 1 )	
			ItemAppendBind( varMap, 10234004, 1 )	
			ItemAppendBind( varMap, 10254004, 1 )	
			ItemAppendBind( varMap, 10274004, 1 )
	elseif nZhiYe==1 then
			ItemAppendBind( varMap, 10024004, 1 )	
			ItemAppendBind( varMap, 10084004, 1 )	
			ItemAppendBind( varMap, 10234014, 1 )	
			ItemAppendBind( varMap, 10254014, 1 )	
			ItemAppendBind( varMap, 10274014, 1 )
	elseif nZhiYe==2 then
			ItemAppendBind( varMap, 10034004, 1 )	
			ItemAppendBind( varMap, 10094004, 1 )	
			ItemAppendBind( varMap, 10234024, 1 )	
			ItemAppendBind( varMap, 10254024, 1 )	
			ItemAppendBind( varMap, 10274024, 1 )
	elseif nZhiYe==3 then
			ItemAppendBind( varMap, 10044004, 1 )	
			ItemAppendBind( varMap, 10104004, 1 )	
			ItemAppendBind( varMap, 10234034, 1 )	
			ItemAppendBind( varMap, 10254034, 1 )	
			ItemAppendBind( varMap, 10274034, 1 )
	elseif nZhiYe==4 then
			ItemAppendBind( varMap, 10054004, 1 )	
			ItemAppendBind( varMap, 10114004, 1 )	
			ItemAppendBind( varMap, 10234044, 1 )	
			ItemAppendBind( varMap, 10254044, 1 )	
			ItemAppendBind( varMap, 10274044, 1 )
	elseif nZhiYe==5 then
			ItemAppendBind( varMap, 10064004, 1 )	
			ItemAppendBind( varMap, 10124004, 1 )	
			ItemAppendBind( varMap, 10234054, 1 )	
			ItemAppendBind( varMap, 10254054, 1 )	
			ItemAppendBind( varMap, 10274054, 1 )
	elseif nZhiYe==6 then
			ItemAppendBind( varMap, 10354004, 1 )	
			ItemAppendBind( varMap, 10414004, 1 )	
			ItemAppendBind( varMap, 10239221, 1 )	
			ItemAppendBind( varMap, 10259221, 1 )	
			ItemAppendBind( varMap, 10279221, 1 )
	elseif nZhiYe==7 then
			ItemAppendBind( varMap, 10364004, 1 )	
			ItemAppendBind( varMap, 10424004, 1 )	
			ItemAppendBind( varMap, 10239225, 1 )	
			ItemAppendBind( varMap, 10259225, 1 )	
			ItemAppendBind( varMap, 10279225, 1 )
	elseif nZhiYe==8 then
			ItemAppendBind( varMap, 10374004, 1 )	
			ItemAppendBind( varMap, 10434004, 1 )	
			ItemAppendBind( varMap, 10239229, 1 )	
			ItemAppendBind( varMap, 10259229, 1 )	
			ItemAppendBind( varMap, 10279229, 1 )
	elseif nZhiYe==9 then
			ItemAppendBind( varMap, 10384004, 1 )	
			ItemAppendBind( varMap, 10444004, 1 )	
			ItemAppendBind( varMap, 10239233, 1 )	
			ItemAppendBind( varMap, 10259233, 1 )	
			ItemAppendBind( varMap, 10279233, 1 )
	elseif nZhiYe==10 then
			ItemAppendBind( varMap, 10394004, 1 )	
			ItemAppendBind( varMap, 10454004, 1 )	
			ItemAppendBind( varMap, 10239237, 1 )	
			ItemAppendBind( varMap, 10259237, 1 )	
			ItemAppendBind( varMap, 10279237, 1 )
	elseif nZhiYe==11 then
			ItemAppendBind( varMap, 10404004, 1 )	
			ItemAppendBind( varMap, 10464004, 1 )	
			ItemAppendBind( varMap, 10239241, 1 )	
			ItemAppendBind( varMap, 10259241, 1 )	
			ItemAppendBind( varMap, 10279241, 1 )
	end

	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)	
			
			
			Msg2Player( varMap,varPlayer,"打开横扫千军大礼包，获得天传装备主手、副手、衣服、护手和鞋子",8,2) ;

			Msg2Player( varMap,varPlayer,"打开横扫千军大礼包，获得天传装备主手、副手、衣服、护手和鞋子",8,3) ;
		
		
			GamePlayScriptLog( varMap, varPlayer, 3053)
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







function x418555_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
