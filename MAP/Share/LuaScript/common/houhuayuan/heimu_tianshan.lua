
--DECLARE_QUEST_INFO_START--
x320001_g_ScriptId		=	320001
x320001_g_MissionName	=	"【帮会】收集黑木"
x320001_g_MissionId 	= 	8501
x320001_g_MissionTarget	=	"　前往@npc_69200收集#G黑木#W"
x320001_g_MissionInfo	=	"\t黑色的树，发出黑的的光芒，古人传说黑色的木头可以炼制最锋利的武器……\t在地下粮仓的三层，四层和五层，生长着神秘的黑木。那里充斥着重重危险，您愿意去那里考验自己的能力，将五个黑木带回来吗？"
x320001_g_MissionHelp	=	"\t#G黑木#W只生长在地下粮仓的三层，四层和五层。并且数量稀少。随着你所在帮会等级的提高，你获得的奖励也会相应增加。\n\t此任务每天只能接取一次，放弃任务后只能在次日再次领取。"
x320001_g_MissionRuse	=	"\t当你到达@npc_69200，进行收集#G黑木#W时，如果受到攻击，将无法收集完成。你可以进入角落，将周围的怪物杀死后，再进行收集。五层的怪物比较密集，您最好好组队进行收集！"
x320001_g_MissionCompleted = "\t我需要的黑木，你已经找到了？太感谢了，辛苦了，这是给你的酬谢。"
x320001_g_SubmitNPCGUID	=	126020
x320001_g_GroupPoint	=	{ {type=10,id =901,target = "黑木"}}

x320001_g_NPCName		= "@npc_126020"

x320001_g_LevelLess		= 	70 

x320001_g_BonusMoney8	=   50
x320001_g_GuildExpBonus =	1

x320001_g_Mis_Count		= 1
x320001_g_Leader_Index	= 5
--DECLARE_QUEST_INFO_STOP--
function x320001_ProcEnumEvent( sceneId, selfId, targetId, MissionId )

	--Msg2Player( sceneId, selfId, IsHaveQuestNM( sceneId, selfId, MissionId ), 8, 2)
	if GetGuildID( sceneId, selfId ) == -1 then
 		--不在帮会中
		return
	end
	
	local GuildLevel = GetGuildSimpleData(GetGuildID( sceneId, selfId ))
	if GuildLevel < 3 then 		
		return
	end
	
	 local level = GetLevel(sceneId,selfId)
	if level < 70 or level > 95 then
		return
	end

  	if IsHaveQuestNM( sceneId, selfId, x320001_g_MissionId ) == 0 then	-- 如果没有这个任务
		--local state = GetQuestStateNM( sceneId, selfId, targetId, MissionId);
		TalkAppendButton( sceneId, x320001_g_ScriptId, x320001_g_MissionName , 8, -1)	
		--GetGuildQuestData(sceneId, selfId, GD_GUILD_INDEX_GATHER_ISSUE_TIME, x320001_g_ScriptId,MissionId,"OnCallBackEnumerate",targetId)
		return 
	end

end


--选中任务
function x320001_ProcEventEntry( sceneId, selfId, targetId, MissionId )
--	if GetTopListInfo_MinLevel( GetWorldID( sceneId, selfId) ) < 70 then
--			Msg2Player(sceneId,selfId,"排行榜最后一名玩家等级未到70级，不能接取此任务",8,3)
  --    return 
 -- end
--local GuildLevel = GetGuildSimpleData(GetGuildID( sceneId, selfId ))--得到帮会简单数据(等级) 
	--if 	GuildLevel == 2 then		     	
		if IsHaveQuestNM( sceneId, selfId, MissionId ) > 0 then	-- 如果有这个任务
			local bDone = x320001_CheckSubmit(sceneId, selfId,targetId, MissionId);
			if(bDone > 0) then
				x320001_DispatchCompletedInfo( sceneId, selfId, targetId,MissionId) --完成任务显示
			else
				x320001_DispatchContinueInfo( sceneId, selfId, targetId,MissionId ) --未完成任务显示
			end
		else
			x320001_DispatchMissionInfo( sceneId, selfId, targetId,MissionId )		--任务信息显示
		end
	--end
end

-----------------------------------------------------------------------------------------------------
----检查任务是否可提交
-----------------------------------------------------------------------------------------------------
function x320001_CheckSubmit(sceneId, selfId,targetId,MissionId)

	local misIndex = GetQuestIndexByID(sceneId, selfId, MissionId);
	local state = GetQuestStateNM(sceneId,selfId,targetId,MissionId)
	TalkAppendButton( sceneId, MissionId,x320001_g_MissionName, 7,state ) 
	return GetQuestParam(sceneId, selfId, misIndex, 7);

