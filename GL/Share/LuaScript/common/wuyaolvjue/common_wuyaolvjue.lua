x310020_var_FileId = 310020


x310020_var_MD_ItemQuest = {  {varItem=13013301, quest=8001}, {varItem=13013302, quest=8002}, {varItem=13013303, quest=8003}, {varItem=13013304, quest=8004} }
x310020_var_QuestCommentId = 1102

x310020_var_ItemUsePosition = {	{varId=13013300, buff=7053, r=10, x1=85, z1=25, x2=17, z2=69, x3=104, z3=88, find1=37000, find2=37001, find3=37002, sceneName="地下粮仓一层", quest=8000, usedItem ="始耀结晶" ,destItem="理耀结晶" }, 
								{varId=13013301, buff=7054, r=10, x1=93, z1=34, x2=79, z2=99, x3=46, z3=15, find1=38000, find2=38001, find3=38002, sceneName="地下粮仓二层", quest=8001, usedItem ="理耀结晶" ,destItem="命耀结晶"  },
								{varId=13013302, buff=7055, r=10, x1=104, z1=47, x2=71, z2=97, x3=57, z3=47, find1=39000, find2=39001, find3=39002, sceneName="地下粮仓三层", quest=8002, usedItem ="命耀结晶" ,destItem="化耀结晶"  },
								{varId=13013303, buff=7056, r=10, x1=114, z1=76, x2=97, z2=8, x3=50, z3=101, find1=40000, find2=40001, find3=40002, sceneName="地下粮仓四层", quest=8003, usedItem ="化耀结晶" ,destItem="灭耀结晶"  },
								{varId=13013304, buff=7057, r=10, x1=101, z1=76, x2=101, z2=76, x3=101, z3=76, find1=41000, find2=41000, find3=41000, sceneName="地下粮仓五层", quest=8004, usedItem ="灭耀结晶" ,destItem=""  }
								}

x310020_var_QuestScene = { {quest=8000, scene=2 }, 
							{quest=8001, scene=3},
							{quest=8002, scene=4},
							{quest=8003, scene=5} 
							}

x310020_var_AwardItemId = 12030027
x310020_var_AbandonMessage	= "你放弃了任务：%s"
x310020_var_AcceptMessage		= "你接受了任务：%s"
x310020_var_CompleteMessage	= "你完成了任务：%s"

function x310020_HaveAccepted(varMap, varPlayer)

	local day = GetPlayerGameData(varMap, varPlayer, MD_WUYAO_LVJUE_DATE[1], MD_WUYAO_LVJUE_DATE[2], MD_WUYAO_LVJUE_DATE[3])
	if day > 0 then
		return 1
	end
	return -1
end

function x310020_ResetQuest( varMap, varPlayer, varItem, varQuest )
	for varI, item in x310020_var_MD_ItemQuest do
		if item.varItem == varItem then
			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			local varLevel = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 ) 
					
			DelQuestNM( varMap, varPlayer, varQuest )
			
			
			local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, item.quest )
			if varFrontQuest1 ~= -1 then
				if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
					return 0
				end
			end
			if varFrontQuest2 ~= -1 then
				if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
					return 0
				end
			end
			if varFrontQuest3 ~= -1 then
				if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
					return 0
				end
			end
			
			
			local varRet = AddQuestNM( varMap, varPlayer, item.quest)
			if varRet < 1 then
				if varRet == -2 then
					local varText = "任务已满，添加任务失败"
					StartTalkTask(varMap)
					TalkAppendString(varMap, varText);
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				elseif varRet == -1 then
					local varText = "背包已满,任务获取失败，添加失败"
					StartTalkTask(varMap)
					TalkAppendString(varMap, varText);
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				else
					local varText = "任务获取失败，添加失败"
					StartTalkTask(varMap)
					TalkAppendString(varMap, varText);
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)
				end
				
			else
				
				if item.quest == 8001 then
					SetQuestParam( varMap, varPlayer, 8001, MP_CIRCLE, 1 )
				elseif item.quest == 8002 then
					SetQuestParam( varMap, varPlayer, 8002, MP_CIRCLE, 2 )
				elseif item.quest == 8003 then
					SetQuestParam( varMap, varPlayer, 8003, MP_CIRCLE, 3 )
				elseif item.quest == 8004 then
					SetQuestParam( varMap, varPlayer, 8004, MP_CIRCLE, 4 )
				end
				varQuestIdx = GetQuestIndexByID( varMap, varPlayer, item.quest )
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, varLevel )

				x310020_SetRandPosition(varMap, varPlayer, item.quest)
			end

			return
		end
	end	
