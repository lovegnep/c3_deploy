
x300640_var_FileId	= 300640
x300640_var_QuestId	=	{ 
							7020,
							7742,
							7741,
							7740,
						}

x300640_MP_KILLCOUNT	= 0
x300640_var_QuestName = "【帮会】帮会暗战"
x300640_var_LevelUp				=	1
x300640_var_NeedKillMonsterNum			= 200

x300640_var_DayCountUntil = 1	
x300640_var_GuildExpBonus       = 3
x300640_var_BonusMoney8		=50
x300640_var_SceneList	=	{2,3,5,6,7,8,9,10,11,13,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,35,64,164,264,364,104,105,106,107,108,109,110,111,204,205,206,207,208,209,210,211,304,305,306,307,308,309,310,311,404,405,406,407,408,409,410,411,45,46,47,48,49,465,466,467,468,469}


function x300640_ProcLeaveGuild(varMap, varPlayer, varQuest)
	DelQuestNM( varMap, varPlayer, varQuest)

	x300640_MarkThisQuest(varMap, varPlayer, 1)

	local message = format("您已经不在帮会中了，删除了任务：%s", x300640_var_QuestName);
	StartTalkTask(varMap);
	TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 8, 2);
end



function x300640_GetLastDay(varMap, varPlayer)
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GUILD_ANZHAN_DATE[1], MD_GUILD_ANZHAN_DATE[2], MD_GUILD_ANZHAN_DATE[3])
	return varLastday
end




function x300640_GetLastDayCount(varMap, varPlayer)
	local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_GUILD_ANZHAN_COUNT[1], MD_GUILD_ANZHAN_COUNT[2], MD_GUILD_ANZHAN_COUNT[3])
	return varDaycount
end




function x300640_CanDoThisQuest(varMap, varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = x300640_GetLastDay(varMap, varPlayer)
	
	if varToday ~= varLastday then
		return 1
	end
	
	local varDaycount = x300640_GetLastDayCount(varMap, varPlayer)
	if varDaycount < x300640_var_DayCountUntil then
		
		return 1
	end
	
	return 0
end

function x300640_SetLastDay(varMap, varPlayer, day)
	SetPlayerGameData(varMap, varPlayer, MD_GUILD_ANZHAN_DATE[1], MD_GUILD_ANZHAN_DATE[2], MD_GUILD_ANZHAN_DATE[3], day)
end

function x300640_SetLastDayCount(varMap, varPlayer, varCount)
	SetPlayerGameData(varMap, varPlayer, MD_GUILD_ANZHAN_COUNT[1], MD_GUILD_ANZHAN_COUNT[2], MD_GUILD_ANZHAN_COUNT[3], varCount)
end




function x300640_MarkThisQuest(varMap, varPlayer, varFlag)
	local varToday = GetDayOfYear()
	local varLastday = x300640_GetLastDay(varMap, varPlayer)

	
	if varToday ~= varLastday then
		x300640_SetLastDay(varMap, varPlayer, varToday)
		x300640_SetLastDayCount(varMap, varPlayer, 1)
		return
	end
	
	
	if varFlag == 1 then
		local varDaycount = x300640_GetLastDayCount(varMap, varPlayer) + 1
		x300640_SetLastDayCount(varMap, varPlayer, varDaycount)
	end
end

function x300640_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	local varLevel =GetLevel(varMap,varPlayer)
	if GetGuildID(varMap, varPlayer) ~= -1 and varLevel >= 30 then
		local varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest);
		TalkAppendButton(varMap, varQuest, x300640_var_QuestName, varState, -1)
	end
end


