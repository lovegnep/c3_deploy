--DECLARE_QUEST_INFO_START--

x310703_var_FileId 					= 310703
x310703_var_QuestName				= "【个人】进阶驯马大师"
x310703_var_QuestId					= 3612
x310703_var_Ability					= 10
x310703_var_Title						= 83
x310703_var_AbillityLevel				= 5
x310703_var_LevelLess					= 55

--DECLARE_QUEST_INFO_STOP--

x310703_var_CommitNPC     = "@npc_139079"
x310703_var_QuestInfo   = "\t想进阶为蒙古驯马术的大师，必须要完成我的考验。\n\t但是要注意，一旦顺利进阶，除非遗忘整个蒙古驯马术，否则无法成为其他生活技能的大师。\n\t成为驯马大师可以学习9级蒙古驯马术及一些特殊的蒙古驯马术配方。\n\t你确定要接受考验吗？"           
x310703_var_QuestHelp   = "所需的部件由生活技能制造，也可以从其他玩家处获得"          
x310703_var_QuestTarget = "  收集@item_11041022#W三个\n  收集@item_11041010#W一个\n  收集@item_11041000#W一个\n  收集@item_11041030#W一个\n  收集@item_11041040#W一个\n  收集@item_11041050#W一个"      
x310703_var_TitleBonus    = "称号：驯马大师（拥有此称号可以学习更多的驯马技能）"

x310703_var_QuestItem = {
{varItemData=11041022,varCount=3},
{varItemData=11041010,varCount=1},
{varItemData=11041000,varCount=1},
{varItemData=11041030,varCount=1},
{varItemData=11041040,varCount=1},
{varItemData=11041050,varCount=1}
}

x310703_var_AllTitle = {81,82,83,84,85,86}

x310703_var_AllQuest = {3610,3611,3612,3613,3614,3615}

function x310703_CheckTitle(varMap, varPlayer)
	for varI, title in x310703_var_AllTitle do
		if IsHaveTitle(varMap, varPlayer, title) > 0 then
			return 0
		end
	end
	return 1
end

function x310703_CheckQuest(varMap, varPlayer)
	for varI, quest in x310703_var_AllQuest do
		if IsHaveQuestNM( varMap, varPlayer, quest ) == 1 then
			return 0
		end
	end
	return 1
end

function x310703_DoLearn(varMap, varPlayer)
	
	local varLevel = QueryPlayerAbilityLevel( varMap, varPlayer, x310703_var_Ability );
	if varLevel <= 0 then
		return "您还没有学会相应的生活技能"
	end
	
	if varLevel < x310703_var_AbillityLevel then
		return format("需要%d级的生活技能", x310703_var_AbillityLevel)
	end
	
	if x310703_CheckTitle(varMap, varPlayer) == 0 then
		--return "你已经获得生活称号了"
	end
	
	if x310703_CheckQuest(varMap, varPlayer) == 0 then
		--return "你已经有其他生活称号任务了，不能接受此任务"
	end
	
	if AddQuestNM( varMap, varPlayer, x310703_var_QuestId, x310703_var_FileId, 0, 0, 1 ) ~= 1 then
		return "添加任务失败，无法接取本任务。"
	end
	
	if 1 == x310703_IsHaveAllItem( varMap, varPlayer ) then
  	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310703_var_QuestId )
  	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
  end
  
	return nil;

end

function x310703_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	varState = GetQuestStateNM(varMap, varPlayer, varTalknpc, x310703_var_QuestId)
	TalkAppendButton(varMap,x310703_var_QuestId,x310703_var_QuestName,varState,-1);
end

function x310703_IsHaveAllItem( varMap, varPlayer )
	local isHaveAllQuestItem = 1
  for varI, item in x310703_var_QuestItem do
  	if GetItemCountInBag(varMap, varPlayer, item.varItemData) < item.varCount then
  		isHaveAllQuestItem = 0
  	end
  end
  return isHaveAllQuestItem
end

function x310703_GetNeedCount( varMap, varPlayer, varItemData )
  for varI, item in x310703_var_QuestItem do
  	if varItemData == item.varItemData then
  		return item.varCount
  	end
  end
  return 0
end

function x310703_IsCanSubmit( varMap, varPlayer )
	local isHaveAllQuestItem = x310703_IsHaveAllItem( varMap, varPlayer )

  if 0 == isHaveAllQuestItem then
  	return "需要的物品还没有收集全"
  end
  
  return nil
end

function x310703_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, x310703_var_QuestId ) <= 0 then
		return
	end
	
	local varStr = x310703_IsCanSubmit( varMap, varPlayer )
	if varStr ~= nil then
		Msg2Player(varMap,varPlayer,varStr,8,2)
		StartTalkTask(varMap);
		TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return
	end
	
	for varI, item in x310703_var_QuestItem do
		if DelItem(varMap, varPlayer, item.varItemData, item.varCount) ~= 1 then return 0 end
  end

	DelQuestNM( varMap, varPlayer, x310703_var_QuestId )
	AwardTitle( varMap, varPlayer, x310703_var_Title )
end

