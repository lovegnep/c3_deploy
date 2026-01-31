

x540114_var_GrowpointId = 614 

x540114_var_AbilitySkillName = "捕捉" 
x540114_var_AbilitySkillType = 13 
x540114_var_AbilitySkillLevel = 5 

x540114_var_AddSkillLimit = 1 
x540114_var_SkillLMax_1 =150 
x540114_var_SkillLMax_2 =200 
x540114_var_SkillLMax_3 =250 
x540114_var_SkillLMax_4 =300	
x540114_var_SkillLMax_5 =350 
x540114_var_SkillLMax_6 =400 
x540114_var_SkillLMax_7 =450 
x540114_var_SkillLMax_8 =500 
x540114_var_SkillLMax = 0 

x540114_var_CostVigorLow = 4		
x540114_var_CostVigorHigh = 5   
x540114_var_CostVigor = 0       

x540114_var_ItemNumLow = 2
x540114_var_ItemNumHigh = 4
x540114_var_ItemNumOver = 6
x540114_var_ItemNum = 0  

x540114_var_ItemIndex = 11030403 
x540114_var_ItemName = "吸血蝙蝠" 	
x540114_var_DoubleItemLow = 700 
x540114_var_DoubleItemHigh = 800 

x540114_var_SpecialItemSkillLevel = 5   
x540114_var_SpecialItemLowPencent = 5 
x540114_var_SpecialItemHighPencent = 7 
x540114_var_SpecialItemIndex = 11030405 
x540114_var_SpecialItemName = "七步蛇"  
x540114_var_SpecialItemNum = 0 






function 	x540114_ProcGpCreate(varMap,growPointType,varX,varY)
	local varBoxId = ItemBoxEnterScene(varX, varY, x540114_var_GrowpointId, varMap, 0, x540114_var_ItemIndex)
end




function	 x540114_ProcGpOpen(varMap,varPlayer,varTalknpc)
	

	local SkillLevel = QueryPlayerAbilityLevel(varMap,varPlayer ,x540114_var_AbilitySkillType)
	local SkillBaseLimit= GetAbilityExp(varMap, varPlayer, x540114_var_AbilitySkillType)
	local SkillLimit = SkillBaseLimit + QueryItemAffAbility(varMap,varPlayer)
	if SkillLevel == nil then
		TipsToPlayer(varMap,varPlayer,"#Y你还没有学习#R"..x540114_var_AbilitySkillName)
	else
		if SkillLevel <= 0 then
			TipsToPlayer(varMap,varPlayer,"#Y你还没有学习#R"..x540114_var_AbilitySkillName)
		else
			if SkillLevel >= x540114_var_AbilitySkillLevel then
				if SkillLevel == x540114_var_AbilitySkillLevel then
					x540114_var_CostVigor = x540114_var_CostVigorLow
				else
					x540114_var_CostVigor = x540114_var_CostVigorHigh
				end
				if GetPlayerVigor(varMap,varPlayer) >=x540114_var_CostVigor then
					return 0
				else
					TipsToPlayer(varMap,varPlayer,"#Y活力不足")
				end
			else
				TipsToPlayer(varMap,varPlayer,"#Y"..x540114_var_AbilitySkillName.." 等级不足#R"..x540114_var_AbilitySkillLevel.."级")
			end
		end
	end
	return 1
end





