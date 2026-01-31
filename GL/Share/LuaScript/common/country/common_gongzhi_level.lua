

function x300656_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap,300656,"【活动】领取测试费",3,1)
end


function x300656_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)
	local x300656Readme = ""
	local Readme_0 = "#Y【活动】领取测试费#W#r"
	local Readme_3 = "#w\t当您的等级为20级~69级之间时，您可以通过我领取相应的测试费，等级低于20级将不能领取测试费，如果您忘记了领取并超过了相应的等级，我会一次性补偿您错过的测试费。#r#r注：测试费的货币类型为（金卡） #r"
	local Readme_4  = "#G\t 等级          测试费#W"
	local Readme_6  = "#r\t20~29级      2两"
	local Readme_7  = "#r\t30~39级      4两"
	local Readme_8  = "#r\t40~49级      8两"
	local Readme_9  = "#r\t50~59级     18两"
	local Readme_10 = "#r\t60~69级     36两"
	local Readme_6_1  = "#r#d\t20~29级   已领取   2两#W"
	local Readme_7_1  = "#r#d\t30~39级   已领取   4两#W"
	local Readme_8_1  = "#r#d\t40~49级   已领取   8两#W"
	local Readme_9_1  = "#r#d\t50~59级   已领取  18两#W"
	local Readme_10_1 = "#r#d\t60~69级   已领取  36两#W"
	local level_1 = GetPlayerGameData(varMap, varPlayer, MD_LEVELUP_LEVEL[1], MD_LEVELUP_LEVEL[2], MD_LEVELUP_LEVEL[3])
	if level_1 < 2 then
		x300656Readme = Readme_0..Readme_3..Readme_4..Readme_6..Readme_7..Readme_8..Readme_9..Readme_10
	elseif level_1 == 2 then
		x300656Readme = Readme_0..Readme_3..Readme_4..Readme_6_1..Readme_7..Readme_8..Readme_9..Readme_10
	elseif level_1 == 3 then
		x300656Readme = Readme_0..Readme_3..Readme_4..Readme_6_1..Readme_7_1..Readme_8..Readme_9..Readme_10
	elseif level_1 == 4 then
		x300656Readme = Readme_0..Readme_3..Readme_4..Readme_6_1..Readme_7_1..Readme_8_1..Readme_9..Readme_10
	elseif level_1 == 5 then
		x300656Readme = Readme_0..Readme_3..Readme_4..Readme_6_1..Readme_7_1..Readme_8_1..Readme_9_1..Readme_10
	elseif level_1 == 6 then
		x300656Readme = Readme_0..Readme_3..Readme_4..Readme_6_1..Readme_7_1..Readme_8_1..Readme_9_1..Readme_10_1
	elseif level_1 > 6 then
		x300656Readme = Readme_0..Readme_3..Readme_4..Readme_6_1..Readme_7_1..Readme_8_1..Readme_9_1..Readme_10_1
	end						
	StartTalkTask(varMap);TalkAppendString(varMap,x300656Readme);StopTalkTask(varMap);DeliverTalkInfo(varMap, varPlayer, varTalknpc, 300656, -1)

end


function x300656_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	local pkMode = GetPlayerPKMode( varMap, varPlayer)
	local pkValue = GetPKValue( varMap, varPlayer)
	if pkMode == 2 then
		StartTalkTask( varMap);TalkAppendString( varMap, "很抱歉，您已开启了PK模式或您的PK值过高，无法使用此模块" );StopTalkTask();DeliverTalkTips( varMap, varPlayer)
		return
	end

	
		local x300656gongzhi2 = 0
		local varLevel = GetLevel(varMap,varPlayer)
		local level_3 = GetPlayerGameData(varMap, varPlayer, MD_LEVELUP_LEVEL[1], MD_LEVELUP_LEVEL[2], MD_LEVELUP_LEVEL[3])
		
		if varLevel < 20 then		
			StartTalkTask(varMap);TalkAppendString(varMap,"测试费领取失败");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer);Msg2Player(varMap,varPlayer,"很抱歉，您的等级小于20级，无法领取测试费！",8,2)
			return			
		else
			if level_3 == 0 then
				if varLevel >= 20 and varLevel <= 29 then
					x300656gongzhi2 = 2	
				elseif varLevel >= 30 and varLevel <= 39 then
					x300656gongzhi2 = 2 + 4
				elseif varLevel >= 40 and varLevel <= 49 then
					x300656gongzhi2 = 2 + 4 + 8
				elseif varLevel >= 50 and varLevel <= 59 then
					x300656gongzhi2 = 2 + 4 + 8 + 18
				elseif varLevel >= 60 then
					x300656gongzhi2 = 2 + 4 + 8 + 18 + 36
				end
			elseif level_3 == 2 then
				if varLevel >= 20 and varLevel <= 29 then
					Msg2Player(varMap,varPlayer,"很抱歉，您已经领取过当前等级的测试费！",8,2)
					return
				elseif varLevel >= 30 and varLevel <= 39 then
					x300656gongzhi2 = 4
				elseif varLevel >= 40 and varLevel <= 49 then
					x300656gongzhi2 = 4 + 8
				elseif varLevel >= 50 and varLevel <= 59 then
					x300656gongzhi2 = 4 + 8 + 18
				elseif varLevel >= 60 then
					x300656gongzhi2 = 4 + 8 + 18 + 36
				end		
			elseif level_3 == 3 then
				if varLevel >= 20 and varLevel <= 39 then
					Msg2Player(varMap,varPlayer,"很抱歉，您已经领取过当前等级的测试费！",8,2)
					return
				elseif varLevel >= 40 and varLevel <= 49 then
					x300656gongzhi2 = 8
				elseif varLevel >= 50 and varLevel <= 59 then
					x300656gongzhi2 = 8 + 18
				elseif varLevel >= 60 then
					x300656gongzhi2 = 8 + 18 + 36
				end
			elseif level_3 == 4 then
				if varLevel >= 20 and varLevel <= 49 then
					Msg2Player(varMap,varPlayer,"很抱歉，您已经领取过当前等级的测试费！",8,2)	
					return
				elseif varLevel >= 50 and varLevel <= 59 then
					x300656gongzhi2 = 18
				elseif varLevel >= 60 then
					x300656gongzhi2 = 18 + 36
				end									
			elseif level_3 == 5 then
				if varLevel >= 20 and varLevel <= 59 then
					Msg2Player(varMap,varPlayer,"很抱歉，您已经领取过当前等级的测试费！",8,2)
					return	
				elseif varLevel >= 60 then
					x300656gongzhi2 = 36
				end
			elseif level_3 >= 6 then
					Msg2Player(varMap,varPlayer,"您已经领取过全部等级的测试费！",8,2)
					return
			end
			
			AddMoney(varMap,varPlayer,3,x300656gongzhi2*1000, 100)
			local level_2 = floor ( ( GetLevel ( varMap , varPlayer ) ) / 10 )
			SetPlayerGameData(varMap,varPlayer,MD_LEVELUP_LEVEL[1],MD_LEVELUP_LEVEL[2], MD_LEVELUP_LEVEL[3], level_2)
			Msg2Player(varMap,varPlayer,"恭喜您，您获得了测试费：#r金卡：#R"..x300656gongzhi2.."两。",8,2)
		end			

end







function x300656_ProcAccept( varMap, varPlayer )
end




function x300656_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300656_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300656_CheckSubmit( varMap, varPlayer )

end




function x300656_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300656_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300656_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300656_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end



