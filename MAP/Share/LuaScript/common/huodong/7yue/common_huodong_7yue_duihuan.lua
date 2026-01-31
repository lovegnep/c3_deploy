

x302530_var_FileId = 302530   
x302530_var_QuestName = ""
x302530_var_QuestInfo = ""
x302530_var_QuestError = ""

--DECLARE_QUEST_INFO_STOP--



function x302530_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

			if seleteId == 19 then
				
				x302530_Accept( varMap, varPlayer, varTalknpc ,seleteId )

			end
			if seleteId == 12 then 
				StartTalkTask(varMap)
				TalkAppendString(varMap, "天狼盔甲碎片兑换")
				TalkAppendString(varMap, "\t谢谢您帮助我击退天狼国的敌人。\n\t您可以用8个天狼盔甲碎片和15两现银兑换1个奶油冰棍（赠品）")
				TalkAppendString(varMap, "您是否要立即兑换？")
				TalkAppendButton(varMap,x302530_var_FileId,"兑换",3,20)				
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)
				return
			end
			if seleteId == 20 then
				x302530_Accept( varMap, varPlayer, varTalknpc ,seleteId )
			end
end


function x302530_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
			TalkAppendButton(varMap,x302530_var_FileId,"【兑换】天狼盔甲碎片",3,12)


end

function x302530_GiftNum(varMap, varPlayer)
	local num = x302530_GetDataNum(varMap, varPlayer)
	if num >= 5 then
		return 1
	else
		return 0
	end
end
function x302530_GetDataNum(varMap, varPlayer)
	return GetPlayerGameData( varMap, varPlayer, MD_KILLMON_NUM[ 1], MD_KILLMON_NUM[ 2], MD_KILLMON_NUM[ 3] )
end
function x302530_GetData(varMap, varPlayer)
	return GetPlayerGameData( varMap, varPlayer, MD_MONATTR_DAY[ 1], MD_MONATTR_DAY[ 2], MD_MONATTR_DAY[ 3] )
end
function x302530_SetGiftDate(varMap, varPlayer,value)
	return SetPlayerGameData( varMap, varPlayer, MD_DAY_GIFT[ 1], MD_DAY_GIFT[ 2], MD_DAY_GIFT[ 3], value)
end
function x302530_GetGiftDate(varMap, varPlayer)
	return GetPlayerGameData( varMap, varPlayer, MD_DAY_GIFT[ 1], MD_DAY_GIFT[ 2], MD_DAY_GIFT[ 3] )
end


function x302530_ProcAccept( varMap, varPlayer )
end

--主运行函数
function x302530_Accept( varMap, varPlayer, varTalknpc ,seleteId )
	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位。", 0, 2)
		Msg2Player(varMap, varPlayer, "很抱歉，至少1个背包空位", 0, 3)
		return 0
	end
	if seleteId == 19 then
			
	  local day = GetDayOfYear() - 190
		if day == x302530_GetGiftDate(varMap, varPlayer) then
				Msg2Player( varMap, varPlayer, "您已领取过奖励", 8, 3)
				return
		end
		if x302530_GetData(varMap, varPlayer) ~= day then
				Msg2Player( varMap, varPlayer, "您今日击杀的天狼国战士数量不足", 8, 3)
				return
				
		end
		local num = x302530_GiftNum(varMap, varPlayer)
		if num == 0 then 
			Msg2Player( varMap, varPlayer, "您没有可领取的奖励", 8, 3)
			return
		end
		if num ~= 0 then 
				StartItemTask( varMap)
					ItemAppendBind( varMap, 12110217, num)
					if StopItemTask( varMap, varPlayer) == 0 then
		    		Msg2Player( varMap, varPlayer, "背包已满，无法获得奖励", 8, 3)
		    		return
		    	else
		    		Msg2Player( varMap, varPlayer,format( "恭喜您获得了#G骁勇战将礼包%d个",num ), 8, 3)
		    		DeliverItemListSendToPlayer( varMap, varPlayer)
		    		x302530_SetGiftDate(varMap, varPlayer,day)
		    		GamePlayScriptLog( varMap, varPlayer, 3840)
		    		--判断是否领取过
					end
		end
	elseif  seleteId == 20 then
		
			if GetItemCount(varMap, varPlayer,12110216) < 8 then
				Msg2Player( varMap,varPlayer,"您的天狼盔甲碎片不足！",8,3)
				return
			end
			if CostMoney(varMap, varPlayer, 0, 15000,524) ~= 1 then
				Msg2Player( varMap,varPlayer,"您的现银不足！",8,3)
				return
			end
			StartItemTask(varMap)
			ItemAppendBind( varMap, 12032019, 1)	
			
			local ret = StopItemTask(varMap,varPlayer)
			if ret > 0 then 
				if DelItemByIDInBag(varMap, varPlayer,12110216,8) == 1 then
				  varMsg ="恭喜您获得奖励"
					Msg2Player( varMap,varPlayer,varMsg,8,2) ;			
					Msg2Player( varMap,varPlayer,varMsg,8,3) ;
		   		--GamePlayScriptLog( varMap, varPlayer, 3740)
		   		DeliverItemListSendToPlayer( varMap, varPlayer)
		   		GamePlayScriptLog( varMap, varPlayer, 3841)
				else
					Msg2Player( varMap,varPlayer,"您的天狼盔甲碎片或现银不足！",8,3) 
					return
				end
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足！")	
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return
			end

	end


end

		
function x302530_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x302530_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x302530_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x302530_CheckSubmit( varMap, varPlayer )

end




function x302530_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x302530_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x302530_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x302530_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
