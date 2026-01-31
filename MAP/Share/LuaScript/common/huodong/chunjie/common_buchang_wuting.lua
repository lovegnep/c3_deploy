----------------------------
--春节补偿舞台
----------------------------

x310809_g_ScriptId 		= 	310809
x310809_g_MissionName 	=	"【美丽会】春节补偿"
x310809_g_MissionText	=	"您是否要领取【美丽会】春节补偿的经验奖励？"
x310809_g_idExt			= 	{}
x310809_g_MissionName1 	=	
{
{id = 1, name = "普通经验奖励"}, 
{id = 2, name = "杰克丹尼（4倍经验）", 		num = 20,  itemid = 12030011}, 
{id = 3, name = "精品杰克丹尼（4倍经验）", 	num = 1,   itemid = 12250006}, 
{id = 4, name = "芝华士（8倍经验）", 			num = 20,  itemid = 12030013},
{id = 5, name = "精品芝华士（8倍经验）", 		num = 1,   itemid = 12250002}}

x310809_g_GetExp		=
{
{level = 60, ptexp = 45000,  fourexp = 180000, eightexp = 360000},
{level = 70, ptexp = 81000,  fourexp = 324000, eightexp = 648000},
{level = 80, ptexp = 162000, fourexp = 648000, eightexp = 1296000},
{level = 90, ptexp = 210600, fourexp = 842400, eightexp = 1684800},
}




function x310809_ProcEnumEvent(sceneId, selfId, targetId, MissionId)
	TalkAppendButton(sceneId, x310809_g_ScriptId, x310809_g_MissionName, 3)

end

function x310809_ProcEventEntry(sceneId, selfId, targetId, MissionId, idExt)
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
		
	local leavenum = x310809_GetMD( sceneId, selfId, MD_2011CJBC_WUTING)
	local freenum = x310809_GetMD( sceneId, selfId, MD_2011CJBC_WUTINGFREE)	
	local n = 21 - freenum
	if n < 0 then
		n = 0
	end
	local GetItemNum = GetItemCount(sceneId, selfId, 12030011)
	local DeductNum = floor(GetItemNum / 20)
	StartTalkTask( sceneId)
    TalkAppendString( sceneId, x310809_g_MissionName )
    TalkAppendString( sceneId, "\t【美丽会】春节补偿经验有三种领取途径：\n\t1.直接领取美丽会#R基础经验奖励#W。\n\t2.通过提交20瓶杰克丹尼或1瓶精品杰克丹尼获得#R4倍经验奖励#W。\n\t3.通过提交20瓶芝华士或1瓶精品芝华士获得#R8倍经验奖励#W。\n\t请选择你需要的领取方式：" )
    for i, item in x310809_g_MissionName1 do
    	TalkAppendButton( sceneId, x310809_g_ScriptId, item.name, 3, item.id)
	end
    StopTalkTask()
    DeliverTalkMenu( sceneId, selfId, targetId)
	x310809_g_idExt[GetGUID(sceneId, selfId)] = idExt
	
    if idExt == 1 then
    	x310809_g_idExt[GetGUID(sceneId, selfId)] = idExt
    	Exp = x310809_GetWutingExp(sceneId, selfId, Exp)
    	StartTalkTask( sceneId)
    	TalkAppendString( sceneId, "#Y"..x310809_g_MissionName1[idExt].name )
    	TalkAppendString( sceneId, "\t"..x310809_g_MissionText )
        TalkAppendString( sceneId, "\n")
        TalkAppendString( sceneId, "#Y奖励内容：")
        TalkAppendString( sceneId, format("经验值：%u点", Exp))
   			TalkAppendString( sceneId, format("您可以领取#R%u次#W美丽会经验奖励补偿", n))        
    	StopTalkTask()
		DeliverTalkInfo(sceneId, selfId, targetId, x310809_g_ScriptId, -1) 
	elseif idExt == 2 or idExt == 3 or idExt == 4 or idExt == 5 then
		x310809_AddPlayerQuestText( sceneId, selfId, targetId)  	  		
    end
    

end