end


-----------------------------------------------------------------------------------------------------
----向客户端发送任务完成信息
-----------------------------------------------------------------------------------------------------
function x320001_DispatchCompletedInfo( sceneId, selfId, targetId,MissionId )
	
	StartTalkTask(sceneId)

		--任务完成信息
		TalkAppendString(sceneId,"#Y"..x320001_g_MissionName)
		TalkAppendString(sceneId,x320001_g_MissionCompleted)
		TalkAppendString(sceneId,"\n#Y奖励内容：  ")

		--1、经验
		local level = GetLevel(sceneId, selfId)
		--local gongdezhi =GetMeritInfo_Multiple(sceneId, selfId)
		local ExpBonus = ceil (100 * 3 * level * 20*1*1*1)
		ExpBonus =floor(ExpBonus+0.5)
		if ExpBonus > 0 then
			AddQuestExpBonus(sceneId, ExpBonus )
		end
		--2 帮供
		if x320001_g_BonusMoney8>0 then
			AddQuestMoneyBonus8(sceneId,x320001_g_BonusMoney8)
		end
			AddQuestItemBonus(sceneId, 12250015, 1)
		--3 帮会经验
		-- if x320001_g_GuildExpBonus>0 then
			-- AddQuestGuildExpBonus(sceneId,x320001_g_GuildExpBonus)
		-- end
	StopTalkTask(sceneId)
	DeliverTalkContinueNM(sceneId, selfId, targetId, x320001_g_ScriptId, MissionId);

end


-----------------------------------------------------------------------------------------------------
----向客户端发送任务未完成
-----------------------------------------------------------------------------------------------------
function x320001_DispatchContinueInfo( sceneId, selfId, targetId,MissionId )
	
	StartTalkTask(sceneId)

		--任务继续信息
		TalkAppendString(sceneId,"#Y"..x320001_g_MissionName)
		TalkAppendString(sceneId,format("%s", x320001_g_MissionInfo))
		TalkAppendString(sceneId," ")

		--任务目标
		TalkAppendString( sceneId,"#Y完成情况：")
		TalkAppendString(sceneId, "未完成");

		--1、经验
		local level = GetLevel(sceneId, selfId)
		--local gongdezhi =GetMeritInfo_Multiple(sceneId, selfId)
		local ExpBonus = ceil (100 * 3 * level * 20*1*1*1)
		ExpBonus =floor(ExpBonus+0.5)
		if ExpBonus> 0 then
			AddQuestExpBonus(sceneId, ExpBonus )
		end
		--2 帮供
		if x320001_g_BonusMoney8>0 then
			AddQuestMoneyBonus8(sceneId,x320001_g_BonusMoney8)
		end
			AddQuestItemBonus(sceneId, 12250015, 1)
		--3 帮会经验
		-- if x320001_g_GuildExpBonus>0 then
			-- AddQuestGuildExpBonus(sceneId,x320001_g_GuildExpBonus)
		-- end

	--任务提示信息
	StopTalkTask(sceneId)
	DeliverTalkRequire(sceneId, selfId, targetId, x320001_g_ScriptId, MissionId,0);

end


-----------------------------------------------------------------------------------------------------
----向客户端发送任务信息
-----------------------------------------------------------------------------------------------------
function x320001_DispatchMissionInfo( sceneId, selfId, NPCId,MissionId )

	StartTalkTask(sceneId)

		--任务信息
		TalkAppendString(sceneId,"#Y"..x320001_g_MissionName)
		TalkAppendString(sceneId,format("%s", x320001_g_MissionInfo))
		TalkAppendString(sceneId," ")

		--任务目标
		TalkAppendString( sceneId,"#Y任务目标：")
		TalkAppendString( sceneId,format("%s", x320001_g_MissionTarget))
		TalkAppendString( sceneId," ")

		--提示信息
		if x320001_g_MissionHelp ~= "" then

			TalkAppendString(sceneId,"#Y任务提示：")
			TalkAppendString(sceneId,format("%s", x320001_g_MissionHelp))
			TalkAppendString(sceneId," ")
		end

		--1、经验
		local level = GetLevel(sceneId, selfId)
		--local gongdezhi =GetMeritInfo_Multiple(sceneId, selfId)
		local ExpBonus = ceil (100 * 3 * level * 20*1*1*1)
		ExpBonus =floor(ExpBonus+0.5)
		if ExpBonus > 0 then
			AddQuestExpBonus(sceneId, ExpBonus )
		end
		--2 帮供
		if x320001_g_BonusMoney8>0 then
			AddQuestMoneyBonus8(sceneId,x320001_g_BonusMoney8)
		end
			AddQuestItemBonus(sceneId, 12250015, 1)
		--3 帮会经验
		-- if x320001_g_GuildExpBonus>0 then
			-- AddQuestGuildExpBonus(sceneId,x320001_g_GuildExpBonus)
		-- end
	StopTalkTask(sceneId)
	DeliverTalkInfoNM(sceneId, selfId, NPCId, x320001_g_ScriptId, MissionId);
