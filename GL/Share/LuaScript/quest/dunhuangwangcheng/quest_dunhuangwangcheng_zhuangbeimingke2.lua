--装备铭刻

--DECLARE_QUEST_INFO_START--
x256304_var_FileId = 256304
x256304_var_QuestIdPre = 3950
x256304_var_QuestId = 3949
x256304_var_LevelLess	= 	45
x256304_var_QuestIdNext = -1
x256304_var_Name	={}
x256304_var_ExtTarget={{type=20,n=1,target="在@npc_139052处为一件国传装备进行灵魂铭刻"}}
x256304_var_QuestName="【个人】装备铭刻（二）"
x256304_var_QuestInfo="\t我可以帮你把装备通过铭刻其他物品的方式提高装备属性，当你需要的时候可以来找我。\n\t亲自体验下灵魂铭刻给装备属性带来的提升吧，请使用#G国传灵魂印#W为一件国传装备进行#G灵魂铭刻#W。"  --任务描述
x256304_var_QuestTarget=""		
x256304_var_QuestCompleted="\t铭刻后的装备是不是有焕然一新的感觉？如果你还满意铭刻的效果，可以尝试将其他装备也进行铭刻。当你需要时也可以用#G灵魂印#W对60级以上装备进行铭刻。"					--完成任务npc说话的话
x256304_var_ContinueInfo="\t你可以在我这里买到#G国传灵魂印#W对40～59级的装备进行灵魂铭刻。"
x256304_var_QuestHelp =	""
x256304_var_DemandItem ={10014002,10019802,10024002,10028802,10034002,10038802,10044002,10048802,10054002,10058802,10064002,10068802,10074002,10077802,10084002,10087802,10094002,10097802,10104002,10107802,10114002,10117802,10124002,10127802,10204002,10204012,10204022,10204032,10204042,10204052,10204062,10204072,10204082,10204092,10204102,10204112,10208802,10208812,10208822,10208832,10208842,10208852,10209273,10209278,10209283,10209288,10209293,10209298,10234002,10234012,10234022,10234032,10234042,10234052,10238802,10238812,10238822,10238832,10238842,10238852,10239219,10239223,10239227,10239231,10239235,10239239,10239297,10239302,10239307,10239312,10239317,10239322,10244002,10244012,10244022,10244032,10244042,10244052,10248802,10248812,10248822,10248832,10248842,10248852,10249219,10249223,10249227,10249231,10249235,10249239,10249297,10249302,10249307,10249312,10249317,10249322,10254002,10254012,10254022,10254032,10254042,10254052,10258802,10258812,10258822,10258832,10258842,10258852,10259219,10259223,10259227,10259231,10259235,10259239,10259297,10259302,10259307,10259312,10259317,10259322,10264002,10264012,10264022,10264032,10264042,10264052,10268802,10268812,10268822,10268832,10268842,10268852,10269219,10269223,10269227,10269231,10269235,10269239,10269297,10269302,10269307,10269312,10269317,10269322,10274002,10274012,10274022,10274032,10274042,10274052,10278802,10278812,10278822,10278832,10278842,10278852,10279219,10279223,10279227,10279231,10279235,10279239,10279297,10279302,10279307,10279312,10279317,10279322,10284002,10284012,10284022,10284032,10284042,10284052,10287002,10287012,10287022,10287032,10287042,10287052,10287071,10287076,10287081,10287086,10288019,10288023,10288027,10288031,10288035,10288039,10288055,10288058,10288061,10288064,10288067,10288070,10294002,10294012,10294022,10294032,10294042,10294052,10297002,10297012,10297022,10297032,10297042,10297052,10297071,10297076,10297081,10297086,10298019,10298023,10298027,10298031,10298035,10298039,10298055,10298058,10298061,10298064,10298067,10298070,10354002,10355002,10364002,10365002,10374002,10375002,10384002,10385002,10394002,10395002,10404002,10405002,10414002,10415002,10424002,10425002,10434002,10435002,10444002,10445002,10454002,10455002,10464002,10465002,
}
x256304_var_BonusMoney1 =376
x256304_var_BonusMoney2 =0
x256304_var_BonusMoney3 =0
x256304_var_BonusMoney4 =0
x256304_var_BonusMoney5 =71
x256304_var_BonusMoney6 =0
x256304_var_BonusItem	=	{}
x256304_var_BonusChoiceItem ={}
x256304_var_ExpBonus = 104000
x256304_var_NpcGUID ={{ guid = 139052, name = "李定邦"} }
--DECLARE_QUEST_INFO_STOP--
--**********************************
x256304_var_MaxLevel   = 65