function x300640_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )
 	
  if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 1 then	
		
	 	if GetGuildID(varMap, varPlayer) == -1 then
	 		StartTalkTask(varMap)
			TalkAppendString(varMap,"你已经不在帮会中，请加入帮会后再继续本任务！")
			StopTalkTask()
			DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300640_var_FileId, varQuest,0);
			return
		end
		
		local varCountry = GetCurCountry(varMap, varPlayer)
		local varRet
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) > 0 then 
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y【帮会】帮会暗战")
			TalkAppendString(varMap,"\t恭喜您，完成了【帮会】帮会暗战！这是给您的奖励，请收下。#r#r#r#r")
			
			local varLevel = GetLevel(varMap, varPlayer)
			local varExp = floor(varLevel * 26000)
			TalkAppendString( varMap, "#Y奖励内容：#W#r帮贡：50点#r帮会经验：3点#r经验值："..varExp.."点#r使命点：1点")
			StopTalkTask()
			DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300640_var_FileId, varQuest);
		else
			StartTalkTask(varMap)
			local Readme_1 = "\t您可以通过帮会任务发布人进行每天一次的帮会暗战任务，在以下地点消灭相应等级的怪物200只。如果您的等级高于目标怪物等级5级以上将不能完成任务。\n\t当帮主发布#G暗战令#W时2小时内回复任务可获得翻倍奖励经验，帮贡和2点使命点！新建帮会和入帮时间低于24小时者，不能获得帮会经验！#r"			
			
			local Readme_2 = "#R 领地     （45-140级）#R（争夺场景）#O#r#G 本国迷宫 （30-110级）#G（和平场景）#W#r"
			
			local Readme_3 = "请选择对应地图完成任务！#r"
			
			local Readme_4 = "#G小提示：随着您所在帮会等级的提升，您获得的奖励也会相应增加。您也可以和非本帮成员组队完成任务。"
			local varReadme = Readme_1..Readme_2..Readme_3..Readme_4
			TalkAppendString(varMap,varReadme)
			
			TalkAppendString( varMap,"#Y完成情况：")
			TalkAppendString(varMap, "未完成#r");
			
			local varLevel = GetLevel(varMap, varPlayer)
			local varExp = floor(varLevel * 26000)
			TalkAppendString( varMap, "#Y奖励内容：#W#r帮贡：50点#r帮会经验：3点#r经验值："..varExp.."点#r使命点：1点")
			StopTalkTask()
			DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300640_var_FileId, varQuest,0);
		end
		
		varCountry = GetCurCountry(varMap, varPlayer)
		if varCountry == 0 then 
			varRet = LuaCallNoclosure( 256264, "Finishanzhan", varMap, varPlayer)
		elseif varCountry == 1 then
			varRet = LuaCallNoclosure( 256265, "Finishanzhan", varMap, varPlayer)
		elseif varCountry == 2 then
			varRet = LuaCallNoclosure( 256266, "Finishanzhan", varMap, varPlayer)
		elseif varCountry == 3 then
			varRet = LuaCallNoclosure( 256267, "Finishanzhan", varMap, varPlayer)
		end
			
		return varRet
	end
	
	
		
		
		
		
		
		
		
		
		
		
		
	
	StartTalkTask(varMap)
			local Readme_1 = "\t您可以通过帮会任务发布人进行每天一次的帮会暗战任务，在以下地点消灭相应等级的怪物200只，如果您的等级高于目标怪物等级5级以上将不能完成任务。\n\t当帮主发布#G暗战令#W时2小时内回复任务可获得翻倍奖励经验，帮贡和2点使命点！新建帮会和入帮时间低于24小时者，不能获得帮会经验！#r"			
			local Readme_2 = "#R 领地     （45-140级）#R（争夺场景）#O#r#G 本国迷宫 （30-110级）#G（和平场景）#W#r"
			local Readme_3 = "请选择对应地图完成任务！#r"
			local Readme_4 ="#G小提示：随着您所在帮会等级的提升，您获得的奖励也会相应增加，红色地图为PK地图。"
			local varReadme = Readme_1..Readme_2..Readme_3..Readme_4
			TalkAppendString(varMap,"#Y【帮会】帮会暗战")
			TalkAppendString(varMap,varReadme)
			
			local varLevel = GetLevel(varMap, varPlayer)
			local varExp = floor(varLevel * 26000)
			local 	varReadme = "#Y奖励内容：#W#r帮贡：50点#r帮会经验：3点#r经验值："..varExp.."点#r使命点：1点"							
			TalkAppendString( varMap,varReadme )
			StopTalkTask()

			local varCountry = GetCurCountry( varMap, varPlayer )

			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300640_var_QuestId[varCountry+1], -1)
			return

end

