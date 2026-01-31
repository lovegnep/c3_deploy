--------------------------
--春节补偿
--------------------------

x310808_g_ScriptId 		= 	310808
x310808_g_MissionName 	=	{{id = 1, name = "【国家内政】春节补偿"}}--, {id = 2, name = "【轮回台】春节补偿"}, {id = 3, name = "【三环副本】春节补偿"}, {id = 4, name = "【圣山地宫】春节补偿"}}
x310808_g_MenuSlect		=	{}
x310808_g_SanhuanExp	=
{
{level = 60,  nexp = 4821120},
{level = 65,  nexp = 5209920},
{level = 70,  nexp = 5598720},
{level = 75,  nexp = 20124720},
{level = 80,  nexp = 21431520},
{level = 85,  nexp = 22738320},
{level = 90,  nexp = 24045120},
{level = 95,  nexp = 25351920},
{level = 100, nexp = 26658720},
{level = 105, nexp = 27965520},
{level = 110, nexp = 29272320},
}

x310808_g_ShengshanExp	=
{
{level = 60,  nexp = 4354000},
{level = 70,  nexp = 5070000},
{level = 75,  nexp = 13186800},
{level = 80,  nexp = 14018400},
{level = 85,  nexp = 14850000},
{level = 90,  nexp = 15674900},
{level = 95,  nexp = 16508240},
{level = 100, nexp = 17337120},
}

x310808_g_LunhuitaiExp	=
{
{level = 60, nexp = 32000 * 3},
{level = 75, nexp = 32000 * 4},
{level = 85, nexp = 32000 * 5},
}

function x310808_ProcEnumEvent(sceneId, selfId, targetId, MissionId)
	for i, item in x310808_g_MissionName do
		TalkAppendButton(sceneId, x310808_g_ScriptId, item.name, 3, item.id)
	end    
end

