
--DECLARE_QUEST_INFO_START--
x300869_var_FileId 					= 	300869                  

x300869_var_QuestKind 				= 	1                       
x300869_var_LevelLess					= 	20                      
x300869_var_QuestName				= 	"【帮会】帮会神兽"           

x300869_var_QuestTarget				= 	"  护送神兽经过@npc_129174中转后到达@npc_131516处"          
x300869_var_QuestInfo				= 	"\t帮主带领帮会成员，每天可在王城参加一次【帮会】帮会神兽任务。\n\t帮主需要在帮会任务发布人处缴纳#G10两现银#W才能接受此任务。帮会成员只需此时在帮主周围，便可自动接到任务，进入护送神兽状态。\n\t在护送神兽过程中，神兽只跟随帮主移动，如帮主离神兽过远，神兽会#G停止前进#W。如果神兽受到袭击并死亡，帮主的#G押金#W将被对方抢走，全体成员#G任务失败#W。\n\t帮主离开神兽一段时间或掉线，神兽消失，所有人#G任务失败#W。\n\t由于路途遥远，神兽中途需要休息，帮主在@npc_129174处点击#R神兽驿站#W按扭，当前在驿站周围的帮众都会获得经验奖励。并且在最后完成护兽任务时都会获得经验加成的奖励。\n\t顺利护送神兽到达指定地点，帮主可得到返还的押金和#G巨额经验#W，参与护送的帮会成员得到#G巨额经验#W。\n\t帮主到达指定地点提交任务，此时只有帮主周围并且已经参与护送的帮会成员才能完成任务并获得#G巨额奖励#W，同时帮会增加100点帮会经验#W。当帮主发布#G护兽令#W时2小时内回复任务可获得翻倍奖励（经验，帮贡）和2点使命点！"            
x300869_var_ContinueInfo				= 	"神兽乃祥瑞之兽，我在等待它的降临"  
x300869_var_QuestCompleted			= 	"恭喜您顺利完成任务！这是您应得的奖励，请收下！"  
x300869_var_QuestHelp				=	"\t接受任务后，会在帮主萤幕正下方出现辅助图示：#R上\下车#W和护送#G成员列表。帮主通过列表踢除表内成员，解除其护送神兽状态。当帮主提交任务时，周围参与护送的帮众越多，您所获得的奖励也会更多。随着您所在帮会等级的提高，您获得的奖励也会相应增加。"          
x300869_var_ExtTarget		=	{ {type=20,n=1,target="护送神兽"}} 
 
--DECLARE_QUEST_INFO_STOP--



x300869_var_BonusMoney8               =   150  
x300869_var_GuildExpBonus				=	1

x300869_SubmitNPCGUID				= 131516 
x300869_var_BusScriptId = 300870
x300869_var_Leader_Index = 5		
x300869_var_QuestId  = 7022
x300869_var_CostMoney = 10000
x300869_var_Exp = 100*3*25*1*1*0.4            
x300869_var_RingQuestIndex = 1	

function x300869_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
	
	SetPlayerRuntimeData(varMap,varPlayer,RD_GUILDCONTEND_KILL_FAMILY,1)

	if GetGuildID(varMap, varPlayer) == -1 then
		
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, x300869_var_QuestId ) == 0 then	
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300869_var_QuestId)
		TalkAppendButton(varMap,x300869_var_QuestId,x300869_var_QuestName,8);
		return 1
	end
	return 0
end



function x300869_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )

	local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, varQuest);
	if(varHaveQuest > 0) then

		local varTalkNpcGUID = GetMonsterGUID(varMap,varTalknpc)
		if x300869_SubmitNPCGUID == varTalkNpcGUID then
			x300869_DispatchCompletedInfo( varMap, varPlayer, varTalknpc) 
		end

	else
		if varExtIdx ~= x300869_var_FileId then
			x300869_DispatchQuestInfo( varMap, varPlayer, varTalknpc )	
			
			SetPlayerRuntimeData(varMap,varPlayer,RD_GUILDCONTEND_KILL_FAMILY,2)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"你没有此任务！")
			StopTalkTask()
			DeliverTalkMenu(varMap,varPlayer,varTalknpc);			
		end

	end

end