end

function x310020_NextDayRest(varMap, varPlayer)
	
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_WUYAO_LVJUE_DATE[1], MD_WUYAO_LVJUE_DATE[2], MD_WUYAO_LVJUE_DATE[3])

	local varToday = GetDayOfYear()
	if varToday ~= varLastday then 
		SetPlayerGameData(varMap, varPlayer, MD_WUYAO_LVJUE_DATE[1], MD_WUYAO_LVJUE_DATE[2], MD_WUYAO_LVJUE_DATE[3], 0)
	end
end

function x310020_SetRandPosition(varMap, varPlayer, varQuest)
	local rp = random(1, 3)
	SetQuestParam( varMap, varPlayer, varQuest, 5, rp )		
end

function x310020_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	
		
	
	if IsHaveQuestNM( varMap, varPlayer, 8000 ) > 0 then
		return 0
	elseif IsHaveQuestNM( varMap, varPlayer, 8001 ) > 0 then
		return 0
	elseif IsHaveQuestNM( varMap, varPlayer, 8002 ) > 0 then
		return 0
	elseif IsHaveQuestNM( varMap, varPlayer, 8003 ) > 0 then
		return 0
	elseif IsHaveQuestNM( varMap, varPlayer, 8004 ) > 0 then
		return 0
	elseif IsHaveQuestNM( varMap, varPlayer, 8005 ) > 0 then
		return 0
	elseif IsHaveQuestNM( varMap, varPlayer, 8006 ) > 0 then
		return 0
	elseif IsHaveQuestNM( varMap, varPlayer, 8007 ) > 0 then
		return 0
	elseif IsHaveQuestNM( varMap, varPlayer, 8008 ) > 0 then
		return 0
	elseif IsHaveQuestNM( varMap, varPlayer, 8009 ) > 0 then
		return 0
	end
	
	if QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest ) > 0 then
		TalkAppendButtonNM(varMap, varPlayer, varTalknpc, x310020_var_QuestCommentId, 13, -1)
		local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
		TalkAppendButtonNM(varMap, varPlayer, varTalknpc, varQuest, questState);
		return 1
	end
    
	return 0
end

