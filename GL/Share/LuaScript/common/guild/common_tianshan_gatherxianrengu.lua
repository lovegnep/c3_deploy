
--DECLARE_QUEST_INFO_START--
x300908_var_FileId		=	300908
x300908_var_QuestName	=	"【帮会】丹木"
x300908_var_QuestTarget	=	"　收集#G丹木#W"
x300908_var_QuestInfo	=	"\t随着帮会的蓬勃发展，我们需要更高级的木材来满足日益增长的需求。生长在#R中立地图#W的丹木是一种神奇的木头，终年不见阳光却能生长茂盛，传说仙人们都拿它来制作酒器。在仙人谷的二层，三层，四层和五层，生长着这种神奇的丹木。那里充斥着重重危险，你愿意进入谷内带回五个丹木么？当帮主发布收集令时2小时内回复任务可获得翻倍奖励（经验，帮贡）和2点使命点！"
x300908_var_QuestHelp	=	"\t#G丹木#W只生长在地下#R中立地图#W@npc_37000，@npc_38000，@npc_39000。并且数量稀少。随着你所在帮会等级的提高，你获得的奖励也会相应增加。"
x300908_var_QuestRuse	=	"\t当你到达#R中立地图#W，进行收集#G丹木#W时，如果受到攻击，将无法收集完成。你可以进入角落，将周围的怪物杀死后，再进行收集。#R中立地图#W的怪物比较密集，您最好好组队进行收集！"
x300908_var_QuestCompleted = "我需要的丹木，你已经找到了？太感谢了，辛苦了，这是给你的酬谢。"
x300908_var_SubmitNPCGUID	=	126020
x300908_var_GroupPoint	=	{ {type=10,varId =124,target = "丹木"}}

x300908_var_NPCName		= "@npc_126020"

x300908_var_ExtTarget		=	{ {type=20,n=10,target="马车"} }
x300908_var_LevelLess		= 	40 

--DECLARE_QUEST_INFO_STOP--
x300908_var_BonusMoney8	=   50
x300908_var_GuildExpBonus =	1

x300908_var_Mis_Count		= 1
x300908_var_Leader_Index	= 5
x300908_var_PreQuestId	= 7006


function x300908_IsHavePreQuest(varMap, varPlayer)
	local QuestId1  = 7700 
		if IsHaveQuestNM( varMap, varPlayer, QuestId1 ) > 0 then	
			return 1
		end
	return -1
end
                    
function x300908_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	if x300908_IsHavePreQuest(varMap, varPlayer) > 0 then
		return 0
	end

	if GetGuildID( varMap, varPlayer ) == -1 then
 		
		return
	end
	
	 local varLevel = GetLevel(varMap,varPlayer)
	if varLevel < 40  then
		return
	end

  	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, varQuest);
		TalkAppendButton( varMap, varQuest, x300908_var_QuestName ,8,varState)	
		
		return 
	end

end



function x300908_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest )

	
		if IsHaveQuestNM( varMap, varPlayer, varQuest ) > 0 then	
			local varDone = x300908_CheckSubmit(varMap, varPlayer,varTalknpc, varQuest);
			if(varDone > 0) then
				x300908_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest) 
			else
				x300908_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest ) 
			end
		else
			x300908_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varQuest )		
		end
	
end




function x300908_CheckSubmit(varMap, varPlayer,varTalknpc,varQuest)

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
	local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,varQuest)
	TalkAppendButton( varMap, varQuest,x300908_var_QuestName, 7,varState ) 
	return GetQuestParam(varMap, varPlayer, varQuestIdx, 7);

end





function x300908_DispatchCompletedInfo( varMap, varPlayer, varTalknpc,varQuest )
	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300908_var_QuestName)
		TalkAppendString(varMap,x300908_var_QuestCompleted)
		TalkAppendString(varMap," ")
		
		
		local varLevel = GetLevel(varMap, varPlayer)
		
		local varExpBonus = ceil (100 * 3 * varLevel * 20*1*1 )
		varExpBonus =floor(varExpBonus+0.5)
		if varExpBonus > 0 then
			AddQuestExpBonus(varMap, varExpBonus )
		end
		
		if x300908_var_BonusMoney8>0 then
			AddQuestMoneyBonus8(varMap,x300908_var_BonusMoney8)
		end
		
		
			
		
	StopTalkTask(varMap)
	DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x300908_var_FileId, varQuest);

end