function x300869_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	if GetGuildID(varMap, varPlayer) == -1 then
		
		return 0
	end
	
	if IsHideName(varMap, varPlayer) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"抱歉，蒙面状态不能接此任务。")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end
			
	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end

	local pos = GetGuildOfficial(varMap, varPlayer)
  	if pos ~= x300869_var_Leader_Index then			
  		StartTalkTask(varMap)
		TalkAppendString(varMap, "抱歉，您不是帮主，没有权利发起护送神兽！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "#o抱歉，您不是帮主，没有权利发起护送神兽！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
  		return 0
 	end

	if IsTeamFollow(varMap, varPlayer) == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "组队跟随状态下不可以接帮会护送任务!");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "#o组队跟随状态下不可以接帮会护送任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
	
	local varBusID = IsBusMember(varMap, varPlayer);
	if(varBusID == 1) then
		local varText = "您已处于护送状态，无法领取新的护送任务！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varText);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "#o您已处于护送状态，无法领取新的护送任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
			
 	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel < x300869_var_LevelLess then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，30级以后才能接受【帮会】帮会神兽任务！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "#o很抱歉，30级以后才能接受【帮会】帮会神兽任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end
	
	
		if GetPlayerRuntimeData(varMap,varPlayer,RD_GUILDCONTEND_KILL_FAMILY) == 3 then
	 		GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_YUNBIAO_ACCEPT_TIME, x300869_var_FileId,varQuest,"ProcReturn")
	 	end

	
		if GetPlayerRuntimeData(varMap,varPlayer,RD_GUILDCONTEND_KILL_FAMILY) == 2 then 
				StartTalkTask(varMap)
						
						SetPlayerRuntimeData(varMap,varPlayer,RD_GUILDCONTEND_KILL_FAMILY,3)
						TalkAppendString(varMap,"#Y【帮会】帮会神兽#W\n  \n\t当您领取神兽时，帮会成员需在您的身边才可接收到接受任务的提示；在您完成任务时，只有在您身边的帮会成员才能完成任务获得奖励。\n \n#G您确定要领取帮会神兽吗?")
				StopTalkTask()
				DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300869_var_FileId, x300869_var_QuestId)
		end
	
	
	
 	

end
function x300869_ProcReturn1(varMap, varPlayer,QuestData,varQuest,varTalknpc)

	if GetGuildID(varMap, varPlayer) == -1 then
		
		return 0
	end
	
 local curTime = GetCurrentTime()
	local isMultiple = 0
	if curTime - QuestData < 2*60*60 then
		isMultiple = 1
	end
	local varMemberCount = varQuest
	local raingMisFinishing = varTalknpc
	x300869_GetBonus( varMap,varPlayer, isMultiple, varMemberCount,raingMisFinishing )
end


