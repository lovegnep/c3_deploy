
x310308_var_FileId = 310308
x310308_var_GameId	= 1037

x310308_var_QuestName	= "【师徒】能人异士"
x310308_var_QuestId	= 9343
x310308_var_MasterDistance = 15
x310308_var_LimitTimes = 1

x310308_var_GoodBadValue = 2500
x310308_var_ExpRate = 30000
x310308_var_ExpRate_Low = 5000

x310308_var_LevelLessPrentice = 20
x310308_var_LevelLessMaster = 50
x310308_var_QuestReplyGuid = 132023
x310308_var_QuestReply          = "@npc_132023"

x310308_var_ItemID = 12030211


x310308_var_HasTalkedCoff            = 100

x310308_var_HasTalkedValue           = 10000000


x310308_var_HasAnsweredCoff            = 10

x310308_var_HasAnsweredValue           = 100000000

x310308_var_GameOpenId				= 1063

x310308_var_strNPCTalk             = {
					{varId = 132017 , content = "\t我是免费治疗医师，如果你受伤了，我可以帮你恢复健康。"},	
					{varId = 132018 , content = "\t我是帮战发布人，受到别的帮会欺负，就请帮主通过我来向对方帮会宣战吧。"}, 
					{varId = 132019 , content = "\t我是国战发布人，如今国家战事不断，当你拥有一定实力后，要多来找我为国出力。"}, 
					{varId = 132020 , content = "\t我是帮会任务发布人，想要为自己的帮会尽一份力？找我就对了。"}, 
					{varId = 132021 , content = "\t我是国家管理员，通过我可以参加屠城战、查询自己的功勋值"},
					
					{varId = 132032 , content = "\t我是荣誉商人，在我这里可以用荣誉值换取很多实用的东西，不要错过啊。"},
					{varId = 132042 , content = "\t我是龙眼石兑换商人，在我这里可以用龙眼石换取装备，不要错过啊。"},
					{varId = 132033 , content = "\t我是帮会商人，在我这里可以用帮贡值换取很多实用的东西，不要错过啊。"},
					{varId = 132069 , content = "\t我是威望商人，在我这里可以用威望值换取很多奖励，不要错过啊。"},
					{varId = 132006 , content = "\t我是杂货商人，在我这里能买到各种杂物还有生活技能材料，有需要的时候随时来找我。"},
					{varId = 132009 , content = "\t我是骑乘恢复商人，如果你的坐骑受伤了，我可以帮你把它恢复健康。"},
					{varId = 132060 , content = "\t我是仓库管理员，如果你的包里有一时用不上的东西，可以免费寄存在我这里，随时都可以来拿。"},
					{varId = 132034 , content = "\t我是装备升星大师，在我这里可以提升装备的基础属性，有需要就来找我。"},
					{varId = 132035 , content = "\t我是装备镶嵌大师，在我这里可以给装备打孔和镶嵌宝石，有需要就来找我。"},
					{varId = 132076 , content = "\t我是装备回收人，你不想要的装备可以在我这里换取补偿，有需要就来找我。"},
					{varId = 132064 , content = "\t我是钱庄管理员，在我这里可以进行现金与现银的交易，有需要就来找我。"},
					{varId = 132029 , content = "\t我是装备铭刻大师，在我这里可以进行装备的铭刻，有需要就来找我。"},
					{varId = 132038 , content = "\t我是骑乘技能大师，在我这里可以购买为骑乘提升技能等级的道具，有需要就来找我。"},

					{varId = 132024 , content = "\t我是声望商人，在我这里可以用声望值换取很多实用的东西，不要错过啊。"},
					{varId = 132025 , content = "\t我是药品商人，在我这里可以买到很多常用药品，随身携带一些药品是基本常识。"}, 
					{varId = 132026 , content = "\t我是防具商人，在我这里能买到各式防具，有需要的时候随时来找我。"}, 
					{varId = 132027 , content = "\t我是武器商人，在我这里能买到各式武器，有需要的时候随时来找我。"}, 
					{varId = 132028 , content = "\t我是领双管理员，大于20级后，每周都能找我领取5小时的双倍经验时间。"},
					
					 
				  }

x310308_var_NPCLevel_Tab             = {
					{minlevel = 20 ,maxlevel = 30, 
						varTalkNpcGUID = {
							132017,
							132018, 
							132019, 
							132020, 
							132021,
							},
					},
					{minlevel = 30 ,maxlevel = 60, 
						varTalkNpcGUID = {
							132017,
							132018,
							132019,
							132020,
							132021,					      
							132032,
							132042,
							132033,
							132069,
							132006,
							132009,
							132060,
							132034,
							132035,
							132076,
							132064,
							132029,
							132038,
							132024,
							132025,
							132026,
							132027,
							132028,   
							},
					},
					{minlevel = 60 ,maxlevel = 160, 
						varTalkNpcGUID = {
							132017,
							132018, 
							132019, 
							132020, 
							132021,					      
							132032, 
							132042, 
							132033, 
							132069,
							132006,
							132009,
							132060,
							132034,
							132035,
							132076,
							132064,
							132029,
							132038,
							},
					},

				  }


x310308_var_FinishOne             = "你已完成拜访@npc_%s的任务（%d/5）"

x310308_var_TargetCount           = 5


x310308_var_QuestTarget			=	"  拜访@npc_%d(%d/1)"


x310308_var_QuestInfo           = "\t找到@npc_%d，@npc_%d，@npc_%d，@npc_%d和@npc_%d，你会得到意外的收获！"


x310308_var_QuestHelp           = "#G找到指定NPC后，可以回答他们的问题，答对会得到额外的经验！"


x310308_var_QuestMoney = 5000

function x310308_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetGameOpenById(x310308_var_GameId)<=0 then
		return
	end
	
	
		
	

	local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x310308_var_LevelLessPrentice then
		return
	end

	local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
	if varTalkNpcGUID == x310308_var_QuestReplyGuid then
		if IsHaveQuestNM( varMap, varPlayer, x310308_var_QuestId) == 1 then
			local varState = GetQuestStateNM( varMap, varPlayer, varTalknpc, x310308_var_QuestId)
			TalkAppendButton( varMap, x310308_var_QuestId, x310308_var_QuestName, varState)
		else
			TalkAppendButton( varMap, x310308_var_QuestId, x310308_var_QuestName, 8)
		end
	end
end