function x310020_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, varButtonClick )

	if varQuest == x310020_var_QuestCommentId then
		local varStr;
		local contentStr = "";
		
		if varButtonClick == -1 then
			contentStr = "\t国库#g地下粮仓#w在前一个王朝时期曾名曰#g怨冢#w，得名之源是数百年前在此发生的一场惨剧，贪财的国王洗劫了数千名为避战祸流亡到此的百姓的家产，并把他们残忍的#g坑杀#w在了此地，冤魂滞留百年不散，四周荒芜不生，才得名为#g怨冢#w。"
		elseif varButtonClick == 0 then
			contentStr = "\t当然，我皇惠天，如今这些也都成了历史，冤魂厉鬼已经远离此地，安乐成佛了。我蒙古大军西征期间曾把这里改建为囤集粮食草料的粮仓，以供20万蒙古骑兵西征之用。西征完成后此粮仓也结束了它伟大的历史使命。但是这个废弃的粮仓并没有淡出人们的视线……"
		elseif varButtonClick == 1 then
			contentStr = "\t随着时间的推移，粮仓中本已消失的瘴气又出现了，很多误入其中的人，再也没能回来。我查阅古书，偶间看到#g怨冢#w后续的故事，才发现古书中描述了一种更具有神效的力量存在：#g五耀#w。传说这五耀掌管了一切事物的#g始、理、命、化、灭#w。若能释放五耀的力量，可以破除此气，还此地太平。"
		elseif varButtonClick == 2 then
			contentStr = "\t据我调查，这地下粮仓的五层之中，也分别对应着五耀的五种力量。我这里有一个#g始耀结晶#w，在一层中使用它便能引出始耀的力量，而这时拥有全部五耀流转的妖魔鬼怪、甚至人体在离世时，都会因五耀轮转而现出理耀的属性，如果顺利的话，将会获得#g激活理耀的结晶#w。如此一来，直到你到达粮仓五层，#g引出灭耀之力#w，便能发动#g五耀律诀#w，使粮仓中的瘴气一举消灭。"
		elseif varButtonClick == 3 then
			contentStr = "\t保一方平安本是下官分内之事，无奈我武艺平平，难胜此任，还烦请您鼎力相助。此事若成，您乃此地百姓再生父母，下官定为您树碑立传，传知后代。"
		end
		
		local varQuestName;
		if varQuest > 0 then
			varQuestName = GetQuestNameNM(varMap, varPlayer, varQuest);
		end
		local varStr = "#Y";
		varStr = varStr..varQuestName;
		varStr = varStr.."#W\n\n"..contentStr;
		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();
		if varButtonClick < 3 then
			TalkAppendButton(varMap, varQuest, "继续", 0, varButtonClick+1)
		end
		DeliverTalkMenu(varMap, varPlayer, varTalknpc);
		
		return
	end
	
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		x310020_NextDayRest(varMap, varPlayer)
		local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest )
			if varRet > 0 then	
				DeliverTalkAddQuestInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
			else
				local varText = "未知错误，无法接新的任务"
				if varRet == -1 then
					varText = "等级不足，无法接新的任务"
				elseif varRet == -2 then
					varText = "等级过高，无法接新的任务"
				elseif varRet == -3 then
					varText = "金钱不足，无法接新的任务"
				elseif varRet == -4 then
					varText = "你不是本国玩家，无法接新的任务"
				elseif varRet == -5 then
					varText = "职业类型不符，无法接新的任务"
				elseif varRet == -6 then
					varText = "阵营不符，无法接新的任务"
				elseif varRet == -7 then
					varText = "此人无此任务"
				end
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText);
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
			end

	else 
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		if QuestCheckSubmitNM( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx ) > 0 then 
			QuestComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
		else
			QuestNotComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest ) 
		end
	end
end

function x310020_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	if x310020_HaveAccepted(varMap, varPlayer) > 0 then
			StartTalkTask(varMap);
			TalkAppendString(varMap, "今天已经接过任务，不能再接。");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"今天已经接过任务，不能再接。",8,2)
			return 
	end

	if GetLevel(varMap, varPlayer) >= 65 then
		StartTalkTask(varMap);
			TalkAppendString(varMap, "你已经是65级大侠了，请到仙人谷接任务");
			StopTalkTask(varMap);
			DeliverTalkTips(varMap,varPlayer);
			Msg2Player(varMap,varPlayer,"你已经是65级大侠了，请到仙人谷接任务",8,2)
		return
	end
	
	
	local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer, varQuest )
	if varFrontQuest1 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest1 ) == 0 then
			return 0
		end
	end
	if varFrontQuest2 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest2 ) == 0 then
			return 0
		end
	end
	if varFrontQuest3 ~= -1 then
		if IsQuestHaveDoneNM( varMap, varPlayer, varFrontQuest3 ) == 0 then
			return 0
		end
	end

	local varRet = QuestCheckAcceptNM( varMap, varPlayer, varTalknpc, varQuest ) 
	if varRet > 0 then 
		varRet = AddQuestNM( varMap, varPlayer, varQuest ) 
		if varRet > 0 then
			SetPlayerGameData(varMap, varPlayer, MD_WUYAO_LVJUE_DATE[1], MD_WUYAO_LVJUE_DATE[2], MD_WUYAO_LVJUE_DATE[3], GetDayOfYear())

			local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
			
			SetQuestByIndex( varMap, varPlayer, varQuestIdx, 2, GetLevel(varMap, varPlayer) )
			
			x310020_SetRandPosition(varMap, varPlayer, varQuest)

			local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
			local message = format(x310020_var_AcceptMessage, varQuestName);
			StartTalkTask(varMap)
			TalkAppendString(varMap, message);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
			Msg2Player(varMap,varPlayer, message, 4, 2)
			GamePlayScriptLog(varMap, varPlayer, 521)

		elseif varRet == 0 then
			local varText = "任务获取失败，添加失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif varRet == -1 then
			local varText = "背包已满,请整理后再来接任务"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		elseif varRet == -2 then
			local varText = "任务已满，添加任务失败"
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText);
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
	
	end