function x256304_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
  local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256304_var_LevelLess or varLevel > x256304_var_MaxLevel then
	return 
	end
	
	


	if IsQuestHaveDone(varMap, varPlayer, x256304_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x256304_var_QuestIdPre)> 0 then

						if IsHaveQuest(varMap,varPlayer, x256304_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256304_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256304_var_QuestId, varState, -1 )
						end
		
	end
end

function x256304_DispatchMissionInfo( varMap, varPlayer, varTalknpc )
		if x256304_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256304_var_ExpBonus )
		end
		if x256304_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256304_var_BonusMoney1 )
		end
		if x256304_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256304_var_BonusMoney2 )
		end
		if x256304_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256304_var_BonusMoney3 )
		end
		if x256304_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256304_var_BonusMoney4 )
		end
		if x256304_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256304_var_BonusMoney5 )
		end
		if x256304_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256304_var_BonusMoney6 )
		end
		for i, item in x256304_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for i, item in x256304_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end
--**********************************

function x256304_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	--点击该任务后执行此脚本
	if IsQuestHaveDone(varMap, varPlayer, x256304_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256304_var_QuestId) > 0 then
			if x256304_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256304_var_QuestName)
						TalkAppendString(varMap,x256304_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256304_var_FileId, x256304_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x256304_var_QuestName)
						TalkAppendString(varMap,x256304_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x256304_DispatchMissionInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256304_var_FileId, x256304_var_QuestId);
			end
  elseif x256304_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x256304_var_QuestName)
			TalkAppendString(varMap,x256304_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for i, item in x256304_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256304_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256304_var_QuestHelp )
			end
			x256304_DispatchMissionInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256304_var_FileId, x256304_var_QuestId);
  end
	
end
--**********************************

function x256304_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end
--**********************************
function x256304_CheckSubmit( varMap, varPlayer, varTalknpc)

		if  IsHaveQuest(varMap, varPlayer,x256304_var_QuestId) ~=1 then
			return 0
		end
		
	  local 	varQuestIdx = GetQuestIndexByID(varMap, varPlayer,x256304_var_QuestId)                                                  
	  if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1) == 1 then
	  	return 1
	  else 
	  	return 0
	  end
	   	
	
end
--**********************************
function x256304_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256304_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		--检查前置任务
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256304_var_QuestId  )
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
		
		if x256304_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256304_var_QuestId, x256304_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x256304_Msg2toplayer( varMap, varPlayer,0)
		  			for i, item in x256304_var_DemandItem do
							local equip	=	GetEquipItemCountByLess(varMap, varPlayer, 1,3,item)
							local bag	=	GetBagItemCountByLess(varMap, varPlayer, 1,3,item)  --0--升星 1--打孔 2--宝石
							if equip >= 1 or bag >=1 then
						
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256304_var_QuestId)                                                  
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    				break
					end
				end
		  end
	 	end                                                                    
	     
end
--**********************************

function x256304_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256304_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256304_var_QuestId)
	  x256304_Msg2toplayer( varMap, varPlayer,1)
			
end
--**********************************
function x256304_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 --是否已经在固定物品奖励添加检测中已经检查出包裹已满
	StartItemTask(varMap)
	for j, item in x256304_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x256304_var_BonusChoiceItem do
        if item.item == varRadioSelected then
            ItemAppendBind( varMap, item.item, item.n )
            break
        end
  end
  local varRet = StopItemTask(varMap,varPlayer)
    if varRet <= 0 then
        if result == 1 then
            result = 0
        end
    end
	return result
end
--**********************************
function x256304_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256304_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256304_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256304_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256304_var_QuestId) > 0 then
				x256304_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256304_var_QuestId)
				x256304_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for i, item in x256304_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for i, item in x256304_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		--DeliverItemListSendToPlayer(varMap,varPlayer)
   end
  -- LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x256304_var_QuestIdNext )	
end

function x256304_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256304_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256304_var_ExpBonus);
  	end
		if x256304_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256304_var_BonusMoney1 )
	  end
		if x256304_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256304_var_BonusMoney2 )
	  end
		if x256304_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256304_var_BonusMoney3 )
		end
		if x256304_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256304_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256304_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256304_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256304_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256304_var_BonusMoney6)
		end
end

function x256304_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务："..x256304_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务："..x256304_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256304_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256304_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256304_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256304_var_QuestName.."！", 0, 3)
				if x256304_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256304_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256304_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256304_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256304_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256304_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256304_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256304_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256304_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256304_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256304_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256304_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256304_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256304_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256304_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256304_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	--return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256304_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	-- LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256304_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	--LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256304_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	--LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256304_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for i ,item in x256304_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256304_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256304_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256304_var_QuestId, varState, -1 )
		end
end

function x256304_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	--return LuaCallNoclosure( QUEST_SCRIPT, "MissionComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256304_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	--return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256304_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	--return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256304_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	--return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256304_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	--LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256304_OpenCheck( varMap, varPlayer, varTalknpc )
	--LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