end
--
--
-----------------------------------------------------------------------------------------------------
----获得奖励
-----------------------------------------------------------------------------------------------------
function x320001_OnReturn1(sceneId, selfId,MissionData,MissionId,targetId)
 
	local curTime = GetCurrentTime()
	local isMultiple = 0
	if curTime - MissionData < 2*60*60 then
		isMultiple = 1
	end
	x320001_GetBonus( sceneId,selfId, isMultiple )
end

function x320001_GetBonus( sceneId, selfId, isMultiple )

	--奖励经验
	local level = GetLevel(sceneId, selfId)
	--local gongdezhi =GetMeritInfo_Multiple(sceneId, selfId)
	local ExpBonus = ceil (100 * 3 * level * 20*1*1 )
	ExpBonus =floor(ExpBonus+0.5)
	local GuildLevel = GetGuildSimpleData(GetGuildID( sceneId, selfId ))--得到帮会简单数据(等级) 
    if ExpBonus > 0 then
    		local text1 = "你完成了任务：【帮会】收集黑木"
    	   	local text2 = "获得#R经验"..ExpBonus.."点#o的奖励"
			--local text3 = "获得#R帮会功德1点#o的奖励"

			AddExp(sceneId, selfId, ExpBonus);
			--AddGuildMerit(sceneId, selfId,1)
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, text1);
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, text2);
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)
			-- StartTalkTask(sceneId)
			-- TalkAppendString(sceneId, text3);
			-- StopTalkTask(sceneId)
			-- DeliverTalkTips(sceneId,selfId)	
	  		Msg2Player(sceneId,selfId,text1,8,2)
	  		Msg2Player(sceneId,selfId,text2,8,2)
			--Msg2Player(sceneId,selfId,text3,8,2)
		if isMultiple == 1 then
			local ExpBonus1 = ceil (100 * 3 * level * 20*1*1 *3)
			local Exp3 = ceil (100 * 3 * level * 20*1*1*3 )
			local ExpBonus2 = ceil (100 * 3 * level * 20*1*1 *2)
			local pos = GetGuildOfficial(sceneId, selfId)
			local text3 = "获得#R使命点2点#o的奖励"
			AddGuildShiMing(sceneId, selfId,2)
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, text3);
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
	  		Msg2Player(sceneId,selfId,text3,8,2)
			if pos == 5 then
				local guildid =GetGuildID(sceneId, selfId)
				if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
					StartTalkTask(sceneId)
					TalkAppendString(sceneId, "帮主职位只能领取一次收集令奖励");
					StopTalkTask(sceneId)
					DeliverTalkTips(sceneId,selfId)
					Msg2Player(sceneId,selfId,"帮主职位只能领取一次收集令奖励",8,2)
				else
					AddExp(sceneId, selfId, ExpBonus1);	
					StartTalkTask(sceneId)
					TalkAppendString(sceneId, "额外获得#R经验"..Exp3.."点#o的奖励");
					StopTalkTask(sceneId)
					DeliverTalkTips(sceneId,selfId)	
					Msg2Player(sceneId,selfId,"帮会多倍任务额外获得#R经验"..Exp3.."点#o的奖励",8,2)
					SetGuildQuestData(sceneId,GetGuildID(sceneId,selfId),GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
				end
			elseif pos == 4 then
				local guildid =GetGuildID(sceneId, selfId)
				if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
					StartTalkTask(sceneId)
					TalkAppendString(sceneId, "副帮主职位只能领取一次收集令奖励");
					StopTalkTask(sceneId)
					DeliverTalkTips(sceneId,selfId)
					Msg2Player(sceneId,selfId,"副帮主职位只能领取一次收集令奖励",8,2)
				else
					AddExp(sceneId, selfId, ExpBonus2);	
					StartTalkTask(sceneId)
					TalkAppendString(sceneId, "额外获得#R经验"..ExpBonus2.."点#o的奖励");
					StopTalkTask(sceneId)
					DeliverTalkTips(sceneId,selfId)	
					Msg2Player(sceneId,selfId,"帮会多倍任务额外获得#R经验"..ExpBonus2.."点#o的奖励",8,2)
					SetGuildQuestData(sceneId,GetGuildID(sceneId,selfId),GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
				end
			else
				AddExp(sceneId, selfId, ExpBonus);	
				StartTalkTask(sceneId)
				TalkAppendString(sceneId, "额外获得#R经验"..ExpBonus.."点#o的奖励");
				StopTalkTask(sceneId)
				DeliverTalkTips(sceneId,selfId)	
				Msg2Player(sceneId,selfId,"帮会多倍任务额外获得#R经验"..ExpBonus.."点#o的奖励",8,2)
			end
		end
		if 	GuildLevel == 2 then
			local level = GetLevel(sceneId, selfId)
			local exp = ceil (100 * 3 * level * 20*0.25*1 )
			AddExp(sceneId, selfId, exp);	
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "额外获得#R经验"..exp.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			Msg2Player(sceneId,selfId,"帮会等级2级额外获得#R经验"..exp.."点#o的奖励",8,2)
		end
		if 	GuildLevel == 3 then
			local level = GetLevel(sceneId, selfId)
			local exp = ceil (100 * 3 * level * 20*0.5*1 )
			AddExp(sceneId, selfId, exp);	
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "额外获得#R经验"..exp.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			Msg2Player(sceneId,selfId,"帮会等级3级额外获得#R经验"..exp.."点#o的奖励",8,2)
		end
		if 	GuildLevel == 4 then
			local level = GetLevel(sceneId, selfId)
			local exp = ceil (100 * 3 * level * 20*0.75*1 )
			AddExp(sceneId, selfId, exp);	
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "额外获得#R经验"..exp.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			Msg2Player(sceneId,selfId,"帮会等级4级额外获得#R经验"..exp.."点#o的奖励",8,2)
		end
		if 	GuildLevel == 5 then
			local level = GetLevel(sceneId, selfId)
			local exp = ceil (100 * 3 * level * 20*1*1 )
			AddExp(sceneId, selfId, exp);	
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "额外获得#R经验"..exp.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			Msg2Player(sceneId,selfId,"帮会等级5级额外获得#R经验"..exp.."点#o的奖励",8,2)
		end
		if 	GuildLevel == 6 then
			local level = GetLevel(sceneId, selfId)
			local exp = ceil (100 * 3 * level * 20*1.25*1 )
			AddExp(sceneId, selfId, exp);	
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "额外获得#R经验"..exp.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			Msg2Player(sceneId,selfId,"帮会等级6级额外获得#R经验"..exp.."点#o的奖励",8,2)
		end
		if 	GuildLevel == 7 then
			local level = GetLevel(sceneId, selfId)
			local exp = ceil (100 * 3 * level * 20*1.5*1 )
			AddExp(sceneId, selfId, exp);	
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "额外获得#R经验"..exp.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			Msg2Player(sceneId,selfId,"帮会等级7级额外获得#R经验"..exp.."点#o的奖励",8,2)
		end
	end
--奖励帮贡
    if x320001_g_BonusMoney8 > 0 then
		    AddGuildUserPoint(sceneId,selfId,x320001_g_BonusMoney8)	--增加帮贡
			local BonusMoney8 = x320001_g_BonusMoney8
			StartTalkTask(sceneId)
			TalkAppendString(sceneId, "获得#R帮贡"..BonusMoney8.."点#o的奖励");
			StopTalkTask(sceneId)
			DeliverTalkTips(sceneId,selfId)	
			Msg2Player(sceneId,selfId,format("获得#R帮贡"..BonusMoney8.."点#o的奖励", x320001_g_BonusMoney8),8,2)
			if isMultiple == 1 then
			local pos = GetGuildOfficial(sceneId, selfId)
				if pos == 5 then
					local guildid =GetGuildID(sceneId, selfId)
					if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
						StartTalkTask(sceneId)
						TalkAppendString(sceneId, "帮主职位只能领取一次收集令奖励");
						StopTalkTask(sceneId)
						DeliverTalkTips(sceneId,selfId)
						Msg2Player(sceneId,selfId,"帮主职位只能领取一次收集令奖励",8,2)
					else
						AddGuildUserPoint(sceneId,selfId,150)	--增加帮贡
						local BonusMoney8 = x320001_g_BonusMoney8
						StartTalkTask(sceneId)
						TalkAppendString(sceneId, "额外获得#R帮贡150点#o的奖励");
						StopTalkTask(sceneId)
						DeliverTalkTips(sceneId,selfId)	
						Msg2Player(sceneId,selfId,"帮会多倍任务额外获得#R帮贡150点#o的奖励",8,2)
						SetGuildQuestData(sceneId,GetGuildID(sceneId,selfId),GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
					end
				elseif pos == 4 then
					local guildid =GetGuildID(sceneId, selfId)
					if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
						StartTalkTask(sceneId)
						TalkAppendString(sceneId, "副帮主职位只能领取一次收集令奖励");
						StopTalkTask(sceneId)
						DeliverTalkTips(sceneId,selfId)
						Msg2Player(sceneId,selfId,"副帮主职位只能领取一次收集令奖励",8,2)
					else
						AddGuildUserPoint(sceneId,selfId,100)	--增加帮贡
						local BonusMoney8 = x320001_g_BonusMoney8
						StartTalkTask(sceneId)
						TalkAppendString(sceneId, "额外获得#R帮贡100点#o的奖励");
						StopTalkTask(sceneId)
						DeliverTalkTips(sceneId,selfId)	
						Msg2Player(sceneId,selfId,"帮会多倍任务额外获得#R帮贡100点#o的奖励",8,2)
						SetGuildQuestData(sceneId,GetGuildID(sceneId,selfId),GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
					end
				else
					AddGuildUserPoint(sceneId,selfId,50)	--增加帮贡
					local BonusMoney8 = x320001_g_BonusMoney8
					StartTalkTask(sceneId)
					TalkAppendString(sceneId, "额外获得#R帮贡"..BonusMoney8.."点#o的奖励");
					StopTalkTask(sceneId)
					DeliverTalkTips(sceneId,selfId)	
					Msg2Player(sceneId,selfId,format("帮会多倍任务额外获得#R帮贡"..BonusMoney8.."点#o的奖励", x320001_g_BonusMoney8),8,2)
				end
			end
	end
	-- 奖励帮会经验
	-- local bangExp = x320001_g_BangExp 
	-- if bangExp > 0 then
		-- local gongde = GetGuildMerit(sceneId, selfId)
		-- if 	gongde >= 5 then
			-- AddGuildExp(sceneId,selfId,bangExp)
			-- StartTalkTask(sceneId)
			-- TalkAppendString(sceneId, "获得#R帮会经验"..bangExp.."点#o的奖励");
			-- StopTalkTask(sceneId)
			-- DeliverTalkTips(sceneId,selfId)			
			-- Msg2Player(sceneId,selfId,format("获得#R帮会经验"..bangExp.."点#o的奖励"),8,2)
		-- else
			-- StartTalkTask(sceneId)
			-- TalkAppendString( sceneId, "很抱歉，帮会功德低于5点，不能获得帮会经验。" )
			-- StopTalkTask( sceneId )
			-- DeliverTalkTips( sceneId, memberId )
			-- Msg2Player(sceneId,selfId,"很抱歉，帮会功德低于5点，不能获得帮会经验。",8,2)
		-- end
	-- end

end


----**********************************
----接受
----**********************************
function x320001_ProcAcceptCheck( sceneId, selfId, targetId, MissionId )

	if IsQuestFullNM( sceneId, selfId )==1 then
		StartTalkTask(sceneId)
		TalkAppendString(sceneId,"可接任务数量已满")
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
		return 
	end

	if GetGuildID( sceneId, selfId ) == -1 then
		--不在帮会中
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, "你不是帮会成员");
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)	
		Msg2Player(sceneId,selfId,"你不是帮会成员",8,2)
		return
	end
	
	
	local guildid = GetGuildID( sceneId, selfId )
	local GuildLevel = GetGuildSimpleData(guildid)--得到帮会简单数据(等级)
	if 	GuildLevel < 3 then
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, "很抱歉，帮会等级到达3级才可以接取收集黑木任务！");
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)	
		Msg2Player(sceneId,selfId,"很抱歉，帮会等级到达3级才可以接取收集黑木任务！",8,2)
	return 
	end

 	local level = GetLevel(sceneId,selfId)
	if level < x320001_g_LevelLess then
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, "很抱歉，40级以后才能接取收集黑木任务！");
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
		local Readme = "很抱歉，40级以后才能接取收集黑木任务！"
		Msg2Player(sceneId,selfId,Readme,8,2)
		return
	end
		
	if x320001_GetDayCount(sceneId, selfId) >= x320001_g_Mis_Count then
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, "你今天已经领取过收集黑木任务了，请明天再来吧！");
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
		local Readme = "你今天已经领取过收集黑木任务了，请明天再来吧！"
		Msg2Player(sceneId,selfId,Readme,8,2)
		DeliverTalkTips(sceneId,selfId)
		--DeliverTalkMenu(sceneId, selfId, -1)
		return
	end
	
   --GetGuildQuestData(sceneId, selfId, GD_GUILD_INDEX_GATHER_ISSUE_TIME, x320001_g_ScriptId,MissionId,"OnReturn")
   
   --检查前置任务
	local FrontMissiontId1, FrontMissiontId2, FrontMissiontId3 = GetFrontQuestIdNM( sceneId, selfId, x320001_g_MissionId )
	if FrontMissiontId1 ~= -1 then
		if IsQuestHaveDoneNM( sceneId, selfId, FrontMissiontId1 ) == 0 then
			return 
		end
	end
	if FrontMissiontId2 ~= -1 then
		if IsQuestHaveDoneNM( sceneId, selfId, FrontMissiontId2 ) == 0 then
			return 
		end
	end
	if FrontMissiontId3 ~= -1 then
		if IsQuestHaveDoneNM( sceneId, selfId, FrontMissiontId3 ) == 0 then
			return
		end
	end

	if AddQuestNM( sceneId, selfId,	x320001_g_MissionId) == 1 then
		
		--接任务写日志
		GamePlayScriptLog(sceneId,selfId,101)

		StartTalkTask(sceneId)
		TalkAppendString(sceneId, "你接受了任务：【帮会】收集黑木")
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
		local Readme = "你接受了任务：【帮会】收集黑木"
		Msg2Player(sceneId,selfId,Readme,8,2)
		local misIndex = GetQuestIndexByID(sceneId, selfId, x320001_g_MissionId);
		SetQuestByIndex( sceneId, selfId, misIndex, 0, 0 )
		--SetPlayerAbilityLevel(sceneId, selfId, 26, 1)
	end

      
