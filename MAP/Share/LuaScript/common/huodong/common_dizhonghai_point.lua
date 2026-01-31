x310936_var_FileId 				= 310936                  
x310936_var_QuestName			= "【活动】冲卡迪兹征服度拿大奖"
x310936_var_QuestText			= "\n\t全新的地中海世界已经全面开放了，目前我们要尽快提高卡迪兹港的征服度，加快我们对地中海的扩张脚步。在11月22日前，卡迪兹港的征服度到达500点、1000点、1500点后，全服60级以上玩家都可以在我这里领取一份奖励。"
x310936_var_QuestName1			= {"【领取】500点征服度奖励", "【领取】1000点征服度奖励","【领取】1500点征服度奖励"}
x310936_var_Movement			= {}
x310936_var_strAddItemFailed	= "添加物品失败，请整理背包"
x310936_var_MD ={MD_ZHENGFUDU_LINGJIANG1,MD_ZHENGFUDU_LINGJIANG2,MD_ZHENGFUDU_LINGJIANG3}
x310936_var_Point ={500,1000,1500}
x310936_var_item =
{
{{item = 12010012,num =2},{item = 12054300,num =2},{item = 12266785,num =1}},
{{item = 11000937,num =5},{item = 11990050,num =2},{item = 12266785,num =2}},
{{item = 11000937,num =5},{item = 12041101,num =2},{item = 12266785,num =2}}
}

function x310936_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local year,month,day = GetYearMonthDay()
	if 	year ~=2011 or month ~= 11 or day > 21 then
		return
	end			
	

	TalkAppendButton(varMap,x310936_var_FileId,x310936_var_QuestName,3, 0)

end

function x310936_ProcEventEntry( varMap ,varPlayer, varTalknpc,idScript,idExt )
	local year,month,day = GetYearMonthDay()
	if 	year ~=2011 or month ~= 11 or day > 21 then
		return
	end			
	
	local  guid,Level50 = GetToplistInfo(varMap,0,49)
--	if Level50 <80 then
--		 Msg2Player(varMap, varPlayer, format("很抱歉，当前卡迪兹港征服度不足"), 0, 3)
--		return
--	end
	
	if GetLevel(varMap, varPlayer) <60 then
		Msg2Player(varMap, varPlayer, format("很抱歉，你的等级不足60级"), 0, 3)
		return
	end
	
	if idExt == 0 then
		StartTalkTask(varMap)          
		TalkAppendString(varMap, "#Y"..x310936_var_QuestName)
		TalkAppendString(varMap, x310936_var_QuestText )
		TalkAppendButton(varMap,x310936_var_FileId,x310936_var_QuestName1[1],3, 1)
		TalkAppendButton(varMap,x310936_var_FileId,x310936_var_QuestName1[2],3, 2)
		TalkAppendButton(varMap,x310936_var_FileId,x310936_var_QuestName1[3],3, 3)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310936_var_FileId, -1)
	else
		x310936_GiveReward( varMap, varPlayer,idExt)	
	end	
end

function x310936_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
end


function x310936_GiveReward( varMap, varPlayer, idExt)
	if idExt > 3 or idExt < 1 or  idExt == nil then
		return
	end

	if x310936_CheckMD( varMap, varPlayer, x310936_var_MD[idExt]) ==0 then
		Msg2Player(varMap, varPlayer, "你已经领取过这个奖励了", 0, 3)
		return
	end


	if GetCountryParam(varMap,0,CD_COUNTRY_DIZHONGHAI_POINT) <x310936_var_Point[idExt] then
	Msg2Player(varMap, varPlayer, format("当前卡迪兹港征服度不足%d点，不能领取此奖励",x310936_var_Point[idExt]), 0, 3)
	return
	end


	StartItemTask(varMap)
	ItemAppendBind( varMap, x310936_var_item[idExt][1].item,x310936_var_item[idExt][1].num)	
	ItemAppendBind( varMap, x310936_var_item[idExt][2].item,x310936_var_item[idExt][2].num)	
	ItemAppendBind( varMap, x310936_var_item[idExt][3].item,x310936_var_item[idExt][3].num)	
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,"领取奖励完成,获得#G@item_"..x310936_var_item[idExt][1].item.."、#G@item_"..x310936_var_item[idExt][2].item.."和#G银卡包")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverItemListSendToPlayer(varMap,varPlayer)
			x310936_SetMD( varMap, varPlayer, x310936_var_MD[idExt], 1)
			local logid =3006+idExt
			GamePlayScriptLog( varMap, varPlayer,logid )
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有3个背包空间！")	
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
	end
	

--	local itemid = 0
--	if GetCurrentTime() >= 1301965200 and GetDayOfYear() <= 100 then
--		itemid = x310936_var_PresentID[1]
--	elseif GetCurrentTime() >= 1304298000	 and GetDayOfYear() <= 128 then
--		itemid = x310936_var_PresentID[2]
--	end
--	
--    if varItem ~= 0 then
--    	StartItemTask( varMap)
--        ItemAppendBind( varMap, itemid, 1)
--    	local bRes = StopItemTask( varMap, varPlayer)
--    	if bRes == 0 then
--    		Msg2Player( varMap, varPlayer, x310936_var_strAddItemFailed, 8, 3)
--    		return
--    	else
--    		DeliverItemListSendToPlayer( varMap, varPlayer)
--    		if itemid == x310936_var_PresentID[1] then
--    			x310936_SetMD( varMap, varPlayer, MD_CHONGJUNJIE_GETPERSENT1, 1)
--    		elseif itemid == x310936_var_PresentID[2] then
--    			x310936_SetMD( varMap, varPlayer, MD_CHONGJUNJIE_GETPERSENT2, 1)
--    		end
--    		WriteLog(1, format("x310936_GiveReward SceneId=%d PlayerGUID=%u GetItem=%d", varMap, GetGUID(varMap, varPlayer), itemid))
--    	end
--    end 
--    		
end


function x310936_GetMD( varMap, varPlayer, mdName)
    return GetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310936_SetMD( varMap, varPlayer, mdName, value)
    SetPlayerGameData( varMap, varPlayer, mdName[ 1], mdName[ 2], mdName[ 3], value)
end


function x310936_CheckMD( varMap, varPlayer, mdName)
		if x310936_GetMD( varMap, varPlayer, mdName) >=1 then
			return 0
		end
		return 1
end