function x300869_GetBonus( varMap, varPlayer, isMultiple, varMemberCount, raingMisFinishing)	

	LuaCallNoclosure(802005,"AddActivityQuest",varMap, varPlayer, 0,3)
	LuaCallNoclosure(888895,"EventActivity",varMap, varPlayer,3)
	local exExp = 1
	if raingMisFinishing == 1 then
		exExp = 1.6
	else 
		exExp = 1
	end
	
	local varLevel = GetLevel(varMap, varPlayer)
	
	local varExpBonus = x300869_var_Exp * varLevel* exExp
	varExpBonus =floor(varExpBonus+0.5)
			--老玩家回归额外经验奖励
	if IsHaveSpecificImpact( varMap, varPlayer, 8864) == 1 then
		varExpBonus = varExpBonus*2
	end
	local GuildLevel = GetGuildSimpleData( GetGuildID( varMap, varPlayer ) )
    if varExpBonus > 0 then
		if GetHp(varMap, varPlayer) > 0 then
			AddExp(varMap, varPlayer, varExpBonus);
			
	  		local varReadme = "您完成了任务：【帮会】帮会神兽#r获得#R经验"..varExpBonus.."点#o的奖励" 
			StartTalkTask(varMap)
			TalkAppendString(varMap, "您完成了任务：【帮会】帮会神兽" );
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			StartTalkTask(varMap)
			--老玩家回归额外经验奖励
			if IsHaveSpecificImpact( varMap, varPlayer, 8864) == 1 then
				TalkAppendString(varMap, "老玩家回归获得#R双倍经验"..varExpBonus.."点#o的奖励" );
			else
				TalkAppendString(varMap, "获得#R经验"..varExpBonus.."点#o的奖励" );
			end	
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			DeliverTalkTips(varMap,varPlayer)
			
			
			
			
			Msg2Player(varMap,varPlayer,varReadme,8,2)	
			if GetLevel(varMap,varPlayer) >= 80 then
				local refixInhExp = AddInherenceExp(varMap,varPlayer,400)
				local varStr = format("获得#R天赋值%d点#o的奖励", refixInhExp)
				StartTalkTask(varMap)
				TalkAppendString(varMap, varStr );
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,varStr,8,2)
			end
		end
		if isMultiple == 1 then
			local ExpBonus1 = ceil (x300869_var_Exp * varLevel *3)* exExp
			local Exp3 = ceil (x300869_var_Exp* varLevel*3 )* exExp
			local ExpBonus2 = ceil (x300869_var_Exp * varLevel *2)* exExp
			local pos = GetGuildOfficial(varMap, varPlayer)
			local text3 = "获得#R使命点2点#o的奖励"
				AddGuildShiMing(varMap, varPlayer,2)
				StartTalkTask(varMap)
				TalkAppendString(varMap, text3);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,text3,8,2)
			if pos == 5 then
				AddExp(varMap, varPlayer, ExpBonus1);	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "额外获得#R经验"..Exp3.."点#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R经验"..Exp3.."点#o的奖励",8,2)
			elseif pos == 4 then
				AddExp(varMap, varPlayer, ExpBonus2);	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "额外获得#R经验"..ExpBonus2.."点#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R经验"..ExpBonus2.."点#o的奖励",8,2)
			else
				AddExp(varMap, varPlayer, varExpBonus);	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "额外获得#R经验"..varExpBonus.."点#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R经验"..varExpBonus.."点#o的奖励",8,2)
			end
		end
		if GuildLevel == 1 then
				if varMemberCount >= 1  then
					if varMemberCount>=30 then
						varMemberCount=30
					end
				ExpBonus3 = format(varExpBonus*(varMemberCount/100))
				AddExp(varMap, varPlayer, ExpBonus3);	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "额外获得#R经验"..ExpBonus3.."点#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,format("护送人数增加额外获得#R经验"..ExpBonus3.."点#o的奖励"),8,2)
			end
		end
		if 	GuildLevel == 2 then
			local varLevel = GetLevel(varMap, varPlayer)
			local varExp = ceil (x300869_var_Exp* varLevel *0.25 )
			if varMemberCount >= 1  then
					if varMemberCount>=40 then
						varMemberCount=40
					end
				ExpBonus3 = format(varExpBonus*(varMemberCount/100))
				AddExp(varMap, varPlayer, ExpBonus3);	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "额外获得#R经验"..ExpBonus3.."点#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,format("护送人数增加额外获得#R经验"..ExpBonus3.."点#o的奖励"),8,2)
			end
			AddExp(varMap, varPlayer, varExp);	
			StartTalkTask(varMap)
			TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			Msg2Player(varMap,varPlayer,format("帮会等级2级额外获得#R经验"..varExp.."点#o的奖励"),8,2)
		end
		if 	GuildLevel == 3 then
			local varLevel = GetLevel(varMap, varPlayer)
			local varExp = ceil (x300869_var_Exp * varLevel *0.5 )
			if varMemberCount >= 1  then
					if varMemberCount>=50 then
						varMemberCount=50
					end
				ExpBonus3 = format(varExpBonus*(varMemberCount/100))
				AddExp(varMap, varPlayer, ExpBonus3);	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "额外获得#R经验"..ExpBonus3.."点#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,format("护送人数增加额外获得#R经验"..ExpBonus3.."点#o的奖励"),8,2)
			end
			AddExp(varMap, varPlayer, varExp);	
			StartTalkTask(varMap)
			TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			Msg2Player(varMap,varPlayer,format("帮会等级3级额外获得#R经验"..varExp.."点#o的奖励"),8,2)
		end
		if 	GuildLevel == 4 then
			local varLevel = GetLevel(varMap, varPlayer)
			local varExp = ceil (x300869_var_Exp * varLevel *0.75 )
			if varMemberCount >= 1  then
					if varMemberCount>=60 then
						varMemberCount=60
					end
				ExpBonus3 = format(varExpBonus*(varMemberCount/100))
				AddExp(varMap, varPlayer, ExpBonus3);	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "额外获得#R经验"..ExpBonus3.."点#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,format("护送人数增加额外获得#R经验"..ExpBonus3.."点#o的奖励"),8,2)
			end
			AddExp(varMap, varPlayer, varExp);	
			StartTalkTask(varMap)
			TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			Msg2Player(varMap,varPlayer,format("帮会等级4级额外获得#R经验"..varExp.."点#o的奖励"),8,2)
		end
		if 	GuildLevel == 5 then
			local varLevel = GetLevel(varMap, varPlayer)
			local varExp = ceil (x300869_var_Exp * varLevel *1 )
			if varMemberCount >= 1  then
					if varMemberCount>=70 then
						varMemberCount=70
					end
				ExpBonus3 = format(varExpBonus*(varMemberCount/100))
				AddExp(varMap, varPlayer, ExpBonus3);	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "额外获得#R经验"..ExpBonus3.."点#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,format("护送人数增加额外获得#R经验"..ExpBonus3.."点#o的奖励"),8,2)
			end
			AddExp(varMap, varPlayer, varExp);	
			StartTalkTask(varMap)
			TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			Msg2Player(varMap,varPlayer,format("帮会等级5级额外获得#R经验"..varExp.."点#o的奖励"),8,2)
		end
		if 	GuildLevel == 6 then
			local varLevel = GetLevel(varMap, varPlayer)
			local varExp = ceil (x300869_var_Exp * varLevel *1.25 )
			if varMemberCount >= 1  then
					if varMemberCount>=70 then
						varMemberCount=70
					end
				ExpBonus3 = format(varExpBonus*(varMemberCount/100))
				AddExp(varMap, varPlayer, ExpBonus3);	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "额外获得#R经验"..ExpBonus3.."点#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,format("护送人数增加额外获得#R经验"..ExpBonus3.."点#o的奖励"),8,2)
			end
			AddExp(varMap, varPlayer, varExp);	
			StartTalkTask(varMap)
			TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			Msg2Player(varMap,varPlayer,format("帮会等级6级额外获得#R经验"..varExp.."点#o的奖励"),8,2)
		end
		if 	GuildLevel == 7 then
			local varLevel = GetLevel(varMap, varPlayer)
			local varExp = ceil (x300869_var_Exp * varLevel *1.5 )
			if varMemberCount >= 1  then
					if varMemberCount>=70 then
						varMemberCount=70
					end
				ExpBonus3 = format(varExpBonus*(varMemberCount/100))
				AddExp(varMap, varPlayer, ExpBonus3);	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "额外获得#R经验"..ExpBonus3.."点#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,format("护送人数增加额外获得#R经验"..ExpBonus3.."点#o的奖励"),8,2)
			end
			AddExp(varMap, varPlayer, varExp);	
			StartTalkTask(varMap)
			TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			Msg2Player(varMap,varPlayer,format("帮会等级7级额外获得#R经验"..varExp.."点#o的奖励"),8,2)
		end
	end

	
	
	local maxlevel = GetTopListInfo_MaxLevel(GetWorldID(varMap, varPlayer))
	local nCountryIdx = GetCurCountry(varMap, varPlayer);
	
	local selfscore = GetCountryParam(varMap, nCountryIdx, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	
	local loulanscore   = GetCountryParam(varMap, 0, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local tianshanscore = GetCountryParam(varMap, 1, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local kunlunscore   = GetCountryParam(varMap, 2, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local dunhuangscore = GetCountryParam(varMap, 3, CD_LASTWEEK_STRONG_WEAK_JIFEN)
	local allscore		= loulanscore + tianshanscore + kunlunscore + dunhuangscore
	local ruoguoopen = IsOpenWeakCountryCheck()
	
    if x300869_var_BonusMoney8 > 0 then
		AddGuildUserPoint(varMap,varPlayer,x300869_var_BonusMoney8)	
		local BonusMoney8 = x300869_var_BonusMoney8
		StartTalkTask(varMap)
		TalkAppendString(varMap, "获得#R帮贡"..BonusMoney8.."点#o的奖励" );
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,format("获得#R帮贡"..BonusMoney8.."点#o的奖励", x300869_var_BonusMoney8),8,2)
		if isMultiple == 1 then
			local pos = GetGuildOfficial(varMap, varPlayer)
				if pos == 5 then
					AddGuildUserPoint(varMap,varPlayer,450)	
					local BonusMoney8 = x300621_var_BonusMoney8
					StartTalkTask(varMap)
					TalkAppendString(varMap, "额外获得#R帮贡450点#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R帮贡450点#o的奖励",8,2)
				elseif pos == 4 then
					AddGuildUserPoint(varMap,varPlayer,300)	
					local BonusMoney8 = x300621_var_BonusMoney8
					StartTalkTask(varMap)
					TalkAppendString(varMap, "额外获得#R帮贡300点#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R帮贡300点#o的奖励",8,2)
				else
					AddGuildUserPoint(varMap,varPlayer,150)	
					local BonusMoney8 = x300621_var_BonusMoney8
					StartTalkTask(varMap)
					TalkAppendString(varMap, "额外获得#R帮贡150点#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					Msg2Player(varMap,varPlayer,format("帮会多倍任务额外获得#R帮贡150点#o的奖励", x300621_var_BonusMoney8),8,2)
				end
		end
		
		if maxlevel >= 70 and ruoguoopen == 1 then
			if selfscore <= allscore * 0.2 and selfscore > 0 and allscore > 0 then
			local BonusMoney8rg =floor((( 0.2 - selfscore / allscore) * 10 + 0.5) * 150)
				if BonusMoney8rg > 150 then 
					BonusMoney8rg = 150
				end
				AddGuildUserPoint(varMap,varPlayer,BonusMoney8rg)
				StartTalkTask(varMap)
				TalkAppendString(varMap, "弱国额外获得#R帮贡"..BonusMoney8rg.."点#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,format("弱国额外获得#R帮贡%d点#o的奖励", BonusMoney8rg),8,2)
			end
		end

	end
	--老玩家额外经验
	if IsHaveSpecificImpact( varMap, varPlayer, 8864) == 1 then
		x300869_var_GuildExpBonus = x300869_var_GuildExpBonus*2
	end
	local bangExp = x300869_var_GuildExpBonus
	if bangExp > 0 then
		local pos = GetGuildOfficial(varMap, varPlayer)
		if pos == x300869_var_Leader_Index then
			if maxlevel >= 70 and ruoguoopen == 1 then
				if selfscore <= allscore * 0.2 and selfscore > 0 and allscore > 0 then
					AddGuildExp(varMap, varPlayer,150)
					Msg2Player(varMap,varPlayer,format("护兽完成，帮会获得#R帮会经验100点#G的奖励"),6,2)
					Msg2Player(varMap,varPlayer,format("弱国额外获得#R帮会经验50点#G的奖励"),6,2)
				else
					AddGuildExp(varMap, varPlayer,100)
					Msg2Player(varMap,varPlayer,format("护兽完成，帮会获得#R帮会经验100点#G的奖励"),6,2)
				end
			else
				AddGuildExp(varMap, varPlayer,100)
				Msg2Player(varMap,varPlayer,format("护兽完成，帮会获得#R帮会经验100点#G的奖励"),6,2)
			end
		end
		
		
			AddGuildExp(varMap,varPlayer,bangExp)
			StartTalkTask(varMap)
						--老玩家额外经验
			if IsHaveSpecificImpact( varMap, varPlayer, 8864) == 1 then
				Msg2Player(varMap,varPlayer,format("老玩家回归，帮会获得双倍经验"),6,2)
			end
			TalkAppendString(varMap, "获得#R帮会经验"..bangExp.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)			
			Msg2Player(varMap,varPlayer,format("获得#R帮会经验"..bangExp.."点#o的奖励"),8,2)
		
			
			
			
			
			
		
	end

	local pos = GetGuildOfficial(varMap, varPlayer)
  	if pos == x300869_var_Leader_Index then			
		if x300869_var_CostMoney > 0 then
			AddMoney( varMap , varPlayer ,0, x300869_var_CostMoney )
			local readme="获得#R返还押金10两#o"
			StartTalkTask(varMap)
			TalkAppendString(varMap, "获得#R返还押金10两#o" );
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player( varMap,varPlayer,readme,8,2 )
		end 
 	end
	
	GamePlayScriptLog(varMap,varPlayer,12)
	
	LuaCallNoclosure( 300638, "SaveGuildYunBiaoMD", varMap,varPlayer )	
end




function x300869_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	if GetGuildID(varMap, varPlayer) == -1 then
		
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

    local pos = GetGuildOfficial(varMap, varPlayer)
  	if pos ~= x300869_var_Leader_Index then			
	  	StartTalkTask(varMap)
		TalkAppendString(varMap, "您不是帮主无法回复【帮会】帮会神兽任务！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "#o您不是帮主无法回复【帮会】帮会神兽任务！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
 	end

    
	local varValid = IsValidGuildBus(varMap, varPlayer)
	if varValid == 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "您距离镖车过远，无法提交【帮会】帮会神兽任务！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "#o您距离镖车过远，无法提交【帮会】帮会神兽任务！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return 0
	end
	
	SubmitGuildConvoyQuest(varMap, varPlayer)
 	local GuildID = GetGuildID(varMap,varPlayer)
	local varCurDayTime = GetDayTime()						
	SetGuildQuestData(varMap,GuildID, GD_GUILD_INDEX_YUNBIAO_ACCEPT_TIME, varCurDayTime)

	return 0
end


function x300869_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, x300869_var_QuestId ) == 0 then	
		return
	end

	if varTalkNpcGUID == x300869_SubmitNPCGUID then	
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300869_var_QuestId)
		TalkAppendButton( varMap, x300869_var_QuestId,x300869_var_QuestName, 7,x300869_var_FileId ) 
	end
end





function x300869_ProcGuildConvoyClearMemberQuest( varMap, varPlayer,varState )
	
	if IsHaveQuestNM( varMap, varPlayer, x300869_var_QuestId ) == 0 then	
		return
	end
	local varStr = "你放弃了【帮会】帮会神兽任务，任务失败!"

	if varState == 0 then				
		varStr = "你放弃了【帮会】帮会神兽任务，任务失败!"
	elseif varState == 1 then			
		varStr = "由于帮主将你踢出了护送神兽队伍，【帮会】帮会神兽任务失败!"
	elseif varState == 2 then			
		varStr = "由于帮主放弃了【帮会】帮会神兽任务，任务失败!"
		local pos = GetGuildOfficial(varMap, varPlayer)
		if pos == x300869_var_Leader_Index then			
			local GuildID = GetGuildID(varMap,varPlayer)
			local varCurDayTime = GetDayTime()						
			SetGuildQuestData(varMap,GuildID, GD_GUILD_INDEX_YUNBIAO_ACCEPT_TIME, varCurDayTime)
		end
	elseif varState == 3 then			
		varStr = "由于帮主禅让了职位，【帮会】帮会神兽任务失败!"
		local GuildID = GetGuildID(varMap,varPlayer)
		local varCurDayTime = GetDayTime()						
		SetGuildQuestData(varMap,GuildID, GD_GUILD_INDEX_YUNBIAO_ACCEPT_TIME, varCurDayTime)
	elseif varState == 4 then			
		varStr = "由于帮会被解散，【帮会】帮会神兽任务失败!"
	elseif varState == 5 then			
		varStr = "由于神兽死亡，【帮会】帮会神兽任务失败!"
	elseif varState == 6 then			
		varStr = "由于帮主离开护送目标时间过久，护送目标消失，任务失败！"
	elseif varState == 7 then			
		varStr = "由于神兽生命超时，【帮会】帮会神兽任务失败!"
	elseif varState == 11 then			
		varStr = "由于你离开神兽太远，你无法获得奖励!"
	elseif varState == 17 then			
		varStr = "由于弹劾帮主达成，帮主位置发生变化，【帮会】帮会神兽任务失败!"
		local GuildID = GetGuildID(varMap,varPlayer)
		local varCurDayTime = GetDayTime()						
		SetGuildQuestData(varMap,GuildID, GD_GUILD_INDEX_YUNBIAO_ACCEPT_TIME, varCurDayTime)
	elseif varState == 18 then			
		varStr = "由于神兽死亡，【帮会】帮会神兽任务失败!"
		local GuildID = GetGuildID(varMap,varPlayer)
		local varCurDayTime = GetDayTime()						
		SetGuildQuestData(varMap,GuildID, GD_GUILD_INDEX_YUNBIAO_ACCEPT_TIME, varCurDayTime)
	end

	if varState>=0 and varState<=7 or varState == 11 or varState ==17 or varState ==18 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, varStr)
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varStr,8,2)
	end

	local varRet = DelQuest( varMap, varPlayer, x300869_var_QuestId  )
	if varRet == 1 then
		
	else
		
	end
	
end     





function x300869_ProcGuildConvoySubmitQuest( varMap, varPlayer )

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300869_var_QuestId); 
	
	
	local raingMisFinishing = GetQuestParam( varMap, varPlayer,varQuestIdx,x300869_var_RingQuestIndex )

	
	
	if DelQuest( varMap, varPlayer, x300869_var_QuestId  ) < 1 then
		return 
	end

    
    local varId = GetGuildID( varMap, varPlayer)
    if varId ~= -1 then
        AddGuildActivity( varMap, varPlayer, GetGuildCacheFreeParam( varId, GD_GUILD_ACTIVITY_PARAM5) )
    end

	LuaCallNoclosure( 256266, "Finishhss", varMap, varPlayer)
	local varMemberCount = GetBusEscortMemberNum(varMap,varPlayer)
	GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_MULTI_MISSION_HUSHOU, x300869_var_FileId,varMemberCount,"ProcReturn1",raingMisFinishing)
