
x310227_var_GameId = 1102  
x310227_var_Xinbing_FileId			=	310227
x310227_var_RandomItemTable0   = {
                               { varItem = 1, 			 probability = 706136 , itemName = "经验",varNum = 2, varhorn =0}, 
                               { varItem = 5000, 		 probability = 20000 , itemName = "银卡" ,varNum = 3, varhorn =0}, 
                               { varItem = 12030094, probability = 10000 , itemName = "金砂" ,varNum = 1, varhorn =0}, 
                               { varItem = 12031002, probability = 20000 , itemName = "卡牌",varNum = 4, varhorn =0}, 
                               { varItem = 12031002, probability = 20000 , itemName = "五彩缤纷",varNum = 1 , varhorn =0}, 
                               { varItem = 11990117, probability = 20000 , itemName = "嘉年华娱乐币",varNum = 1, varhorn =0  }, 
                               { varItem = 11970021, probability = 5000 , itemName = "乱士符",varNum = 1, varhorn =0  }, 
                               { varItem = 11990011, probability = 3000 , itemName = "三番令",varNum = 1, varhorn =0  }, 
                               { varItem = 12035252, probability = 8000 , itemName = "魔君附身石",varNum = 1, varhorn =0  }, 
                               { varItem = 11000306, probability = 20 , itemName = "烈焱碎片",varNum = 1, varhorn =1  }, 
                               { varItem = 11970023, probability = 100 , itemName = "黄金乱士符" ,varNum = 1, varhorn =1 }, 
                               { varItem = 12030047, probability = 200 , itemName = "金砖" ,varNum = 1, varhorn =1 }, 
                               { varItem = 12030511, probability = 1 , itemName = "掌门牌碰碰胡（7天）礼包",varNum = 1, varhorn =1  }, 
                               { varItem = 12030018, probability = 1000 , itemName = "蒙面巾",varNum = 1, varhorn =0  }, 
                               { varItem = 12054300, probability = 5000 , itemName = "还童书",varNum = 1, varhorn =0  },
                               { varItem = 12030504, probability = 1 , itemName = "熊猫降世符礼包",varNum = 1, varhorn =1  },
                               { varItem = 12030016, probability = 500 , itemName = "队伍召集令",varNum = 1, varhorn =0  }, 
                               { varItem = 12030503, probability = 1 , itemName = "掌门牌：平胡（7天）礼包",varNum = 1, varhorn =1  }, 
                               { varItem = 12030512, probability = 1 , itemName = "掌门牌:清一色(7天) 礼包",varNum = 1, varhorn =1  }, 
                               { varItem = 12041109, probability = 500 , itemName = "混元丹",varNum = 1, varhorn =0  }, 
                               { varItem = 11000304, probability = 20 , itemName = "残破的神兵之魂" ,varNum = 1, varhorn =1 }, 
                               { varItem = 12030240, probability = 10 , itemName = "节日时装(14天)礼包" ,varNum = 1, varhorn =1 }, 
                               { varItem = 10217200, probability = 10 , itemName = "节日徽章(14天)",varNum = 1, varhorn =1  }, 
                               { varItem = 11000902, probability = 4000 , itemName = "高级洗石剂",varNum = 1, varhorn =0  }, 
                               { varItem = 12030201, probability = 10000 , itemName = "修理石",varNum = 1, varhorn =0  }, 
                               { varItem = 12030213, probability = 10000 , itemName = "强效极乐草",varNum = 1, varhorn =0  },
                               { varItem = 11010001, probability = 5000 , itemName = "一级皇家秘银",varNum = 1, varhorn =0  }, 
                               { varItem = 12041090, probability = 5000 , itemName = "免伤神水",varNum = 1, varhorn =0  }, 
                               { varItem = 12041091, probability = 5000 , itemName = "极速神水",varNum = 1, varhorn =0  }, 
                               { varItem = 12041092, probability = 5000 , itemName = "暴击神水" ,varNum = 1, varhorn =0 }, 
                               { varItem = 12041093, probability = 5000 , itemName = "命中神水" ,varNum = 1, varhorn =0 }, 
                               { varItem = 12041094, probability = 5000 , itemName = "无敌神水",varNum = 1, varhorn =0  }, 
                               { varItem = 12250008, probability = 6000 , itemName = "回城卷轴",varNum = 1, varhorn =0  }, 
                               { varItem = 12250009, probability = 500 , itemName = "随机卷轴",varNum = 1, varhorn =0  }, 
                               { varItem = 11000501, probability = 5000 , itemName = "紫檀木炭",varNum = 1, varhorn =0  },
                               { varItem = 12110206, probability = 10000 , itemName = "钟情一生",varNum = 1, varhorn =0  }, 
                               { varItem = 11990100, probability = 5000 , itemName = "混沌之星",varNum = 1, varhorn =0  }, 
                               { varItem = 2, 			probability = 100000 , itemName = "经验",varNum = 2, varhorn =0  },  
                                 }	
