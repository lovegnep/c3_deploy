--优质地中海尖凿礼包





x418709_var_FileId 		= 418709

x418709_var_LevelMin		=	1

x418709_var_RandomItemTable0   = {																		
																		{item =11000949, varNum =50,varName ="优质地中海尖凿"},
																		{item =11000949, varNum =60,varName ="优质地中海尖凿"},
																		{item =11000949, varNum =70,varName ="优质地中海尖凿"},																	                    
																}
x418709_var_RandomItemTable1   = {																		
																		{item =11970023, varNum =50,varName ="黄金乱士符"},
																		{item =12030775, varNum =45,varName ="掌门牌碎片"},	
																		{item =1, varNum =5,varName ="",},										                    
																}



function x418709_ProcEventEntry( varMap, varPlayer, varBagIdx )
		if GetBagSpace(varMap, varPlayer) < 4 then
			Msg2Player(varMap, varPlayer, "背包空间少于4个，请整理后再试", 0, 2)
			Msg2Player(varMap, varPlayer, "背包空间少于4个，请整理后再试", 0, 3)
			return
		end
		local rand1 =random( 1, 100)
		local rand2 =random( 1, 10)
		local rand3 =random( 1, 100)
		local rseed = random( 1, 100)
		StartItemTask( varMap)
		local varNumber = 1
		if rand1 < 91 then 
			--优质地中海尖凿
			ItemAppendBind( varMap, x418709_var_RandomItemTable0[1].item, x418709_var_RandomItemTable0[1].varNum)
		elseif rand1 > 90 and rand1 < 100 then
			ItemAppendBind( varMap, x418709_var_RandomItemTable0[2].item, x418709_var_RandomItemTable0[2].varNum)
			varNumber = 2
		else
			ItemAppendBind( varMap, x418709_var_RandomItemTable0[3].item, x418709_var_RandomItemTable0[3].varNum)
			varNumber = 3		
		end
		--精品地中海尖凿*5
			if rand2 == 1 then
				ItemAppendBind( varMap, 11000950, 5)	
			end
			--残破的神兵之魂
			if rand3 < 68 then
				ItemAppendBind( varMap, 11000304, 1)
			end
			--时装纹样or掌门牌碎片
			local varIndex = 1
		  local dn = 1
		  local up = 1
		  for varI, item in x418709_var_RandomItemTable1 do
		      up = up + item.varNum
		      if rseed >= dn and rseed < up then
		          varIndex = varI
		          break
		      end
		      dn = dn + item.varNum
		  end
		  if varIndex == 1 then
		  	ItemAppendBind( varMap, x418709_var_RandomItemTable1[varIndex].item, 5)
		  elseif varIndex ==2 then
		  	ItemAppendBind( varMap, x418709_var_RandomItemTable1[varIndex].item, 1)
		  end
		if StopItemTask( varMap, varPlayer) == 0 then
	    	Msg2Player( varMap, varPlayer, "背包已满，无法获得奖励", 8, 3)
	    	return
	  else	    		
	    		if(DelItem(varMap, varPlayer,12035260 ,1)) == 1 then
		    		local varMsg = format( "恭喜您获得了#G%d个@item_%d#cffcc00", x418709_var_RandomItemTable0[ varNumber ].varNum, x418709_var_RandomItemTable0[ varNumber ].item )
						Msg2Player( varMap, varPlayer, varMsg, 8, 3)			
						if rand2 == 1 then
							Msg2Player( varMap, varPlayer,"您意外的获得了#G5个精品地中海尖凿",8,3) 
						end
						if rand3 < 69 then
							Msg2Player( varMap, varPlayer,"您意外的获得了#G1个残破的神兵之魂",8,3)
						end
						if varIndex == 1 then
							Msg2Player( varMap, varPlayer, "恭喜您意外获得#G5个黄金乱士符", 8, 3)
						elseif varIndex == 2 then
							Msg2Player( varMap, varPlayer,"您意外的获得了#G1个掌门牌碎片",8,3) 
						end	
						if rand1 == 3 then
							local varMsg1 = format("恭喜#R%s#cffcc00在优质地中海尖凿礼包中开出#G70个优质地中海尖凿",GetName( varMap, varPlayer))
							LuaAllScenceM2Wrold (varMap , varMsg1 , 5, 1)
						end
						DeliverItemListSendToPlayer( varMap, varPlayer)
					end
		end
end






function x418709_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418709_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418709_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418709_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418709_ProcActivateOnce( varMap, varPlayer, varImpact )




end







function x418709_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