end





function x300869_ProcQuestAbandon( varMap, varPlayer, varQuest )

	AbandonGuildConvoyQuest(varMap, varPlayer,0)
	





 	
end

function x300869_ClearBusQuest( varMap, varPlayer )
	AbandonGuildConvoyQuest(varMap, varPlayer, 18)
end

function x300869_ProcReturn(varMap, varPlayer,QuestData,varQuest,varTalknpc)

	local varCurDayTime = GetDayTime()						
		
	if QuestData == varCurDayTime then					
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，今天您的帮会已护送过神兽了，请改天再来吧！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "#o很抱歉，今天您的帮会已护送过神兽了，请改天再来吧！" 
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		
	else
		local CurrMoney = GetMoney(varMap , varPlayer ,0)
		if CurrMoney < x300869_var_CostMoney then
		    StartTalkTask(varMap)
			TalkAppendString(varMap, "您身上的现银不足！");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			local varReadme = "#o很抱歉，您包裹中的现银不够支付押金，无法接取任务！" 
			Msg2Player(varMap,varPlayer,varReadme,8,2)
			return
		end

	
	    local varBusID = LuaCallNoclosure( x300869_var_BusScriptId, "ProcCreateBus", varMap, varPlayer,varQuest )
		
		
		
		
	end
	
	