x310227_var_levelupexp ={
													10,
													45,
													140,
													325,
													630,
													1085,
													1720,
													2565,
													3650,
													5005,
													6660,
													8645,
													10990,
													13725,
													16880,
													20485,
													24570,
													29165,
													34300,
													68956,
													95810,
													120000,
													150579,
													187824,
													201192,
													222841,
													259924,
													302592,
													310990,
													1251143,
													1320651,
													1390160,
													1469597,
													1539105,
													1618543,
													1697980,
													1777418,
													1856856,
													3813009,
													4855871,
													5085377,
													5302804,
													5544390,
													5785976,
													6039640,
													6293305,
													6559050,
													6824794,
													13939491,
													11446321,
												}
x310227_var_RandomCardTable ={45011051,45011041,45011046}
function x310227_ProcIntervalOverEvent( varMap, varPlayer )
	if GetGameOpenById(x310227_var_GameId) ~= 1 then
		return
	end
	
	local year, month, day = GetYearMonthDay();
	local day1 = GetDayOfYear()

	local hour,min1,sec = GetHourMinSec()
	    if year == 2012 and day1 >= 119 and day1 <= 121 then
	    	if hour >=9 and hour <=24 then
					x310227_AddItem(varMap, varPlayer)
		   		GamePlayScriptLog( varMap, varPlayer, 3049)	
			  else
			  	--非时间段内取消Buff
			  	CancelSpecificImpact( varMap, varPlayer, 7767)
	    	end
	    else
	    	CancelSpecificImpact( varMap, varPlayer, 7767)
	    end
	    
end


function x310227_ProcActiveEvent( varMap, varPlayer )

end


function x310227_ProcFadeOutEvent( varMap, varPlayer )

end

function x310227_ProcEventEntry()

end

function x310227_CheckPlayerInArea(varMap, varPlayer)

end

function x310227_AddItem(varMap, varPlayer)

--获取roll到的区间			
		  local rseed = random( 1, 1000000)
		  local varIndex = 1
		  local dn = 1
		  local up = 1
		  for varI, item in x310227_var_RandomItemTable0 do
		      up = up + item.probability
		      if rseed >= dn and rseed < up then
		          varIndex = varI
		          break
		      end
		      dn = dn + item.probability
		  end
--加物品	  		  
	
		if x310227_var_RandomItemTable0[ varIndex ].varNum == 1 then 	
			StartItemTask( varMap)
			if x310227_var_RandomItemTable0[ varIndex ].varItem == 11990117 then
				ItemAppendBind( varMap, x310227_var_RandomItemTable0[ varIndex ].varItem, 5)
			else
				ItemAppendBind( varMap, x310227_var_RandomItemTable0[ varIndex ].varItem, 1)
			end	
			if StopItemTask( varMap, varPlayer) == 0 then
	    	Msg2Player( varMap, varPlayer, "背包已满，无法获得奖励", 8, 3)
	    	return
	    else
	    		Msg2Player( varMap, varPlayer,format( "恭喜您获得了#G%s",x310227_var_RandomItemTable0[ varIndex ].itemName), 8, 3)
	    		DeliverItemListSendToPlayer( varMap, varPlayer)
			end