function x300908_DispatchContinueInfo( varMap, varPlayer, varTalknpc,varQuest )
	
	StartTalkTask(varMap)

		
		TalkAppendString(varMap,"#Y"..x300908_var_QuestName)
		TalkAppendString(varMap,format("%s", x300908_var_QuestInfo))
		TalkAppendString(varMap," ")

		
		TalkAppendString( varMap,"#Y完成情况：")
		TalkAppendString(varMap, "未完成");

		
		local varLevel = GetLevel(varMap, varPlayer)
		
		local varExpBonus = ceil (100 * 3 * varLevel * 20*1*1 )
		varExpBonus =floor(varExpBonus+0.5)
		if varExpBonus> 0 then
			AddQuestExpBonus(varMap, varExpBonus )
		end
		
		if x300908_var_BonusMoney8>0 then
			AddQuestMoneyBonus8(varMap,x300908_var_BonusMoney8)
		end
		
		
			
		
		
	
	StopTalkTask(varMap)
	DeliverTalkRequire(varMap, varPlayer, varTalknpc, x300908_var_FileId, varQuest,0);

end





function x300908_DispatchQuestInfo( varMap, varPlayer, varTalknpc,varQuest )

	StartTalkTask(varMap)
		
		TalkAppendString(varMap,"#Y"..x300908_var_QuestName)
		TalkAppendString(varMap,format("%s", x300908_var_QuestInfo))
		TalkAppendString(varMap," ")

		
		TalkAppendString( varMap,"#Y任务目标：")
		TalkAppendString( varMap,format("%s", x300908_var_QuestTarget))
		TalkAppendString( varMap," ")

		
		if x300908_var_QuestHelp ~= "" then
			TalkAppendString(varMap,"#Y任务提示：")
			TalkAppendString(varMap,format("%s", x300908_var_QuestHelp))
			TalkAppendString(varMap," ")
		end
			
		
		local varLevel = GetLevel(varMap, varPlayer)
		
		local varExpBonus = ceil (100 * 3 * varLevel * 20*1*1 )
		varExpBonus =floor(varExpBonus+0.5)
		if varExpBonus > 0 then
			AddQuestExpBonus(varMap, varExpBonus )
		end
		
		if x300908_var_BonusMoney8>0 then
			AddQuestMoneyBonus8(varMap,x300908_var_BonusMoney8)
		end
		
		
			
		
	StopTalkTask(varMap)
	DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x300908_var_FileId, varQuest);
end





function x300908_ProcReturn1(varMap, varPlayer,QuestData,varQuest,varTalknpc)
 
	local curTime = GetCurrentTime()
	local isMultiple = 0
	if curTime - QuestData < 2*60*60 then
		isMultiple = 1
	end
	x300908_GetBonus( varMap,varPlayer, isMultiple )
end