end


----完成任务
----返回1代表成功，0代表交任务失败
function x320001_ProcQuestSubmit( sceneId, selfId, targetId, selectId, MissionId )
     
	if IsHaveQuestNM( sceneId, selfId, MissionId) == 0 then	-- 如果没这个任务直接退出
		return 0
	end
	
	-- 粉丝先锋团
	local ret = LuaCallNoclosure( 302510, "CheckMission", sceneId, selfId, 320001)
	if ret == 0 then
		return 0
	elseif ret == 2 then
		LuaCallNoclosure( 302510, "FinishMission", sceneId, selfId, 320001)
	end
	
	StartItemTask( sceneId )
	ItemAppend( sceneId, 12250015, 1 )
	local varRet = StopItemTask( sceneId, selfId )
	if varRet > 0 then
		DeliverItemListSendToPlayer(sceneId,selfId)
	else
		local varText = "背包已满,不能获得奖励物品"
		StartTalkTask(sceneId)
		TalkAppendString(sceneId, varText);
		StopTalkTask(sceneId)
		DeliverTalkTips(sceneId,selfId)
		return
	end	
				
	if DelQuestNM( sceneId, selfId, MissionId) < 1 then
		return 
	end
	LuaCallNoclosure(802005,"AddActivityQuest",sceneId, selfId, 0,3)
	LuaCallNoclosure(888895,"EventActivity",sceneId, selfId,3)
    LuaCallNoclosure( 256238, "Finishdanmu", sceneId, selfId)
