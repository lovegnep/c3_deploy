x300836_var_FileId = 300836
x300836_var_QuestName = "【帮会】帮务发布"
x300836_var_QuestInfo = {
							{ 
								varId=GD_GUILD_INDEX_MULTI_MISSION_HUSHOU,
								varName="【帮会】护兽令",
								varReadme="#Y【帮会】帮务发布#r#W\t发布【帮会】护兽令根据帮会等级不同需要消耗数量不同的#Y帮会金钱#W。如果您确定发布【帮会】帮会神兽多倍，您帮会内所有成员在#R2小时内#W完成当天【帮会】帮会神兽任务时，将会获得#G2倍经验和帮贡#W，帮主获得#G4倍经验和帮贡#W，副帮主获得#G3倍经验和帮贡#W。#r",
								money = {1000,1000,1000,1000,1000,1000,1000,1000,1000,}
							},
							
							{ 
								varId=GD_GUILD_INDEX_MULTI_MISSION_HEIMU,
								varName="【帮会】图腾令",
								varReadme="#Y【帮会】帮务发布#r#W\t发布【帮会】图腾令根据帮会等级不同需要消耗数量不同的#Y帮会金钱#W。如果您确定发布【帮会】帮会图腾多倍，您帮会内所有成员在#R2小时内#W完成当天【帮会】帮会图腾任务时，将会获得#G2倍经验和帮贡#W，帮主获得#G4倍经验和帮贡#W，副帮主获得#G3倍经验和帮贡#W。#r",
                                money = {1000,1000,1000,1000,1000,1000,1000,1000,1000,}
							},
							
							{ 
								varId=GD_GUILD_INDEX_MULTI_MISSION_ANZHAN,
								varName="【帮会】暗战令",
								varReadme="#Y【帮会】帮务发布#r#W\t发布【帮会】帮会暗战令根据帮会等级不同需要消耗数量不同的#Y帮会金钱#W。如果您确定发布【帮会】帮会暗战多倍，您帮会内所有成员在#R2小时内#W完成当天【帮会】帮会暗战任务时，将会获得#G2倍经验和帮贡#W，帮主获得#G4倍经验和帮贡#W，副帮主获得#G3倍经验和帮贡#W。#r",
                                money = {1000,1000,1000,1000,1000,1000,1000,1000,1000,}
							},
							
							{ 
								varId=GD_GUILD_INDEX_MULTI_MISSION_CHUYAO,
								varName="【帮会】除魔令",
								varReadme="#Y【帮会】帮务发布#r#W\t发布【帮会】除魔令根据帮会等级不同需要消耗数量不同的#Y帮会金钱#W。如果您确定发布【帮会】帮会除魔多倍，您帮会内所有成员在#R2小时内#W完成当天【帮会】帮会除魔任务时，将会获得#G2倍经验和帮贡#W，帮主获得#G4倍经验和帮贡#W，副帮主获得#G3倍经验和帮贡#W。#r",
                                money = {1000,1000,1000,1000,1000,1000,1000,1000,1000,}
							},
							
							{ 
								varId=GD_GUILD_INDEX_MULTI_MISSION_MUJI,
								varName="【帮会】募集令",
								varReadme="#Y【帮会】帮务发布#r#W\t发布【帮会】募集令根据帮会等级不同需要消耗数量不同的#Y帮会金钱#W。如果您确定发布【帮会】帮会募集多倍，您帮会内所有成员在#R2小时内#W提交【帮会】帮会募集时，将会获得#G2倍经验和帮贡#W，帮主获得#G4倍经验和帮贡#W，副帮主获得#G3倍经验和帮贡#W。#r",
                                money = {1000,1000,1000,1000,1000,1000,1000,1000,1000,}
							},
						}


x300836_var_ElapseTime = 2*60*60	


function x300836_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if GetGuildID( varMap, varPlayer ) == -1 then
 		
		return
	end
	
	TalkAppendButton(varMap,300836,x300836_var_QuestName,8,0)


end