function	 x540114_ProcGpRecycle(varMap,varPlayer,varTalknpc)
   	local SkillLevel = QueryPlayerAbilityLevel(varMap,varPlayer ,x540114_var_AbilitySkillType)
	local SkillBaseLimit= GetAbilityExp(varMap, varPlayer, x540114_var_AbilitySkillType)
	local SkillLimit = SkillBaseLimit + QueryItemAffAbility(varMap,varPlayer)
	if SkillLevel == nil then
		TipsToPlayer(varMap,varPlayer,"#Y你还没有学习#R"..x540114_var_AbilitySkillName)
	else
		if SkillLevel <= 0 then
			TipsToPlayer(varMap,varPlayer,"#Y你还没有学习#R"..x540114_var_AbilitySkillName)
		else
			if SkillLevel >= x540114_var_AbilitySkillLevel then
				local NowVigor = GetPlayerVigor(varMap,varPlayer)
				if SkillLevel == x540114_var_AbilitySkillLevel then
					x540114_var_CostVigor = x540114_var_CostVigorLow
				else
					x540114_var_CostVigor = x540114_var_CostVigorHigh
				end
				if NowVigor >= x540114_var_CostVigor then
					StartItemTask( varMap )
						if SkillLevel >= x540114_var_AbilitySkillLevel + 2 then
							x540114_var_ItemNum = x540114_var_ItemNumOver 
						elseif SkillLevel >= x540114_var_AbilitySkillLevel + 1 then
							local varX =random(1,x540114_var_DoubleItemHigh)
							if varX <=  SkillLimit then
								varX = 1
							else
								varX = 0
							end
							x540114_var_ItemNum = x540114_var_ItemNumHigh + varX 
						else
							local varX =random(1,x540114_var_DoubleItemLow)
							if varX <=  SkillLimit then
								varX = 1
							else
								varX = 0
							end
							x540114_var_ItemNum =x540114_var_ItemNumLow + varX 
						end
						ItemAppend( varMap, x540114_var_ItemIndex, x540114_var_ItemNum)
						if  SkillLevel == x540114_var_SpecialItemSkillLevel and x540114_var_SpecialItemSkillLevel > 0 then
							if random(1,100) <= x540114_var_SpecialItemLowPencent and x540114_var_SpecialItemIndex > 0 then
								x540114_var_SpecialItemNum = 1
								ItemAppend( varMap, x540114_var_SpecialItemIndex, x540114_var_SpecialItemNum )	
							else
								x540114_var_SpecialItemNum = 0
							end
						elseif SkillLevel > x540114_var_SpecialItemSkillLevel and x540114_var_SpecialItemSkillLevel > 0 then
							if random(1,100) <= x540114_var_SpecialItemHighPencent and x540114_var_SpecialItemIndex > 0 then
								x540114_var_SpecialItemNum = 1
								ItemAppend( varMap, x540114_var_SpecialItemIndex, x540114_var_SpecialItemNum )	
							else
								x540114_var_SpecialItemNum = 0
							end
						else	
							x540114_var_SpecialItemNum = 0
						end
					if SkillLevel == 1 then 
						x540114_var_SkillLMax = x540114_var_SkillLMax_1
					elseif SkillLevel == 2 then 
						x540114_var_SkillLMax = x540114_var_SkillLMax_2
					elseif SkillLevel == 3 then 
						x540114_var_SkillLMax = x540114_var_SkillLMax_3
					elseif SkillLevel == 4 then 
						x540114_var_SkillLMax = x540114_var_SkillLMax_4
					elseif SkillLevel == 5 then 
						x540114_var_SkillLMax = x540114_var_SkillLMax_5
					elseif SkillLevel == 6 then 
						x540114_var_SkillLMax = x540114_var_SkillLMax_6
					elseif SkillLevel == 7 then 
						x540114_var_SkillLMax = x540114_var_SkillLMax_7
					elseif SkillLevel == 8 then 
						x540114_var_SkillLMax = x540114_var_SkillLMax_8
					end
					local varRet = StopItemTask( varMap, varPlayer )
					if varRet > 0 then
						DeliverItemListSendToPlayer(varMap,varPlayer)
						if x540114_var_SpecialItemIndex > 0 and x540114_var_SpecialItemNum > 0 then
							TipsToPlayer (varMap,varPlayer,"#Y获得#G"..x540114_var_ItemNum.."个#Y"..x540114_var_ItemName.."和#G"..x540114_var_SpecialItemNum.."个#Y"..x540114_var_SpecialItemName)
						else
							TipsToPlayer (varMap,varPlayer,"#Y获得#G"..x540114_var_ItemNum.."个#Y"..x540114_var_ItemName)
						end
						TipsToPlayer (varMap,varPlayer,"#Y消耗#G"..x540114_var_CostVigor.."点#Y活力")
						if SkillLevel < x540114_var_AbilitySkillLevel + 2 then
							if SkillLevel > 8 then 
								SetAbilityExp(varMap,varPlayer,x540114_var_AbilitySkillType,SkillBaseLimit + x540114_var_AddSkillLimit)
								TipsToPlayer (varMap,varPlayer,"#Y"..x540114_var_AbilitySkillName.."获得#G"..x540114_var_AddSkillLimit.."点#Y熟练度")
							elseif SkillLevel > 0 and SkillLevel <= 8 then
								if SkillBaseLimit + x540114_var_AddSkillLimit <= x540114_var_SkillLMax then 
									SetAbilityExp(varMap,varPlayer,x540114_var_AbilitySkillType,SkillBaseLimit + x540114_var_AddSkillLimit)
									TipsToPlayer (varMap,varPlayer,"#Y"..x540114_var_AbilitySkillName.."获得#G"..x540114_var_AddSkillLimit.."点#Y熟练度")
								elseif SkillBaseLimit + x540114_var_AddSkillLimit > x540114_var_SkillLMax and SkillBaseLimit < x540114_var_SkillLMax then
									SetAbilityExp(varMap,varPlayer,x540114_var_AbilitySkillType,x540114_var_SkillLMax)
									TipsToPlayer (varMap,varPlayer,"#Y"..x540114_var_AbilitySkillName.."获得#G"..x540114_var_SkillLMax-SkillBaseLimit.."点#Y熟练度")
								else
									TipsToPlayer (varMap,varPlayer,"熟练度已达上限")
								end
							end
						end
						SetPlayerVigor(varMap,varPlayer, NowVigor - x540114_var_CostVigor)
						return 1
					else
						StartItemTask( varMap )
						if SkillLevel >= x540114_var_AbilitySkillLevel + 2 then
							x540114_var_ItemNum = x540114_var_ItemNumOver 
						elseif SkillLevel >= x540114_var_AbilitySkillLevel + 1 then
							local varX =random(1,x540114_var_DoubleItemHigh)
							if varX <=  SkillLimit then
								varX = 1
							else
								varX = 0
							end
							x540114_var_ItemNum = x540114_var_ItemNumHigh + varX 
						else
							local varX =random(1,x540114_var_DoubleItemLow)
							if varX <=  SkillLimit then
								varX = 1
							else
								varX = 0
							end
							x540114_var_ItemNum =x540114_var_ItemNumLow + varX 
						end
						ItemAppend( varMap, x540114_var_ItemIndex, x540114_var_ItemNum)
						local varRet = StopItemTask( varMap, varPlayer )
						if varRet > 0 then
							DeliverItemListSendToPlayer(varMap,varPlayer)
							TipsToPlayer (varMap,varPlayer,"#Y获得#G"..x540114_var_ItemNum.."个#Y"..x540114_var_ItemName)
							TipsToPlayer (varMap,varPlayer,"由于背包空间已满,没有得到额外附加物品")
							TipsToPlayer (varMap,varPlayer,"#Y消耗#G"..x540114_var_CostVigor.."点#Y活力")
							if SkillLevel < x540114_var_AbilitySkillLevel + 2 then
								if SkillLevel > 8 then 
									SetAbilityExp(varMap,varPlayer,x540114_var_AbilitySkillType,SkillBaseLimit + x540114_var_AddSkillLimit)
									TipsToPlayer (varMap,varPlayer,"#Y"..x540114_var_AbilitySkillName.."获得#G"..x540114_var_AddSkillLimit.."点#Y熟练度")
								elseif SkillLevel > 0 and SkillLevel <= 8 then
									if SkillBaseLimit + x540114_var_AddSkillLimit <= x540114_var_SkillLMax then 
										SetAbilityExp(varMap,varPlayer,x540114_var_AbilitySkillType,SkillBaseLimit + x540114_var_AddSkillLimit)
										TipsToPlayer (varMap,varPlayer,"#Y"..x540114_var_AbilitySkillName.."获得#G"..x540114_var_AddSkillLimit.."点#Y熟练度")
									elseif SkillBaseLimit + x540114_var_AddSkillLimit > x540114_var_SkillLMax and SkillBaseLimit < x540114_var_SkillLMax then
										SetAbilityExp(varMap,varPlayer,x540114_var_AbilitySkillType,x540114_var_SkillLMax)
										TipsToPlayer (varMap,varPlayer,"#Y"..x540114_var_AbilitySkillName.."获得#G"..x540114_var_SkillLMax-SkillBaseLimit.."点#Y熟练度")
									else
										TipsToPlayer (varMap,varPlayer,"熟练度已达上限")
									end
								end
							end
							SetPlayerVigor(varMap,varPlayer, NowVigor - x540114_var_CostVigor)
							return 1
						else					
							StartTalkTask(varMap)
								TalkAppendString(varMap,"#y背包空间不足，无法得到采集物品！")
							StopTalkTask(varMap)
							DeliverTalkTips(varMap,varPlayer)
						end
					end
				else
					TipsToPlayer(varMap,varPlayer,"#Y活力不足")
				end
			else
				TipsToPlayer(varMap,varPlayer,"#Y"..x540114_var_AbilitySkillName.." 等级不足#R"..x540114_var_AbilitySkillLevel.."级")
			end
		end
	end
	return 0       	               
end





function	x540114_ProcGpProcOver(varMap,varPlayer,varTalknpc)

end



function  TipsToPlayer (varMap,varPlayer,varStr)
	StartTalkTask(varMap)
		TalkAppendString(varMap,varStr)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
end