--	local level = GetLevel(sceneId, selfId)
--	local ExpBonus = ceil (1000 * 0.3 * level * 20 )
--	StartTalkTask(sceneId)
--	TalkAppendString(sceneId, "你出色的完成了收集黑木任务，你获得了：#r经验：#R"..ExpBonus.."#o点#r帮贡：#R%d#W#o点");
--	StopTalkTask(sceneId)
--	DeliverTalkTips(sceneId,selfId)
				
	--交任务写日志
	GamePlayScriptLog(sceneId,selfId,102)

	x320001_SetDayCount(sceneId, selfId)
	GetGuildQuestData(sceneId, selfId, GD_GUILD_INDEX_MULTI_MISSION_HEIMU, x320001_g_ScriptId,MissionId,"OnReturn1",targetId)
	
	-- local GuildUser = 50
	-- AddGuildUserPoint(sceneId, selfId, GuildUser)
	--AddGuildUserPoint(sceneId,selfId,40)	--增加帮贡
	return 0
end


function x320001_ProcQuestAttach( sceneId, selfId, npcId, npcGuid,misIndex, MissionId )
	
	if IsHaveQuestNM( sceneId, selfId, MissionId) == 0 then	-- 如果没有这个任务
		return
	end

	if npcGuid == x320001_g_SubmitNPCGUID then
		local itemNum = GetItemCount( sceneId, selfId, 13011005 )
		local state = GetQuestStateNM(sceneId,selfId,npcId,MissionId)
		if itemNum < 5 then
		TalkAppendButton(sceneId, MissionId, x320001_g_MissionName,state);
		else
		TalkAppendButton(sceneId, MissionId, x320001_g_MissionName,state);
		end
	end

