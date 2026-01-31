

x300972_var_FileId 					= 	300972                  
x300972_var_Title						=  "【帮会】帮会发展基金" 
x300972_var_BONUS_TBL_IDX = 
{
1000000 ,
2000000,
3000000,
5000000,
7000000,
10000000,
15000000,
20000000,
25000000,
30000000,
35000000,
40000000,
50000000,
60000000,
70000000,
80000000,
90000000,
100000000,
120000000,
140000000,
160000000,
180000000,
200000000
} 
x300972_var_BONUS_TBL = 
{
100000,
200000,
300000,
400000,
560000,
800000,
1000000,
1200000,
1500000,
1800000,
2100000,
2400000,
2800000,
3300000,
3800000,
4300000,
4800000,
5300000,
5800000,
6300000,
6800000,
7300000,
7800000
}

x300972_var_Quest_Max_Count = 1 
x300972_var_GameId = 1057
 

function x300972_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if GetGameOpenById(x300972_var_GameId) ~= 1 then
		return 0
	end

	if GetGuildID(varMap, varPlayer) == -1 then
		
		return 0
	end
	
	local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= 5 then
		return 0
	end
	TalkAppendButton(varMap,x300972_var_FileId,x300972_var_Title, 3, -1)	
end



function x300972_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
	
	if varExtIdx == -1 then
						
						local pos = GetGuildOfficial(varMap, varPlayer)
						
						if pos ~= 5 then
												StartTalkTask(varMap)
												TalkAppendString(varMap,"很抱歉，只有帮主才能领取帮会发展基金")
												StopTalkTask(varMap)
												
												DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300972_var_FileId, -1,  0)
												Msg2Player(varMap,varPlayer,"很抱歉，只有帮主才能领取帮会发展基金",8,2)	
												return
						end
						
						local nGuildID = GetGuildID(varMap,varPlayer)
						
						local year, curMonth,  day = GetYearMonthDay()
						curMonth = year*100 + curMonth
						local sysCurMonth = GetGuildParamEx( varMap, varPlayer,nGuildID, GD_GUILD_CURMONTH)
						if curMonth ~= sysCurMonth then 
						
									local nCurMonth = GetGuildParamEx( varMap, varPlayer,nGuildID, GD_GUILD_CURMONTH)
									local nCurMoney = GetGuildParamEx( varMap, varPlayer,nGuildID, GD_GUILD_CURMONTH_GUILD_MEMBER_MONEY)
									
									SetGuildParamEx(varMap, varPlayer,nGuildID,GD_GUILD_CURMONTH,curMonth)
									SetGuildParamEx(varMap, varPlayer,nGuildID,GD_GUILD_LASTMONTH,nCurMonth)

									
									SetGuildParamEx(varMap, varPlayer,nGuildID,GD_GUILD_CURMONTH_GUILD_MEMBER_MONEY,0)					
									SetGuildParamEx(varMap, varPlayer,nGuildID,GD_GUILD_LASTMONTH_GUILD_MEMBER_MONEY,nCurMoney )			        
						end
						
				

						
						
						local nTotalLast = GetGuildParamEx( varMap, varPlayer,nGuildID,GD_GUILD_LASTMONTH_GUILD_MEMBER_MONEY) 
						
						
						local nTotalNow = GetGuildParamEx( varMap, varPlayer,nGuildID,GD_GUILD_CURMONTH_GUILD_MEMBER_MONEY)  
						
						
						local nTotal   = GetGuildParamEx( varMap, varPlayer,nGuildID,GD_GUILD_LASTMONTH_GUILD_MEMBER_MONEY)  
						
						
						
						local nCur ,nIdx  =  x300972_GetBonus(varMap, varPlayer,nTotalNow)
						local nNext =  x300972_GetBonus_NextMonth(varMap, varPlayer,nIdx)
						local nNext2 = 0
						if nIdx < 23 then
												nNext2 =  x300972_var_BONUS_TBL[nIdx+1]
										
												local str_last = x300972_GetMoney_Liang(varMap,nTotalLast)
												local str_now  = x300972_GetMoney_Liang(varMap,nTotalNow)
												local str_cur = x300972_GetMoney_Liang(varMap,nCur)
												local str_next = x300972_GetMoney_Liang(varMap,nNext)
												local str_next2 = x300972_GetMoney_Liang(varMap,nNext2)
												
												local nBindGold ,nIdx = x300972_GetBonus(varMap, varPlayer,nTotal)
												local str_bind = x300972_GetMoney_Liang(varMap,nBindGold)



												StartTalkTask(varMap)
												TalkAppendString(varMap,"#Y"..x300972_var_Title)
												TalkAppendString(varMap,"\t帮会的发展，需要众人一心，和充足的资金。而常用的帮会召集令，天赋研发等等，都需要付出不菲的资金。\n\t帮会发展基金的目的正是为了帮会的持续发展，它来源于各位帮众每月的现金消费之和，每月底结算，帮主在本月结算之前都可以领取上月的基金。\n#B（此模块仅帮主可见）#W\n \n#Y本月领取：\n#W您#G本月#W可以领取到金卡#R"..str_bind.."#W\n \n#Y下月领取：#W\n您#G下月#W可以领取到金卡#R"..str_cur.."#W,如果#G本月#W帮众再消费现金#G"..str_next.."#W，您#G下月#W就可以领取#R"..str_next2.."#W金卡了。")
												
												StopTalkTask()
												
												DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300972_var_FileId, -1,  0)
							
							
						else
												nNext2 =  x300972_var_BONUS_TBL[nIdx]
									
																			
												local str_last = x300972_GetMoney_Liang(varMap,nTotalLast)
												local str_now  = x300972_GetMoney_Liang(varMap,nTotalNow)

												local str_cur = x300972_GetMoney_Liang(varMap,nCur)
												local str_next = x300972_GetMoney_Liang(varMap,nNext)
												local str_next2 = x300972_GetMoney_Liang(varMap,nNext2)
												
												local nBindGold ,nIdx = x300972_GetBonus(varMap, varPlayer,nTotal)
												local str_bind = x300972_GetMoney_Liang(varMap,nBindGold)



												StartTalkTask(varMap)
												TalkAppendString(varMap,"#Y"..x300972_var_Title)
												TalkAppendString(varMap,"\t帮会的发展，需要众人一心，和充足的资金。而常用的帮会召集令，天赋研发等等，都需要付出不菲的资金。\n\t帮会发展基金的目的正是为了帮会的持续发展，它来源于各位帮众每月的现金消费之和，每月底结算，帮主在本月结算之前都可以领取上月的基金。\n#B（此模块仅帮主可见）#W\n \n#Y本月领取：\n#W您#G本月#W可以领取到金卡#R"..str_bind.."#W\n \n#Y下月领取：#W\n您#G下月#W可以领取到金卡#R"..str_cur.."")
												
												StopTalkTask()
												
												DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300972_var_FileId, -1,  0)
												
							
						end

	 end
	