function x300640_DoAccept( varMap, varPlayer )
	if GetGuildID(varMap, varPlayer) == -1 then
		return "很抱歉，您没有加入帮会，不能领取本任务！"
	end
	if GetLevel(varMap, varPlayer) < x300640_var_LevelUp then
		return format("很抱歉，您的等级不足%d级，不能领取本任务！", x300640_var_LevelUp)
	end
	
	if 1 == IsQuestFullNM(varMap, varPlayer) then
			return "很抱歉，您的任务已经满了，不能领取本任务！"
	end
	
	
	local varCountry = GetCurCountry( varMap, varPlayer )
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, x300640_var_QuestId[varCountry+1] )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return 
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return 
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return
		end
	end
	
	AddQuestNM(varMap, varPlayer, x300640_var_QuestId[varCountry+1]);

	x300640_MarkThisQuest(varMap, varPlayer, 1)
	
	
	x300640_WriteLog( varMap, varPlayer, varQuest, 121);
	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300640_var_QuestId[varCountry+1]);
	SetQuestByIndex(varMap, varPlayer, varQuestIdx, x300640_MP_KILLCOUNT, 0);
	
	local varStr = format("您领取了任务：%s", x300640_var_QuestName)
	Msg2Player(varMap,varPlayer,varStr,8,2)
	StartTalkTask(varMap);
	TalkAppendString(varMap, varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	
	return nil
end



function x300640_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
if x300640_CanDoThisQuest( varMap, varPlayer) ~= 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，您今天已经领取过帮会暗战任务，请明天再来吧。");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,"很抱歉，您今天已经领取过帮会暗战任务，请明天再来吧。",8,2)	
		return
	end
	local varStr = x300640_DoAccept( varMap, varPlayer )
	if varStr ~= nil then
		Msg2Player(varMap,varPlayer,varStr,8,2)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
	end
end
function x300640_ProcReturn1(varMap, varPlayer,QuestData,varQuest,varTalknpc)
 local curTime = GetCurrentTime()
	local isMultiple = 0
	if curTime - QuestData < 2*60*60 then
		isMultiple = 1
	end
	local joinguildtime = varQuest
	x300640_GetBonus( varMap,varPlayer, isMultiple, joinguildtime )
end

function x300640_GetBonus( varMap, varPlayer, isMultiple,joinguildtime )

			local guildId = GetGuildID(varMap, varPlayer);
			local GuildLevel = GetGuildSimpleData( GetGuildID( varMap, varPlayer ) )
			if guildId ~= -1 then
				
				local varLevel = GetLevel(varMap, varPlayer)
				local varExp = floor(varLevel * 26000)
				AddGuildUserPoint(varMap,varPlayer,50)				
				AddGuildShiMing(varMap, varPlayer,1)
	
								
				local Readme_1 = "您完成了任务：【帮会】帮会暗战 "
				local Readme_2 = "获得#R帮贡50点#o的奖励。"
				local Readme_4 = "获得#R经验值"..varExp.."点#o的奖励。"
				
				local Readme_6 = "获得#R使命点1点#o的奖励。"
				
				--老玩家额外经验
				if IsHaveSpecificImpact( varMap, varPlayer, 8864) == 1 then
					AddExp (varMap,varPlayer,(GetLevel(varMap, varPlayer)) * 26000*2)
					Readme_4 = "老玩家回归，获得#R双倍经验值"..(GetLevel(varMap, varPlayer)*26000*2).."点#o的奖励。"				
				else
					AddExp (varMap,varPlayer,(GetLevel(varMap, varPlayer)) * 26000)
				end
				
				Msg2Player(varMap,varPlayer,Readme_1,8,3)
				Msg2Player(varMap,varPlayer,Readme_2,8,3)
				
				Msg2Player(varMap,varPlayer,Readme_4,8,3)
				
				Msg2Player(varMap,varPlayer,Readme_6,8,3)
				Msg2Player(varMap,varPlayer,Readme_1,8,2)
				Msg2Player(varMap,varPlayer,Readme_2,8,2)
				
				Msg2Player(varMap,varPlayer,Readme_4,8,2)
				
				Msg2Player(varMap,varPlayer,Readme_6,8,2)
				if isMultiple == 1 then
					local ExpBonus1 = (GetLevel(varMap, varPlayer)) * 26000*3
					local Exp3 = (GetLevel(varMap, varPlayer)) *26000*2
					local ExpBonus2 = (GetLevel(varMap, varPlayer)) *26000*3
					local pos = GetGuildOfficial(varMap, varPlayer)
					local text3 = "额外获得#R使命点2点#o的奖励"
					AddGuildShiMing(varMap, varPlayer,2)
					StartTalkTask(varMap)
					TalkAppendString(varMap, text3);
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					Msg2Player(varMap,varPlayer,text3,8,2)
					if  pos == 5 then
						local guildid =GetGuildID(varMap, varPlayer)
						if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
							StartTalkTask(varMap)
							TalkAppendString(varMap, "帮主职位只能领取一次暗战令奖励");
							StopTalkTask(varMap)
							DeliverTalkTips(varMap,varPlayer)
							Msg2Player(varMap,varPlayer,"帮主职位只能领取一次暗战令奖励",8,2)
						else
							AddExp(varMap, varPlayer, ExpBonus1);	
							StartTalkTask(varMap)
							TalkAppendString(varMap, "额外获得#R经验"..ExpBonus1.."点#o的奖励");
							StopTalkTask(varMap)
							DeliverTalkTips(varMap,varPlayer)	
							Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R经验"..ExpBonus1.."点#o的奖励",8,2)
							SetGuildQuestData(varMap,GetGuildID(varMap,varPlayer),GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
						end
					elseif pos == 4 then
						local guildid =GetGuildID(varMap, varPlayer)
						if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
							StartTalkTask(varMap)
							TalkAppendString(varMap, "副帮主职位只能领取一次暗战令奖励");
							StopTalkTask(varMap)
							DeliverTalkTips(varMap,varPlayer)
							Msg2Player(varMap,varPlayer,"副帮主职位只能领取一次暗战令奖励",8,2)
						else
							AddExp(varMap, varPlayer, Exp3);	
							StartTalkTask(varMap)
							TalkAppendString(varMap, "额外获得#R经验"..Exp3.."点#o的奖励");
							StopTalkTask(varMap)
							DeliverTalkTips(varMap,varPlayer)	
							Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R经验"..Exp3.."点#o的奖励",8,2)
							SetGuildQuestData(varMap,GetGuildID(varMap,varPlayer),GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
						end
					else
						AddExp(varMap, varPlayer, varExp);	
						StartTalkTask(varMap)
						TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varPlayer)	
						Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R经验"..varExp.."点#o的奖励",8,2)
					end
				end
				if 	GuildLevel == 2 then
					local varLevel = GetLevel(varMap, varPlayer)
					local varExp = ceil (varLevel *26000*0.25 )
					AddExp(varMap, varPlayer, varExp);
					StartTalkTask(varMap)
					TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					Msg2Player(varMap,varPlayer,format("帮会等级2级额外获得#R经验"..varExp.."点#o的奖励"),8,2)
				end
				if 	GuildLevel == 3 then
					local varLevel = GetLevel(varMap, varPlayer)
					local varExp = ceil (varLevel *26000*0.5 )
					AddExp(varMap, varPlayer, varExp);	
					StartTalkTask(varMap)
					TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					Msg2Player(varMap,varPlayer,format("帮会等级3级额外获得#R经验"..varExp.."点#o的奖励"),8,2)
				end
				if 	GuildLevel == 4 then
					local varLevel = GetLevel(varMap, varPlayer)
					local varExp = ceil (varLevel *26000*0.75 )
					AddExp(varMap, varPlayer, varExp);	
					StartTalkTask(varMap)
					TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					Msg2Player(varMap,varPlayer,format("帮会等级4级额外获得#R经验"..varExp.."点#o的奖励"),8,2)
				end
				if 	GuildLevel == 5 then
					local varLevel = GetLevel(varMap, varPlayer)
					local varExp = ceil (varLevel *26000*1 )
					AddExp(varMap, varPlayer, varExp);	
					StartTalkTask(varMap)
					TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					Msg2Player(varMap,varPlayer,format("帮会等级5级额外获得#R经验"..varExp.."点#o的奖励"),8,2)
				end
				if 	GuildLevel == 6 then
					local varLevel = GetLevel(varMap, varPlayer)
					local varExp = ceil (varLevel *26000*1.25 )
					AddExp(varMap, varPlayer, varExp);	
					StartTalkTask(varMap)
					TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					Msg2Player(varMap,varPlayer,format("帮会等级6级额外获得#R经验"..varExp.."点#o的奖励"),8,2)
				end
				if 	GuildLevel == 7 then
					local varLevel = GetLevel(varMap, varPlayer)
					local varExp = ceil (varLevel *26000*1.5 )
					AddExp(varMap, varPlayer, varExp);	
					StartTalkTask(varMap)
					TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					Msg2Player(varMap,varPlayer,format("帮会等级7级额外获得#R经验"..varExp.."点#o的奖励"),8,2)
				end
				if isMultiple == 1 then
					local pos = GetGuildOfficial(varMap, varPlayer)
					if pos == 5 then
					local guildid =GetGuildID(varMap, varPlayer)
						if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
							StartTalkTask(varMap)
							TalkAppendString(varMap, "帮主职位只能领取一次暗战令奖励");
							StopTalkTask(varMap)
							DeliverTalkTips(varMap,varPlayer)
							Msg2Player(varMap,varPlayer,"帮主职位只能领取一次暗战令奖励",8,2)
						else
							AddGuildUserPoint(varMap,varPlayer,150)	
							StartTalkTask(varMap)
							TalkAppendString(varMap, "额外获得#R帮贡150点#o的奖励");
							StopTalkTask(varMap)
							DeliverTalkTips(varMap,varPlayer)	
							Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R帮贡150点#o的奖励",8,2)
							SetGuildQuestData(varMap,GetGuildID(varMap,varPlayer),GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
						end
					elseif pos == 4 then
					local guildid =GetGuildID(varMap, varPlayer)
						local guildid =GetGuildID(varMap, varPlayer)
						if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
							StartTalkTask(varMap)
							TalkAppendString(varMap, "副帮主职位只能领取一次暗战令奖励");
							StopTalkTask(varMap)
							DeliverTalkTips(varMap,varPlayer)
							Msg2Player(varMap,varPlayer,"副帮主职位只能领取一次暗战令奖励",8,2)
						else
							AddGuildUserPoint(varMap,varPlayer,100)	
							local BonusMoney8 = x300621_var_BonusMoney8
							StartTalkTask(varMap)
							TalkAppendString(varMap, "额外获得#R帮贡100点#o的奖励");
							StopTalkTask(varMap)
							DeliverTalkTips(varMap,varPlayer)	
							Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R帮贡100点#o的奖励",8,2)
							SetGuildQuestData(varMap,GetGuildID(varMap,varPlayer),GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
						end
					else
						AddGuildUserPoint(varMap,varPlayer,50)	
						StartTalkTask(varMap)
						TalkAppendString(varMap, "额外获得#R帮贡50点#o的奖励");
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varPlayer)	
						Msg2Player(varMap,varPlayer,format("帮会多倍任务额外获得#R帮贡50点#o的奖励", x300621_var_BonusMoney8),8,2)
					end
				end
				if joinguildtime == -1 or GetCurrentTime()-joinguildtime<24*3600 then
					StartTalkTask(varMap)
					TalkAppendString( varMap, "很抱歉，您加入帮会时间低于24小时，不能获得帮会经验。" )
					StopTalkTask( varMap )
					DeliverTalkTips( varMap, varPlayer )
					Msg2Player(varMap,varPlayer,"很抱歉，您加入帮会时间低于24小时，不能获得帮会经验。",8,2)
					return
				end
				local varName = GetName(varMap, varPlayer)
				--老玩家额外经验
				if IsHaveSpecificImpact( varMap, varPlayer, 8864) == 1 then
					AddGuildExp(varMap, varPlayer, 6);	
				else
					AddGuildExp(varMap, varPlayer, 3);	
				end
								
				
				StartTalkTask(varMap)
				
				--老玩家额外经验
				if IsHaveSpecificImpact( varMap, varPlayer, 8864) == 1 then
					TalkAppendString( varMap, "获得#R帮会经验6点#o的奖励。" )	
					Msg2Player(varMap,varPlayer,"获得#R帮会经验6点#o的奖励。",8,2)
					Msg2Player(varMap,varPlayer,"帮会："..varName.."老玩家回归，完成【帮会】帮会暗战任务，为帮会贡献了6点帮会经验。",6,2)
				
				else
					TalkAppendString( varMap, "获得#R帮会经验3点#o的奖励。" )	
					Msg2Player(varMap,varPlayer,"获得#R帮会经验3点#o的奖励。",8,2)
					Msg2Player(varMap,varPlayer,"帮会："..varName.."完成了【帮会】帮会暗战任务，为帮会贡献了3点帮会经验。",6,2)
				
				end
				StopTalkTask( varMap )
				DeliverTalkTips( varMap, varPlayer )
			
				
			end		
end



function x300640_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

    if varQuest == nil or varQuest < 0 then
        return 0
    end

	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest) <= 0 then	
		return 0
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local varRet = QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) 
	if varRet > 0 then 
		local varRet = QuestComplateNM( varMap, varPlayer, varTalknpc, varQuest, varButtonClick ) 
		if varRet == 1 then 

			DelQuestNM( varMap, varPlayer, varQuest)

            LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,3)
            LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,3)
            local varId = GetGuildID( varMap, varPlayer)
            if varId ~= -1 then
                AddGuildActivity( varMap, varPlayer, GetGuildCacheFreeParam( varId, GD_GUILD_ACTIVITY_PARAM3) )
            end

			x300640_MarkThisQuest(varMap, varPlayer, 1)
	
			
			x300640_WriteLog( varMap, varPlayer, varQuest, 122);
			
			GetJoinGuildTime(varMap,varPlayer,x300640_var_FileId)
		end
	end
    
	return 0
