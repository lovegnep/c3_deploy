

--DECLARE_QUEST_INFO_START--
x256292_var_FileId = 256292
x256292_var_QuestIdPre = 4224
x256292_var_QuestId = 2632
x256292_var_LevelLess	= 	32 

x256292_var_Name	={}
x256292_var_ExtTarget={{type=20,n=1,target="#G到金币商店贵宾区麒麟商店#W购买#G世传钻石#W或#G世传水晶#W将一件#G声望装#W@npc_59650"}}
x256292_var_QuestName="【个人】“星”的追求"
x256292_var_QuestInfo="\t亲爱的朋友，对于打星的需求是永无止境的，你可以去金币商店贵宾区麒麟商店购买足够的#G世传钻石#W或#G世传水晶#W，它可以使你将一件#G30级以下的世传声望装备#W很容易的升级到五星。\n\t在打星完成后，你会发现，你的实力也提高了不少。"  
x256292_var_QuestTarget=""		
x256292_var_QuestCompleted="\t手握这件打上五星的装备，你是不是在为它强大的属性所惊叹？"					
x256292_var_ContinueInfo="\t你不愿意为你的那件声望装备打上五星吗？#G注：打星所需的世传钻石可以在金币商店贵宾区麒麟商店购买。#W"
x256292_var_QuestHelp =	"打星所需的世传钻石可以在金币商店贵宾区麒麟商店购买。"
x256292_var_DemandItem =	   {10014001,10024001,10034001,10044001,10054001,10064001,10074001,10084001,10094001,10104001,10114001,10124001,10234001,10234011,10234021,10234031,10234041,10234051,10254001,10254011,10254021,10254031,10254041,10254051,10274001,10274011,10274021,10274031,10274041,10274051,10354001,10414001,10204061,10239218,10259218,10269218,10279218,10249218,10364001,10424001,10204071,10239222,10259222,10269222,10279222,10249222,10374001,10434001,10204081,10239226,10259226,10269226,10279226,10249226,10384001,10444001,10204091,10239230,10259230,10269230,10279230,10249230,10394001,10455001,10204101,10239234,10259234,10269234,10279234,10249234,10404001,10464001,10204111,10239238,10259238,10269238,10279238,10249238}				
x256292_var_BonusMoney1 =0
x256292_var_BonusMoney2 =0
x256292_var_BonusMoney3 =0
x256292_var_BonusMoney4 =0
x256292_var_BonusMoney5 =0
x256292_var_BonusMoney6 =0
x256292_var_BonusItem	=	{}
x256292_var_BonusChoiceItem ={}
x256292_var_ExpBonus = 500000
x256292_var_NpcGUID ={{ guid = 123738, varName = "托哈格"} }
--DECLARE_QUEST_INFO_STOP--

x256292_var_MaxLevel   = 50

function x256292_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256292_var_LevelLess or varLevel >= x256292_var_MaxLevel then
		return
	end


	if IsQuestHaveDone(varMap, varPlayer, x256292_var_QuestId) > 0 then
		return 
	end

  if IsQuestHaveDone(varMap, varPlayer, x256292_var_QuestIdPre)> 0 then 	
	if IsHaveQuest(varMap,varPlayer, x256292_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256292_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256292_var_QuestId, varState, -1 )

	end
  end
end

function x256292_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256292_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256292_var_ExpBonus )
		end
		if x256292_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256292_var_BonusMoney1 )
		end
		if x256292_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256292_var_BonusMoney2 )
		end
		if x256292_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256292_var_BonusMoney3 )
		end
		if x256292_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256292_var_BonusMoney4 )
		end
		if x256292_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256292_var_BonusMoney5 )
		end
		if x256292_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256292_var_BonusMoney6 )
		end
		for varI, item in x256292_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		for varI, item in x256292_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  	end
end


function x256292_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256292_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256292_var_QuestId) > 0 then
			if x256292_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256292_var_QuestName)
				TalkAppendString(varMap,x256292_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256292_var_FileId, x256292_var_QuestId);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256292_var_QuestName)
				TalkAppendString(varMap,x256292_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x256292_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256292_var_FileId, x256292_var_QuestId);
			end
  elseif x256292_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x256292_var_QuestName)
			TalkAppendString(varMap,x256292_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256292_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256292_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256292_var_QuestHelp )
			end
			x256292_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256292_var_FileId, x256292_var_QuestId);
  end
	
end


function x256292_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
	return 1
		

end

function x256292_CheckSubmit( varMap, varPlayer, varTalknpc)  
                                                  
		if  IsHaveQuest(varMap, varPlayer,x256292_var_QuestId) ~=1 then
			return 0
		end
		
	   	local 	varQuestIdx = GetQuestIndexByID(varMap, varPlayer,x256292_var_QuestId)                                                  
	   	if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1) == 1 then
	   		return 1
	   	else 
	   		return 0
	   	end
	   	
	
end


function x256292_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256292_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256292_var_QuestId  )
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
		
		if x256292_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			local retmiss = AddQuest( varMap, varPlayer, x256292_var_QuestId, x256292_var_FileId, 0, 0, 0,1)
			if retmiss ==0 then
				Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
				return 0
			else
	  			x256292_Msg2toplayer( varMap, varPlayer,0)
				for varI, item in x256292_var_DemandItem do
					local equip	=	GetEquipItemCountByLess(varMap, varPlayer, 5,0,item)
					local bag	=	GetBagItemCountByLess(varMap, varPlayer, 5,0,item)  
					if equip >= 1 or bag >=1 then
						
						local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256292_var_QuestId)                                                  
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    				break
					end
				end
			end
	 	end                                                                    
	     
end


function x256292_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256292_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256292_var_QuestId)
	  x256292_Msg2toplayer( varMap, varPlayer,1)
			
end

function x256292_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256292_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256292_var_BonusChoiceItem do
        if item.item == varRadioSelected then
            ItemAppend( varMap, item.item, item.n )
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

function x256292_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256292_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256292_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256292_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，请清理后再来！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256292_var_QuestId) > 0 then
				x256292_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256292_var_QuestId)
				x256292_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256292_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x256292_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   
end

function x256292_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256292_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256292_var_ExpBonus);
  	end
		if x256292_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256292_var_BonusMoney1 )
	  end
		if x256292_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256292_var_BonusMoney2 )
	  end
		if x256292_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256292_var_BonusMoney3 )
		end
		if x256292_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256292_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256292_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256292_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256292_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256292_var_BonusMoney6)
		end
end

function x256292_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务："..x256292_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务："..x256292_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256292_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256292_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256292_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256292_var_QuestName.."！", 0, 3)
				if x256292_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256292_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256292_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256292_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256292_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256292_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256292_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256292_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256292_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256292_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256292_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256292_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256292_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256292_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256292_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256292_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256292_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256292_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256292_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256292_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256292_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256292_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256292_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256292_var_QuestId, varState, -1 )
		end
end

function x256292_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256292_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256292_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256292_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256292_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256292_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