function x310308_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varIndex )
	if GetGameOpenById(x310308_var_GameId)<=0 then
		return
	end

	if varQuest ~= x310308_var_QuestId then
		return
	end

	local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
	if varTalkNpcGUID == x310308_var_QuestReplyGuid then
		
		local varMOPFlag = x310308_CheckIsMasterOrPrentice(varMap, varPlayer)
		if varMOPFlag == 1 then 
			if IsHaveQuestNM( varMap, varPlayer, x310308_var_QuestId) == 1 then
				local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310308_var_QuestId)
				local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
				StartTalkTask(varMap)
				TalkAppendString( varMap, "#Y"..x310308_var_QuestName)
				if isFinish == 0 then
					
					TalkAppendString( varMap, "\t交给你的事情都办完了？")
					StopTalkTask( varMap)
					DeliverTalkMenu( varMap, varPlayer, varTalknpc)
				else
					x310308_DispatchCompletedInfo(varMap, varPlayer, varTalknpc, varIndex)
					
					
					
					
					
					
					
					
					
					
				end
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y【师徒】能人异士")
				local varStr = "\t大隐隐于市，天下间能人异士无数，有不少就出没在各个城市、交通要道。时常去拜访他们，对徒弟的成长有很大的帮助。\n\t你是否愿意花费#G5两银币#W让你徒弟前去拜访几位能人，增加他的历练？"
				TalkAppendString(varMap,varStr)
				TalkAppendString(varMap,"\n#Y任务目标：")
				local target = "#W拜访5位当世能人。"
				TalkAppendString(varMap,target)
				TalkAppendString(varMap,"\n#G小提示：\n1.本任务需在师傅组队陪伴下提交。\n2.当徒弟等级低于等级排行榜最后一名10级以上，徒弟获得高额经验奖励，否则，徒弟获得普通经验奖励。师傅奖励不变。#W")
				TalkAppendString(varMap,"\n#Y任务奖励：")
				local varExp, expRate = x310308_CalculateExp(varMap, varPlayer)
				TalkAppendString(varMap,format("#W徒弟获得经验：徒弟等级*%s点", expRate))
				TalkAppendString(varMap,format("#W师傅获得威望：%s点", x310308_var_GoodBadValue))
				StopTalkTask()

				DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310308_var_QuestId, -1)
			end
			return

		elseif varMOPFlag == 2 then 
			local nPrenticeId = x310308_GetPrenticeObjId(varMap, varPlayer)
			if IsHaveQuestNM( varMap, nPrenticeId, x310308_var_QuestId) == 0 then
				
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y【师徒】能人异士")
				local varStr = "\t大隐隐于市，天下间能人异士无数，有不少就出没在各个城市、交通要道。时常去拜访他们，对徒弟的成长有很大的帮助。\n\t你是否愿意花费#G5两银币#W让你徒弟前去拜访几位能人，增加他的历练？"
				TalkAppendString(varMap,varStr)
				TalkAppendString(varMap,"\n#Y任务目标：")
				local target = "#W拜访5位当世能人。"
				TalkAppendString(varMap,target)
				TalkAppendString(varMap,"\n#G小提示：\n1.本任务需在师傅组队陪伴下提交。\n2.当徒弟等级低于等级排行榜最后一名10级以上，徒弟获得高额经验奖励，否则，徒弟获得普通经验奖励。师傅奖励不变。#W")
				TalkAppendString(varMap,"\n#Y任务奖励：")
				local varExp,expRate = x310308_CalculateExp(varMap, nPrenticeId)
				TalkAppendString(varMap,format("#W徒弟获得经验：徒弟等级*%s点", expRate))
				TalkAppendString(varMap,format("#W师傅获得威望：%s点", x310308_var_GoodBadValue))
				StopTalkTask()

				DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310308_var_QuestId, -1)

			else
				
				local varQuestIdx = GetQuestIndexByID( varMap, nPrenticeId, x310308_var_QuestId)
				local isFinish = GetQuestParam( varMap, nPrenticeId, varQuestIdx, 7)
				StartTalkTask(varMap)
				TalkAppendString( varMap, "#Y"..x310308_var_QuestName)
				if isFinish == 0 then
					
					TalkAppendString( varMap, "\t交给你的事情都办完了？")
					StopTalkTask( varMap)
					DeliverTalkMenu( varMap, varPlayer, varTalknpc)
				else
					TalkAppendString(varMap,"\t您这位徒弟今天已经领取过师徒任务了，请让他提交本任务。")
					local varExp = x310308_CalculateExp(varMap, nPrenticeId)
					local varAwardForPrentice = "\n \n \n#Y徒弟奖励内容：\n#W经验值:"..varExp.."点"
					TalkAppendString(varMap, varAwardForPrentice)
					local varAwardForMaster = "\n#Y师傅奖励内容：\n#W威望值:"..x310308_var_GoodBadValue.."点"
					TalkAppendString(varMap, varAwardForMaster)
					StopTalkTask()
					
					DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x310308_var_FileId, x310308_var_QuestId)
				end
			end
			return
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y【师徒】能人异士")
			local varStr = "\t大隐隐于市，天下间能人异士无数，有不少就出没在各个城市、交通要道。时常去拜访他们，对徒弟的成长有很大的帮助。\n\t你是否愿意花费#G5两银币#W让你徒弟前去拜访几位能人，增加他的历练？"
			TalkAppendString(varMap,varStr)
			TalkAppendString(varMap,"\n#Y任务目标：")
			local target = "#W拜访5位当世能人。"
			TalkAppendString(varMap,target)
			TalkAppendString(varMap,"\n#G小提示：\n1.本任务需在师傅组队陪伴下提交。\n2.当徒弟等级低于等级排行榜最后一名10级以上，徒弟获得高额经验奖励，否则，徒弟获得普通经验奖励。师傅奖励不变。#W")
				TalkAppendString(varMap,"\n#Y任务奖励：")
			local varExp,expRate = x310308_CalculateExp(varMap, varPlayer)
			TalkAppendString(varMap,format("#W徒弟获得经验：徒弟等级*%s点", expRate))
			TalkAppendString(varMap,format("#W师傅获得威望：%s点", x310308_var_GoodBadValue))
			StopTalkTask()

			DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310308_var_QuestId, -1)
			return
		end
	else
	
		if IsHaveQuestNM( varMap, varPlayer, x310308_var_QuestId) == 1 then	
			if  varIndex >= 11001 and varIndex <= 11004	then
				
				if x310308_CanAnswerQuestion(varMap, varPlayer, varTalknpc) == 1 then
					x310308_NPCQuestion(varMap, varPlayer, varTalknpc, varIndex)
				end
			else
				
				x310308_FindNPC(varMap, varPlayer, varTalknpc)
			end
		end
	end
