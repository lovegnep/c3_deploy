--冲级赛礼包（60级）





x418716_var_FileId 		= 418716

x418716_var_LevelMin		=	1

x418716_var_MoneyTable ={ {varNum =8,varPro =300},
													{varNum =10,varPro =673},
													{varNum =20,varPro =9},
													{varNum =30,varPro =9},
													{varNum =50,varPro =9},
												}



function x418716_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418716_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418716_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418716_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418716_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418716_ProcActivateOnce( varMap, varPlayer, varImpact )
	if GetBagSpace(varMap, varPlayer) < 1 then
			Msg2Player(varMap, varPlayer, "背包空间少于1个，请整理后再试", 0, 2)
			Msg2Player(varMap, varPlayer, "背包空间少于1个，请整理后再试", 0, 3)
			return
		end

	StartItemTask(varMap)
	ItemAppendBind( varMap, 12110208, 1)	--冲级赛礼包（70级）1个
 	
 	
 	
	local ret = StopItemTask(varMap,varPlayer)
	if ret > 0 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer)				
			local rseed = random(1,1000)
			local varIndex = 1
		  local dn = 1
		  local up = 1
		  for varI, item in x418716_var_MoneyTable do
		      up = up + item.varPro
		      if rseed >= dn and rseed < up then
		          varIndex = varI
		          break
		      end
		      dn = dn + item.varPro
		  end
		  AddMoney(varMap, varPlayer, 3, x418716_var_MoneyTable[varIndex].varNum*1000)
		  varMsg =format("恭喜您获得#G%d两#cffcc00金卡，#G钟情一生花篮#cffcc001个",x418716_var_MoneyTable[varIndex].varNum)
			Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
			Msg2Player( varMap,varPlayer,varMsg,8,3) ;
			if x418716_var_MoneyTable[varIndex].varNum == 50 then
				local varMsg1 = format("恭喜#R%s#cffcc00开启520情意浓浓礼盒中获得#G50两金卡",GetName( varMap, varPlayer))
				LuaAllScenceM2Wrold (varMap , varMsg1 , 5, 1)
			end
   		GamePlayScriptLog( varMap, varPlayer, 3739)
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







function x418716_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
