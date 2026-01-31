--小点数礼包





x418732_var_FileId 		= 418732

x418732_var_LevelMin		=	1
x418732_var_ItemName = "资质丹"

x418732_var_RandomItemTable0   = {																		
																		{item =6, varNum =170,varName ="帮贡"},
																		{item =5, varNum =170,varName ="荣誉"},
																		{item =4, varNum =170,varName ="声望"},																																					
																		{item =5000, varNum =170,varName ="威望"},																				
																		{item =10000, varNum =150,varName ="经验"},																		
																		{item =100, varNum =170,varName ="天赋"},
																}
x418732_var_RandomItemTable1   = {																		
																		{item =12050055,varName ="一级勇力丹"},
																		{item =12050065,varName ="一级追影丹"},
																		{item =12050075,varName ="一级心智丹"},	
																		{item =12050085,varName ="一级强身丹"},	
																}
function x418732_ProcEventEntry( varMap, varPlayer, varBagIdx )


		if GetBagSpace(varMap, varPlayer) < 1 then
			Msg2Player(varMap, varPlayer, "背包空间少于1个，请整理后再试", 0, 2)
			Msg2Player(varMap, varPlayer, "背包空间少于1个，请整理后再试", 0, 3)
			return
		end
		local playerLv =GetLevel(varMap ,varPlayer)
		local guildId = GetGuildID(varMap ,varPlayer)
		local rand = random(1,1000)
		local rand_1 = random(1,1000)
		if IsHaveQuestNM( varMap, varPlayer,1590 ) > 0 then
				local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,1590)                                                  
    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)		
		end
		while(guildId < 0 and rand <= 170 ) or (playerLv < 80 and rand > 830) or (playerLv <50 and rand >=510 and rand <680) do

			rand =random( 1, 1000)

		end
		
		local varIndex = 1
		  local dn = 1
		  local up = 1
		  for varI, item in x418732_var_RandomItemTable0 do
		      up = up + item.varNum
		      if rand >= dn and rand < up then
		          varIndex = varI
		          break
		      end
		      dn = dn + item.varNum
		  end
		  
		  if(DelItem(varMap, varPlayer,12500330 ,1)) == 1 then	
		  	--帮贡 
			  if varIndex == 1 then
			  	AddGuildUserPoint(varMap, varPlayer, 100)
			  	Msg2Player( varMap, varPlayer, format("恭喜您获得100点#G%s#cffcc00",x418732_var_RandomItemTable0[varIndex].varName), 8, 3)
			 
			  --荣誉
			  elseif varIndex ==2 then
			  	AddHonor(varMap, varPlayer, 200)
			  	Msg2Player( varMap, varPlayer, format("恭喜您获得200点#G%s#cffcc00",x418732_var_RandomItemTable0[varIndex].varName), 8, 3)
			   --声望
			  elseif varIndex ==3 then
			  	local varShengWang = GetShengWang( varMap, varPlayer )
					varShengWang = varShengWang + 2000
					SetShengWang( varMap, varPlayer, varShengWang )
			  	Msg2Player( varMap, varPlayer, format("恭喜您获得2000点#G%s#cffcc00",x418732_var_RandomItemTable0[varIndex].varName), 8, 3)
			  --威望
			  elseif varIndex == 4 then 
			  	local value = GetPlayerGoodBadValue(varMap, varPlayer)
					value = value + x418732_var_RandomItemTable0[varIndex].item
					SetPlayerGoodBadValue(varMap, varPlayer, value)
					Msg2Player( varMap, varPlayer, format("恭喜您获得%d点#G%s#cffcc00",x418732_var_RandomItemTable0[varIndex].item,x418732_var_RandomItemTable0[varIndex].varName), 8, 3)			
				--经验
				elseif varIndex == 5 then
					local exp = x418732_var_RandomItemTable0[varIndex].item * playerLv
					AddExp(varMap, varPlayer,exp)
					Msg2Player( varMap, varPlayer, format("恭喜您获得%d点#G%s#cffcc00",exp,x418732_var_RandomItemTable0[varIndex].varName), 8, 3)
				--天赋
			  elseif varIndex == 6 then
					 local refixtf = AddInherenceExp(varMap,varPlayer, 100)
					Msg2Player( varMap, varPlayer, format("恭喜您获得%d点#G%s#cffcc00",refixtf,x418732_var_RandomItemTable0[varIndex].varName), 8, 3)
			  end
				GamePlayScriptLog( varMap, varPlayer, 3778)
			  --资质丹	
		  	if rand_1 == 438 then
					StartItemTask( varMap)
					local rand1 =random(1,4)
					ItemAppend( varMap, x418732_var_RandomItemTable1[rand1].item, 1)
					if StopItemTask( varMap, varPlayer) == 0 then
			    	Msg2Player( varMap, varPlayer, "背包已满，无法获得奖励", 8, 3)
			    	return
			 		else	    				  		
							DeliverItemListSendToPlayer( varMap, varPlayer)
							Msg2Player( varMap, varPlayer, format("恭喜您获得1个#G%s#cffcc00",x418732_var_RandomItemTable1[rand1].varName), 8, 3)
							LuaAllScenceM2Wrold (varMap ,format("恭喜#R%s#cffcc00开启天资聪慧礼包获得#G%s",GetName( varMap, varPlayer) ,x418732_var_RandomItemTable1[rand1].varName), 5, 1)
							GamePlayScriptLog( varMap, varPlayer, 3779)
					end
				end
		 	end
		  	

		
end






function x418732_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
end






function x418732_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x418732_ProcConditionCheck( varMap, varPlayer )
	
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end







function x418732_ProcDeplete( varMap, varPlayer )
	
	
	
	
	
	
	
	return 1;
end








function x418732_ProcActivateOnce( varMap, varPlayer, varImpact )


end







function x418732_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
