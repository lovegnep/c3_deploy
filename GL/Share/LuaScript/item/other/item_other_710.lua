--一级皇家秘银礼包





x418710_var_FileId 		= 418710

x418710_var_LevelMin		=	1

x418710_var_RandomItemTable0   = {																		
																		{item =11010001, varNum =50,varName ="一级皇家密银"},
																		{item =11010001, varNum =60,varName ="一级皇家密银"},
																		{item =11010001, varNum =70,varName ="一级皇家密银"},																	                    
																}
x418710_var_RandomItemTable1   = {																		
																		{item =11011482, varNum =15,varName ="凤鸣纹样"},
																		{item =11011483, varNum =15,varName ="龙吟纹样"},
																		{item =11011484, varNum =16,varName ="虎啸纹样"},	
																		{item =11970023, varNum =500,varName ="黄金乱士符"},
																		{item =1, varNum =454,varName =" "},											                    
																}



function x418710_ProcEventEntry( varMap, varPlayer, varBagIdx )


		if GetBagSpace(varMap, varPlayer) < 3 then
			Msg2Player(varMap, varPlayer, "背包空间少于3个，请整理后再试", 0, 2)
			Msg2Player(varMap, varPlayer, "背包空间少于3个，请整理后再试", 0, 3)
			return
		end
		local rand1 =random( 1, 100)

		local rand3 =random( 1, 100)
		local rseed = random( 1, 1000)
		StartItemTask( varMap)
		local varNumber = 1
		if rand1 < 91 then 
			--优质地中海尖凿
			ItemAppendBind( varMap, x418710_var_RandomItemTable0[1].item, x418710_var_RandomItemTable0[1].varNum)
		elseif rand1 > 90 and rand1 < 100 then
			ItemAppendBind( varMap, x418710_var_RandomItemTable0[2].item, x418710_var_RandomItemTable0[2].varNum)
			varNumber = 2
		else
			ItemAppendBind( varMap, x418710_var_RandomItemTable0[3].item, x418710_var_RandomItemTable0[3].varNum)
			varNumber = 3		
		end
			--残破的神兵之魂
			if rand3 < 69 then
				ItemAppendBind( varMap, 11000304, 1)
			end
			--时装纹样or掌门牌碎片
			local varIndex = 1
		  local dn = 1
		  local up = 1
		  for varI, item in x418710_var_RandomItemTable1 do
		      up = up + item.varNum
		      if rseed >= dn and rseed < up then
		          varIndex = varI
		          break
		      end
		      dn = dn + item.varNum
		  end
		  if varIndex <= 3 then
		  	ItemAppendBind( varMap, x418710_var_RandomItemTable1[varIndex].item, 1)
			elseif varIndex == 4 then
				ItemAppendBind( varMap, x418710_var_RandomItemTable1[varIndex].item, 5)
		  end
		if StopItemTask( varMap, varPlayer) == 0 then
	    	Msg2Player( varMap, varPlayer, "背包已满，无法获得奖励", 8, 3)
	    	return
	  else	    		
	    		if(DelItem(varMap, varPlayer,12035261 ,1)) == 1 then
		    		local varMsg = format( "恭喜您获得了#G%d个@item_%d#cffcc00", x418710_var_RandomItemTable0[ varNumber ].varNum, x418710_var_RandomItemTable0[ varNumber ].item )
						Msg2Player( varMap, varPlayer, varMsg, 8, 3)			
						if rand3 < 68 then
							Msg2Player( varMap, varPlayer,"您意外的获得了#G1个残破的神兵之魂",8,3)
						end
						if varIndex <= 3 then
							local varMsg3 =format("恭喜您意外获得#G1个%s",x418710_var_RandomItemTable1[varIndex].varName)
							local varMsg2 = format("恭喜#R%s#cffcc00在一级皇家秘银礼包中开出#G%s",GetName( varMap, varPlayer),x418710_var_RandomItemTable1[varIndex].varName)
							Msg2Player( varMap, varPlayer, varMsg3, 8, 3)
							LuaAllScenceM2Wrold (varMap , varMsg2 , 5, 1)
						elseif varIndex == 4 then
							Msg2Player( varMap, varPlayer,"您意外的获得了#G5个黄金乱士符",8,3) 
						end	
						if rand1 == 100 then
							local varMsg1 = format("恭喜#R%s#cffcc00在一级皇家秘银礼包中开出#G70个一级皇家秘银",GetName( varMap, varPlayer))
							LuaAllScenceM2Wrold (varMap , varMsg1 , 5, 1)
						end
						DeliverItemListSendToPlayer( varMap, varPlayer)
					end
		end
end






function x418710_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418710_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418710_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418710_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418710_ProcActivateOnce( varMap, varPlayer, varImpact )


end







function x418710_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