end

function x310308_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if GetGameOpenById(x310308_var_GameId)<=0 then
		return
	end
	
	if varQuest ~= x310308_var_QuestId then
		return
	end

	local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
	if varTalkNpcGUID == x310308_var_QuestReplyGuid then
		
		local varMOPFlag = x310308_CheckIsMasterOrPrentice(varMap, varPlayer)
		local strMOP = nil
		if varMOPFlag == -1 then
			strMOP = "请师徒两人组队来领取任务！"
		elseif varMOPFlag == 0 then
			strMOP = "组队两人没有师徒关系或距离太远，无法领取任务！"
		end

		if strMOP ~= nil then
			Msg2Player(varMap,varPlayer,strMOP,8,2)
			StartTalkTask(varMap);
			TalkAppendString(varMap, strMOP);
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer)
			return
		end


		if varMOPFlag == 1 then	
			local varMaster = x310308_GetMasterObjId(varMap, varPlayer)
			if IsHaveQuestNM( varMap, varPlayer, x310308_var_QuestId) > 0 then 
				x310308_DoSubmit( varMap, varMaster, varPlayer, 2)
			else
				Msg2Player(varMap,varPlayer,"请让你的师傅来领取任务！",8,2)
				StartTalkTask(varMap);
				TalkAppendString(varMap, "请让你的师傅来领取任务！");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer)
			end
		elseif varMOPFlag == 2 then	
			local nPrenticeId = x310308_GetPrenticeObjId(varMap, varPlayer)
			if IsHaveQuestNM( varMap, nPrenticeId, x310308_var_QuestId) > 0 then 
				Msg2Player(varMap,varPlayer,"您这位徒弟今天已经领取过师徒任务了，请让他提交本任务。",8,2)
				StartTalkTask(varMap);
				TalkAppendString(varMap, "您这位徒弟今天已经领取过师徒任务了，请让他提交本任务。");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer)
			else
				local varStr = x310308_DoAccept( varMap, varPlayer ,nPrenticeId)
				if varStr ~= nil then
					Msg2Player(varMap,varPlayer,varStr,8,2)
					StartTalkTask(varMap);
					TalkAppendString(varMap, varStr);
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
				return
				end

				local szMasterName = GetName(varMap, varPlayer)
				local szMsg = format("你的师傅%s已经为你领取了师徒任务，请努力完成，不要辜负了师傅的期望。", szMasterName)
		
				Msg2Player(varMap, nPrenticeId, szMsg, 8, 2)
				StartTalkTask(varMap);
				TalkAppendString(varMap, szMsg);
				StopTalkTask();
				DeliverTalkTips(varMap, nPrenticeId);
			end

		end
	else
		
		if IsHaveQuestNM( varMap, varPlayer, x310308_var_QuestId) == 1 then	
			x310308_ShowQuestion(varMap, varPlayer, varTalknpc)

		end
	end	
end

