x700104_var_FileId 		= 700104

x700104_var_MaxCount		= 5

x700104_var_SubmitItem	= 11990015

x700104_var_TitleInfo		= "在这里你可以用藏宝令兑换一些道具材料。但兑换一次将消耗一次再次进入藏宝洞的机会。"

x700104_var_SelectOpt		= {
							{"藏宝令兑换水晶",11001}, 
							{"藏宝令兑换龙眼石",11002}, 
							{"藏宝令兑换声望",11003}, 
							{"藏宝令兑换银币",11004}, 
							{"藏宝令兑换生活技能材料",11005}
						}
						
x700104_var_SelectPane1	= {
							{"世传水晶", 11011, 11000200, 20, 9},
							{"国传水晶", 11012, 11000201, 40, 9},
							{"神传水晶", 11013, 11000202, 60, 9},
							{"天传水晶", 11014, 11000203, 80, 9}
						}
						
x700104_var_SelectPane2	= {
							{"初级龙眼石", 11021, 11050001, 20, 9},
							{"中级龙眼石", 11022, 11050002, 40, 9},
							{"高级龙眼石", 11023, 11050003, 60, 9},
							{"天之龙眼石", 11024, 11050004, 80, 9},
							{"换冥之龙眼石",11025,11050005, 100,9}
						}
						
x700104_var_SelectPane5	= {
							{"草本精华", 11051, 11020501},
							{"七步蛇", 11052, 11030405},
							{"熔火石", 11053, 11030501}
						}

x700104_var_RandItem = {11010100, 11010101, 11010102}
				
function x700104_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,idExt)	

	if idExt == 11000 then
		x700104_Opt( varMap, varPlayer, varTalknpc )
	elseif idExt == x700104_var_SelectOpt[1][2] then
		x700104_ShowPane1( varMap, varPlayer, varTalknpc )
	elseif idExt == x700104_var_SelectOpt[2][2] then
		x700104_ShowPane2( varMap, varPlayer, varTalknpc )
	elseif idExt == x700104_var_SelectOpt[3][2] then
		x700104_ShowPane3( varMap, varPlayer, varTalknpc )
	elseif idExt == x700104_var_SelectOpt[4][2] then
		x700104_ShowPane4( varMap, varPlayer, varTalknpc )
	elseif idExt == x700104_var_SelectOpt[5][2] then
		x700104_ShowPane5( varMap, varPlayer, varTalknpc )
	elseif idExt >= 11010 and idExt <= 11100 then
		x700104_ShowOpt( varMap, varPlayer, varTalknpc, idExt )
	else
		x700104_ShowInit( varMap, varPlayer, varTalknpc )
	end
end


function x700104_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	x700104_ShowInit( varMap, varPlayer, varTalknpc )
end

function x700104_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x700104_ProcAccept( varMap, varPlayer )
end

function x700104_ShowOpt( varMap, varPlayer, varTalknpc, idExt )
	SetPlayerRuntimeData(varMap, varPlayer, RD_HUANGJINKUANGDONG_OPT, idExt)
		
	StartTalkTask(varMap)
		local varCount = 1
		local varName = ""
		if idExt >= x700104_var_SelectPane1[1][2] and idExt <= x700104_var_SelectPane1[4][2] then
			local idx = idExt-11010
			varName = x700104_var_SelectPane1[idx][1]
			varCount = x700104_var_SelectPane1[idx][5]
		elseif idExt >= x700104_var_SelectPane2[1][2] and idExt <= x700104_var_SelectPane2[5][2] then
			local idx = idExt-11020
			varName = x700104_var_SelectPane2[idx][1]
			varCount = x700104_var_SelectPane2[idx][5]
		elseif idExt >= x700104_var_SelectPane5[1][2] and idExt <= x700104_var_SelectPane5[3][2] then
			local idx = idExt-11050
			varName = x700104_var_SelectPane5[idx][1]
			
			local varLevel = GetLevel(varMap, varPlayer)
			if varLevel >= 70 then
				varCount =35
			elseif varLevel >= 60 then
				varCount =30
			elseif varLevel >= 50 then
				varCount =15
			end
		end
		
		local varStr = format("你确定要用藏宝令兑换%d个%s", varCount, varName)
		TalkAppendString(varMap,varStr)
		
		TalkAppendButton(varMap,x700104_var_FileId,"确定",3,11000)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end