function x310703_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)

	if IsHaveQuestNM( varMap, varPlayer, varQuest ) == 1 then
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest )
		if GetQuestParam( varMap, varPlayer, varQuestIdx, 7 ) == 1 then
			local varStr = x310703_IsCanSubmit( varMap, varPlayer )
			if varStr ~= nil then
				Msg2Player(varMap,varPlayer,varStr,8,2)
				StartTalkTask(varMap);
				TalkAppendString(varMap, varStr);
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				return
			end
			StartTalkTask(varMap)
			TalkAppendString(varMap,"\t你这就收集齐了所有的东西？看来你可以成为蒙古驯马术大师了。")
			StopTalkTask()
			DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, -1, varQuest  );
			return
		end
		
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y【个人】进阶驯马大师\n\t#W你还没有收集齐我要的东西，收齐再来找我吧。")
		StopTalkTask()
		DeliverTalkRequire(varMap, varPlayer, varTalknpc, x310703_var_FileId, varQuest, 0);
	  return
	  
	end
	
	StartTalkTask(varMap);
	
	
    TalkAppendString( varMap, "#Y"..x310703_var_QuestName.."\n#W"..x310703_var_QuestInfo)
                 
    
    TalkAppendString( varMap, "#Y任务目标：\n#W"..x310703_var_QuestTarget)
    TalkAppendString( varMap, " ")

    
    TalkAppendString( varMap, "#Y任务提示：\n#W"..x310703_var_QuestHelp)
    TalkAppendString( varMap, " ")

    
    TalkAppendString( varMap, "#Y奖励内容：\n#W"..x310703_var_TitleBonus)
    TalkAppendString( varMap, " ")

	StopTalkTask();
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310703_var_QuestId, -1);
	
end

function x310703_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
	return 1
end






function x310703_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	local varRet = x310703_DoLearn(varMap, varPlayer);
	
	if varRet ~= nil then
		Msg2Player(varMap,varPlayer,varRet,8,2)
		Msg2Player(varMap,varPlayer,varRet,8,3)
	end
	
end

function x310703_ProcQuestItemChanged(varMap, varPlayer, varItemData, nChangeType)

  if IsHaveQuestNM(varMap, varPlayer, x310703_var_QuestId) <= 0 then
      return
  end
  
  local isQuestItem = 0
  for varI, item in x310703_var_QuestItem do
  	if item.varItemData == varItemData then
  		isQuestItem = 1
  	end
  end
  
  if isQuestItem ~= 1 then
  	return
  end
  
  local curCount = GetItemCountInBag(varMap, varPlayer, varItemData)
  local needCount = x310703_GetNeedCount(varMap, varPlayer, varItemData)
  if curCount > needCount then
  	curCount = needCount
  end
  if nChangeType == 0 and curCount <= needCount then
      StartTalkTask(varMap)
      local varText = format("#Y获得物品#G#{_ITEM%d}#Y: %d/%d", varItemData, curCount, needCount )
      if varText == nil then
          varText = "";
      end
      TalkAppendString( varMap, varText )
      StopTalkTask( varMap )
      DeliverTalkTips( varMap, varPlayer )
  end
  
  x310703_QuestLogRefresh(varMap, varPlayer, x310703_var_QuestId)
  
  if 1 == x310703_IsHaveAllItem( varMap, varPlayer ) then
  	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310703_var_QuestId )
  	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1 )
  else
  	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310703_var_QuestId )
  	SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 0 )
  end
	
end

function x310703_GetCurCount(varMap, varPlayer, varIndex)
	local varItemCount = GetItemCountInBag(varMap, varPlayer, x310703_var_QuestItem[varIndex].varItemData)
  if varItemCount > x310703_var_QuestItem[varIndex].varCount then
  	varItemCount = x310703_var_QuestItem[varIndex].varCount
  end
  return varItemCount
end

function x310703_QuestLogRefresh( varMap, varPlayer, varQuest)
		
	if varQuest == nil or varQuest < 0 then
        return
    end
    
    if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then
        return
    end

    local szTarget   = ""
    local varItemCount  = 0
    local totlecount = 0

    for varI = 1, 6 do
        varItemCount = x310703_GetCurCount(varMap, varPlayer, varI)
        totlecount = x310703_var_QuestItem[varI].varCount
        
        if varItemCount == totlecount then
            szTarget = szTarget .. format("  #G收集@item_%d#W(%d/%d)", 
            x310703_var_QuestItem[varI].varItemData, varItemCount, totlecount)
        else
            szTarget = szTarget .. format("  #W收集@item_%d#W(%d/%d)", 
            x310703_var_QuestItem[varI].varItemData, varItemCount, totlecount)
        end
        
        if varI < 6 then
        	szTarget = szTarget .. "\n"
        end
    end
  
  StartTalkTask(varMap)
	AddQuestLogCustomText( varMap,
							x310703_var_QuestName,						
							x310703_var_QuestName,        
							szTarget,		
							x310703_var_CommitNPC,			
							"  所需的部件由生活技能制造，也可以从其他玩家处获得\n \n#Y奖励内容：\n\t#W称号：驯马大师（拥有此称号可以学习更多的驯马技能）",               
							"\t想进阶为蒙古驯马术的大师，必须要完成我的考验。\n\t但是要注意，一旦顺利进阶，除非遗忘整个蒙古驯马术，否则无法成为其他生活技能的大师。",	
							""					
							)
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, varQuest);
end

function x310703_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	x310703_QuestLogRefresh( varMap, varPlayer, varQuest );
end

function x310703_ProcQuestAbandon(varMap, varPlayer, varQuest)
	DelQuestNM( varMap, varPlayer, varQuest )

	local message = "您放弃了:"..x310703_var_QuestName
	StartTalkTask(varMap);
	TalkAppendString(varMap, message);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
	Msg2Player(varMap, varPlayer, message, 4, 2);

end

function x310703_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then	
		return
	end
	
end