end


function x310020_ProcQuestAbandon( varMap, varPlayer, varQuest )
	local varRet = 0
	varRet = DelQuestNM( varMap, varPlayer, varQuest )
	if varRet == 1 then
		local varQuestName = GetQuestNameNM( varMap, varPlayer, varQuest )
		local message = format(x310020_var_AbandonMessage, varQuestName);
		StartTalkTask(varMap);
		TalkAppendString(varMap, message);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		Msg2Player(varMap,varPlayer, message, 8,2)
		SetPlayerGameData(varMap, varPlayer, MD_WUYAO_LVJUE_DATE[1], MD_WUYAO_LVJUE_DATE[2], MD_WUYAO_LVJUE_DATE[3], GetDayOfYear())
	end
end

function x310020_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return
	end
	local guid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	local  questState = GetQuestStateNM(varMap, varPlayer, varTalknpc, varQuest)
	if guid ~= -1 then 
		if guid == varTalkNpcGUID then	
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
		end
	else
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, varQuest, questState, -1 ) 
	end
end


function x310020_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	local varLevel = GetQuestParam( varMap, varPlayer, varQuestIdx, 2 ) 

	local varRet = LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestSubmit", varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	if varRet >0 then
		SetPlayerGameData(varMap, varPlayer, MD_WUYAO_LVJUE_DATE[1], MD_WUYAO_LVJUE_DATE[2], MD_WUYAO_LVJUE_DATE[3], GetDayOfYear())

		GamePlayScriptLog(varMap, varPlayer, 522)
	end
end


function x310020_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
	
	return 0
end


function x310020_GetRand(varMap, varPlayer)
	local varLevel = GetLevel( varMap, varPlayer )
	local varRand =0;
	if varLevel >= 40 and varLevel <= 49 then
		varRand = 90;
	elseif varLevel >=50 and varLevel <=59 then
		varRand = 70;
	elseif varLevel >=60 and varLevel <=69 then
		varRand = 50;
	elseif varLevel >=70 and varLevel <=79 then
		varRand = 30;
	elseif varLevel >=80 then
		varRand = 10;
	end
	return varRand;
end

function x310020_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

	local bSign=0;

	for varI, item in x310020_var_QuestScene do
		if item.quest == varQuest then
			if item.scene == varMap then
				bSign = 1;
				break
			end
		end
	end
	
	if bSign == 0 then
		return
	end
	
	local varItemCount=0;
	local varItem=0;
	local ItemRand=0;
	local ItemDropNum=0;
	

		local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
		for varI = 0, KilledNum-1 do
			local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
			if humanObjId ~= -1 then
				if IsPlayerStateNormal(varMap, humanObjId) > 0 then
					if GetHp(varMap, humanObjId) > 0 then
						if IsHaveQuestNM( varMap, humanObjId, varQuest ) > 0 then	
							local varRand=0;
							local varQuestIdx = GetQuestIndexByID( varMap, humanObjId, varQuest )
							if GetQuestParam( varMap, humanObjId, varQuestIdx, 0 ) == 1 then
								varRand = x310020_GetRand(varMap, humanObjId)
							end

							local InstIndex = 1
							varItemCount, varItem, ItemRand, ItemDropNum = GetQuestItemNM( varMap, humanObjId, varQuest, InstIndex )
							local dropRand = random(1, 100);
							
							if varRand ~= 0 and dropRand <= varRand then
							
								if HaveItem( varMap, humanObjId, varItem ) <= 0 then 
									if GetBagSpace(varMap, humanObjId) > 0 then
										StartTalkTask(varMap)
										local varText = format( "你获得了#G@itemid_%d", varItem)
										if varText == nil then
											varText = "";
										end
										TalkAppendString( varMap, varText )
										StopTalkTask( varMap )
										DeliverTalkTips( varMap, humanObjId )
										x310020_ResetQuest( varMap, humanObjId, varItem, varQuest )	
									else
										local varText = "背包已满,请整理后再来杀怪"
										StartTalkTask(varMap)
										TalkAppendString(varMap, varText);
										StopTalkTask(varMap)
										DeliverTalkTips(varMap,humanObjId)
									end
								 end
							end
										

						end

					end
				end
			end
		end

