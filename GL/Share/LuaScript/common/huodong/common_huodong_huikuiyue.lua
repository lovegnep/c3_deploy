

x270109_var_FileId 		= 270109
x270109_var_QuestName	= "成吉思汗庆奥运活动\n"


x270109_var_IsEnableId    = 1104
x270109_var_LimitLevel	= 40
			
x270109_var_ItemTable ={
		{ext="点击领取奖励"    ,id=12032034,num=-1,des="2012年8月份庆奥运活动期间，每消费#R5#W两现金，即可领取激情奥运纪念券一张。消费现金数额到达#R100#W的倍数，将额外送出多张纪念券！\n"},
	}
	
x270109_var_ewaibili = {
	1,				--100档次
	2,				--200档次
	3,				--300档次
	3,				--400档次
	4,				--500档次
}


function x270109_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetGameOpenById( x270109_var_IsEnableId) <= 0 or GetDayOfYear() >243 then
        return
    end
	TalkAppendButton(varMap, x270109_var_FileId, "领取庆奥运活动奖励", 3,1)
end


function x270109_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt )
	if GetGameOpenById( x270109_var_IsEnableId) <= 0 then
        return
    end
    
    if idExt < 0 then
    	StartTalkTask(varMap)
    	TalkAppendString(varMap,"#Y"..x270109_var_QuestName)
    	TalkAppendString(varMap,"\t成吉思汗庆奥运回馈大礼，打开免费赠送的激情奥运纪念券即可获得大量金卡以及稀有道具！\n\t游戏中每消费满#R5两#W现金即可免费获得#R1#W张激情奥运纪念券，宁外消费额度到达100倍数更有额外份数纪念券奖励，消费越多奖励越多。")
    	for i, item in x270109_var_ItemTable do
    		TalkAppendButton(varMap, x270109_var_FileId, "领取回馈月奖励", 3, i)
    	end
    	StopTalkTask()
    	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
  
    elseif idExt == 1 then
			
		local count , ewaiaward = x270109_GetMoneyCost(varMap,varPlayer)
		local havecount = GetCashCostTotal(varMap, varPlayer)
	    local allcount = count+ewaiaward
	    WriteLog(1, format("show count in UI,putongCount:%d,ewaiCount:%d", count, ewaiaward))
	    local chae = format("#{_MONEY%d}",floor((100000 - mod(havecount,100000))))
	    --print(mod(havecount,100))
	    local str ="#R"
	    local strewai = ""
	    if ewaiaward >0 then
	    	strewai = "+#R"..ewaiaward.."#W份额外奖励"
	    end
		if allcount >=0 then
			StartTalkTask(varMap)          
			TalkAppendString(varMap, "#Y"..x270109_var_QuestName.."#W")
			TalkAppendString(varMap, "\t"..x270109_var_ItemTable[idExt].des)
			TalkAppendString(varMap, "你当前可领取奖励："..str..count.."#W份"..strewai)
			TalkAppendString(varMap, "\n#G小提示：你只需要再消费"..str..chae.."#G现金即可获得额外奖励！")
			if x270109_var_ItemTable[idExt].id ~= nil then
				AddQuestItemBonus(varMap, x270109_var_ItemTable[idExt].id, 1)
			end
			StopTalkTask()
			DeliverTalkInfo(varMap ,varPlayer, varTalknpc, x270109_var_FileId, -1)
		end
    end
end

function x270109_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end







function x270109_ProcAccept( varMap, varPlayer )

	local count , ewaiaward = x270109_GetMoneyCost(varMap,varPlayer)
	
    local allcount = count+ewaiaward

	if allcount ==0 then
		Msg2Player(varMap, varPlayer, format("很抱歉，你没有可领取的奖励"), 8, 3)
		Msg2Player(varMap, varPlayer, format("很抱歉，你没有可领取的奖励"), 8, 2)
		return
	end
	
	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位", 0, 3)
		return
	end
	
	StartItemTask( varMap )
	ItemAppendBind( varMap, x270109_var_ItemTable[1].id, allcount)
	local varRet = StopItemTask( varMap, varPlayer )
	if varRet > 0 then
		local yiaward =floor((GetCashCostTotal(varMap, varPlayer)/1000 - GetMoneyAwardTotal(varMap, varPlayer)/1000)/5)
		AddMoneyAwardTotal(varMap,varPlayer,5000*yiaward)
		DeliverItemListSendToPlayer(varMap,varPlayer)
		Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", allcount, x270109_var_ItemTable[1].id).."。", 8, 2)
		Msg2Player( varMap, varPlayer, format( "兑换完成，获得%d个#cffcf00@item_%d", allcount, x270109_var_ItemTable[1].id), 8, 3)
		WriteLog(1, format("get award,putongCount:%d,ewaiCount:%d", count, ewaiaward))
		for i = 1 ,allcount do
		GamePlayScriptLog( varMap, varPlayer, 3777)
		end
	else
		local varStr = "#Y背包空间不足，请整理背包后再试！"
		Msg2Player(varMap, varPlayer, varStr, 8, 3)
		Msg2Player(varMap, varPlayer, varStr, 8, 2)
		return
		
	end
end

function x270109_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x270109_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x270109_CheckSubmit( varMap, varPlayer )

end




function x270109_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x270109_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end




function x270109_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x270109_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end


function x270109_GetMoneyCost(varMap,varPlayer)

	local havecount = GetCashCostTotal(varMap, varPlayer)/1000 	--当前消费额度
    local isawarded = GetMoneyAwardTotal(varMap, varPlayer)/1000
    local	canaward = havecount - isawarded		   --当前可量去的奖励
    local count =floor(canaward/5) --可领取的普通奖励个数
    local ewaiaward = 0									   --可领取的额外奖励个数
    --print(havecount,isawarded,canaward,count)
  	local k = floor(isawarded/100)
  	local v = floor(havecount/100)
  	--print(k,v)
  	if k>=0 and v>0 and k<v and canaward>0 then
    	for i =k+1 , v  do
    		if i<=5 then
    			ewaiaward = ewaiaward+x270109_var_ewaibili[i]
    		elseif i > 5 then
    			ewaiaward = ewaiaward+x270109_var_ewaibili[5]
    		end
    		--print(ewaiaward)
    	end
  	end
	return count,ewaiaward
	
end