function x310808_ProcEventEntry(sceneId, selfId, targetId, MissionId ,NameId )
	local level = GetLevel( sceneId, selfId)
	local ativetime = GetDayOfYear() - 45
	if level < 60 then
		Msg2Player( sceneId, selfId, "很抱歉，你的等级未达到#R60级！", 8, 2)
		Msg2Player( sceneId, selfId, "很抱歉，你的等级未达到#R60级！", 8, 3)		
		return
	end
	if ativetime < 0 then
		Msg2Player( sceneId, selfId, "请您在#G2011#cffcf00年#G2#cffcf00月#G14#cffcf00日之后再来领取相应奖励！", 8, 3)	
		return
	end
	if ativetime > 13 then
		Msg2Player( sceneId, selfId, "活动已关闭！", 8, 3)	
		return
	end
		
	if NameId == 1 then 
		x310808_g_MenuSlect[GetGUID(sceneId, selfId)] = NameId
		local num = x310808_GetMD( sceneId, selfId, MD_2011CJBC_QUEST_NEIZHENG)
		local n = 21 - num
		if n < 0 then
			n = 0 
		end
		local Exp = n * 25000 * level	
		local str = format("\t您是否要领取春节期间错过的经验奖励？\n\t您总共可以领取#R%d#W天的%s。",n ,x310808_g_MissionName[x310808_g_MenuSlect[GetGUID(sceneId, selfId)]].name)
        StartTalkTask( sceneId)
        TalkAppendString( sceneId, "#Y"..x310808_g_MissionName[NameId].name)
        TalkAppendString( sceneId, str )
        TalkAppendString( sceneId, "\n")
        TalkAppendString( sceneId, "#Y奖励内容：")
        TalkAppendString( sceneId, format("经验值:%u点", Exp))
        StopTalkTask( sceneId)
        if num < 22 then
			DeliverTalkInfo(sceneId, selfId, targetId, x310808_g_ScriptId, -1)
		else
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 2)
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 3)			
		end
		
	elseif NameId == 2 then
		x310808_g_MenuSlect[GetGUID(sceneId, selfId)] = NameId
		local num = x310808_GetMD( sceneId, selfId, MD_2011CJBC_FUBEN_LUNHUITAI)
		local n = 21 - num
		if n < 0 then
			n = 0 
		end		
		local Exp = x310808_GetLunhuitaiExp( sceneId, selfId, Exp)
		local str = format("\t您是否要领取春节期间错过的经验奖励？\n\t您总共可以领取#R%d#W天的%s。",n ,x310808_g_MissionName[x310808_g_MenuSlect[GetGUID(sceneId, selfId)]].name)	
        StartTalkTask( sceneId)
        TalkAppendString( sceneId, "#Y"..x310808_g_MissionName[NameId].name)
        TalkAppendString( sceneId, str )
        TalkAppendString( sceneId, "\n")
        TalkAppendString( sceneId, "#Y奖励内容：")
        TalkAppendString( sceneId, format("经验值:%u点", Exp))        
        StopTalkTask( sceneId)
        if num < 22 then
			DeliverTalkInfo(sceneId, selfId, targetId, x310808_g_ScriptId, -1)
		else
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 2)
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 3)			
		end

	elseif NameId == 3 then
		x310808_g_MenuSlect[GetGUID(sceneId, selfId)] = NameId			
		local num = x310808_GetMD( sceneId, selfId, MD_2011CJBC_FUBEN_SANHUAN)
		local n = 63 - num
		if n < 0 then
			n = 0 
		end			
		local Exp = x310808_GetSanhuanExp( sceneId, selfId, Exp)	
		local str = format("\t您是否要领取春节期间错过的经验奖励？\n\t您总共可以领取#R%d#W次的%s。",n ,x310808_g_MissionName[x310808_g_MenuSlect[GetGUID(sceneId, selfId)]].name)	
        StartTalkTask( sceneId)
        TalkAppendString( sceneId, "#Y"..x310808_g_MissionName[NameId].name)
        TalkAppendString( sceneId, str )
        TalkAppendString( sceneId, "\n")
        TalkAppendString( sceneId, "#Y奖励内容：")
        TalkAppendString( sceneId, format("经验值:%d点", Exp))
        StopTalkTask( sceneId)
        if num < 63 then
			DeliverTalkInfo(sceneId, selfId, targetId, x310808_g_ScriptId, -1)
		else
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 2)
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 3)			
		end
					
	elseif NameId == 4 then
		x310808_g_MenuSlect[GetGUID(sceneId, selfId)] = NameId	
		local num = x310808_GetMD( sceneId, selfId, MD_2011CJBC_FUBEN_SHENGSHAN)
		local n = 21 - num
		if n < 0 then
			n = 0 
		end			
		local Exp = x310808_g_GetShengshanExp( sceneId, selfId, Exp)
		local str = format("\t您是否要领取春节期间错过的经验奖励？\n\t您总共可以领取#R%d#W天的%s。",n ,x310808_g_MissionName[x310808_g_MenuSlect[GetGUID(sceneId, selfId)]].name)		
        StartTalkTask( sceneId)
        TalkAppendString( sceneId, "#Y"..x310808_g_MissionName[NameId].name)
        TalkAppendString( sceneId, str )
        TalkAppendString( sceneId, "\n")
        TalkAppendString( sceneId, "#Y奖励内容：")
        TalkAppendString( sceneId, format("经验值:%d点", Exp))
        StopTalkTask( sceneId)
        if num < 22 then
			DeliverTalkInfo(sceneId, selfId, targetId, x310808_g_ScriptId, -1)
		else
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 2)
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 3)			
		end	
	end


end