function x300908_GetBonus( varMap, varPlayer, isMultiple )

	
	local varLevel = GetLevel(varMap, varPlayer)
	
	local varExpBonus = ceil (100 * 3 * varLevel * 20*1*1 )
	varExpBonus =floor(varExpBonus+0.5)
	local GuildLevel = GetGuildSimpleData(GetGuildID( varMap, varPlayer ))
    if varExpBonus > 0 then
    		local text1 = "你完成了任务：【帮会】收集丹木"
			local text2 = "获得#R经验"..varExpBonus.."点#o的奖励"
			
			
			AddExp(varMap, varPlayer, varExpBonus);	
			StartTalkTask(varMap)
			TalkAppendString(varMap, text1);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			StartTalkTask(varMap)
			TalkAppendString(varMap, text2);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			
			
			
			
	  		Msg2Player(varMap,varPlayer,text1,8,2)
	  		Msg2Player(varMap,varPlayer,text2,8,2)
			
		if isMultiple == 1 then
			local ExpBonus1 = ceil (100 * 3 * varLevel * 20*1*1 *3)
			local Exp3 = ceil (100 * 3 * varLevel * 20*1*1*3 )
			local ExpBonus2 = ceil (100 * 3 * varLevel * 20*1*1 *2)
			local pos = GetGuildOfficial(varMap, varPlayer)
			local text3 = "获得#R使命点2点#o的奖励"
				AddGuildShiMing(varMap, varPlayer,2)
				StartTalkTask(varMap)
				TalkAppendString(varMap, text3);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,text3,8,2)
			if pos == 5 then
				local guildid =GetGuildID(varMap, varPlayer)
				if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
					StartTalkTask(varMap)
					TalkAppendString(varMap, "帮主职位只能领取一次收集令奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					Msg2Player(varMap,varPlayer,"帮主职位只能领取一次收集令奖励",8,2)
				else
					AddExp(varMap, varPlayer, ExpBonus1);	
					StartTalkTask(varMap)
					TalkAppendString(varMap, "额外获得#R经验"..Exp3.."点#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R经验"..Exp3.."点#o的奖励",8,2)
					SetGuildQuestData(varMap,GetGuildID(varMap,varPlayer),GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
				end
			elseif pos == 4 then
				local guildid =GetGuildID(varMap, varPlayer)
				if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
					StartTalkTask(varMap)
					TalkAppendString(varMap, "副帮主职位只能领取一次收集令奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
					Msg2Player(varMap,varPlayer,"副帮主职位只能领取一次收集令奖励",8,2)
				else
					AddExp(varMap, varPlayer, ExpBonus2);	
					StartTalkTask(varMap)
					TalkAppendString(varMap, "额外获得#R经验"..ExpBonus2.."点#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R经验"..ExpBonus2.."点#o的奖励",8,2)
					SetGuildQuestData(varMap,GetGuildID(varMap,varPlayer),GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
				end
			else
				AddExp(varMap, varPlayer, varExpBonus);	
				StartTalkTask(varMap)
				TalkAppendString(varMap, "额外获得#R经验"..varExpBonus.."点#o的奖励");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)	
				Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R经验"..varExpBonus.."点#o的奖励",8,2)
			end
		end
		if 	GuildLevel == 2 then
			local varLevel = GetLevel(varMap, varPlayer)
			local varExp = ceil (100 * 3 * varLevel * 20*0.25*1 )
			AddExp(varMap, varPlayer, varExp);	
			StartTalkTask(varMap)
			TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			Msg2Player(varMap,varPlayer,"帮会等级2级额外获得#R经验"..varExp.."点#o的奖励",8,2)
		end
		if 	GuildLevel == 3 then
			local varLevel = GetLevel(varMap, varPlayer)
			local varExp = ceil (100 * 3 * varLevel * 20*0.5*1 )
			AddExp(varMap, varPlayer, varExp);	
			StartTalkTask(varMap)
			TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			Msg2Player(varMap,varPlayer,"帮会等级3级额外获得#R经验"..varExp.."点#o的奖励",8,2)
		end
		if 	GuildLevel == 4 then
			local varLevel = GetLevel(varMap, varPlayer)
			local varExp = ceil (100 * 3 * varLevel * 20*0.75*1 )
			AddExp(varMap, varPlayer, varExp);	
			StartTalkTask(varMap)
			TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			Msg2Player(varMap,varPlayer,"帮会等级4级额外获得#R经验"..varExp.."点#o的奖励",8,2)
		end
		if 	GuildLevel == 5 then
			local varLevel = GetLevel(varMap, varPlayer)
			local varExp = ceil (100 * 3 * varLevel * 20*1*1 )
			AddExp(varMap, varPlayer, varExp);	
			StartTalkTask(varMap)
			TalkAppendString(varMap, "额外获得#R经验"..varExp.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			Msg2Player(varMap,varPlayer,"帮会等级5级额外获得#R经验"..varExp.."点#o的奖励",8,2)
		end
	end

    if x300908_var_BonusMoney8 > 0 then
		    AddGuildUserPoint(varMap,varPlayer,x300908_var_BonusMoney8)	
			local BonusMoney8 = x300908_var_BonusMoney8
			StartTalkTask(varMap)
			TalkAppendString(varMap, "获得#R帮贡"..BonusMoney8.."点#o的奖励");
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)	
			Msg2Player(varMap,varPlayer,format("获得#R帮贡"..BonusMoney8.."点#o的奖励", x300908_var_BonusMoney8),8,2)
			if isMultiple == 1 then
			local pos = GetGuildOfficial(varMap, varPlayer)
				if pos == 5 then
					local guildid =GetGuildID(varMap, varPlayer)
					if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
						StartTalkTask(varMap)
						TalkAppendString(varMap, "帮主职位只能领取一次收集令奖励");
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varPlayer)
						Msg2Player(varMap,varPlayer,"帮主职位只能领取一次收集令奖励",8,2)
					else
						AddGuildUserPoint(varMap,varPlayer,150)	
						local BonusMoney8 = x300908_var_BonusMoney8
						StartTalkTask(varMap)
						TalkAppendString(varMap, "额外获得#R帮贡150点#o的奖励");
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varPlayer)	
						Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R帮贡150点#o的奖励",8,2)
						SetGuildQuestData(varMap,GetGuildID(varMap,varPlayer),GD_GUILD_INDEX_CHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
					end
				elseif pos == 4 then
					local guildid =GetGuildID(varMap, varPlayer)
					if  GetGuildCacheFreeParam(guildid,GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY) == GetDayOfYear() then
						StartTalkTask(varMap)
						TalkAppendString(varMap, "副帮主职位只能领取一次收集令奖励");
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varPlayer)
						Msg2Player(varMap,varPlayer,"副帮主职位只能领取一次收集令奖励",8,2)
					else
						AddGuildUserPoint(varMap,varPlayer,100)	
						local BonusMoney8 = x300908_var_BonusMoney8
						StartTalkTask(varMap)
						TalkAppendString(varMap, "额外获得#R帮贡100点#o的奖励");
						StopTalkTask(varMap)
						DeliverTalkTips(varMap,varPlayer)	
						Msg2Player(varMap,varPlayer,"帮会多倍任务额外获得#R帮贡100点#o的奖励",8,2)
						SetGuildQuestData(varMap,GetGuildID(varMap,varPlayer),GD_GUILD_INDEX_ASSCHIEF_MULTIMISSION_DAY,GetDayOfYear(),0)
					end
				else
					AddGuildUserPoint(varMap,varPlayer,50)	
					local BonusMoney8 = x300908_var_BonusMoney8
					StartTalkTask(varMap)
					TalkAppendString(varMap, "额外获得#R帮贡"..BonusMoney8.."点#o的奖励");
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	
					Msg2Player(varMap,varPlayer,format("帮会多倍任务额外获得#R帮贡"..BonusMoney8.."点#o的奖励", x300908_var_BonusMoney8),8,2)
				end
			end
	end
	
	
	
		
		
			
			
			
			
			
			
		
			
			
			
			
			
		
	

end





function x300908_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )

	if IsQuestFullNM( varMap, varPlayer )==1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"可接任务数量已满")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 
	end

	if GetGuildID( varMap, varPlayer ) == -1 then
		
		StartTalkTask(varMap)
		TalkAppendString(varMap, "你不是帮会成员");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,"你不是帮会成员",8,2)
		return
	end
	local guildid = GetGuildID( varMap, varPlayer )
	local GuildLevel = GetGuildSimpleData(guildid)
	if 	GuildLevel < 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，帮会等级到达2级才可以接取【帮会】丹木任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,"很抱歉，帮会等级到达2级才可以接取【帮会】丹木任务！",8,2)
	return 
	end

 	local varLevel = GetLevel(varMap,varPlayer)
	if varLevel < x300908_var_LevelLess then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "很抱歉，40级以后才能接取【帮会】丹木任务！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "很抱歉，40级以后才能接取【帮会】丹木任务！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		return
	end
		

	if x300908_GetDayCount(varMap, varPlayer) >= x300908_var_Mis_Count then
		StartTalkTask(varMap)
		TalkAppendString(varMap, "你今天已经领取过【帮会】丹木了，请明天再来吧！");
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你今天已经领取过【帮会】丹木了，请明天再来吧！"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		DeliverTalkTips(varMap,varPlayer)
		
		return
	end
	
   
   
   
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, varQuest )
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

	if AddQuestNM( varMap, varPlayer,varQuest) == 1 then
		
		
		GamePlayScriptLog(varMap,varPlayer,124)

		StartTalkTask(varMap)
		TalkAppendString(varMap, "你接受了任务：【帮会】收集丹木")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		local varReadme = "你接受了任务：【帮会】收集丹木"
		Msg2Player(varMap,varPlayer,varReadme,8,2)
		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 0 )
		
	end

      