end





function x300869_ProcAccept( varMap, varPlayer )

	if GetGuildID(varMap, varPlayer) == -1 then
		
		return 0
	end

	local pos = GetGuildOfficial(varMap, varPlayer)
  	if pos == x300869_var_Leader_Index then			
		
		local varNum = CostMoney( varMap , varPlayer ,0, x300869_var_CostMoney,301 )
		if varNum == -1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap, "接取任务失败！");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			local varReadme = "#o很抱歉，您包裹中的现银不够支付押金，无法接取任务！" 
			Msg2Player(varMap,varPlayer,varReadme,8,2)
			return
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap, "您接受了任务：【帮会】帮会神兽")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			local varReadme = "您接受了任务：【帮会】帮会神兽#r扣除您#R10#W#o两现银做为押金！" 
			Msg2Player(varMap,varPlayer,varReadme,8,2)
		end

 	end

	local varCurDayTime = GetDayTime()						
	local varRet = AddQuest( varMap, varPlayer,x300869_var_QuestId , x300869_var_FileId,0,0,0,1 ) 
	
	if varRet == 1 then

		
		GamePlayScriptLog(varMap,varPlayer,11)

		x300869_QuestLogRefresh( varMap, varPlayer, x300869_var_QuestId)
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		
		
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x300869_var_QuestId);
		SetQuestByIndex(varMap, varPlayer, varQuestIdx, 7, 0);

		
		SetQuestByIndex(varMap, varPlayer, varQuestIdx, x300869_var_RingQuestIndex, 0);		

  		
  		local pos = GetGuildOfficial(varMap, varPlayer)
  		if pos == x300869_var_Leader_Index then			
  			local GuildID = GetGuildID(varMap,varPlayer)
  			SetGuildQuestData(varMap, GuildID, GD_GUILD_INDEX_YUNBIAO_ACCEPT_TIME , varCurDayTime)		
  			SetGuildQuestData(varMap, GuildID, GD_GUILD_INDEX_YUNBIAO_RING_MIS_TIME , 0)	  				
  		end
	end