end


function x300972_GetMoney_Liang(varMap,nMoney)
			if nMoney <= 0 then
				local varStr = "0文"
				return varStr
			end
				
				
			local ding = floor(nMoney/(1000*1000))
			local liang = floor((nMoney-ding*1000*1000)/1000)
			local wen = nMoney-(ding*1000*1000+liang*1000)
			local varStr=""
			if ding>0 then
				varStr = varStr..format("%d锭",ding)
			end

			if liang>0 then
				varStr = varStr..format("%d两",liang)
			end

			if wen>0 then
				varStr = varStr..format("%d文",wen)
			end

			return varStr;
end


function x300972_GetBonus_NextMonth(varMap, varPlayer,nIdx)
		local nGuildID = GetGuildID(varMap,varPlayer)
		if nIdx < 23 then
			
			return x300972_var_BONUS_TBL_IDX[nIdx + 1] - GetGuildParamEx( varMap, varPlayer,nGuildID,GD_GUILD_CURMONTH_GUILD_MEMBER_MONEY)			
		else
			return x300972_var_BONUS_TBL_IDX[nIdx]
		end
		return 0
end



function x300972_GetBonus(varMap, varPlayer,nTotal)
	if nTotal <= 0 then
		return 0,0
	end
	
	if nTotal < x300972_var_BONUS_TBL_IDX[1] then
		return 0 , 0
	end
	
	if nTotal >= x300972_var_BONUS_TBL_IDX[1] and nTotal < x300972_var_BONUS_TBL_IDX[2] then
		return x300972_var_BONUS_TBL[1] , 1
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[2] and nTotal < x300972_var_BONUS_TBL_IDX[3] then
		return x300972_var_BONUS_TBL[2] , 2
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[3] and nTotal < x300972_var_BONUS_TBL_IDX[4] then
		return x300972_var_BONUS_TBL[3] ,  3
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[4] and nTotal < x300972_var_BONUS_TBL_IDX[5] then
		return x300972_var_BONUS_TBL[4],  4
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[5] and nTotal < x300972_var_BONUS_TBL_IDX[6] then
		return x300972_var_BONUS_TBL[5], 5
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[6] and nTotal < x300972_var_BONUS_TBL_IDX[7] then
		return x300972_var_BONUS_TBL[6], 6
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[7] and nTotal < x300972_var_BONUS_TBL_IDX[8] then
		return x300972_var_BONUS_TBL[7], 7
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[8] and nTotal < x300972_var_BONUS_TBL_IDX[9] then
		return x300972_var_BONUS_TBL[8], 8
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[9] and nTotal < x300972_var_BONUS_TBL_IDX[10] then
		return x300972_var_BONUS_TBL[9], 9
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[10] and nTotal < x300972_var_BONUS_TBL_IDX[11] then
		return x300972_var_BONUS_TBL[10], 10
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[11] and nTotal < x300972_var_BONUS_TBL_IDX[12] then
		return x300972_var_BONUS_TBL[11], 11
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[12] and nTotal < x300972_var_BONUS_TBL_IDX[13] then
		return x300972_var_BONUS_TBL[12], 12
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[13] and nTotal < x300972_var_BONUS_TBL_IDX[14] then
		return x300972_var_BONUS_TBL[13], 13
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[14] and nTotal < x300972_var_BONUS_TBL_IDX[15] then
		return x300972_var_BONUS_TBL[14], 14
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[15] and nTotal < x300972_var_BONUS_TBL_IDX[16] then
		return x300972_var_BONUS_TBL[15], 15
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[16] and nTotal < x300972_var_BONUS_TBL_IDX[17] then
		return x300972_var_BONUS_TBL[16], 16
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[17] and nTotal < x300972_var_BONUS_TBL_IDX[18] then
		return x300972_var_BONUS_TBL[17], 17
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[18] and nTotal < x300972_var_BONUS_TBL_IDX[19] then
		return x300972_var_BONUS_TBL[18], 18
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[19] and nTotal < x300972_var_BONUS_TBL_IDX[20] then
		return x300972_var_BONUS_TBL[19], 19
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[20] and nTotal < x300972_var_BONUS_TBL_IDX[21] then
		return x300972_var_BONUS_TBL[20], 20
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[21] and nTotal < x300972_var_BONUS_TBL_IDX[22] then
		return x300972_var_BONUS_TBL[21], 21
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[22] and nTotal < x300972_var_BONUS_TBL_IDX[23] then
		return x300972_var_BONUS_TBL[22], 22
	end
	if nTotal >= x300972_var_BONUS_TBL_IDX[23] then
		return x300972_var_BONUS_TBL[23], 23
	end	
	
	return  0, 0