function x310308_DoAccept( varMap, MasterId, PrenticeId )

	if IsQuestFullNM(varMap, PrenticeId) == 1 then
		return "很抱歉，你徒弟的任务已经满了，无法领取本任务。"
	end
	
	if x310308_GetQuestTimes(varMap, PrenticeId) >= x310308_var_LimitTimes then
		return format("很抱歉，你这个徒弟本日的已经领取过%s次本任务，请明天再带他来。", x310308_var_LimitTimes)
	end

	if IsEnoughMoney(varMap, MasterId,x310308_var_QuestMoney) == 0 then
		return "很抱歉，你没有足够的银币，无法为徒弟法领取本任务"
	end

	if SpendMoney(varMap, MasterId, x310308_var_QuestMoney) ~= 1 then
		return "扣费失败，无法为徒弟法领取本任务"
	end

	local errorCode = AddQuest( varMap, PrenticeId, x310308_var_QuestId, x310308_var_FileId, 0, 0, 0, 1)
	if errorCode ~= 1 then
		return "添加任务失败！"
	end
	
	StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x310308_var_QuestName)

        
	local varIndex = 0
	local indexs = {}
	local Prenticelevel = GetLevel(varMap, PrenticeId)
        for varI, item in x310308_var_NPCLevel_Tab do
		if Prenticelevel >= item.minlevel and Prenticelevel < item.maxlevel then
			varIndex = varI
			indexs[1] = random( 1, getn( item.varTalkNpcGUID) )
			local rndm = random( 1, getn( item.varTalkNpcGUID) )
			while rndm == indexs[1] do
				rndm = random( 1, getn( item.varTalkNpcGUID) )
			end
			indexs[2] = rndm
			rndm = random( 1, getn( item.varTalkNpcGUID) )
			while rndm == indexs[1] or rndm == indexs[2] do
				rndm = random( 1, getn( item.varTalkNpcGUID) )
			end
			indexs[3] = rndm
			rndm = random( 1, getn( item.varTalkNpcGUID) )
			while rndm == indexs[1] or rndm == indexs[2] or rndm == indexs[3] do
				rndm = random( 1, getn( item.varTalkNpcGUID) )
			end
			indexs[4] = rndm
			rndm = random( 1, getn( item.varTalkNpcGUID) )
			while rndm == indexs[1] or rndm == indexs[2] or rndm == indexs[3] or rndm == indexs[4] do
				rndm = random( 1, getn( item.varTalkNpcGUID) )
			end
			indexs[5] = rndm
		end
	end
				local varStr = "\t大隐隐于市，天下间能人异士无数，有不少就出没在各个城市、交通要道。时常去拜访他们，对你的成长有很大的帮助。"
				TalkAppendString(varMap,varStr)
        TalkAppendString( varMap, "\n#Y任务目标：" )
        
	local npcGUIDs =  x310308_var_NPCLevel_Tab[varIndex].varTalkNpcGUID
        TalkAppendString( varMap, format( "拜访@npc_%s,@npc_%s,@npc_%s,@npc_%s,@npc_%s", x310308_var_NPCLevel_Tab[varIndex].varTalkNpcGUID[indexs[1]], x310308_var_NPCLevel_Tab[varIndex].varTalkNpcGUID[indexs[2]], x310308_var_NPCLevel_Tab[varIndex].varTalkNpcGUID[indexs[3]],x310308_var_NPCLevel_Tab[varIndex].varTalkNpcGUID[indexs[4]],x310308_var_NPCLevel_Tab[varIndex].varTalkNpcGUID[indexs[5]] ) )
        TalkAppendString( varMap, " " )

        
        TalkAppendString( varMap, "#Y任务回复：" )
        TalkAppendString( varMap, x310308_var_QuestReply)
        TalkAppendString( varMap, " " )

        TalkAppendString( varMap, "#Y小提示：" )
        TalkAppendString( varMap, x310308_var_QuestHelp)
        TalkAppendString( varMap, " " )

        
	local varExp = x310308_CalculateExp(varMap, PrenticeId)
	local szAward = "\n#Y奖励内容：\n#W经验值:"..varExp.."点"
	TalkAppendString( varMap, szAward )
        TalkAppendString( varMap, " " )

	StopTalkTask( varMap)
	DeliverTalkMenu( varMap, PrenticeId, MasterId)


	
	local varQuestIdx = GetQuestIndexByID( varMap, PrenticeId, x310308_var_QuestId)

	SetQuestByIndex( varMap, PrenticeId, varQuestIdx, 0, 0)
	SetQuestByIndex( varMap, PrenticeId, varQuestIdx, 1, x310308_var_NPCLevel_Tab[ varIndex].varTalkNpcGUID[indexs[1]] )
	SetQuestByIndex( varMap, PrenticeId, varQuestIdx, 2, x310308_var_NPCLevel_Tab[ varIndex].varTalkNpcGUID[indexs[2]] )
	SetQuestByIndex( varMap, PrenticeId, varQuestIdx, 3, x310308_var_NPCLevel_Tab[ varIndex].varTalkNpcGUID[indexs[3]] )
	SetQuestByIndex( varMap, PrenticeId, varQuestIdx, 4, x310308_var_NPCLevel_Tab[ varIndex].varTalkNpcGUID[indexs[4]] )
	SetQuestByIndex( varMap, PrenticeId, varQuestIdx, 5, x310308_var_NPCLevel_Tab[ varIndex].varTalkNpcGUID[indexs[5]] )
	SetQuestByIndex( varMap, PrenticeId, varQuestIdx, 6, 0)
	SetQuestByIndex( varMap, PrenticeId, varQuestIdx, 7, 0)
	
	Msg2Player( varMap, MasterId, format("你已经顺利的帮助徒弟领取了任务：%s,扣去银币：%d两", x310308_var_QuestName, x310308_var_QuestMoney / 1000), 8, 2)
	Msg2Player( varMap, MasterId, format("你已经顺利的帮助徒弟领取了任务：%s,扣去银币：%d两", x310308_var_QuestName, x310308_var_QuestMoney / 1000), 8, 3)

	if GetPlayerGameData(varMap, PrenticeId, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3]) ~= GetDayOfYear() then
		SetPlayerGameData(varMap, PrenticeId, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3], GetDayOfYear())
		SetPlayerGameData(varMap, PrenticeId, MD_MASTER_PRENTICE_COM_TIMES[1], MD_MASTER_PRENTICE_COM_TIMES[2], MD_MASTER_PRENTICE_COM_TIMES[3], 1)
	else
		local times = GetPlayerGameData(varMap, PrenticeId, MD_MASTER_PRENTICE_COM_TIMES[1], MD_MASTER_PRENTICE_COM_TIMES[2], MD_MASTER_PRENTICE_COM_TIMES[3])
		times = times + 1
		SetPlayerGameData(varMap, PrenticeId, MD_MASTER_PRENTICE_COM_TIMES[1], MD_MASTER_PRENTICE_COM_TIMES[2], MD_MASTER_PRENTICE_COM_TIMES[3], times)
	end

	GamePlayScriptLog(varMap, PrenticeId, 1471)
	return nil
end

function x310308_CalculateExp(varMap, varPlayer)
	local varLevel = GetLevel(varMap, varPlayer)
	local minlevel = GetTopListInfo_MinLevel(GetWorldID(varMap, varPlayer))
	local varExp = 0
	local ExpRate = 0
	if (minlevel - varLevel) <= 10 then
		varExp = varLevel * x310308_var_ExpRate_Low
		ExpRate = x310308_var_ExpRate_Low
	else
		varExp = varLevel * x310308_var_ExpRate
		ExpRate = x310308_var_ExpRate
	end

	return varExp,ExpRate
end

function x310308_DoSubmit( varMap, MasterId , PrenticeId , Param)
	if Param == 2 then
	        
                if DelItem( varMap, PrenticeId, x310308_var_ItemID, 1) == 0 then
                    Msg2Player( varMap, PrenticeId, format( "没有道具@item_%d#cffcc00，提交任务失败", x310308_var_ItemID), 8, 3)
                    return
                end

	end

	if GetPlayerGameData(varMap, PrenticeId, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3]) ~= GetDayOfYear() then
		SetPlayerGameData(varMap, PrenticeId, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3], GetDayOfYear())
		SetPlayerGameData(varMap, PrenticeId, MD_MASTER_PRENTICE_COM_TIMES[1], MD_MASTER_PRENTICE_COM_TIMES[2], MD_MASTER_PRENTICE_COM_TIMES[3], 1)
	end
	
	
	
	local bret = DelQuest( varMap, PrenticeId, x310308_var_QuestId )
	if bret == 0 then
		return
	end
	
	
	local value = GetPlayerGoodBadValue(varMap, MasterId)
	value = value + x310308_var_GoodBadValue* Param
	SetPlayerGoodBadValue(varMap, MasterId, value)
	local varStr = format("你的徒弟已完成师徒任务你获得%d点威望。", x310308_var_GoodBadValue * Param)
	Msg2Player(varMap,MasterId,varStr,8,2)
	StartTalkTask(varMap);
	TalkAppendString(varMap, varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, MasterId);
	
	local varExp = x310308_CalculateExp(varMap, PrenticeId)
	AddExp(varMap, PrenticeId, varExp* Param);
	varStr = format("你已完成师徒任务，获得%d点经验的奖励。", varExp * Param)
	Msg2Player(varMap,PrenticeId,varStr,8,2)

	
	if Param == 2 then
		local ran =random(1,10)
		if ran == 1 then
			StartItemTask(varMap)
				ItemAppend( varMap, 11000810, 1 )
	 		StopItemTask(varMap,PrenticeId)
	 		DeliverItemListSendToPlayer(varMap,PrenticeId)
	 	end	
	end
	
	StartTalkTask(varMap);
	TalkAppendString(varMap, varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, PrenticeId);
	GamePlayScriptLog(varMap, PrenticeId, 1472)