function x310809_ProcAcceptCheck( sceneId, selfId)

	local leavenum = x310809_GetMD( sceneId, selfId, MD_2011CJBC_WUTING)
	local freenum = x310809_GetMD( sceneId, selfId, MD_2011CJBC_WUTINGFREE)	
	local Exp = x310809_GetWutingExp(sceneId, selfId, Exp)
	local ativetime = GetDayOfYear() - 45	
	if x310809_g_idExt[GetGUID(sceneId, selfId)] == 1 then
		local Exp = x310809_GetWutingExp(sceneId, selfId, Exp)
		if  21 - freenum <= 0 then
			Msg2Player( sceneId, selfId, "你领取经验的剩余次数为#R0#cffcf00,无法领取经验！", 8, 2)
			Msg2Player( sceneId, selfId, "你领取经验的剩余次数为#R0#cffcf00,无法领取经验！", 8, 3)
			return
		elseif ativetime < 0 then
			Msg2Player( sceneId, selfId, "时间未到，你无法获得经验！", 8, 2)
			Msg2Player( sceneId, selfId, "时间未到，你无法获得经验！", 8, 3)
			return
		elseif ativetime > 13 then
			Msg2Player( sceneId, selfId, "活动已关闭！", 8, 2)
			Msg2Player( sceneId, selfId, "活动已关闭！", 8, 3)
			return		
		elseif freenum == 22 then
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 2)
			Msg2Player( sceneId, selfId, "您已经领取过此项补偿！", 8, 3)
			return				
		else
			AddExp(sceneId, selfId, Exp)
			Msg2Player( sceneId, selfId, format("你获得经验值为#R%u#cffcf00点", Exp), 8, 2)
			Msg2Player( sceneId, selfId, format("你获得经验值为#R%u#cffcf00点", Exp), 8, 3)
			x310809_SetMD( sceneId, selfId, MD_2011CJBC_WUTINGFREE, 22)
			WriteLog( 1, format("x310809_GetWutingExp : SceneId=%d PlayerGUID=%u GetExp=%d GetExpTime=%d leavenum=%d",sceneId, GetGUID(sceneId, selfId), Exp, GetDayOfYear(), leavenum))			
		end
		
	else
		x310809_AddMsgPlayer( sceneId, selfId)
	end
end

function x310809_GetWutingExp(sceneId, selfId, Exp)
	local level = GetLevel( sceneId, selfId)
	local num = x310809_GetMD( sceneId, selfId, MD_2011CJBC_WUTING)
	local freenum = x310809_GetMD( sceneId, selfId, MD_2011CJBC_WUTINGFREE)
	local n = 21 - freenum
	if n < 0 then
		n = 0
	end	
	local Exp = 0	
	for i, item in x310809_g_GetExp do
		if level >= item.level then 
			if x310809_g_idExt[GetGUID(sceneId, selfId)] == 2 or x310809_g_idExt[GetGUID(sceneId, selfId)] == 3 then
				Exp = item.fourexp * level
			elseif x310809_g_idExt[GetGUID(sceneId, selfId)] == 4 or x310809_g_idExt[GetGUID(sceneId, selfId)] == 5 then
				Exp = item.eightexp	* level
			elseif x310809_g_idExt[GetGUID(sceneId, selfId)] == 1 then
				Exp = item.ptexp * level * n
			end
		end		
	end
	return Exp	
end