end




function x300869_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varIndex )

	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300869_var_QuestName)
		TalkAppendString(varMap,format("%s", x300869_var_QuestInfo))
		TalkAppendString(varMap," ")

		
		TalkAppendString( varMap,"#Y任务目标：")
		TalkAppendString( varMap,format("%s", x300869_var_QuestTarget))
		TalkAppendString( varMap," ")

		
		if x300869_var_QuestHelp ~= "" then

			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s", x300869_var_QuestHelp))
			TalkAppendString(varMap," ")
		end
		
			
		
		
			TalkAppendString(varMap,"\n#Y奖励内容：")	
		
		local varLevel = GetLevel(varMap, varPlayer)
		
		local varExpBonus = x300869_var_Exp * varLevel
		varExpBonus =floor(varExpBonus+0.5)
	    if varExpBonus > 0 then
			TalkAppendString(varMap,"经验值："..varExpBonus.."点")	
		end

		
		if x300869_var_BonusMoney8 > 0 then
			
			TalkAppendString(varMap,"帮贡：150点")	
			
		end	
		
		if x300869_var_GuildExpBonus>0 then
			
			TalkAppendString(varMap,"帮会经验：1点")		
		end
		if varLevel >= 80 then
			local refixInhExp = RefixInherenceExp(varMap, varPlayer, 400)
			local varStr = format("天赋值：%d点", refixInhExp)
			TalkAppendString(varMap, varStr)
		end
		
		
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300869_var_FileId, x300869_var_QuestId);
end




