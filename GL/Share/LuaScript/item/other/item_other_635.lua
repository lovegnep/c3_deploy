--冲级赛礼包（70级）





x418635_var_FileId 		= 418635

x418635_var_LevelMin		=	1
x418635_var_RandomItemTable0   = {																		
																		{item =12030011, probability = 40  ,varNum =1},
																		{item =11000304, probability = 5,varNum =4},
																		{item =12030012, probability = 79  ,varNum =1},
																		{item =12030013, probability = 157 ,varNum =1},
																		{item =12030014, probability = 314 ,varNum =1},
																		{item =12030016, probability = 314 ,varNum =1},
																		{item =12030017, probability = 314 ,varNum =1},
																		{item =12030018, probability = 314 ,varNum =1},
																		{item =12030022, probability = 157 ,varNum =1},
																		{item =12030023, probability = 157 ,varNum =1},
																		{item =12030024, probability = 157 ,varNum =1},		
																		{item =12030025, probability = 157 ,varNum =1},		
																		{item =11060001, probability = 79  ,varNum =1},		
																		{item =12030043, probability = 784 ,varNum =1},		
																		{item =12031037, probability = 40  ,varNum =1},
																		{item =11010001, probability = 318 ,varNum =1},
																		{item =12010200, probability = 2676,varNum =1},
																		{item =11990015, probability = 157 ,varNum =1},
																		{item =11990011, probability = 79  ,varNum =1},
																		{item =11990051, probability = 157 ,varNum =1},
																		{item =11990100, probability = 314 ,varNum =1},
																		{item =11000800, probability = 40  ,varNum =1},
																		{item =11990400, probability = 157 ,varNum =1},
																		{item =12010201, probability = 157 ,varNum =1},
																		{item =12010202, probability = 157 ,varNum =1},
																		{item =12010203, probability = 157 ,varNum =1},
																		{item =12010204, probability = 157 ,varNum =1},		
																		{item =12030107, probability = 157 ,varNum =1},		
																		{item =12030044, probability = 40  ,varNum =1},		
																		{item =12030201, probability = 79  ,varNum =1},		
																		{item =12030213, probability = 157 ,varNum =1},		
																		{item =12041060, probability = 40  ,varNum =1},		
																		{item =12041061, probability = 79  ,varNum =1},		
																		{item =12041062, probability = 157 ,varNum =1},		
																		{item =12041070, probability = 40  ,varNum =1},		
																		{item =12041071, probability = 79  ,varNum =1},		
																		{item =12041072, probability = 157 ,varNum =1},		
																		{item =12041080, probability = 40  ,varNum =1},		
																		{item =12041081, probability = 79  ,varNum =1},		
																		{item =12041082, probability = 157 ,varNum =1},		
																		{item =12041097, probability = 157 ,varNum =1},		
																		{item =12041099, probability = 157 ,varNum =1},		
																		{item =12041103, probability = 157 ,varNum =1},		
																		{item =12041101, probability = 79  ,varNum =1},		
																		{item =12054300, probability = 314 ,varNum =1},		
																		{item =11000902, probability = 118 ,varNum =1},		
																		{item =12110206, probability = 79  ,varNum =1},			
																		{item =11000501, probability = 79  ,varNum =1},																				
																		{item =11000306, probability = 5,varNum =4},                            
																		}





function x418635_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x418635_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x418635_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418635_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418635_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418635_ProcActivateOnce( varMap, varPlayer, varImpact )


		if GetBagSpace(varMap, varPlayer) <= 0 then
			Msg2Player(varMap, varPlayer, "背包已满，请整理后再试", 0, 2)
			Msg2Player(varMap, varPlayer, "背包已满，请整理后再试", 0, 3)
			return
		end

	  local rseed = random( 1, 10000)

	  local varIndex = 1
	  local dn = 1
	  local up = 1
	  for varI, item in x418635_var_RandomItemTable0 do
	      up = up + item.probability
	      if rseed >= dn and rseed < up then
	          varIndex = varI
	          break
	      end
	      dn = dn + item.probability
	  end


		if x418635_var_RandomItemTable0[ varIndex ].varNum == 1 then 	
			StartItemTask( varMap)
			ItemAppendBind( varMap, x418635_var_RandomItemTable0[ varIndex ].item, 1)
			if StopItemTask( varMap, varPlayer) == 0 then
	    	Msg2Player( varMap, varPlayer, "背包已满，无法获得奖励", 8, 3)
	    	return
	    else	    		
	    		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		    		local varMsg = format( "恭喜您获得了#G@item_%d#cffcc00！", x418635_var_RandomItemTable0[ varIndex ].item )
						Msg2Player( varMap, varPlayer, varMsg, 8, 3)			
						DeliverItemListSendToPlayer( varMap, varPlayer)
					end
			end
--全服公告
		elseif x418635_var_RandomItemTable0[ varIndex ].varNum ==4 then
			StartItemTask( varMap)
			ItemAppendBind( varMap, x418635_var_RandomItemTable0[ varIndex ].item, 1)
			if StopItemTask( varMap, varPlayer) == 0 then
	    	Msg2Player( varMap, varPlayer, "背包已满，无法获得奖励", 8, 3)
	    	return
	    else	
		    if(DepletingUsedItem(varMap, varPlayer)) == 1 then    	
					local varMsg1 = format("恭喜#R%s#cffcc00在新浪微博达人礼盒中开出#G烈焱碎片#cffcc00！",GetName( varMap, varPlayer))
					local varMsg2 = format("恭喜#R%s#cffcc00在新浪微博达人礼盒中开出#G残破的神兵之魂#cffcc00！",GetName( varMap, varPlayer))
					if x418635_var_RandomItemTable0[ varIndex ].item == 11000304 then
						LuaAllScenceM2Wrold (varMap , varMsg2 , 5, 1)
					elseif x418635_var_RandomItemTable0[ varIndex ].item == 11000306 then
						LuaAllScenceM2Wrold (varMap , varMsg1 , 5, 1)
					end
					DeliverItemListSendToPlayer( varMap, varPlayer)
				end
			end	
		end

end







function x418635_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