end

 
----********************************************************************
----放弃
----********************************************************************
function x320001_ProcQuestAbandon( sceneId, selfId,MissionId )
	
	if IsHaveQuestNM( sceneId, selfId, MissionId) == 0 then	-- 如果没有这个任务
		return
	end
	
	DelQuestNM( sceneId, selfId, MissionId)
	local Readme = "你放弃了任务：【帮会】收集黑木"
	StartTalkTask(sceneId)
	TalkAppendString(sceneId, Readme);
    StopTalkTask(sceneId)
	DeliverTalkTips(sceneId,selfId)
	Msg2Player(sceneId,selfId,Readme,8,2)
	x320001_SetDayCount(sceneId, selfId)
end


function x320001_OnReturn(sceneId, selfId,MissionData,MissionId,targetId)

	local CurDaytime = GetDayTime()						--当前时间(天)

	if MissionData == CurDaytime then					--上次发布的时间是今天
 		--可以做任务
 			--防止玩家不会采集的生活技能,playertemplate完善后，可以不需要此段
	--else
	    --StartTalkTask(sceneId)
		--TalkAppendString(sceneId, "帮会今天还没有发布该任务！")
		--StopTalkTask(sceneId)
		--DeliverTalkTips(sceneId,selfId)
		--local Readme = "帮会今天还没有发布该任务！"
		--Msg2Player(sceneId,selfId,Readme,8,2)
		--DeliverTalkTips(sceneId,selfId)
	end
	
