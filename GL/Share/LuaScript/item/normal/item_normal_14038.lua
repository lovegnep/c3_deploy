





x414038_var_FileId 		= 414038 

x414038_var_LevelMin		=	20






function x414038_ProcEventEntry( varMap, varPlayer, varBagIdx )

end






function x414038_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x414038_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x414038_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x414038_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x414038_ProcActivateOnce( varMap, varPlayer, varImpact )
	
	
	if GetLevel(varMap, varPlayer)< x414038_var_LevelMin then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"等级不足20级，无法使用此道具")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return
	end
	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)	
	local itemInBag = GetItemIDByIndexInBag(varMap, varPlayer, varBagIdx)
	--冠军大礼包
	if itemInBag ==12030147 then 
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			GamePlayScriptLog(varMap, varPlayer, 2515)
			local r47 = random( 1, 5 ) 
			if r47 ==1 then
				if GetGuildID(varMap, varPlayer) == -1 then
					r47 = random( 2, 5 )
				else
					local nValue = 1000
					AddGuildUserPoint(varMap, varPlayer, nValue)	
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,2)
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,3)
				end	
			end	
			if r47 ==2 then
				local nMoney = 250*1000
				AddMoney(varMap, varPlayer, 0, nMoney)
				local varStr = format("获得了#{_MONEY%d}现银的奖励。", nMoney)
				Msg2Player(varMap,varPlayer,varStr,8,2)
				Msg2Player(varMap,varPlayer,varStr,8,3)
			elseif r47 ==3 then	
				local nValue = 7000
				local varShengWang = GetShengWang( varMap, varPlayer )
				varShengWang = varShengWang + nValue
				SetShengWang( varMap, varPlayer, varShengWang )
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,2)				
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,3)		
			elseif r47 ==4 then	
				local varExpBonus = 3500000
				AddExp(varMap, varPlayer, varExpBonus)
				Msg2Player(varMap,varPlayer,"#o获得#R经验"..varExpBonus.."点#o的奖励",8,2)
				Msg2Player(varMap,varPlayer,"#o获得#R经验"..varExpBonus.."点#o的奖励",8,3)
			elseif r47 ==5 then		
				local nValue = 2500
				AddHonor(varMap, varPlayer, nValue)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,2)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,3)
			end	
			if GetLevel(varMap, varPlayer) >= 90 then
				local exitem = {11000839,11000843,11000842,11000845}
				local rex =random(1,4)
				StartItemTask( varMap )
				ItemAppendBind( varMap, exitem[rex], 1 )	
				local varRet = StopItemTask( varMap, varPlayer )
				if varRet > 0 then
						DeliverItemListSendToPlayer(varMap,varPlayer) 	
						local str =format("获得了1个@item_%d",exitem[rex])
						Msg2Player(varMap,varPlayer,str,8,2)				
						Msg2Player(varMap,varPlayer,str,8,3)		
				else
					return
				end
			end				
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end		

		
		
		
	elseif itemInBag ==12030148 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			GamePlayScriptLog(varMap, varPlayer, 2516)
			local r48 = random( 1, 5 ) 
			if r48 ==1 then
				if GetGuildID(varMap, varPlayer) == -1 then
					r48 = random( 2, 5 )
				else
					local nValue = 100
					AddGuildUserPoint(varMap, varPlayer, nValue)	
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,2)
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,3)
				end
			end		
			if r48 ==2 then
				local nPVP2V2Mark = 100
				AddPVP2V2Mark(varMap, varPlayer, nPVP2V2Mark)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,2)
			elseif r48 ==3 then	
				local nValue = 100
				local varShengWang = GetShengWang( varMap, varPlayer )
				varShengWang = varShengWang + nValue
				SetShengWang( varMap, varPlayer, varShengWang )
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,2)				
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,3)		
			elseif r48 ==4 then	
				local value = GetPlayerGoodBadValue(varMap, varPlayer)
				value = value + 100
				SetPlayerGoodBadValue(varMap, varPlayer, value)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", 100),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", 100),4,2)
			elseif r48 ==5 then		
				local nValue = 100
				AddHonor(varMap, varPlayer, nValue)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,2)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,3)
			end	
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
		
	elseif itemInBag ==12030149 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			GamePlayScriptLog(varMap, varPlayer, 2516)		
			local exitem = {12041101,11990050,12030016,11990110,12041108,12030258,11990011}
			
				local r49 =random(1,100)
				local rex =nil
				if r49 <= 50 then
					rex =5
				elseif r49 <=80 then
					rex =6
				elseif r49 <=84 then
					rex =1
				elseif r49 <=88 then
					rex =2
				elseif r49 <=92 then
					rex =3
				elseif r49 <=96 then
					rex =4
				elseif r49 <=100 then
					rex =7
				end																					
				StartItemTask( varMap )
				ItemAppendBind( varMap, exitem[rex], 1 )	
				local varRet = StopItemTask( varMap, varPlayer )
				if varRet > 0 then
						DeliverItemListSendToPlayer(varMap,varPlayer) 	
						local str =format("获得了1个@item_%d",exitem[rex])
						Msg2Player(varMap,varPlayer,str,8,2)				
						Msg2Player(varMap,varPlayer,str,8,3)		
				else
					return
				end
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end	
		
	elseif itemInBag ==12030150 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			GamePlayScriptLog(varMap, varPlayer, 2516)
			local level =GetLevel(varMap, varPlayer)
			local r48 = random( 1, 5 ) 
			if r48 ==1 then
				if GetGuildID(varMap, varPlayer) == -1 then
					r48 = random( 2, 5 )
				else
					local nValue = level
					AddGuildUserPoint(varMap, varPlayer, nValue)	
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,2)
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,3)
				end
			end		
			if r48 ==2 then
				local nPVP2V2Mark = level
				AddPVP2V2Mark(varMap, varPlayer, nPVP2V2Mark)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,2)
			elseif r48 ==3 then	
				local nValue = level
				local varShengWang = GetShengWang( varMap, varPlayer )
				varShengWang = varShengWang + nValue
				SetShengWang( varMap, varPlayer, varShengWang )
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,2)				
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,3)		
			elseif r48 ==4 then	
				local value = GetPlayerGoodBadValue(varMap, varPlayer)
				value = value + level
				SetPlayerGoodBadValue(varMap, varPlayer, value)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", 100),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", 100),4,2)
			elseif r48 ==5 then		
				local nValue = level
				AddHonor(varMap, varPlayer, nValue)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,2)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,3)
			end	
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
		elseif itemInBag ==12030151 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			GamePlayScriptLog(varMap, varPlayer, 2516)
			local level =GetLevel(varMap, varPlayer)
			local r48 = random( 1, 5 ) 
			if r48 ==1 then
				if GetGuildID(varMap, varPlayer) == -1 then
					r48 = random( 2, 5 )
				else
					local nValue = level*10
					AddGuildUserPoint(varMap, varPlayer, nValue)	
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,2)
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,3)
				end
			end		
			if r48 ==2 then
				local nPVP2V2Mark = level*10
				AddPVP2V2Mark(varMap, varPlayer, nPVP2V2Mark)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,2)
			elseif r48 ==3 then	
				local nValue = level*10
				local varShengWang = GetShengWang( varMap, varPlayer )
				varShengWang = varShengWang + nValue
				SetShengWang( varMap, varPlayer, varShengWang )
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,2)				
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,3)		
			elseif r48 ==4 then	
				local value = GetPlayerGoodBadValue(varMap, varPlayer)
				value = value + level*10
				SetPlayerGoodBadValue(varMap, varPlayer, value)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", level*10),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", level*10),4,2)
			elseif r48 ==5 then		
				local nValue = level*10
				AddHonor(varMap, varPlayer, nValue)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,2)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,3)
			end	
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
			elseif itemInBag ==12030152 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			GamePlayScriptLog(varMap, varPlayer, 2516)
			local level =GetLevel(varMap, varPlayer)
			local r48 = random( 1, 5 ) 
			if r48 ==1 then
				if GetGuildID(varMap, varPlayer) == -1 then
					r48 = random( 2, 5 )
				else
					local nValue = level*15
					AddGuildUserPoint(varMap, varPlayer, nValue)	
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,2)
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,3)
				end
			end		
			if r48 ==2 then
				local nPVP2V2Mark = level*15
				AddPVP2V2Mark(varMap, varPlayer, nPVP2V2Mark)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,2)
			elseif r48 ==3 then	
				local nValue = level*15
				local varShengWang = GetShengWang( varMap, varPlayer )
				varShengWang = varShengWang + nValue
				SetShengWang( varMap, varPlayer, varShengWang )
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,2)				
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,3)		
			elseif r48 ==4 then	
				local value = GetPlayerGoodBadValue(varMap, varPlayer)
				value = value + level*15
				SetPlayerGoodBadValue(varMap, varPlayer, value)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", level*15),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", level*15),4,2)
			elseif r48 ==5 then		
				local nValue = level*15
				AddHonor(varMap, varPlayer, nValue)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,2)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,3)
			end	
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
			elseif itemInBag ==12030153 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			GamePlayScriptLog(varMap, varPlayer, 2516)
			local level =GetLevel(varMap, varPlayer)
			local r48 = random( 1, 5 ) 
			if r48 ==1 then
				if GetGuildID(varMap, varPlayer) == -1 then
					r48 = random( 2, 5 )
				else
					local nValue = level*20
					AddGuildUserPoint(varMap, varPlayer, nValue)	
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,2)
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,3)
				end
			end		
			if r48 ==2 then
				local nPVP2V2Mark = level*20
				AddPVP2V2Mark(varMap, varPlayer, nPVP2V2Mark)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,2)
			elseif r48 ==3 then	
				local nValue = level*20
				local varShengWang = GetShengWang( varMap, varPlayer )
				varShengWang = varShengWang + nValue
				SetShengWang( varMap, varPlayer, varShengWang )
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,2)				
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,3)		
			elseif r48 ==4 then	
				local value = GetPlayerGoodBadValue(varMap, varPlayer)
				value = value + level*20
				SetPlayerGoodBadValue(varMap, varPlayer, value)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", level*20),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", level*20),4,2)
			elseif r48 ==5 then		
				local nValue = level*20
				AddHonor(varMap, varPlayer, nValue)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,2)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,3)
			end	
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
			elseif itemInBag ==12030154 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			GamePlayScriptLog(varMap, varPlayer, 2516)
			local level =GetLevel(varMap, varPlayer)
			local r48 = random( 1, 5 ) 
			if r48 ==1 then
				if GetGuildID(varMap, varPlayer) == -1 then
					r48 = random( 2, 5 )
				else
					local nValue = level*25
					AddGuildUserPoint(varMap, varPlayer, nValue)	
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,2)
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,3)
				end
			end		
			if r48 ==2 then
				local nPVP2V2Mark = level*25
				AddPVP2V2Mark(varMap, varPlayer, nPVP2V2Mark)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,2)
			elseif r48 ==3 then	
				local nValue = level*25
				local varShengWang = GetShengWang( varMap, varPlayer )
				varShengWang = varShengWang + nValue
				SetShengWang( varMap, varPlayer, varShengWang )
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,2)				
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,3)		
			elseif r48 ==4 then	
				local value = GetPlayerGoodBadValue(varMap, varPlayer)
				value = value + level*25
				SetPlayerGoodBadValue(varMap, varPlayer, value)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", level*25),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", level*25),4,2)
			elseif r48 ==5 then		
				local nValue = level*25
				AddHonor(varMap, varPlayer, nValue)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,2)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,3)
			end	
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		
			elseif itemInBag ==12030155 then
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			GamePlayScriptLog(varMap, varPlayer, 2516)
			local level =GetLevel(varMap, varPlayer)
			local r48 = random( 1, 5 ) 
			if r48 ==1 then
				if GetGuildID(varMap, varPlayer) == -1 then
					r48 = random( 2, 5 )
				else
					local nValue = level*30
					AddGuildUserPoint(varMap, varPlayer, nValue)	
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,2)
					Msg2Player(varMap,varPlayer,"#o获得#R帮贡"..nValue.."点#o的奖励",8,3)
				end
			end		
			if r48 ==2 then
				local nPVP2V2Mark = level*30
				AddPVP2V2Mark(varMap, varPlayer, nPVP2V2Mark)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R战场积分%d#o的奖励", nPVP2V2Mark),4,2)
			elseif r48 ==3 then	
				local nValue = level*30
				local varShengWang = GetShengWang( varMap, varPlayer )
				varShengWang = varShengWang + nValue
				SetShengWang( varMap, varPlayer, varShengWang )
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,2)				
				Msg2Player(varMap,varPlayer,"#o获得#R声望"..nValue.."点#o的奖励",8,3)		
			elseif r48 ==4 then	
				local value = GetPlayerGoodBadValue(varMap, varPlayer)
				value = value + level*30
				SetPlayerGoodBadValue(varMap, varPlayer, value)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", level*30),4,3)
				Msg2Player(varMap,varPlayer,format("获得#R威望%d点#o的奖励", level*30),4,2)
			elseif r48 ==5 then		
				local nValue = level*30
				AddHonor(varMap, varPlayer, nValue)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,2)
				Msg2Player(varMap,varPlayer,"#o获得#R荣誉"..nValue.."点#o的奖励",8,3)
			end	
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end	
		
	end	
end







function x414038_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