end


function x310020_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	
	local varItem = GetItemTableIndexByIndex( varMap, varPlayer, varBagIdx ) 
	local varQuest = GetQuestIDByItemIDNM( varMap, varPlayer, varItem )

	if varQuest == -1 then 	
		return 0
	end

	if IsQuestHaveDoneNM( varMap, varPlayer, varQuest ) > 0 then 
		return 0
	end

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local scene, posx, posz, radii, QuestIdx, dispStr, bDispOther, otherStr = GetQuestUseItemInfoNM( varMap, varPlayer, varQuest, varItem )
	
		
	
	local offset = -1;

	if IsHaveQuestNM( varMap, varPlayer, 8000 ) > 0 then
		offset = 1;
	elseif IsHaveQuestNM( varMap, varPlayer, 8001 ) > 0 then
		offset = 2;
	elseif IsHaveQuestNM( varMap, varPlayer, 8002 ) > 0 then
		offset = 3;
	elseif IsHaveQuestNM( varMap, varPlayer, 8003 ) > 0 then
		offset = 4;
	elseif IsHaveQuestNM( varMap, varPlayer, 8004 ) > 0 then
		offset = 5;
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )

	local rp = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )
	local rFind = 0;
	for varI, item in x310020_var_ItemUsePosition do
		if item.varId == varItem then
			local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )
			local rPositionx = 0
			local rPositionz =0
			
			if rp == 1 then
				rPositionx = item.x1
				rPositionz = item.z1
				rFind	= item.find1
			elseif rp == 2 then
				rPositionx = item.x2
				rPositionz = item.z2
				rFind	= item.find2
			elseif rp == 3 then
				rPositionx = item.x3
				rPositionz = item.z3
				rFind	= item.find3
			end

		if scene == -1 or varMap ~= scene then
			if offset ~= -1 then
				local varText = format("你应该在%s(@npc_%d)使用此物品！", x310020_var_ItemUsePosition[offset].sceneName, rFind)
				StartTalkTask(varMap)
				TalkAppendString(varMap, varText)
				StopTalkTask(varMap)
				DeliverTalkTips(varMap, varPlayer)
			end
			
			
			return 0
		end 

			local distanceRet = item.r * item.r - (rPositionx - PlayerPosX) * (rPositionx - PlayerPosX) - (rPositionz - PlayerPosZ) * (rPositionz - PlayerPosZ)

			if distanceRet <=0 then
				if offset ~= -1 then
					local varText = format("你应该在%s(@npc_%d)使用此物品！", x310020_var_ItemUsePosition[offset].sceneName, rFind )
					StartTalkTask(varMap)
					TalkAppendString(varMap, varText)
					StopTalkTask(varMap)
					DeliverTalkTips(varMap, varPlayer)
				end
				return 0
			else
				
				if GetQuestParam( varMap, varPlayer, varQuestIdx, QuestIdx ) == 1 then
					return 0
				end

				
				if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end

				
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, QuestIdx, 1 )

				StartTalkTask(varMap)
				
				TalkAppendString( varMap, otherStr )
				StopTalkTask(varMap)
				DeliverTalkTips(varMap, varPlayer)

				if varQuest == 8004 then
					SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )         
				end

				x310020_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
				
				
				varImpact = item.buff;
				
				if varImpact ~= -1 then
					SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, varImpact, 0);
				end
				return 1
			end
		
		end
	end

	if posx > 0 then 
		local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )

		local distanceRet = radii * radii - (posx - PlayerPosX) * (posx - PlayerPosX) - (posz - PlayerPosZ) * (posz - PlayerPosZ)
		if distanceRet <= 0 then
			local varText = format("你应该在@sceneid_%d(@npc_%d)使用此物品！", scene, rFind )
			StartTalkTask(varMap)
			TalkAppendString(varMap, varText)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap, varPlayer)
			return 0
		end
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
	if GetQuestParam( varMap, varPlayer, varQuestIdx, QuestIdx ) == 1 then
		return 0
	end

	
	if EraseItem(varMap, varPlayer, varBagIdx) ~= 1 then return 0 end

	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, QuestIdx, 1 )

	StartTalkTask(varMap)
	TalkAppendString(varMap, dispStr)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap, varPlayer)

	
	if varImpact ~= -1 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, varImpact, 0);
	end
	return 1