--	DeliverTalkMenu(sceneId, selfId, -1)

end


----********************************************************************
----接受
----********************************************************************
function x320001_ProcAccept( sceneId, selfId )

end

--物品改变
function x320001_ProcQuestItemChanged( sceneId, selfId, itemdataId, MissionId, nChangeType )

    if MissionId == nil or MissionId < 0 then
        return
    end
    
    if IsHaveQuestNM(sceneId,selfId,MissionId) <= 0 then
        return
    end

						   --场景ID, 自己的ID, 物品置号,  任务ID
  	local NeedNum, ObjIndex = GetQuestNeedItemNumNM( sceneId, selfId, MissionId, itemdataId )
	local misIndex = GetQuestIndexByID( sceneId, selfId, MissionId )

	if nChangeType ==1 then
		--删除道具
		local itemNum = GetItemCount( sceneId, selfId, itemdataId )
		if itemNum < NeedNum then
	       		SetQuestByIndex( sceneId, selfId, misIndex, 0, itemNum )
			SetQuestByIndex( sceneId, selfId, misIndex, 7, 0 )
			x320001_QuestLogRefresh( sceneId, selfId, MissionId );
		end

		return

	end
	
	if NeedNum > 0 then
      	local Num = GetItemCount( sceneId, selfId, itemdataId )
		if Num < NeedNum and Num > 0 then --还没有完成任务
			StartTalkTask(sceneId)
			local strText = format("已得到@itemid_%d: %d/%d", itemdataId, Num, NeedNum )
			if strText == nil then
				strText = "";
			end
			TalkAppendString( sceneId, strText )
			StopTalkTask( sceneId )
			DeliverTalkTips( sceneId, selfId )
   			SetQuestByIndex( sceneId, selfId, misIndex, 0, Num )
			x320001_QuestLogRefresh( sceneId, selfId, MissionId );
  		elseif Num == NeedNum then
			--已经完成任务
			StartTalkTask(sceneId)
			local strText = format( "已得到足够的@itemid_%d: %d/%d", itemdataId, Num, NeedNum )
			if strText == nil then
				strText = "";
			end
			TalkAppendString( sceneId, strText )
			StopTalkTask( sceneId )
			DeliverTalkTips( sceneId, selfId )
			SetQuestByIndex( sceneId, selfId, misIndex, 7, 1 )
			SetQuestByIndex( sceneId, selfId, misIndex, 0, Num )
			x320001_QuestLogRefresh( sceneId, selfId, MissionId );


		end
	end