function x300869_DispatchContinueInfo( varMap, varPlayer, varTalknpc )
	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300869_var_QuestName)
		TalkAppendString(varMap,format("%s", x300869_var_QuestInfo))
		TalkAppendString(varMap," ")

		
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成\n");
		TalkAppendString(varMap, "#Y奖励内容：");
  		

   		
		local varLevel = GetLevel(varMap, varPlayer)
		
		local varExpBonus = x300869_var_Exp * varLevel
		varExpBonus =floor(varExpBonus+0.5)
	    if varExpBonus > 0 then
			TalkAppendString(varMap,"经验值："..varExpBonus.."点")	
		end

		
		if x300869_var_BonusMoney8 > 0 then
			
			TalkAppendString(varMap,"帮贡：150点")	
			
		end	
		
		if x300869_var_GuildExpBonus>0 then
			
			TalkAppendString(varMap,"帮会经验：1点")		
		end
		if varLevel >= 80 then
			local refixInhExp = RefixInherenceExp(varMap, varPlayer, 400)
			local varStr = format("天赋值：%d点", refixInhExp)
			TalkAppendString(varMap, varStr)
		end
	    
	StopTalkTask()
	
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300869_var_FileId, x300869_var_QuestId,0);

end




function x300869_DispatchCompletedInfo( varMap, varPlayer, varTalknpc )
	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300869_var_QuestName)
		TalkAppendString(varMap,x300869_var_QuestCompleted)
		TalkAppendString(varMap," ")

  		
		TalkAppendString(varMap,"\n#Y奖励内容：")	
		
		
		local varLevel = GetLevel(varMap, varPlayer)
		
		local varExpBonus = x300869_var_Exp * varLevel
		varExpBonus =floor(varExpBonus+0.5)
	    if varExpBonus > 0 then
			TalkAppendString(varMap,"经验值："..varExpBonus.."点")	
		end

		
		if x300869_var_BonusMoney8 > 0 then
			
			TalkAppendString(varMap,"帮贡：150点")	
			
		end	
		
		if x300869_var_GuildExpBonus>0 then
			
			TalkAppendString(varMap,"帮会经验：1点")		
		end
		if varLevel >= 80 then
			local refixInhExp = RefixInherenceExp(varMap, varPlayer, 400)
			local varStr = format("天赋值：%d点", refixInhExp)
			TalkAppendString(varMap, varStr)
		end
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300869_var_FileId, x300869_var_QuestId);
  LuaCallNoclosure( 256238, "Finishhss", varMap, varPlayer)
