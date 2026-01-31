--优质地中海尖凿礼包





x418802_var_FileId 		= 418802

x418802_var_LevelMin		=	1

x418802_var_RandomItemTable0   = {																		
																		{item =11000551, varNum =50,varName ="无瑕星辰"},
																		{item =11000552, varNum =1,varName ="完美星辰"},
															                    
																}

function x418802_ProcEventEntry( varMap, varPlayer, varBagIdx )
		if GetBagSpace(varMap, varPlayer) < 2 then
			Msg2Player(varMap, varPlayer, "背包空间少于2个，请整理后再试", 0, 2)
			Msg2Player(varMap, varPlayer, "背包空间少于2个，请整理后再试", 0, 3)
			return
		end
		local rand2 =random(100)

		StartItemTask( varMap)
		local varNumber = 1
		--100%给25个无暇星辰
		ItemAppendBind( varMap, x418802_var_RandomItemTable0[1].item, x418802_var_RandomItemTable0[1].varNum)
		local broad = 0
		local wuxia = 0
		--完美星辰*1
			if rand2 <= 30 then
				ItemAppendBind( varMap, x418802_var_RandomItemTable0[2].item, 1)
				wuxia = 1	
			elseif rand2 > 30 and rand2 <= 75 then
				ItemAppendBind( varMap, x418802_var_RandomItemTable0[2].item, 2)
				wuxia = 2	
			elseif rand2 > 30 and rand2 < 75 then
				ItemAppendBind( varMap, x418802_var_RandomItemTable0[2].item, 3)
				wuxia = 3	
			elseif rand2 > 30 and rand2 < 75 then
				ItemAppendBind( varMap, x418802_var_RandomItemTable0[2].item, 5)
				wuxia = 5	
			elseif rand2 == 100 then
				ItemAppendBind( varMap, x418802_var_RandomItemTable0[2].item, 10)
				wuxia = 10
				broad =1
			end
		if StopItemTask( varMap, varPlayer) == 0 then
	    	Msg2Player( varMap, varPlayer, "背包已满，无法获得奖励", 8, 3)
	    	return
	  else	    		
	    		if(DelItem(varMap, varPlayer,12032033 ,1)) == 1 then
		    		local varMsg = format( "恭喜您获得了#G%d个@item_%d#cffcc00", 50,x418802_var_RandomItemTable0[1].item )
						Msg2Player( varMap, varPlayer, varMsg, 8, 3)			
					if 	wuxia > 0 then
						local varMsg = format( "恭喜您获得了#G%d个@item_%d#cffcc00",wuxia,x418802_var_RandomItemTable0[2].item )
						Msg2Player( varMap, varPlayer, varMsg, 8, 3)
					end	
						if broad ==1 then
							local varMsg1 = format("恭喜#R%s#cffcc00在无暇星辰礼包中开出#G10个完美星辰",GetName( varMap, varPlayer))
							LuaAllScenceM2Wrold (varMap , varMsg1 , 5, 1)
						end
						DeliverItemListSendToPlayer( varMap, varPlayer)
					end
		end
end
--local varName = GetName(varMap,varPlayer)
--				if varName == nil then
--					varName = "Errorname"
--				end
--				local varMsg1 =format(varName.."使用#{_ITEM%d}获得%d点"..iname,Useitem,varNum)
--				LuaAllScenceM2Wrold(varMap, varMsg1, CHAT_MAIN_RIGHTDOWN, 1)
--			end
--			TalkAppendString(varMap,varStr)
--			StopTalkTask(varMap)
--			DeliverTalkTips(varMap,varPlayer)
--			--DeliverItemListSendToPlayer(varMap,varPlayer)
--			AddPlayerChariotHonour(varMap, varPlayer, varNum)
--			if ( useItem == x418800_var_ItemId ) then
--				AddMoney(varMap, varPlayer, 3, 500)
--				Msg2Player(varMap,varPlayer,format("使用#{_ITEM%d}，你获得了#{_MONEY%d}金卡", Useitem, 500),4,3)	
--			end





function x418802_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418802_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418802_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418802_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418802_ProcActivateOnce( varMap, varPlayer, varImpact )




end







function x418802_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