end



-----------------------------------------------------------------------------------------------------
----任务日志刷新
-----------------------------------------------------------------------------------------------------
function x320001_QuestLogRefresh( sceneId, selfId, MissionId)

	local bHaveMission = IsHaveQuestNM(sceneId, selfId,MissionId );
	if bHaveMission > 0 then
	
		StartTalkTask(sceneId)
		local level = GetLevel(sceneId, selfId)
		--local gongdezhi =GetMeritInfo_Multiple(sceneId, selfId)
		local ExpBonus = ceil (100 * 3 * level * 20*1*1*1)
		ExpBonus =floor(ExpBonus+0.5)
		if ExpBonus > 0 then
		AddQuestExpBonus(sceneId, ExpBonus);		
		end
		if x320001_g_BonusMoney8 > 0 then
			AddQuestMoneyBonus8(sceneId, x320001_g_BonusMoney8 )	--增加帮贡
		end
			AddQuestItemBonus(sceneId, 12250015, 1)
		--3 帮会经验
		-- if x320001_g_GuildExpBonus>0 then
			-- AddQuestGuildExpBonus(sceneId,x320001_g_GuildExpBonus)
		-- end

		local misIndex = GetQuestIndexByID(sceneId, selfId, MissionId);
		local num = GetQuestParam(sceneId, selfId,misIndex,0)
		local text = format("(%d/%d)",num,5)

		AddQuestLogCustomText( sceneId,
								"",								-- 标题
								x320001_g_MissionName,			-- 任务名字
								x320001_g_MissionTarget..text,	--任务目标
								x320001_g_NPCName,				--任务NPC
								x320001_g_MissionRuse,			--任务攻略
								x320001_g_MissionInfo,			--任务描述
								""								--任务小提示
								)
		StopTalkTask(sceneId)
		DeliverTalkRefreshQuest(sceneId, selfId, MissionId);
	end

end

function x320001_ProcQuestLogRefresh( sceneId, selfId, MissionId)

	x320001_QuestLogRefresh( sceneId, selfId, MissionId );
end
--
--
-----------------------------------------------------------------------------------------------------
----取得此任务当天当前已完成次数
-----------------------------------------------------------------------------------------------------
function x320001_GetDayCount(sceneId, selfId)

	if x320001_g_Mis_Count > 0 then

		local today = GetDayOfYear()

		local lastday = GetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_GATHER_DATE[1], MD_GUILD_HOUHUAYUAN_GATHER_DATE[2], MD_GUILD_HOUHUAYUAN_GATHER_DATE[3])

		if lastday ~= today then
			return 0
		end

		local daycount =  GetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_GATHER_COUNT[1], MD_GUILD_HOUHUAYUAN_GATHER_COUNT[2], MD_GUILD_HOUHUAYUAN_GATHER_COUNT[3])
		return daycount

	end

	return 0
end

-----------------------------------------------------------------------------------------------------
----更新当天接任务次数
-----------------------------------------------------------------------------------------------------
function x320001_SetDayCount(sceneId, selfId)
	local today = GetDayOfYear()

	local lastday = GetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_GATHER_DATE[1], MD_GUILD_HOUHUAYUAN_GATHER_DATE[2], MD_GUILD_HOUHUAYUAN_GATHER_DATE[3])

	if lastday ~= today then
		SetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_GATHER_DATE[1], MD_GUILD_HOUHUAYUAN_GATHER_DATE[2], MD_GUILD_HOUHUAYUAN_GATHER_DATE[3], today)
		SetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_GATHER_COUNT[1], MD_GUILD_HOUHUAYUAN_GATHER_COUNT[2], MD_GUILD_HOUHUAYUAN_GATHER_COUNT[3], 1)
	else
		local daycount = GetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_GATHER_COUNT[1], MD_GUILD_HOUHUAYUAN_GATHER_COUNT[2], MD_GUILD_HOUHUAYUAN_GATHER_COUNT[3])
		SetPlayerGameData(sceneId, selfId, MD_GUILD_HOUHUAYUAN_GATHER_COUNT[1], MD_GUILD_HOUHUAYUAN_GATHER_COUNT[2], MD_GUILD_HOUHUAYUAN_GATHER_COUNT[3], daycount+1)
	end
end