end




function x300869_QuestLogRefresh( varMap, varPlayer, varQuest)
 StartTalkTask(varMap)

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,varQuest );
	if varHaveQuest > 0 then
		StartTalkTask(varMap)	
		local varLevel = GetLevel(varMap, varPlayer)
		
		local varExpBonus = x300869_var_Exp * varLevel
		varExpBonus =floor(varExpBonus+0.5)
	    if varExpBonus > 0 then
			AddQuestExpBonus(varMap,  varExpBonus);
		end
		if x300869_var_BonusMoney8 > 0 then
			AddQuestMoneyBonus8(varMap, x300869_var_BonusMoney8 )
		end	
		
		if x300869_var_GuildExpBonus>0 then
			AddQuestGuildExpBonus(varMap,x300869_var_GuildExpBonus)
		end
		if varLevel >= 80 then
			local refixInhExp = RefixInherenceExp(varMap, varPlayer, 400)			
			AddQuestInherenceExpBonus(varMap,refixInhExp)
		end
		AddQuestLogCustomText( varMap,
								"",						
								x300869_var_QuestName,        
								x300869_var_QuestTarget,		
								"",					
								"将神兽安全护送到边境交给@npc_131516",                 
								x300869_var_QuestInfo,	
								""					
								)
	end

	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);

end

function x300869_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	x300869_QuestLogRefresh( varMap, varPlayer, x300869_var_QuestId)
end


function x300869_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300869_ProcMeberOffline(varMap,varPlayer)

	StartTalkTask(varMap)
	TalkAppendString(varMap, "您已经距离神兽过远，神兽感到了一丝危险，请尽快返回！")
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,"#cEFC800您已经距离神兽过远，神兽感到了一丝危险，请尽快返回！", 8,2)
	
end