function x700104_Opt( varMap, varPlayer, varTalknpc )

	local peerVipBenefit  = GetPeerVipBenefit(varMap, varPlayer, 5)
	local maxCount = x700104_var_MaxCount + peerVipBenefit
	
	if x700104_GetDayCount(varMap, varPlayer) >= maxCount then
		return
	end
		
	local opt = GetPlayerRuntimeData(varMap,varPlayer,RD_HUANGJINKUANGDONG_OPT)
	
	if opt == x700104_var_SelectOpt[3][2] then
		local varItemCount = GetItemCountInBag(varMap,varPlayer,x700104_var_SubmitItem)
      if varItemCount == 0 then
 		    Msg2Player( varMap, varPlayer, "您身上没有藏宝令。", 8, 3)
		    Msg2Player( varMap, varPlayer, "您身上没有藏宝令。", 8, 2)     
	        return
	     end   			
		if DelItem( varMap, varPlayer, x700104_var_SubmitItem, 1) == 0 then
		    Msg2Player( varMap, varPlayer, "没有藏宝令。", 8, 3)
		    Msg2Player( varMap, varPlayer, "没有藏宝令。", 8, 2)
		    
		    x700104_ShowInit( varMap, varPlayer, varTalknpc )
		    return
		end
		x700104_SetDayCount(varMap, varPlayer)
			
		local bQingjian = x700104_CheckQingjian(varMap, varPlayer)
		local nadd = 620*(bQingjian+1)
		local varShengWang = GetShengWang( varMap, varPlayer ) + nadd
		SetShengWang( varMap, varPlayer, varShengWang )
		
		if GetLevel(varMap, varPlayer) >= 80 and random(1, 100) <= 5 then
			local varIndex = random(1,3)
			if varIndex < 1 then varIndex = 1 end
			if varIndex > 3 then varIndex = 3 end
			local rndItemid = x700104_var_RandItem[varIndex]
			
			StartItemTask( varMap )
			ItemAppend( varMap, rndItemid, 1)
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				
				local varStr = format("#Y随机获得#G1个#Y#{_ITEM%d}", rndItemid)
				Msg2Player(varMap, varPlayer, varStr, 8, 3)
				
			end
		end
		
		varStr = format("获得#R声望%d#o的奖励", nadd)
		Msg2Player(varMap, varPlayer, varStr, 8, 3)
		Msg2Player(varMap, varPlayer, varStr, 8, 2)
		
	elseif opt == x700104_var_SelectOpt[4][2] then
		local varItemCount = GetItemCountInBag(varMap,varPlayer,x700104_var_SubmitItem)
      if varItemCount == 0 then
	 		    Msg2Player( varMap, varPlayer, "您身上没有藏宝令。", 8, 3)
			    Msg2Player( varMap, varPlayer, "您身上没有藏宝令。", 8, 2)  
	        return
	     end   			
		
		if DelItem( varMap, varPlayer, x700104_var_SubmitItem, 1) == 0 then
		    Msg2Player( varMap, varPlayer, "没有藏宝令。", 8, 3)
		    Msg2Player( varMap, varPlayer, "没有藏宝令。", 8, 2)
		    
		    x700104_ShowInit( varMap, varPlayer, varTalknpc )
		    return
		end
		x700104_SetDayCount(varMap, varPlayer)
		
		local bQingjian = x700104_CheckQingjian(varMap, varPlayer)
		if bQingjian > 0 then
                        local nadd_yinbi_1 = GetLevel(varMap, varPlayer)*200
                        local nadd_yinka_1 = GetLevel(varMap, varPlayer)*400

			AddMoney(varMap, varPlayer, 0, nadd_yinbi_1)
			AddMoney(varMap, varPlayer, 1, nadd_yinka_1)
			
			Msg2Player(varMap,varPlayer,format("获得#{_MONEY%d}现银与#{_MONEY%d}银卡",nadd_yinbi_1,nadd_yinka_1),8,3)
		else
                        local nadd_yinka = GetLevel(varMap, varPlayer)*600
			AddMoney(varMap, varPlayer, 1, nadd_yinka)
			Msg2Player(varMap,varPlayer,format("获得#{_MONEY%d}银卡。",nadd_yinka),8,3)
		end
		
		if GetLevel(varMap, varPlayer) >= 80 and random(1, 100) <= 5 then
			local varIndex = random(1,3)
			if varIndex < 1 then varIndex = 1 end
			if varIndex > 3 then varIndex = 3 end
			local rndItemid = x700104_var_RandItem[varIndex]
			
			StartItemTask( varMap )
			ItemAppend( varMap, rndItemid, 1)
			local varRet = StopItemTask( varMap, varPlayer )
			if varRet > 0 then
				DeliverItemListSendToPlayer(varMap,varPlayer)
				
				local varStr = format("#Y随机获得#G1个#Y#{_ITEM%d}", rndItemid)
				Msg2Player(varMap, varPlayer, varStr, 8, 3)
				
			end
		end
	
	elseif opt >= x700104_var_SelectPane1[1][2] and opt <= x700104_var_SelectPane1[4][2] then
		local idx = opt-11010
		x700104_AddItem(varMap, varPlayer, varTalknpc, x700104_var_SelectPane1[idx][1], x700104_var_SelectPane1[idx][3], x700104_var_SelectPane1[idx][5])
	elseif opt >= x700104_var_SelectPane2[1][2] and opt <= x700104_var_SelectPane2[5][2] then
		local idx = opt-11020
		x700104_AddItem(varMap, varPlayer, varTalknpc, x700104_var_SelectPane2[idx][1], x700104_var_SelectPane2[idx][3], x700104_var_SelectPane2[idx][5])
	elseif opt >= x700104_var_SelectPane5[1][2] and opt <= x700104_var_SelectPane5[3][2] then
		local idx = opt-11050
		local varCount = 1
		local varLevel = GetLevel(varMap, varPlayer)
		if varLevel >= 70 then
			varCount =35
		elseif varLevel >= 60 then
			varCount =30
		elseif varLevel >= 50 then
			varCount =15
		end
		
		x700104_AddItem(varMap, varPlayer, varTalknpc, x700104_var_SelectPane5[idx][1], x700104_var_SelectPane5[idx][3],varCount)
	end
	
	x700104_ShowInit( varMap, varPlayer, varTalknpc )
