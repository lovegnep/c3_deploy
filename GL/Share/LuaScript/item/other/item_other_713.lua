--大点数礼包





x418713_var_FileId 		= 418713

x418713_var_LevelMin		=	1
x418713_var_ItemName = "黄金乱世符"
x418713_var_ItemId = 11970023

function x418713_ProcEventEntry( varMap, varPlayer, varBagIdx )


		if GetBagSpace(varMap, varPlayer) < 1 then
			Msg2Player(varMap, varPlayer, "背包空间少于1个，请整理后再试", 0, 2)
			Msg2Player(varMap, varPlayer, "背包空间少于1个，请整理后再试", 0, 3)
			return
		end
		local rand1 =random( 1, 6)
		local rand2 =random( 1, 6)
		local rand3 =random( 1, 6)
		StartItemTask( varMap)
		local varNumber = rand1 + rand2 + rand3
		local varMark = 0
	-- 豹子
		if rand1 == rand2 and rand2 ==rand3  then 
				ItemAppendBind( varMap, x418713_var_ItemId, 10)
				varMark =3
	--小点数	
		elseif varNumber < 11 then
				ItemAppendBind( varMap, x418713_var_ItemId, 1)
				varMark =2
	--大点数
		elseif varNumber > 10 then
				ItemAppendBind( varMap, x418713_var_ItemId, 4)
				varMark =1
		end

		if StopItemTask( varMap, varPlayer) == 0 then
	    	Msg2Player( varMap, varPlayer, "背包已满，无法获得奖励", 8, 3)
	    	return
	  else	    		
	  		if(DelItem(varMap, varPlayer,12035264 ,1)) == 1 then	
					if varMark == 1 then
						Msg2Player( varMap, varPlayer,format( "开出点数:#G%d#cffcc00、#G%d#cffcc00、#G%d#cffcc00，点数之和为#R大#cffcc00", rand1,rand2,rand3),8,3)
						Msg2Player( varMap, varPlayer,format( "奖励您4个#G黄金乱士符"),8,3)
					elseif varMark == 2 then
						Msg2Player( varMap, varPlayer, format( "开出点数:#G%d#cffcc00、#G%d#cffcc00、#G%d#cffcc00，点数之和为#R小#cffcc00", rand1,rand2,rand3), 8, 3)						
						Msg2Player( varMap, varPlayer,format( "奖励您1个#G黄金乱士符"),8,3)
					elseif varMark == 3 then
						Msg2Player( varMap, varPlayer,format( "开出点数:#G%d#cffcc00、#G%d#cffcc00、#G%d#cffcc00，开出相同点数#cffcc00", rand1,rand2,rand3),8,3) 
						Msg2Player( varMap, varPlayer,format( "恭喜您获得10个#G黄金乱士符"),8,3)
						LuaAllScenceM2Wrold (varMap ,format("恭喜#R%s#cffcc00在乱士之魂礼包获得#G10个黄金乱士符",GetName( varMap, varPlayer)) , 5, 1)
					end	
					DeliverItemListSendToPlayer( varMap, varPlayer)
				end
		end
end






function x418713_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418713_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418713_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418713_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418713_ProcActivateOnce( varMap, varPlayer, varImpact )


end







function x418713_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