end

function x310308_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
    if GetGameOpenById(x310308_var_GameId)<=0 then
	return
    end
    local varLevel = GetLevel(varMap, varPlayer)
	
    if varLevel < x310308_var_LevelLessPrentice then
	return
    end

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310308_var_QuestId)
    local varNpc1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
    if varNpc1 > x310308_var_HasTalkedValue then
		if varNpc1 > x310308_var_HasAnsweredValue then
			varNpc1 = varNpc1 / x310308_var_HasAnsweredCoff / x310308_var_HasTalkedCoff
		else
			varNpc1 = varNpc1 / x310308_var_HasTalkedCoff
		end
    end
    local varNpc2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2)
    if varNpc2 > x310308_var_HasTalkedValue then
		if varNpc2 > x310308_var_HasAnsweredValue then
			varNpc2 = varNpc2 / x310308_var_HasAnsweredCoff / x310308_var_HasTalkedCoff
		else
			varNpc2 = varNpc2 / x310308_var_HasTalkedCoff
		end
    end
    local varNpc3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)
    if varNpc3 > x310308_var_HasTalkedValue then
		if varNpc3 > x310308_var_HasAnsweredValue then
			varNpc3 = varNpc3 / x310308_var_HasAnsweredCoff / x310308_var_HasTalkedCoff
		else
			varNpc3 = varNpc3 / x310308_var_HasTalkedCoff
		end
    end
    local varNpc4 = GetQuestParam( varMap, varPlayer, varQuestIdx, 4)
    if varNpc4 > x310308_var_HasTalkedValue then
		if varNpc4 > x310308_var_HasAnsweredValue then
			varNpc4 = varNpc4 / x310308_var_HasAnsweredCoff / x310308_var_HasTalkedCoff
		else
			varNpc4 = varNpc4 / x310308_var_HasTalkedCoff
		end
    end
    local varNpc5 = GetQuestParam( varMap, varPlayer, varQuestIdx, 5)
    if varNpc5 > x310308_var_HasTalkedValue then
		if varNpc5 > x310308_var_HasAnsweredValue then
			varNpc5 = varNpc5 / x310308_var_HasAnsweredCoff / x310308_var_HasTalkedCoff
		else
			varNpc5 = varNpc5 / x310308_var_HasTalkedCoff
		end
    end
    if varTalkNpcGUID == varNpc1 then
        local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
        if isFinish < x310308_var_HasTalkedValue then
            TalkAppendButton( varMap, x310308_var_QuestId, x310308_var_QuestName, 6)
        end
        return
    end
    if varTalkNpcGUID == varNpc2 then
        local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 2)
        if isFinish < x310308_var_HasTalkedValue then
            TalkAppendButton( varMap, x310308_var_QuestId, x310308_var_QuestName, 6)
        end
        return
    end
    if varTalkNpcGUID == varNpc3 then
        local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)
        if isFinish < x310308_var_HasTalkedValue then
            TalkAppendButton( varMap, x310308_var_QuestId, x310308_var_QuestName, 6)
        end
        return
    end
    if varTalkNpcGUID == varNpc4 then
        local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 4)
        if isFinish < x310308_var_HasTalkedValue then
            TalkAppendButton( varMap, x310308_var_QuestId, x310308_var_QuestName, 6)
        end
        return
    end
    if varTalkNpcGUID == varNpc5 then
        local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 5)
        if isFinish < x310308_var_HasTalkedValue then
            TalkAppendButton( varMap, x310308_var_QuestId, x310308_var_QuestName, 6)
        end
        return
    end
end

function x310308_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    if GetGameOpenById(x310308_var_GameId)<=0 then
	return
    end
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310308_var_QuestId)
    local mFinished = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
    local F1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
    if F1 > x310308_var_HasTalkedValue then
        F1 = 1
    else
        F1 = 0
    end
    local F2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2)
    if F2 > x310308_var_HasTalkedValue then
        F2 = 1
    else
        F2 = 0
    end
    local F3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)
    if F3 > x310308_var_HasTalkedValue then
        F3 = 1
    else
        F3 = 0
    end
    local F4 = GetQuestParam( varMap, varPlayer, varQuestIdx, 4)
    if F4 > x310308_var_HasTalkedValue then
        F4 = 1
    else
        F4 = 0
    end
    local F5 = GetQuestParam( varMap, varPlayer, varQuestIdx, 5)
    if F5 > x310308_var_HasTalkedValue then
        F5 = 1
    else
        F5 = 0
    end
    

	
    local varNpc1, varNpc2, varNpc3, varNpc4, varNpc5 = x310308_GetNPCID( varMap, varPlayer)
    local strQuestInfo = ""

    if mFinished == 0 then
    		if F1 > 0 then
    			strQuestInfo = strQuestInfo.."#G";
    		else
    			strQuestInfo = strQuestInfo.."#W";
    		end
    		strQuestInfo = strQuestInfo..format(x310308_var_QuestTarget, varNpc1, F1);
    		strQuestInfo = strQuestInfo.."\n"
    		
    		if F2 > 0 then
    			strQuestInfo = strQuestInfo.."#G";
    		else
    			strQuestInfo = strQuestInfo.."#W";
    		end
    		strQuestInfo = strQuestInfo..format(x310308_var_QuestTarget, varNpc2, F2);
    		strQuestInfo = strQuestInfo.."\n"
    		
    		if F3 > 0 then
    			strQuestInfo = strQuestInfo.."#G";
    		else
    			strQuestInfo = strQuestInfo.."#W";
    		end
    		strQuestInfo = strQuestInfo..format(x310308_var_QuestTarget, varNpc3, F3);
		strQuestInfo = strQuestInfo.."\n"

		if F4 > 0 then
    			strQuestInfo = strQuestInfo.."#G";
    		else
    			strQuestInfo = strQuestInfo.."#W";
    		end
    		strQuestInfo = strQuestInfo..format(x310308_var_QuestTarget, varNpc4, F4);
		strQuestInfo = strQuestInfo.."\n"

		if F5 > 0 then
    			strQuestInfo = strQuestInfo.."#G";
    		else
    			strQuestInfo = strQuestInfo.."#W";
    		end
    		strQuestInfo = strQuestInfo..format(x310308_var_QuestTarget, varNpc5, F5);
		strQuestInfo = strQuestInfo.."\n"
    else
        strQuestInfo = "任务已经完成，请回去向"..x310308_var_QuestReply.."汇报！"
    end

    StartTalkTask( varMap)
        AddQuestLogCustomText( varMap,
                               "师徒任务",                             
                               x310308_var_QuestName,          
                               strQuestInfo,     
                               x310308_var_QuestReply,         
                               "找到隐秘的高人",	
                               format( x310308_var_QuestInfo, varNpc1, varNpc2, varNpc3, varNpc4, varNpc5),   
                               x310308_var_QuestHelp)          


    local varExp = x310308_CalculateExp(varMap, varPlayer)
            
    AddQuestExpBonus( varMap, varExp)
    StopTalkTask()
    DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end

