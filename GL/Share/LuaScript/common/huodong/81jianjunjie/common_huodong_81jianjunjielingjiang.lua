--DECLARE_QUEST_INFO_START--

x302542_var_FileId = 302542   

x302542_var_QuestName = ""
x302542_var_QuestInfo = ""
x302542_var_QuestError = ""


--DECLARE_QUEST_INFO_STOP--



function x302542_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	

			if seleteId == 199 then	
				if a = b + 16 then
					x302542_Accept( varMap, varPlayer, varTalknpc ,seleteId )
				else
					Msg2Player(varMap, varPlayer,"请到您国家的阵营处领取！",8,3)
				end
			end
end


function x302542_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
				local a =GetMonsterCamp(varMap, varTalknpc)
				local b =GetCurCountry( varMap, varPlayer)
				
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y八一军事演习")
				TalkAppendString(varMap,"\t#W在7月31日至8月6日，每晚#R10:00#W到#R21:00#W,攻占任何一块营地将会获得一份奖励")   
				TalkAppendButton(varMap,x302542_var_FileId,"【活动】八一军事演习奖励领取",13,199);
				StopTalkTask()
				

end

function x302542_ProcAccept( varMap, varPlayer )
end

function x302542_Accept( varMap, varPlayer, varTalknpc ,seleteId )

	local day = GetDayOfYear()
	local level = GetLevel(varMap, varPlayer)
	if day ~= x302542_GetDayMD(varMap, varPlayer) then	
		local country = GetCurCountry(varMap, varPlayer) + 1
		local num = LuaCallNoclosure( 302538, "giveGift1", country)	
		if num > 0 then
			if GetBagSpace(varMap, varPlayer) < 1 then
				Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
				Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
				return 0
			end
			AddExp(varMap, varPlayer,level*5000 )
			StartItemTask(varMap)
				ItemAppendBind( varMap, 12032030, 5)  --灵力符
				ItemAppendBind( varMap, 11000715, 1)  --天外焚石
			local varRet = StopItemTask(varMap,varPlayer)
			if varRet > 0 then
					DeliverItemListSendToPlayer(varMap,varPlayer)
					Msg2Player(varMap, varPlayer,"您获得5个灵力符1个天外焚石",8,3)
					x302542_SetDayMD(varMap, varPlayer, day)
					x302542_SetMD(varMap, varPlayer, 1)
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"物品栏已满，无法获得物品！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return
			end
		else
				Msg2Player(varMap, varPlayer,"对不起您所在的国家没有占领营地，无法获得奖励",8,2)
				Msg2Player(varMap, varPlayer,"对不起您所在的国家没有占领营地，无法获得奖励",8,3)
				return
		end
	else
				Msg2Player(varMap, varPlayer,"您已经领取过该奖励",8,3)
	end

end

function x302542_GetDayMD(varMap, varPlayer)
		GetPlayerGameData( varMap, varPlayer, MD_JIANJUNDAY[ 1], MD_JIANJUNDAY[ 2], MD_JIANJUNDAY[ 3] )		
end
function x302542_SetDayMD(varMap, varPlayer, num)
		SetPlayerGameData( varMap, varPlayer, MD_JIANJUNDAY[ 1], MD_JIANJUNDAY[ 2], MD_JIANJUNDAY[ 3] ,num)	
end
function x302542_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x302542_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x302542_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x302542_CheckSubmit( varMap, varPlayer )

end




function x302542_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x302542_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x302542_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x302542_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
