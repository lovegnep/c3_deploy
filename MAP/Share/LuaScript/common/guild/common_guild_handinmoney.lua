
x300839_var_FileId = 300839


x300839_var_QuestName1 = "【帮会】帮会捐献"
x300839_var_QuestName2 = "【帮会】捐献10两现银"
x300839_var_QuestName3 = "【帮会】捐献100两现银"
x300839_var_QuestName4 = "【帮会】捐献1锭现银"

x300839_var_GuildLevelMoney   = {
                                 6000000, 
                                 8000000, 
                                20000000, 
                                24000000, 
                                42000000, 
                                48000000, 
                                54000000, 
                                60000000, 
                                66000000, 
}
x300839_var_GuildDayMoney	= 30000000
--DECLARE_QUEST_INFO_STOP--



function x300839_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, idExt)	

	if idExt == 1 then 

		local Readme_1 = "#Y【帮会】帮会捐献#r#W"
		
		local Readme_2 = "\t您可以通过捐献现银来增加#G帮会金钱#W，每捐献#G1两#W现银，帮会金钱也会增加#G1两#W，您每次捐献都会获得帮会活跃度和帮贡的奖励。每天整个帮会在未达到帮会金钱上限的条件下，最多可以接受#G30锭#W的捐献。"
		
		local Readme_3 = "#W#r#Y\t请选择您要捐献的现银数量。"
		
		local varReadme = Readme_1..Readme_2..Readme_3
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, varReadme);
		TalkAppendButton(varMap, x300839_var_FileId, x300839_var_QuestName2, 3, 2)
		TalkAppendButton(varMap, x300839_var_FileId, x300839_var_QuestName3, 3, 3)
		TalkAppendButton(varMap, x300839_var_FileId, x300839_var_QuestName4, 3, 4)
		DeliverTalkMenu(varMap,varPlayer,varTalknpc);
	
	elseif idExt == 2 then

		local Readme_1 = "#Y【帮会】捐献10两现银#r#W"
		
		local Readme_2 = "\t捐献10两现银，会增加#G10两帮会金钱#W，同时您将会获得#G1#W点帮会活跃度和#G1#W点帮贡。"
		
		local Readme_3 = "#W#r#Y\t您是否要进行帮会捐献？"
		
		local varReadme = Readme_1..Readme_2..Readme_3
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap);
		DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300839_var_FileId, -1 );
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 10000)
	elseif idExt == 3 then
			
		local Readme_1 = "#Y【帮会】捐献100两现银#r#W"
		
		local Readme_2 = "\t捐献100两现银，会增加#G100两帮会金钱#W，同时您将会获得#G10#W点帮会活跃度和#G10#W点帮贡。"
		
		local Readme_3 = "#W#r#Y\t您是否要进行帮会捐献？"
		
		local varReadme = Readme_1..Readme_2..Readme_3
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, varReadme);
		StopTalkTask(varMap);
		DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300839_var_FileId, -1 );
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 100000)
	elseif idExt == 4 then
		local Readme_1 = "#Y【帮会】捐献1锭现银#r#W"
		
		local Readme_2 = "\t捐献1锭现银，会增加#G1锭帮会金钱#W，同时您将会获得#G100#W点帮会活跃度和#G100#W点帮贡。"
		
		local Readme_3 = "#W#r#Y\t您是否要进行帮会捐献？"
		
		local varReadme = Readme_1..Readme_2..Readme_3
		
		StartTalkTask(varMap);
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);
		DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300839_var_FileId, -1 );
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 1000000)
	end
	
end




function x300839_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	if GetGuildID( varMap, varPlayer ) == -1 then
		
		return
	end
	
    TalkAppendButton(varMap, x300839_var_FileId, x300839_var_QuestName1, 3, 1)
    local gid = GetGuildID( varMap, varPlayer)
    if gid >= 0 then
        local varToday = GetDayOfYear()
        if varToday ~= GetGuildCacheFreeParam( gid, GD_GUILD_HANDIN_DATE) then
            SetGuildParam( gid, GD_GUILD_HANDIN_DATE, varToday)
            SetGuildParam( gid, GD_GUILD_HANDIN_MONEY, 0)
        end
    end
end





function x300839_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300839_ProcAccept( varMap, varPlayer)
    local money = GetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID)
    SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 0)
    local gmoney = GetGuildMoney( varMap, varPlayer)
    local glv = GetGuildLevel( varMap, varPlayer)
    local gid = GetGuildID( varMap, varPlayer)

    if gid < 0 then
		StartTalkTask(varMap);TalkAppendString(varMap, "您需要先加入一个帮会。");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"很抱歉，您不是帮会成员，无法进行帮会捐献。",8,2)
		return
    end

    if glv <= 0 then
        return
    end

	if GetGuildCacheFreeParam( gid, GD_GUILD_HANDIN_MONEY) >= x300839_var_GuildDayMoney then
        Msg2Player( varMap, varPlayer, "今天帮会捐献总额已达上限，请明天再来", 8, 3)
        return
    elseif GetGuildCacheFreeParam( gid, GD_GUILD_HANDIN_MONEY) + money > x300839_var_GuildDayMoney then
        Msg2Player( varMap, varPlayer, "捐献的数额超过今日帮会可捐上限，无法捐献", 8, 3)
        return
    end

    if gmoney + money > x300839_var_GuildLevelMoney[ glv] then
        Msg2Player( varMap, varPlayer, "帮会金钱接近或已到达上限，无法捐献", 8, 3)
        return
    end

	if GetMoney(varMap, varPlayer, 0) < money then
		StartTalkTask(varMap);TalkAppendString(varMap, "很抱歉，您的现银不足。");StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,"很抱歉，您的现银不足，无法进行帮会捐献。",8,2)
		return
	end

	CostMoney(varMap, varPlayer, 0, money, 310)
	StartTalkTask(varMap);TalkAppendString(varMap, format("扣除金钱#G#{_MONEY%d}#cFFCF00，获得帮贡#G"..tostring( money / 10000).."#cFFCF00点，帮会活跃度#G"..tostring( money / 10000).."#cFFCF00点", money));StopTalkTask(varMap);DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,format("【帮会】帮会捐献:扣除金钱#G#{_MONEY%d}#W", money),8,2)

	AddGuildUserPoint( varMap, varPlayer, money / 10000)
	Msg2Player(varMap,varPlayer,"获得帮贡#G"..tostring( money / 10000).."#cFFCF00点",8,2)

	AddGuildActivity( varMap, varPlayer, money / 10000)
	Msg2Player(varMap,varPlayer,"帮会活跃度增加#G"..tostring( money / 10000).."#cFFCF00点",8,2)

	AddGuildMoney( varMap, varPlayer, money)
	Msg2Player( varMap, varPlayer, format("%s慷慨捐助，使帮会金钱增加了#{_MONEY%d}。",GetName(varMap, varPlayer), money), 6)

    SetGuildParam( gid, GD_GUILD_HANDIN_MONEY, money + GetGuildCacheFreeParam( gid, GD_GUILD_HANDIN_MONEY) )
end




function x300839_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300839_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300839_CheckSubmit( varMap, varPlayer )

end




function x300839_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300839_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300839_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300839_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end