function x310308_ProcQuestAbandon(varMap, varPlayer, varQuest)
	DelQuest( varMap, varPlayer, x310308_var_QuestId )
	
	local message = "您放弃了师徒任务"
	StartTalkTask(varMap);
		TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 4, 2);
	
	if GetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3]) ~= GetDayOfYear() then
		SetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3], GetDayOfYear())
		SetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_TIMES[1], MD_MASTER_PRENTICE_COM_TIMES[2], MD_MASTER_PRENTICE_COM_TIMES[3], 1)
	end
end


function x310308_GetNPCID(varMap, varPlayer)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310308_var_QuestId)
    local F1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1)
    local F2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 2)
    local F3 = GetQuestParam( varMap, varPlayer, varQuestIdx, 3)
    local F4 = GetQuestParam( varMap, varPlayer, varQuestIdx, 4)
    local F5 = GetQuestParam( varMap, varPlayer, varQuestIdx, 5)

    local varNpc1 = F1
    local varNpc2 = F2
    local varNpc3 = F3
    local varNpc4 = F4
    local varNpc5 = F5

    if varNpc1 > x310308_var_HasTalkedValue then
		if varNpc1 > x310308_var_HasAnsweredValue then
			varNpc1 = varNpc1 / x310308_var_HasAnsweredCoff / x310308_var_HasTalkedCoff
		else
			varNpc1 = varNpc1 / x310308_var_HasTalkedCoff
		end
    end
    if varNpc2 > x310308_var_HasTalkedValue then
		if varNpc2 > x310308_var_HasAnsweredValue then
			varNpc2 = varNpc2 / x310308_var_HasAnsweredCoff / x310308_var_HasTalkedCoff
		else
			varNpc2 = varNpc2 / x310308_var_HasTalkedCoff
		end
    end
    if varNpc3 > x310308_var_HasTalkedValue then
		if varNpc3 > x310308_var_HasAnsweredValue then
			varNpc3 = varNpc3 / x310308_var_HasAnsweredCoff / x310308_var_HasTalkedCoff
		else
			varNpc3 = varNpc3 / x310308_var_HasTalkedCoff
		end
    end
    if varNpc4 > x310308_var_HasTalkedValue then
		if varNpc4 > x310308_var_HasAnsweredValue then
			varNpc4 = varNpc4 / x310308_var_HasAnsweredCoff / x310308_var_HasTalkedCoff
		else
			varNpc4 = varNpc4 / x310308_var_HasTalkedCoff
		end
    end
    if varNpc5 > x310308_var_HasTalkedValue then
		if varNpc5 > x310308_var_HasAnsweredValue then
			varNpc5 = varNpc5 / x310308_var_HasAnsweredCoff / x310308_var_HasTalkedCoff
		else
			varNpc5 = varNpc5 / x310308_var_HasTalkedCoff
		end
    end
    return varNpc1, varNpc2, varNpc3, varNpc4, varNpc5
end

function x310308_GetNPCTalk(varTalknpc)
	for varI, item in x310308_var_strNPCTalk do
		if item.varId == varTalknpc then
			return item.content
		end
	end
end

function x310308_GetQuestTimes(varMap, varPlayer)
	if GetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_DAY[1], MD_MASTER_PRENTICE_COM_DAY[2], MD_MASTER_PRENTICE_COM_DAY[3]) ~= GetDayOfYear() then
		return 0
	else
		return GetPlayerGameData(varMap, varPlayer, MD_MASTER_PRENTICE_COM_TIMES[1], MD_MASTER_PRENTICE_COM_TIMES[2], MD_MASTER_PRENTICE_COM_TIMES[3])
	end
end

function x310308_CheckIsMasterOrPrentice( varMap, varPlayer)	
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	if (varTeamSize ~= 2) then
		return -1
	end
	
	local MasterOrPrenticeFlag = 0 
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetTeamMemberId(varMap, varPlayer, varI)
		if varTalknpc ~= varPlayer then
			if IsInDist(varMap, varPlayer, varTalknpc, x310308_var_MasterDistance) == 1 then
				if GetObjType(varMap, varTalknpc) == 1 then
					if IsPrentice(varMap, varPlayer, varTalknpc) == 1 then
						MasterOrPrenticeFlag = 2
					elseif IsMaster(varMap, varPlayer, varTalknpc) == 1 then
						MasterOrPrenticeFlag = 1
					end
				end
			end
		end
	end

	return MasterOrPrenticeFlag
end

function x310308_ShowQuestion(varMap, varPlayer, varTalknpc)
	local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
	
	local varId,varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer = QuestShitu_GetQuestionInfo(varTalkNpcGUID)

	if varId ~= varTalkNpcGUID then
		return
	end

	
	StartTalkTask(varMap)
		
		TalkAppendString(varMap,"#Y【师徒】能人异士#W\n")
		
		TalkAppendString(varMap,varDesc)
		x310308_AddDengmiAnswerOption( varMap, 
							varAnswer1, 
							varAnswer2, 
							varAnswer3, 
							varAnswer4 )
									
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)	
end




function x310308_AddDengmiAnswerOption( varMap,varAnswer1,varAnswer2,varAnswer3,varAnswer4)

	
	local arr_answer = { {varAnswer1,11001},{varAnswer2,11002},{varAnswer3,11003},{varAnswer4,11004} }
	for j = 1, 2 do
		local n = random(1, 4)
		local m =  random(1, 4)
		if n ~= m then
			local t = arr_answer[n]
			arr_answer[n] = arr_answer[m]
			arr_answer[m] = t
		end
	end
	
	for varI=1,4 do
		TalkAppendButton(varMap,x310308_var_QuestId,arr_answer[varI][1],3,arr_answer[varI][2] )
	end