--加经验
		elseif x310227_var_RandomItemTable0[ varIndex ].varNum == 2 then 
		local playerLevel1 = GetLevel(varMap ,varPlayer)
			if x310227_var_RandomItemTable0[ varIndex ].varItem == 1 then
				if playerLevel1 < 50 then	
					local awardexp = x310227_var_levelupexp[ playerLevel1 ] 
					local a =awardexp/720
					Msg2Player( varMap, varPlayer,format( "恭喜您获得了#G%d经验",a), 8, 3)
					AddExp(varMap,varPlayer,awardexp/720)
				else
					Msg2Player( varMap, varPlayer,format( "恭喜您获得了#G%d经验",x310227_GetAllExpBonus(varMap, varPlayer )), 8, 3)
					AddExp(varMap,varPlayer,x310227_GetAllExpBonus(varMap, varPlayer ))	
				end
			elseif x310227_var_RandomItemTable0[ varIndex ].varItem == 2 then
				if playerLevel1 < 50 then	
					local awardexp1 = x310227_var_levelupexp[ playerLevel1 ] 
					Msg2Player( varMap, varPlayer,format( "恭喜您获得了#G%d经验",awardexp1), 8, 3)
					AddExp(varMap,varPlayer,awardexp1/540)
				else
					Msg2Player( varMap, varPlayer,format( "恭喜您获得了#G%d经验",x310227_GetmoreExpBonus(varMap, varPlayer )), 8, 3)
					AddExp(varMap,varPlayer,x310227_GetmoreExpBonus(varMap, varPlayer ))	
				end
			end
--加钱
		elseif x310227_var_RandomItemTable0[ varIndex ].varNum == 3 then
			Msg2Player( varMap, varPlayer, "恭喜您获得了5两#G银卡", 8, 3)
			AddMoney(varMap, varPlayer, 1, x310227_var_RandomItemTable0[ varIndex ].varItem)
		
--卡牌
		elseif x310227_var_RandomItemTable0[ varIndex ].varNum == 4 then 	
		local cardId = random(1,3)
			StartItemTask( varMap)	
			ItemAppendBind( varMap, x310227_var_RandomCardTable[ cardId ], 1)
				if StopItemTask( varMap, varPlayer) == 0 then
		    	Msg2Player( varMap, varPlayer, "背包已满，无法获得奖励", 8, 3)
		    	return
		    else
		    	Msg2Player( varMap, varPlayer, "恭喜您获得了#G将星卡#cffcc00一张！", 8, 3)  
		    	DeliverItemListSendToPlayer( varMap, varPlayer)
				end
		end
--世界通告	**	
		if x310227_var_RandomItemTable0[ varIndex ].varhorn ==1 then
			local varMsg = format( "恭喜#R%s#cffcc00线上上领奖活动中，获得#G%s#cffcc00！", GetName( varMap, varPlayer),x310227_var_RandomItemTable0[ varIndex ].itemName )
			LuaAllScenceM2Wrold (varMap , varMsg , 5, 1)
		end
 

			
end

function x310227_ProcessQuestFail(varMap, varPlayer, varQuest)
end


function x310227_GetAllExpBonus(varMap, varPlayer )
	local awardexp =0
	local playerLevel = GetLevel(varMap ,varPlayer)
--低经验
				if playerLevel >= 50 and playerLevel < 76 then
					awardexp = playerLevel*40
				elseif playerLevel >= 76 and playerLevel < 90 then
					awardexp = playerLevel*60 
				elseif playerLevel >= 90 then
					awardexp = playerLevel*90
				end
	return awardexp	
end
function x310227_GetmoreExpBonus(varMap, varPlayer )
	local awardexp =0
	local playerLevel = GetLevel(varMap ,varPlayer)
			--高经验
				if playerLevel >= 50 and playerLevel < 76 then
					awardexp = playerLevel*60
				elseif playerLevel >= 76 and playerLevel < 90 then
					awardexp = playerLevel*90
				elseif playerLevel >= 90 then
					awardexp = playerLevel*120
				end
	return awardexp	
end
function x310227_GetPerExpBonus(varMap, varPlayer )

end
--记MD
function x310227_GetDayCount(varMap, varPlayer)

end

function x310227_GetExpBonusMuil(varMap, varPlayer )

end