end

function x300640_ProcMemberJoinTimeReturn( varMap, varPlayer, param )

	GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_MULTI_MISSION_ANZHAN, x300640_var_FileId,param,"ProcReturn1",-1)

end

function x300640_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
	
end





function x300640_ProcQuestAbandon( varMap, varPlayer, varQuest )
	
	DelQuestNM( varMap, varPlayer, varQuest)

	x300640_MarkThisQuest(varMap, varPlayer, 1)
	
	local message = format("您放弃了任务：%s", x300640_var_QuestName);
	StartTalkTask(varMap);
	TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 8, 2);
	
end



function x300640_WriteLog( varMap, varPlayer, varQuest, gameId)
	GamePlayScriptLog(varMap, varPlayer, gameId)
end

function x300640_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
						   

end


function x300640_ProcDie( varMap, varObj, varKiller )

							   
	
	if IsObjValid( varMap,varKiller ) ~=1 then
		return
	end
	
	local killerType = GetObjType(varMap, varKiller)

	
	if killerType == 3 then
		varKiller = GetOwnerID(varMap, varKiller)
	end	
	
	if IsPlayerStateNormal( varMap, varKiller) ~= 1 then
        return
    end
	
	local bInScene = 0;
	for varI, item in x300640_var_SceneList do
		if varMap == item then
			bInScene = 1;
			break;
		end
	end
	if bInScene <= 0 then
		return 0;
	end
	
	local NeedKilledNum = x300640_var_NeedKillMonsterNum;
	local varStr = "";
	
	local varNum = 1;
	local bHasTeam = HasTeam(varMap, varKiller);
	if bHasTeam > 0 then
		varNum = GetNearTeamCount(varMap, varKiller)
	end
  
	local memberId = varKiller;
	local varCountry = GetCurCountry( varMap, varKiller )
	local varQuestName = GetQuestNameNM(varMap, varKiller, x300640_var_QuestId[varCountry+1]);

	for varI=0, varNum-1 do
		if bHasTeam > 0 then
			memberId = GetNearTeamMember(varMap, varKiller, varI);
		end

		local varQuestIdx = GetQuestIndexByID(varMap, memberId, x300640_var_QuestId[varCountry+1]);
		local curKillNum = GetQuestParam(varMap, memberId, varQuestIdx, x300640_MP_KILLCOUNT)
		local varLevel = GetLevel(varMap,varKiller)
		
		