end


function x310308_AnswerRight( varMap, varPlayer, varTalknpc )
	StartTalkTask(varMap)
	TalkAppendString(varMap,"恭喜你，回答正确。")	
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		
	local varExp = x310308_CalculateExp(varMap, varPlayer)/10
	AddExp(varMap, varPlayer, varExp);
	varStr = format("你回答对了问题，获得%d点经验的奖励。", varExp)
	Msg2Player(varMap,varPlayer,varStr,8,2)
	StartTalkTask(varMap);
	TalkAppendString(varMap, varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x310308_AnswerError( varMap, varPlayer, varTalknpc )
	StartTalkTask(varMap)
	TalkAppendString(varMap,"很遗憾，你回答错了，不能获得额外奖励。")	
	StopTalkTask(varMap)
	DeliverTalkMenu(varMap,varPlayer,varTalknpc)

	Msg2Player(varMap,varPlayer,"很遗憾，你的问题回答错了，不能获得额外奖励。",8,2)
end

function x310308_GetPrenticeObjId(varMap, varPlayer)
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	local varPrenticeObjId = -1
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetTeamMemberId(varMap, varPlayer, varI)
		if 1 == IsInDist(varMap, varPlayer, varTalknpc, x310308_var_MasterDistance) then
			if 1 == GetObjType(varMap, varTalknpc) and 1 == IsPrentice(varMap, varPlayer, varTalknpc) then
				varPrenticeObjId = varTalknpc
			end
		end
	end
	
	return varPrenticeObjId
end

function x310308_GetMasterObjId(varMap, varPlayer)
	local varTeamSize = GetTeamSize(varMap, varPlayer)
	local varMasterObj = -1
	for varI = 0, varTeamSize - 1 do
		local varTalknpc = GetTeamMemberId(varMap, varPlayer, varI)
		if 1 == IsInDist(varMap, varPlayer, varTalknpc, x310308_var_MasterDistance) then
			if 1 == GetObjType(varMap, varTalknpc) and 1 == IsMaster(varMap, varPlayer, varTalknpc) then
				varMasterObj = varTalknpc
			end
		end
	end
	
	return varMasterObj
end

function x310308_AnswerQuestion(varMap, varPlayer, varTalknpc, varIndex)
	if  varIndex >= 11001 and varIndex <= 11004	then
		local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
		
		local varId,varDesc,varAnswer1,varAnswer2,varAnswer3,varAnswer4,varAnswer = QuestShitu_GetQuestionInfo(varTalkNpcGUID)
		if varId ~= varTalkNpcGUID then
			return
		end

		
		if 11000+varAnswer == varIndex then
			
			x310308_AnswerRight( varMap, varPlayer, varTalknpc )
		else
			
			x310308_AnswerError( varMap, varPlayer, varTalknpc )
		end
		
	end

end

function x310308_NPCQuestion(varMap, varPlayer, varTalknpc, varIndex)
	local varLogFmtMsg         = "x310308_NPCQuestion : varMap = %d,varPlayer = %d,varTalknpc = %d,varIndex = %d" 	
	local varLogMsg = format(varLogFmtMsg,varMap,varPlayer,varTalknpc,varIndex)
	WriteLog(1,varLogMsg)
	x310308_AnswerQuestion(varMap, varPlayer, varTalknpc, varIndex)
end

function x310308_FindNPC(varMap, varPlayer, varTalknpc)
	local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310308_var_QuestId)
	local varNpc1, varNpc2, varNpc3, varNpc4, varNpc5 = x310308_GetNPCID(varMap, varPlayer)
	local varCount = GetQuestParam( varMap, varPlayer, varQuestIdx, 6)
	StartTalkTask(varMap)

	local varNpcTalkContent = ""
	TalkAppendString( varMap, "#Y"..x310308_var_QuestName)

	if varTalkNpcGUID == varNpc1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 1) < x310308_var_HasTalkedValue then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, GetQuestParam( varMap, varPlayer, varQuestIdx, 1) * x310308_var_HasTalkedCoff)
		varCount = varCount + 1
		varNpcTalkContent = x310308_GetNPCTalk(varNpc1)
	end
	if varTalkNpcGUID == varNpc2 and GetQuestParam( varMap, varPlayer, varQuestIdx, 2) < x310308_var_HasTalkedValue then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, GetQuestParam( varMap, varPlayer, varQuestIdx, 2) * x310308_var_HasTalkedCoff)
		varCount = varCount + 1
		varNpcTalkContent = x310308_GetNPCTalk(varNpc2)
	end
	if varTalkNpcGUID == varNpc3 and GetQuestParam( varMap, varPlayer, varQuestIdx, 3) < x310308_var_HasTalkedValue then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, GetQuestParam( varMap, varPlayer, varQuestIdx, 3) * x310308_var_HasTalkedCoff)
		varCount = varCount + 1
		varNpcTalkContent = x310308_GetNPCTalk(varNpc3)
	end
	if varTalkNpcGUID == varNpc4 and GetQuestParam( varMap, varPlayer, varQuestIdx, 4) < x310308_var_HasTalkedValue then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 4, GetQuestParam( varMap, varPlayer, varQuestIdx, 4) * x310308_var_HasTalkedCoff)
		varCount = varCount + 1
		varNpcTalkContent = x310308_GetNPCTalk(varNpc4)
	end
	if varTalkNpcGUID == varNpc5 and GetQuestParam( varMap, varPlayer, varQuestIdx, 5) < x310308_var_HasTalkedValue then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, GetQuestParam( varMap, varPlayer, varQuestIdx, 5) * x310308_var_HasTalkedCoff)
		varCount = varCount + 1
		varNpcTalkContent = x310308_GetNPCTalk(varNpc5)
	end
	
	TalkAppendString( varMap, varNpcTalkContent)
	TalkAppendString( varMap, "\n \n#G小提示#W：\n\t请点击确定回答我提出的问题。答对会有额外经验奖励。" )
	StopTalkTask( varMap)
	
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x310308_var_FileId, x310308_var_QuestId, 0)

	local varTip = format( x310308_var_FinishOne, varTalkNpcGUID, varCount)
	StartTalkTask( varMap)
	TalkAppendString( varMap, varTip)
	StopTalkTask( varMap)
	DeliverTalkTips( varMap, varPlayer)
	if varCount >= x310308_var_TargetCount then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 0, 1)
		Msg2Player( varMap, varPlayer, "任务已经完成，快点回去汇报吧！", 8, 2)
		Msg2Player( varMap, varPlayer, "任务已经完成，快点回去汇报吧！", 8, 3)
	end
	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 6, varCount)
	
	x310308_ProcQuestLogRefresh( varMap, varPlayer, x310308_var_QuestId)