end


function x700104_ShowInit( varMap, varPlayer, varTalknpc )
	StartTalkTask(varMap)
		
		TalkAppendString(varMap,"#Y"..x700104_var_TitleInfo)
		
		
		local varDaycount = x700104_GetDayCount(varMap, varPlayer)
		local peerVipBenefit  = GetPeerVipBenefit(varMap, varPlayer, 5)
		local maxCount = x700104_var_MaxCount + peerVipBenefit
		
		if varDaycount < maxCount then
			for varI, item in x700104_var_SelectOpt do
				if varI ~= 3 then
					TalkAppendButton(varMap,x700104_var_FileId,item[1],3,item[2])
				end
			end
		else
			TalkAppendString(varMap,"进入藏宝洞的次数不足无法兑换")
		end
	StopTalkTask()
	
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end


function x700104_ShowPane1( varMap, varPlayer, varTalknpc )
	local varLevel = GetLevel(varMap, varPlayer)
	StartTalkTask(varMap)
		
		TalkAppendString(varMap,"#Y"..x700104_var_TitleInfo)
		
		for varI, item in x700104_var_SelectPane1 do
			if varLevel >= item[4] then
				TalkAppendButton(varMap,x700104_var_FileId,"藏宝令兑换"..item[1],3,item[2])
			end
		end
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end


function x700104_ShowPane2( varMap, varPlayer, varTalknpc )
	local varLevel = GetLevel(varMap, varPlayer)
	StartTalkTask(varMap)
		
		TalkAppendString(varMap,"#Y"..x700104_var_TitleInfo)
		
		for varI, item in x700104_var_SelectPane2 do
			if varLevel >= item[4] then
				TalkAppendButton(varMap,x700104_var_FileId,"藏宝令兑换"..item[1],3,item[2])
			end
		end
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end

function x700104_ShowPane3( varMap, varPlayer, varTalknpc )
	SetPlayerRuntimeData(varMap, varPlayer, RD_HUANGJINKUANGDONG_OPT, x700104_var_SelectOpt[3][2])
		
	StartTalkTask(varMap)
		
		local bQingjian = x700104_CheckQingjian(varMap, varPlayer)
		local nadd = 620*(bQingjian+1)
		
		local varStr = format("你确定要用藏宝令兑换%d点声望吗？", nadd)
		TalkAppendString(varMap,varStr)
		
		TalkAppendButton(varMap,x700104_var_FileId,"确定",3,11000)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end

function x700104_ShowPane4( varMap, varPlayer, varTalknpc )
	SetPlayerRuntimeData(varMap, varPlayer, RD_HUANGJINKUANGDONG_OPT, x700104_var_SelectOpt[4][2])
	
	StartTalkTask(varMap)
		
		local bQingjian = x700104_CheckQingjian(varMap, varPlayer)

		local varStr = ""
		if bQingjian == 1 then
                        local nadd_yinbi_1 = GetLevel(varMap, varPlayer)*200
                        local nadd_yinka_1 = GetLevel(varMap, varPlayer)*400		
			varStr = format("你确定要用藏宝令兑换%d文现银与%d文银卡吗", nadd_yinbi_1, nadd_yinka_1)
		else
                        local nadd_yinka  =  GetLevel(varMap, varPlayer)*600
			varStr = format("你确定要用藏宝令兑换%d点银卡吗？", nadd_yinka)
		end

		TalkAppendString(varMap,varStr)
		
		TalkAppendButton(varMap,x700104_var_FileId,"确定",3,11000)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end


