--完美星辰礼包





x418711_var_FileId 		= 418711

x418711_var_LevelMin		=	1

x418711_var_RandomItemTable0   = {																		
																		{item =11000552, varNum =20,varName ="完美星辰"},
																		{item =11000552, varNum =25,varName ="完美星辰"},

																}
x418711_var_RandomItemTable1   = {																		
																		{item =11011482, varNum =21,varName ="凤鸣纹样"},
																		{item =11011483, varNum =21,varName ="龙吟纹样"},
																		{item =11011484, varNum =22,varName ="虎啸纹样"},	
																		{item =12030775, varNum =640,varName ="掌门牌碎片"},	
																		{item =1, varNum =504,varName =" "},										                    
																}



function x418711_ProcEventEntry( varMap, varPlayer, varBagIdx )


		if GetBagSpace(varMap, varPlayer) < 3 then
			Msg2Player(varMap, varPlayer, "背包空间少于3个，请整理后再试", 0, 2)
			Msg2Player(varMap, varPlayer, "背包空间少于3个，请整理后再试", 0, 3)
			return
		end
		local rand1 =random( 1, 100)

		local rand3 =random( 1, 100)
		local rseed =random( 1, 1000)
		StartItemTask( varMap)
		local varNumber = 1
		if rand1 < 100 then 
			-- 完美星辰
			ItemAppendBind( varMap, x418711_var_RandomItemTable0[1].item, x418711_var_RandomItemTable0[1].varNum)
		else
			ItemAppendBind( varMap, x418711_var_RandomItemTable0[2].item, x418711_var_RandomItemTable0[2].varNum)
			varNumber = 2		
		end
			--残破的神兵之魂
			if rand3 < 96 then
				ItemAppendBind( varMap, 11000304, 1)
			end
			--时装纹样or掌门牌碎片
			local varIndex = 1
		  local dn = 1
		  local up = 1
		  for varI, item in x418711_var_RandomItemTable1 do
		      up = up + item.varNum
		      if rseed >= dn and rseed < up then
		          varIndex = varI
		          break
		      end
		      dn = dn + item.varNum
		  end
		  if varIndex <= 4 then
		  	ItemAppendBind( varMap, x418711_var_RandomItemTable1[varIndex].item, 1)
		  end
		if StopItemTask( varMap, varPlayer) == 0 then
	    	Msg2Player( varMap, varPlayer, "背包已满，无法获得奖励", 8, 3)
	    	return
	  else	    		
	    		if(DelItem(varMap, varPlayer,12035262 ,1)) == 1 then
		    		local varMsg = format( "恭喜您获得了#G%d个@item_%d#cffcc00", x418711_var_RandomItemTable0[ varNumber ].varNum, x418711_var_RandomItemTable0[ varNumber ].item )
						Msg2Player( varMap, varPlayer, varMsg, 8, 3)			
						if rand3 < 97 then
							Msg2Player( varMap, varPlayer,"您意外的获得了#G1个残破的神兵之魂",8,3)
						end
						if varIndex <= 3 then
							local varMsg3 =format("恭喜您意外获得#G1个%s", x418711_var_RandomItemTable1[varIndex].varName)
							local varMsg2 = format("恭喜#R%s#cffcc00在完美星辰礼包中开出#G%s",GetName( varMap, varPlayer),x418711_var_RandomItemTable1[varIndex].varName)
							Msg2Player( varMap, varPlayer, varMsg3, 8, 3)
							LuaAllScenceM2Wrold (varMap , varMsg2 , 5, 1)
						elseif varIndex == 4 then
							Msg2Player( varMap, varPlayer,"您意外的获得了#G1个掌门牌碎片",8,3) 
						end	
						if rand1 == 100 then
							local varMsg1 = format("恭喜#R%s#cffcc00在完美星辰礼包中开出#G25个完美星辰",GetName( varMap, varPlayer))
							LuaAllScenceM2Wrold (varMap , varMsg1 , 5, 1)
						end
						DeliverItemListSendToPlayer( varMap, varPlayer)
					end
		end
end






function x418711_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418711_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418711_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418711_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418711_ProcActivateOnce( varMap, varPlayer, varImpact )


end







function x418711_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