end




function x300908_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
     
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return 0
	end
	
	if DelQuestNM( varMap, varPlayer, varQuest) < 1 then
		return 
	end

	







				
	
	GamePlayScriptLog(varMap,varPlayer,102)

	x300908_SetDayCount(varMap, varPlayer)
	GetGuildQuestData(varMap, varPlayer, GD_GUILD_INDEX_MULTI_MISSION_HEIMU, x300908_var_FileId,varQuest,"ProcReturn1",varTalknpc)
	
	
	
	
	return 0
end


function x300908_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end

	if varTalkNpcGUID == x300908_var_SubmitNPCGUID then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,varQuest)
		TalkAppendButton(varMap, varQuest, x300908_var_QuestName,7,varState);
	end

end

 



function x300908_ProcQuestAbandon( varMap, varPlayer,varQuest )
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
	
	DelQuestNM( varMap, varPlayer, varQuest)
	local varReadme = "你放弃了任务：【帮会】收集丹木"
	StartTalkTask(varMap)
	TalkAppendString(varMap, varReadme);
    StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,varReadme,8,2)
	x300908_SetDayCount(varMap, varPlayer)
end


function x300908_ProcReturn(varMap, varPlayer,QuestData,varQuest,varTalknpc)

	local varCurDayTime = GetDayTime()						

	if QuestData == varCurDayTime then					
 		
 			
	
	    
		
		
		
		
		
		
	end
	