function x310808_ProcAcceptCheck( sceneId, selfId)
	local level = GetLevel( sceneId, selfId)
	local ativetime = GetDayOfYear() - 45
	if x310808_g_MenuSlect[GetGUID(sceneId, selfId)] == 1 then
		local num = x310808_GetMD( sceneId, selfId, MD_2011CJBC_QUEST_NEIZHENG)
		local Exp = (21 - num) * 25000 * level 
		if Exp > 0 and ativetime >= 0 and ativetime <= 13 then
			AddExp(sceneId, selfId, Exp)
			Msg2Player( sceneId, selfId, format("你获得经验值为%u点", Exp), 8, 2)
			Msg2Player( sceneId, selfId, format("你获得经验值为%u点", Exp), 8, 3)
			x310808_SetMD( sceneId, selfId, MD_2011CJBC_QUEST_NEIZHENG, 22)	
			WriteLog( 1, format("x310808_GetNeizhengExp : SceneId=%d PlayerGUID=%u GetExp=%d GetExpTime=%d",sceneId, GetGUID(sceneId, selfId), Exp, GetDayOfYear()))		
		else
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 2)
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 3)
			return
		end

	elseif x310808_g_MenuSlect[GetGUID(sceneId, selfId)] == 2 then
		local Exp = x310808_GetLunhuitaiExp( sceneId, selfId, Exp)	
		if Exp > 0	and ativetime >= 0 and ativetime <= 13 then
			AddExp(sceneId, selfId, Exp)
			Msg2Player( sceneId, selfId, format("你获得经验值为%u点", Exp), 8, 2)
			Msg2Player( sceneId, selfId, format("你获得经验值为%u点", Exp), 8, 3)
			x310808_SetMD( sceneId, selfId, MD_2011CJBC_FUBEN_LUNHUITAI, 22)
			WriteLog( 1, format("x310808_GetLunhuitaiExp : SceneId=%d PlayerGUID=%u GetExp=%d GetExpTime=%d",sceneId, GetGUID(sceneId, selfId), Exp, GetDayOfYear()))			
		else
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 2)
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 3)
			return
		end	
				
	elseif x310808_g_MenuSlect[GetGUID(sceneId, selfId)] == 3 then
		local Exp = x310808_GetSanhuanExp( sceneId, selfId, Exp)	
		if Exp > 0	and ativetime >= 0 and ativetime <= 13 then
			AddExp(sceneId, selfId, Exp)
			Msg2Player( sceneId, selfId, format("你获得经验值为%u点", Exp), 8, 2)
			Msg2Player( sceneId, selfId, format("你获得经验值为%u点", Exp), 8, 3)
			x310808_SetMD( sceneId, selfId, MD_2011CJBC_FUBEN_SANHUAN, 63)
			WriteLog( 1, format("x310808_GetSanhuanExp : SceneId=%d PlayerGUID=%u GetExp=%d GetExpTime=%d",sceneId, GetGUID(sceneId, selfId), Exp, GetDayOfYear()))			
		else
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 2)
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 3)
			return
		end		

	elseif x310808_g_MenuSlect[GetGUID(sceneId, selfId)] == 4 then
		local Exp = x310808_g_GetShengshanExp( sceneId, selfId, Exp)	
		if Exp > 0	and ativetime >= 0 and ativetime <= 13 then
			AddExp(sceneId, selfId, Exp)
			Msg2Player( sceneId, selfId, format("你获得经验值为%u点", Exp), 8, 2)
			Msg2Player( sceneId, selfId, format("你获得经验值为%u点", Exp), 8, 3)
			x310808_SetMD( sceneId, selfId, MD_2011CJBC_FUBEN_SHENGSHAN, 22)
			WriteLog( 1, format("x310808_GetShengshanExp : SceneId=%d PlayerGUID=%u GetExp=%d GetExpTime=%d",sceneId, GetGUID(sceneId, selfId), Exp, GetDayOfYear()))			
		else
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 2)
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 3)
			return
		end		
	end
		
	
end

function x310808_GetSanhuanExp( sceneId, selfId, Exp)
	local level = GetLevel( sceneId, selfId)
	local num = x310808_GetMD( sceneId, selfId, MD_2011CJBC_FUBEN_SANHUAN)
	local Exp = 0
	local n = 63 - num
	if n > 0 then
		n = 63 - num
	else
		n = 0
	end
	for i, item in x310808_g_SanhuanExp do
		if level >= item.level then
			Exp = n * item.nexp				
		end		
	end
	return Exp
end


function x310808_GetLunhuitaiExp( sceneId, selfId, Exp)
	local level = GetLevel( sceneId, selfId)
	local num = x310808_GetMD( sceneId, selfId, MD_2011CJBC_FUBEN_LUNHUITAI)
	local Exp = 0
	local n = 21 - num
	if n > 0 then
		n = 21 - num
	else
		n = 0
	end
	for i, item in x310808_g_LunhuitaiExp do
		if level >= item.level then
			Exp = n * item.nexp	* level
		end		
	end
	return Exp
end


function x310808_g_GetShengshanExp( sceneId, selfId, Exp)
	local level = GetLevel( sceneId, selfId)
	local num = x310808_GetMD( sceneId, selfId, MD_2011CJBC_FUBEN_SHENGSHAN)
	local Exp = 0
	local n = 21 - num
	if n > 0 then
		n = 21 - num
	else
		n = 0
	end
	for i, item in x310808_g_ShengshanExp do
		if level >= item.level then
			Exp = n * item.nexp			
		end		
	end
	return Exp
end


function x310808_GetMD( sceneId, selfId, mdName)
    return GetPlayerGameData( sceneId, selfId, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310808_SetMD( sceneId, selfId, mdName, value)
    SetPlayerGameData( sceneId, selfId, mdName[ 1], mdName[ 2], mdName[ 3], value)
end