function x700104_ShowPane5( varMap, varPlayer, varTalknpc )
	local varLevel = GetLevel(varMap, varPlayer)
	StartTalkTask(varMap)
		
		TalkAppendString(varMap,"#Y"..x700104_var_TitleInfo)
		
		if varLevel < 50 then
			TalkAppendString(varMap,"\n\t级别高于50级以后才可以兑换生活技能材料。")
		else
			for varI, item in x700104_var_SelectPane5 do
				if varLevel >= 50 then
					TalkAppendButton(varMap,x700104_var_FileId,"藏宝令兑换"..item[1],3,item[2])
				end
			end
		end
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end


function x700104_CheckQingjian(varMap, varPlayer)
    if IsHaveSpecificImpact( varMap, varPlayer, 9011 )>0 or IsHaveSpecificImpact( varMap, varPlayer, 9013 ) > 0  or IsHaveSpecificImpact( varMap, varPlayer, 9012 ) > 0 then
        return 1
    end
    return 0
end


function x700104_AddItem( varMap, varPlayer, varTalknpc, itemname, varItem, varCount )
	StartItemTask( varMap )
	ItemAppend( varMap, varItem, varCount)
	
	local rndItemid = -1
	if GetLevel(varMap, varPlayer) >= 80 and random(1, 100) <= 5 then
		local varIndex = random(1,3)
		if varIndex < 1 then varIndex = 1 end
		if varIndex > 3 then varIndex = 3 end
		rndItemid = x700104_var_RandItem[varIndex]
		ItemAppend( varMap, rndItemid, 1)
	end
	
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local varItemCount = GetItemCountInBag(varMap,varPlayer,x700104_var_SubmitItem)
      if varItemCount == 0 then
	 		    Msg2Player( varMap, varPlayer, "您身上没有藏宝令。", 8, 3)
			    Msg2Player( varMap, varPlayer, "您身上没有藏宝令。", 8, 2)  
	        return
	     end   			
		if DelItem( varMap, varPlayer, x700104_var_SubmitItem, 1) == 0 then
		    Msg2Player( varMap, varPlayer, "没有藏宝令。", 8, 3)
		    Msg2Player( varMap, varPlayer, "没有藏宝令。", 8, 2)
		    
		    x700104_ShowInit( varMap, varPlayer, varTalknpc )
		    return
		end
		x700104_SetDayCount(varMap, varPlayer)
		
		DeliverItemListSendToPlayer(varMap,varPlayer)
		
		local varStr = "#Y获得#G"..varCount.."个#Y"..itemname
		Msg2Player(varMap, varPlayer, varStr, 8, 3)
		Msg2Player(varMap, varPlayer, varStr, 8, 2)
		
		if rndItemid ~= -1 then
			local varStr = format("#Y随机获得#G1个#Y#{_ITEM%d}", rndItemid)
			Msg2Player(varMap, varPlayer, varStr, 8, 3)
			
		end
	else
		local varStr = "#Y背包空间不足，请整理背包后再试！"
		Msg2Player(varMap, varPlayer, varStr, 8, 3)
		Msg2Player(varMap, varPlayer, varStr, 8, 2)
	end
end




function x700104_GetDayCount(varMap, varPlayer)
	if x700104_var_MaxCount > 0 then
		local varToday = GetDayOfYear()
		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_HUANGJINKUANGDONG_DATE[1], MD_FUBEN_HUANGJINKUANGDONG_DATE[2], MD_FUBEN_HUANGJINKUANGDONG_DATE[3])
		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT[1], MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT[2], MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT[3])
		return varDaycount

	end
	return 0
end




function x700104_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_HUANGJINKUANGDONG_DATE[1], MD_FUBEN_HUANGJINKUANGDONG_DATE[2], MD_FUBEN_HUANGJINKUANGDONG_DATE[3])
	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_HUANGJINKUANGDONG_DATE[1], MD_FUBEN_HUANGJINKUANGDONG_DATE[2], MD_FUBEN_HUANGJINKUANGDONG_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT[1], MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT[2], MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT[1], MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT[2], MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT[1], MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT[2], MD_FUBEN_HUANGJINKUANGDONG_DAYCOUNT[3], varDaycount+1)
	end
end