----------------6月29日特制-------------------------
--		local year, month, day = GetYearMonthDay(); 
--		local day1 = GetDayOfYear()
--		local itemid = 11000307
--		if year ==2012 then
--			if day1 ==146 or day1 ==147 or day ==148 or day == 149 then 
--				if IsPlayerStateNormal( varMap, memberId) == 1 and GetHp(varMap, memberId) > 0 and GetLevel(varMap, varObj) >= GetLevel(varMap, memberId)-5  and  varNum >= 4 and varI == tempmember  then
--					local ran = random(200)
--					if ran == 1 then
--						StartItemTask(varMap)
--						ItemAppendBind( varMap, itemid, 1 )	
--			
--						local varRet = StopItemTask(varMap,memberId)
--						if varRet > 0 then
--				
--							local DoneMSG = "恭喜您幸运的获得了一个@item_"..itemid.."！"		
--							StartTalkTask(varMap)
--							TalkAppendString(varMap,DoneMSG)
--							StopTalkTask(varMap)
--							DeliverTalkTips(varMap,memberId)
--							DeliverItemListSendToPlayer(varMap,memberId)			
--						else
--							StartTalkTask(varMap)
--							TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")	
--							StopTalkTask(varMap)
--							DeliverTalkTips(varMap,memberId)
--						end	
--					end
--				end
--			end		
--		end		
--			
----------------6月29日特制制-------------------------		
		
		
		
		
		
		if curKillNum < NeedKilledNum and IsPlayerStateNormal( varMap, memberId) == 1 and GetHp(varMap, memberId) > 0 and IsHaveQuestNM(varMap, memberId, x300640_var_QuestId[varCountry+1]) > 0  and GetGuildID(varMap, memberId) ~= -1 then
			if GetLevel(varMap, varObj) >= GetLevel(varMap, memberId)-5 then
				local KilledNum = GetQuestParam(varMap, memberId, varQuestIdx, x300640_MP_KILLCOUNT);
				if KilledNum < NeedKilledNum then
					SetQuestByIndex(varMap, memberId, varQuestIdx, x300640_MP_KILLCOUNT, KilledNum+1);
				
					if KilledNum == x300640_var_NeedKillMonsterNum - 1 then
						
						varStr = format( "#G%s#Y：已经击败: %d/%d个怪物", varQuestName, KilledNum+1, x300640_var_NeedKillMonsterNum )
						SetQuestByIndex( varMap, memberId, varQuestIdx, 7, 1 )
					else
						varStr = format( "#G%s#Y：已经击败: %d/%d个怪物", varQuestName, KilledNum+1, x300640_var_NeedKillMonsterNum )
					end
					StartTalkTask(varMap)
					TalkAppendString( varMap, varStr )
					StopTalkTask( varMap )
					DeliverTalkTips( varMap, memberId )
				end
		
			elseif GetLevel(varMap, varObj) < GetLevel(varMap, varKiller)-5 then
					nlevel = ceil(varLevel/5)
					mlevel =nlevel*5-5
					StartTalkTask(varMap)
					TalkAppendString( varMap, "您的等级过高，请挑战不低于"..mlevel.."级的敌人。" )
					local message = format("您的等级过高，请挑战不低于"..mlevel.."级的敌人。")
					StopTalkTask( varMap )
					DeliverTalkTips( varMap, varKiller )
					Msg2Player(varMap, varKiller, message, 8, 2);
			end
		end
	end
end




function x300640_QuestLogRefresh( varMap, varPlayer, varQuest)

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,varQuest );
	if varHaveQuest > 0 then
	StartTalkTask(varMap)	
		if x300640_var_BonusMoney8 > 0 then
			AddQuestMoneyBonus8(varMap, x300640_var_BonusMoney8 )	
		end
		if x300640_var_GuildExpBonus>0 then
			AddQuestGuildExpBonus(varMap,x300640_var_GuildExpBonus)
		end 
		local varLevel = GetLevel(varMap, varPlayer)
		
		local varExpBonus = ceil (varLevel * 26000)
		AddQuestExpBonus(varMap, varExpBonus);

		
		
		

		AddQuestLogCustomText( varMap,
								"",								
								"",								
								"",								
								"",								
								"",								
								"",								
								"随着您所在帮会等级的提升，您获得的奖励也会相应增加。"								
								)
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	end

end

function x300640_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	local varCountry = GetCurCountry( varMap, varPlayer )
	x300640_QuestLogRefresh( varMap, varPlayer, x300640_var_QuestId[varCountry+1] );
end 