end


function x310020_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 0 then	
		return 0
	end

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )	
	local varStr;
	varStr = GetQuestNameNM(varMap, varPlayer, varQuest);
	
	local varCircle;
	
	if varQuest == 8004 then
		local inst = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
		if inst == 1 then
			varCircle = 5
		else
			varCircle= GetQuestParam( varMap, varPlayer, varQuestIdx, MP_CIRCLE )
		end
	else
		varCircle= GetQuestParam( varMap, varPlayer, varQuestIdx, MP_CIRCLE )
	end
	
	if varCircle ~= nil then
		varStr = varStr.."("..varCircle;
		varStr = varStr.."/".."5";
		varStr = varStr..")";
	end

	local rp = GetQuestParam( varMap, varPlayer, varQuestIdx, 5 )
	local instData1 = GetQuestParam( varMap, varPlayer, varQuestIdx, 0 )
	local instData2 = GetQuestParam( varMap, varPlayer, varQuestIdx, 1 )
	local instDataStr1 = ""
	local instDataStr2 = ""

	if instData1 ~= nil and instData2 ~= nil then
		 instDataStr1 = format("(%d/1)", instData1 )
		 instDataStr2 = format("(%d/1)", instData2 )
	end

	local str_target="";
	local str_proc="";
	local str_tip="";
	local posfind;
	for varI, item in x310020_var_ItemUsePosition do
		if varQuest == item.quest then
			local posText="";
			if rp == 1 then
				posfind = item.find1;
			elseif rp == 2 then
				posfind = item.find2;
			elseif rp == 3 then
				posfind = item.find3;
			end

			if posfind ~= nil then
				posText = format("(@npc_%d)", posfind )
			end

			local sceneName = item.sceneName;
			local usedItem = item.usedItem 
			local destItem = item.destItem 
			str_proc = "\t到"..sceneName..posText.."使用#G"..usedItem

			if posfind ~= nil then
				str_target = "  到@npcsp_指定地点_"..posfind.."使用#G"..usedItem.."#W"..instDataStr1
			end
			if varQuest ~= 8004 then
				if instData1 > 0 then
					str_target = "  #W获得#G"..destItem.."#W"..instDataStr2
					str_proc = "\t到#G"..sceneName.."#W击败敌人，获得#G"..destItem
				end
			else
				if instData1 > 0 then
					str_target = ""
					str_proc = ""
				end
			end

	 		str_tip = "请在"..sceneName..posText.."附近使用"..usedItem.."，在结晶的发动的本场景内杀怪可以获得激活下一个耀星的结晶。"
			break
		end
	end

    StartTalkTask(varMap)
        AddQuestLogCustomText( varMap,
                                "",                    
                                "",                 
                                str_target,               
                                "",                         
                                str_proc,                   
                                "",                
                                str_tip        
                                )

	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);

end