end





function x300908_ProcAccept( varMap, varPlayer )

end


function x300908_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest, nChangeType )

    if varQuest == nil or varQuest < 0 then
        return
    end
    
    if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then
        return
    end

						   
  	local NeedNum, ObjIndex = GetQuestNeedItemNumNM( varMap, varPlayer, varQuest, varItemData )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )

	if nChangeType ==1 then
		
		local itemNum = GetItemCount( varMap, varPlayer, varItemData )
		if itemNum < NeedNum then
	       		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, itemNum )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
			x300908_QuestLogRefresh( varMap, varPlayer, varQuest );
		end

		return

	end
	
	if NeedNum > 0 then
      	local Num = GetItemCount( varMap, varPlayer, varItemData )
		if Num < NeedNum and Num > 0 then 
			StartTalkTask(varMap)
			local varText = format("已得到@itemid_%d: %d/%d", varItemData, Num, NeedNum )
			if varText == nil then
				varText = "";
			end
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
   			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, Num )
			x300908_QuestLogRefresh( varMap, varPlayer, varQuest );
  		elseif Num == NeedNum then
			
			StartTalkTask(varMap)
			local varText = format( "已得到足够的@itemid_%d: %d/%d", varItemData, Num, NeedNum )
			if varText == nil then
				varText = "";
			end
			TalkAppendString( varMap, varText )
			StopTalkTask( varMap )
			DeliverTalkTips( varMap, varPlayer )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, Num )
			x300908_QuestLogRefresh( varMap, varPlayer, varQuest );


		end
	end

end






function x300908_QuestLogRefresh( varMap, varPlayer, varQuest)

	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer,varQuest );
	if varHaveQuest > 0 then
	
		StartTalkTask(varMap)
		local varLevel = GetLevel(varMap, varPlayer)
		
		local varExpBonus = ceil (100 * 3 * varLevel * 20*1*1*1)
		varExpBonus =floor(varExpBonus+0.5)
		if varExpBonus > 0 then
		AddQuestExpBonus(varMap, varExpBonus);		
		end
		if x300908_var_BonusMoney8 > 0 then
			AddQuestMoneyBonus8(varMap, x300908_var_BonusMoney8 )	
		end
		
		
			
		

		local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);
		local varNum = GetQuestParam(varMap, varPlayer,varQuestIdx,0)
		local text = format("(%d/%d)",varNum,5)

		AddQuestLogCustomText( varMap,
								"",								
								x300908_var_QuestName,			
								x300908_var_QuestTarget..text,	
								x300908_var_NPCName,				
								x300908_var_QuestRuse,			
								x300908_var_QuestInfo,			
								""								
								)
		StopTalkTask(varMap)
		DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
	end

end

function x300908_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	x300908_QuestLogRefresh( varMap, varPlayer, varQuest );
end





function x300908_GetDayCount(varMap, varPlayer)

	if x300908_var_Mis_Count > 0 then

		local varToday = GetDayOfYear()

		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GUILD_GATHER_DATE[1], MD_GUILD_GATHER_DATE[2], MD_GUILD_GATHER_DATE[3])

		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_GUILD_GATHER_COUNT[1], MD_GUILD_GATHER_COUNT[2], MD_GUILD_GATHER_COUNT[3])
		return varDaycount

	end

	return 0
end




function x300908_SetDayCount(varMap, varPlayer)
	local varToday = GetDayOfYear()

	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_GUILD_GATHER_DATE[1], MD_GUILD_GATHER_DATE[2], MD_GUILD_GATHER_DATE[3])

	if varLastday ~= varToday then
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_GATHER_DATE[1], MD_GUILD_GATHER_DATE[2], MD_GUILD_GATHER_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_GATHER_COUNT[1], MD_GUILD_GATHER_COUNT[2], MD_GUILD_GATHER_COUNT[3], 1)
	else
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_GUILD_GATHER_COUNT[1], MD_GUILD_GATHER_COUNT[2], MD_GUILD_GATHER_COUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_GUILD_GATHER_COUNT[1], MD_GUILD_GATHER_COUNT[2], MD_GUILD_GATHER_COUNT[3], varDaycount+1)
	end
end