end

function x310308_DispatchCompletedInfo( varMap, varPlayer, varTalknpc, varIndex)
	if varIndex == 31 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x310308_var_QuestName)
		TalkAppendString(varMap, "\t天下间能人无数，时常走访这些高人会对你的成长很有帮助。\n\t如果你提交给我一个#G师恩难谢#W。完成任务后，你和师傅均会获得双倍的奖励，并且你还有几率获得#G残破的背包图样#W。\n\t你确定要提交一个师恩难谢么？" )
		local varExp = x310308_CalculateExp(varMap, varPlayer)
		varExp = varExp * 2
		local varAwardForPrentice = "\n \n \n#Y徒弟奖励内容：\n#W经验值（双倍）:"..varExp.."点"
		TalkAppendString(varMap, varAwardForPrentice)
		local varGoodBadValue = x310308_var_GoodBadValue * 2
		local varAwardForMaster = "\n#Y师傅奖励内容：\n#W威望值（双倍）:"..varGoodBadValue.."点"
		TalkAppendString(varMap, varAwardForMaster)
		StopTalkTask()
		DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x310308_var_FileId, x310308_var_QuestId)

	elseif varIndex == 32 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x310308_var_QuestName)
		TalkAppendString(varMap, "\t天下间能人无数，时常走访这些高人会对你的成长很有帮助。\n\t你如果能交给我一个#G师恩难谢#W，完成任务后你和你的师傅均会获得双倍的奖励。\n \n#G小提示:\n\t如果你希望提交师恩难谢使自己和师傅的奖励翻倍，请关闭此介面重新提交本任务。" )
		local varExp = x310308_CalculateExp(varMap, varPlayer)
		local varAwardForPrentice = "\n \n \n#Y徒弟奖励内容：\n#W经验值:"..varExp.."点"
		TalkAppendString(varMap, varAwardForPrentice)
		local varAwardForMaster = "\n#Y师傅奖励内容：\n#W威望值:"..x310308_var_GoodBadValue.."点"
		TalkAppendString(varMap, varAwardForMaster)
		StopTalkTask()
		DeliverTalkContinueNM( varMap, varPlayer, varTalknpc, x310308_var_FileId, x310308_var_QuestId)

	else
		StartTalkTask(varMap)
		    TalkAppendString(varMap,"#Y"..x310308_var_QuestName)
		    TalkAppendString(varMap, "\t恭喜您，完成了师徒任务！" )
		    TalkAppendString(varMap," ")

		    TalkAppendButton( varMap, x310308_var_QuestId, "使用师恩难谢提交任务", 3, 31)
		    TalkAppendButton( varMap, x310308_var_QuestId, "直接提交任务", 3, 32)
		StopTalkTask()
		DeliverTalkMenu( varMap, varPlayer, varTalknpc)
	end

end

function x310308_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)

	if GetGameOpenById(x310308_var_GameId)<=0 then
		return
	end
	
	if varQuest ~= x310308_var_QuestId then
		return
	end

	local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
	if varTalkNpcGUID == x310308_var_QuestReplyGuid then
		
		local varMOPFlag = x310308_CheckIsMasterOrPrentice(varMap, varPlayer)

		if varMOPFlag == 1 then	
			local varMaster = x310308_GetMasterObjId(varMap, varPlayer)
			if IsHaveQuestNM( varMap, varPlayer, x310308_var_QuestId) > 0 then 
				x310308_DoSubmit( varMap, varMaster, varPlayer, 1)
			end
		end
	end
end

function x310308_CanAnswerQuestion(varMap, varPlayer, varTalknpc)
	if GetGameOpenById(x310308_var_GameOpenId) <= 0 then
		Msg2Player(varMap, varPlayer, "很抱歉，暂时关闭答题模块。", 0, 3)
		return
	end
	
	local varTalkNpcGUID = GetMonsterGUID( varMap, varTalknpc)
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310308_var_QuestId)
	local varNpc1, varNpc2, varNpc3, varNpc4, varNpc5 = x310308_GetNPCID(varMap, varPlayer)
	local varRet = 0

	if varTalkNpcGUID == varNpc1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 1) > x310308_var_HasTalkedValue and GetQuestParam( varMap, varPlayer, varQuestIdx, 1) < x310308_var_HasAnsweredValue then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, GetQuestParam( varMap, varPlayer, varQuestIdx, 1) * x310308_var_HasAnsweredCoff)
		varRet = 1
	end
	if varTalkNpcGUID == varNpc2 and GetQuestParam( varMap, varPlayer, varQuestIdx, 2) > x310308_var_HasTalkedValue and GetQuestParam( varMap, varPlayer, varQuestIdx, 2) < x310308_var_HasAnsweredValue  then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, GetQuestParam( varMap, varPlayer, varQuestIdx, 2) * x310308_var_HasAnsweredCoff)
		varRet = 1
	end
	if varTalkNpcGUID == varNpc3 and GetQuestParam( varMap, varPlayer, varQuestIdx, 3) > x310308_var_HasTalkedValue and GetQuestParam( varMap, varPlayer, varQuestIdx, 3) < x310308_var_HasAnsweredValue then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 3, GetQuestParam( varMap, varPlayer, varQuestIdx, 3) * x310308_var_HasAnsweredCoff)
		varRet = 1
	end
	if varTalkNpcGUID == varNpc4 and GetQuestParam( varMap, varPlayer, varQuestIdx, 4) > x310308_var_HasTalkedValue and GetQuestParam( varMap, varPlayer, varQuestIdx, 4) < x310308_var_HasAnsweredValue  then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 4, GetQuestParam( varMap, varPlayer, varQuestIdx, 4) * x310308_var_HasAnsweredCoff)
		varRet = 1
	end
	if varTalkNpcGUID == varNpc5 and GetQuestParam( varMap, varPlayer, varQuestIdx, 5) > x310308_var_HasTalkedValue and GetQuestParam( varMap, varPlayer, varQuestIdx, 5) < x310308_var_HasAnsweredValue   then
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 5, GetQuestParam( varMap, varPlayer, varQuestIdx, 5) * x310308_var_HasAnsweredCoff)
		varRet = 1
	end
	
	return varRet

end