function x300836_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)

	if varIndex == 0 then
		local varReadme = "#Y【帮会】帮务发布#r#W\t尊敬的帮主您好#G3级帮会#W以上帮主可以在我这里发布帮务任务！#G每日晚22点前#W只能进行#G一次#W帮务发布。您可以选择以下按钮来发布帮会多倍任务："
		local guildid = GetGuildID(varMap,varPlayer)
		StartTalkTask(varMap);
		for varI,item in x300836_var_QuestInfo do
			if GetGuildCacheFreeParam(guildid,item.varId) == -1 then
				TalkAppendButton(varMap,300836,item.varName.."(未发布)",3,item.varId)
			else
				TalkAppendButton(varMap,300836,item.varName.."(已发布)",3,item.varId)
			end
		end	
		TalkAppendString(varMap,varReadme);
		StopTalkTask(varMap);
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		
	elseif varIndex < 100 then
		for varI,item in x300836_var_QuestInfo do
			if item.varId == varIndex then
				 varReadme = item.varReadme			
				break
			end
		end
		
		local money = x300836_GetDeductMoneyNum(varMap, varPlayer,varIndex)
		local ding = floor( money / (1000*1000) )
		local liang = floor( mod(money,1000*1000)/ 1000 )
		local wen = mod(money,1000)
		
		local varStr = format("#Y需要消耗帮会金钱：%d锭%d两%d文",ding,liang,wen)		
		StartTalkTask(varMap);
		TalkAppendButton(varMap,300836,"确定..",3,varIndex+100)
		TalkAppendString(varMap,varReadme);
		TalkAppendString(varMap,varStr);
		StopTalkTask(varMap);
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		
	else
		if GetGuildOfficial(varMap, varPlayer) ~= 5 and GetGuildOfficial(varMap, varPlayer) ~= 4 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，只有帮主（副帮主）才能发布帮务任务！");
				DeliverTalkTips(varMap,varPlayer)	
				StopTalkTask(varMap)
				Msg2Player(varMap,varPlayer,"很抱歉，只有帮主（副帮主）才能发布帮务任务！",8,2)
			return
		end
		local GuildLevel = GetGuildSimpleData(GetGuildID( varMap, varPlayer ))
		if GuildLevel <3 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您的帮会等级不足3级！");
			DeliverTalkTips(varMap,varPlayer)	
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，您的帮会等级不足3级！",8,2)
			return
		end
		local hour,minute,second = GetHourMinSec()
		if ( hour < 22) then
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，请在22：00前发布帮务任务。");
			DeliverTalkTips(varMap,varPlayer)	
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，请在22：00前发布帮务任务。",8,2)
			return 
		end
			
		
		local op = varIndex - 100
		GetGuildQuestData(varMap,varPlayer,GD_GUILD_INDEX_MULTI_MISSION_TODAY,x300836_var_FileId,op,"ProcReturn1")
	end
	
end

function x300836_ProcReturn1(varMap, varPlayer,QuestData,varQuest,varTalknpc)

	if GetGuildOfficial(varMap, varPlayer) ~= 5 and GetGuildOfficial(varMap, varPlayer) ~= 4 then
		return
	end
	
	local op = varQuest
	if QuestData~=-1 then 
		StartTalkTask(varMap)
		TalkAppendString(varMap, "今天已发布过一次任务，请明日再发！");
		DeliverTalkTips(varMap,varPlayer)	
		StopTalkTask(varMap)
		Msg2Player(varMap,varPlayer,"很抱歉，您今天已发布过一次任务，请明日再发！",8,2)
		return	
	end
	
	GetGuildQuestData(varMap,varPlayer,op,x300836_var_FileId,op,"ProcReturn2")		
	
end

function x300836_ProcReturn2(varMap, varPlayer,QuestData,varQuest,varTalknpc)
	if QuestData ~= -1 then
 		StartTalkTask(varMap)
		TalkAppendString(varMap, "你已发布过该任务");
		StopTalkTask(varMap)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc)		
		return
	end
	local op = varQuest
	local money = x300836_GetDeductMoneyNum(varMap, varPlayer,op)
		if GetGuildMoney(varMap, varPlayer) < money then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "很抱歉，您帮会内的帮会金钱不足！");
			DeliverTalkTips(varMap,varPlayer)	
			StopTalkTask(varMap)
			Msg2Player(varMap,varPlayer,"很抱歉，您帮会内的帮会金钱不足！",8,2)
			return
		end
	if GetGuildOfficial(varMap, varPlayer) ~= 5 and GetGuildOfficial(varMap, varPlayer) ~= 4 then
		return
	end
	
	local guildid = GetGuildID(varMap,varPlayer)
	SetGuildQuestData(varMap,guildid,op,GetCurrentTime())
	SetGuildQuestData(varMap,guildid,GD_GUILD_INDEX_MULTI_MISSION_TODAY,op)
	local varReadme = ""
	StartTalkTask(varMap)

	for varI,item in x300836_var_QuestInfo do
		if item.varId == op then
		varReadme = item.varName			
		break
		end
	end

	TalkAppendString(varMap, "您顺利发布了"..varReadme.."多倍任务");
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	Msg2Player(varMap,varPlayer,"帮主（副帮主）发布了"..varReadme.."多倍任务，2小时内回复该任务双倍奖励！",6,2)
	SubGuildMoney(varMap, varPlayer,money)
end

function x300836_GetDeductMoneyNum(varMap,varPlayer,QuestType)

	local GuildLevel,xx1,xx2 = GetGuildSimpleData(GetGuildID(varMap, varPlayer))
	for varI,item in x300836_var_QuestInfo do
		if item.varId == QuestType then
			return item.money[GuildLevel];
		end
	end
	
	
	return -1;
end



function x300836_ProcQuestAccept( varMap, varPlayer, varTalknpc )
	
end




function x300836_ProcAccept( varMap, varPlayer )
	
	if GetGuildOfficial(varMap, varPlayer) ~= 5 and GetGuildOfficial(varMap, varPlayer) ~= 4 then
		return
	end
	
	GetGuildQuestData(varMap, varPlayer,-1,x300836_var_FileId)
end




function x300836_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300836_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300836_CheckSubmit( varMap, varPlayer )

end




function x300836_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300836_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300836_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300836_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