function x310809_AddMsgPlayer( sceneId, selfId)
	local leavenum = x310809_GetMD( sceneId, selfId, MD_2011CJBC_WUTING)
	local Exp = x310809_GetWutingExp(sceneId, selfId, Exp)
	local name = x310809_g_MissionName1[x310809_g_idExt[GetGUID(sceneId, selfId)]].name
	local number = x310809_g_MissionName1[x310809_g_idExt[GetGUID(sceneId, selfId)]].num
	local itemid = x310809_g_MissionName1[x310809_g_idExt[GetGUID(sceneId, selfId)]].itemid
	local GetItemNum = GetItemCount(sceneId, selfId, itemid)
	local ativetime = GetDayOfYear() - 45
	local DeductNum = 0
	if x310809_g_idExt[GetGUID(sceneId, selfId)] == 2 or x310809_g_idExt[GetGUID(sceneId, selfId)] == 4 then 		
		DeductNum = floor(GetItemNum / 20)
	elseif x310809_g_idExt[GetGUID(sceneId, selfId)] == 3 or x310809_g_idExt[GetGUID(sceneId, selfId)] == 5 then
		DeductNum = GetItemNum
	end
	
	if  21 - leavenum <= 0 then
		Msg2Player( sceneId, selfId, "你领取经验的剩余次数为#R0#cffcf00,无法领取经验！", 8, 2)
		Msg2Player( sceneId, selfId, "你领取经验的剩余次数为#R0#cffcf00,无法领取经验！", 8, 3)
		return
	elseif ativetime < 0 then
		Msg2Player( sceneId, selfId, "时间未到，你无法获得经验！", 8, 2)
		Msg2Player( sceneId, selfId, "时间未到，你无法获得经验！", 8, 3)
		return
	elseif ativetime > 13 then
		Msg2Player( sceneId, selfId, "活动已关闭！", 8, 2)
		Msg2Player( sceneId, selfId, "活动已关闭！", 8, 3)
		return				
	elseif DeductNum <= 0  then		
		Msg2Player( sceneId, selfId, format("你背包中的#G%s#cffcf00不足#R%u瓶#cffcf00,无法领取经验！", name, number), 8, 2)
		Msg2Player( sceneId, selfId, format("你背包中的#G%s#cffcf00不足#R%u瓶#cffcf00,无法领取经验！", name, number), 8, 3)
		return
	else
		if DelItem(sceneId, selfId, itemid, number) ~= 1 then return 0 end	
		AddExp(sceneId, selfId, Exp)
		Msg2Player( sceneId, selfId, format("你获得经验值为#R%u#cffcf00点", Exp), 8, 2)
		Msg2Player( sceneId, selfId, format("你获得经验值为#R%u#cffcf00点", Exp), 8, 3)
		x310809_SetMD( sceneId, selfId, MD_2011CJBC_WUTING, leavenum + 1)

		WriteLog( 1, format("x310809_GetWutingExp : SceneId=%d PlayerGUID=%u GetExp=%d GetExpTime=%d leavenum=%d DelItem=%u DelItemNum=%d",sceneId, GetGUID(sceneId, selfId), Exp, GetDayOfYear(), leavenum, itemid, number))			
	end
			
end

function x310809_AddPlayerQuestText( sceneId, selfId, targetId)
	local leavenum = x310809_GetMD( sceneId, selfId, MD_2011CJBC_WUTING)
	local Exp = x310809_GetWutingExp(sceneId, selfId, Exp)
	local name = x310809_g_MissionName1[x310809_g_idExt[GetGUID(sceneId, selfId)]].name
	local number = x310809_g_MissionName1[x310809_g_idExt[GetGUID(sceneId, selfId)]].num
	local n = 21 - leavenum
	if n < 0 then
		n = 0
	end	
	StartTalkTask( sceneId)
	TalkAppendString( sceneId, "#Y"..x310809_g_MissionName1[x310809_g_idExt[GetGUID(sceneId, selfId)]].name )
	TalkAppendString( sceneId, "\t"..x310809_g_MissionText.."\n" )
    TalkAppendString( sceneId, "#Y奖励内容：")
    TalkAppendString( sceneId, format("经验值：%u点", Exp))
    TalkAppendString( sceneId, format("您还可以领取#R%u次#W美丽会经验奖励补偿", n))    
    TalkAppendString( sceneId, "#Y所需物品：") 
    TalkAppendString( sceneId, format("每次领取经验需扣除#Y%s * %d瓶", name, number))
	StopTalkTask()
	DeliverTalkInfo(sceneId, selfId, targetId, x310809_g_ScriptId, -1)	
end

function x310809_GetMD( sceneId, selfId, mdName)
    return GetPlayerGameData( sceneId, selfId, mdName[ 1], mdName[ 2], mdName[ 3] )
end

function x310809_SetMD( sceneId, selfId, mdName, value)
    SetPlayerGameData( sceneId, selfId, mdName[ 1], mdName[ 2], mdName[ 3], value)
end