end













































function x300972_ProcAccept( varMap, varPlayer )
	
	

	
	local pos = GetGuildOfficial(varMap, varPlayer)
	
	if pos ~= 5 then
							return -1
	end

					
	
	local nGuildID = GetGuildID(varMap,varPlayer)
	
	local nLastDate =  GetGuildParamEx( varMap, varPlayer,nGuildID,GD_GUILD_LASTMONTH)
	local nCurDate  =  GetGuildParamEx( varMap, varPlayer,nGuildID,GD_GUILD_CURMONTH)
	if nLastDate == nCurDate then
							StartTalkTask(varMap)
							TalkAppendString(varMap,"上月您的帮会成员的现金消费不足或者本帮帮主本月已经领取过一次，无法领取帮会发展基金")
							
							StopTalkTask(varMap)
							DeliverTalkTips(varMap, varPlayer)
							Msg2Player(varMap,varPlayer,"上月您的帮会成员的现金消费不足或者本帮帮主本月已经领取过一次，无法领取帮会发展基金",8,2)
							return
	end
	
	local nTotal    = GetGuildParamEx( varMap, varPlayer,nGuildID,GD_GUILD_LASTMONTH_GUILD_MEMBER_MONEY)  
	if nTotal <= 0 then
							StartTalkTask(varMap)
							TalkAppendString(varMap,"上月您的帮会成员的现金消费不足或者本帮帮主本月已经领取过一次，无法领取帮会发展基金")
							
							StopTalkTask(varMap)
							DeliverTalkTips(varMap, varPlayer)
							Msg2Player(varMap,varPlayer,"上月您的帮会成员的现金消费不足或者本帮帮主本月已经领取过一次，无法领取帮会发展基金",8,2)
							return
	end

	
	
	
	
	local nBindGold ,nIdx = x300972_GetBonus(varMap, varPlayer,nTotal)
	if nBindGold == 0 then
							StartTalkTask(varMap)
							TalkAppendString(varMap,"#Y"..x300972_var_Title)
							TalkAppendString(varMap,"上月您的帮会成员的现金消费不足或者本帮帮主本月已经领取过一次，无法领取帮会发展基金")
							StopTalkTask()
							
							DeliverTalkMenu(varMap, varPlayer, -1) 
							
							Msg2Player(varMap,varPlayer,"上月您的帮会成员的现金消费不足或者本帮帮主本月已经领取过一次，无法领取帮会发展基金",8,2)							
							return -1
	end

	
	
	local year, curMonth,  day = GetYearMonthDay()
	curMonth = year*100 + curMonth
	SetGuildParamEx(varMap, varPlayer,nGuildID,GD_GUILD_LASTMONTH,curMonth)
	SetGuildParamEx(varMap, varPlayer,nGuildID,GD_GUILD_CURMONTH, curMonth)
	SetGuildParamEx(varMap, varPlayer,nGuildID,GD_GUILD_LASTMONTH_GUILD_MEMBER_MONEY,0)
				
	local moneymes = "返还金卡"
	
	local varRet = AddMoney( varMap, varPlayer, 3, nBindGold )
	if varRet <= 0 then
							GamePlayScriptLog(varMap, varPlayer, 1732) 
	else
							local nBindStr = x300972_GetMoney_Liang(varMap,nBindGold)
							Msg2Player(varMap, varPlayer,"顺利领取"..nBindStr.."金卡奖励", 8, 2);
							Msg2Player(varMap, varPlayer,"顺利领取"..nBindStr.."金卡奖励", 8, 3)
							GamePlayScriptLog(varMap, varPlayer, 1731) 
	end
	

	
end

function x300972_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x300972_ProcQuestAccept( varMap, varPlayer, varTalknpc )
	
end


