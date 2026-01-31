

--DECLARE_QUEST_INFO_START--
x256218_var_FileId = 256218
x256218_var_QuestIdPre =3051
x256218_var_QuestId = 3093
x256218_var_LevelLess	= 	25 
x256218_var_QuestIdNext = 3052
x256218_var_Name	={}
x256218_var_ExtTarget={{type=20,n=1,target="用#G水晶#W将一件#G声望装#W@npc_82068"}}
x256218_var_QuestName="【个人】第一次升星"
x256218_var_QuestInfo="\t亲爱的朋友，在你的身上有足够的#G水晶#W可以使你将一件#G世传君主装备#W升级到3星。 \n\t滑鼠左键点击装备升星大师，再用滑鼠左键点击#G装备升星#W的选项，会打开打星的模块栏，同时背包也会自动打开。\n\t 右键点击所要#G打造的装备#W，该装备会自动放入打星模块栏中，此时滑鼠左键在下方选择#G宝石#W种类和#G打星#W等级，然后点击#G自动打星或打星#W就可以进行打星的操作了。\n\t打星完成后点击关闭模块栏，打星就此结束，已打星的装备也会自动回到您的背包中。\n\t #G注：装备的前三星是不会失败的，之后就可能会出现打星失败的情况。#W\n\t#G四-五星打星失败将会回到三星，五星以上失败将会回到零星！#W"  
x256218_var_QuestTarget=""		
x256218_var_QuestCompleted="\t我想你已经仔细看过那件被打上3颗星的声望装备，感觉如何？升星后的装备确实比升星前要强化了不少吧。"					
x256218_var_ContinueInfo="\t你不愿意为你的那件声望装备打上三星吗？"
x256218_var_QuestHelp =	""
x256218_var_DemandItem =	   {10014001,10024001,10034001,10044001,10054001,10064001,10074001,10084001,10094001,10104001,10114001,10124001,10234001,10234011,10234021,10234031,10234041,10234051,10254001,10254011,10254021,10254031,10254041,10254051,10274001,10274011,10274021,10274031,10274041,10274051,10244001, 10244011, 10244021,	10244031,	10244041,	10244051,	10264001,	10264011,	10264021,	10264031,	10264041,	10264051,	10204001, 10204011,	10204021,	10204031,	10204041,	10204051}					
x256218_var_BonusMoney1 =0
x256218_var_BonusMoney2 =0
x256218_var_BonusMoney3 =0
x256218_var_BonusMoney4 =0
x256218_var_BonusMoney5 =0
x256218_var_BonusMoney6 =0
x256218_var_BonusItem	=	{}
x256218_var_BonusChoiceItem ={}
x256218_var_ExpBonus = 10200
x256218_var_NpcGUID ={{ guid = 138553, varName = "托哈格"} }
--DECLARE_QUEST_INFO_STOP--

x256218_var_MaxLevel   = 40

function x256218_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x256218_var_LevelLess or varLevel >= x256218_var_MaxLevel then
		return
	end


	if IsQuestHaveDone(varMap, varPlayer, x256218_var_QuestId) > 0 then
		return 
	end
	
	if IsQuestHaveDone(varMap, varPlayer, x256218_var_QuestIdPre)> 0 then 
	if IsHaveQuest(varMap,varPlayer, x256218_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256218_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256218_var_QuestId, varState, -1 )
	end
	end

end

function x256218_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x256218_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x256218_var_ExpBonus )
		end
		if x256218_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x256218_var_BonusMoney1 )
		end
		if x256218_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x256218_var_BonusMoney2 )
		end
		if x256218_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x256218_var_BonusMoney3 )
		end
		if x256218_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x256218_var_BonusMoney4 )
		end
		if x256218_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x256218_var_BonusMoney5 )
		end
		if x256218_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x256218_var_BonusMoney6 )
		end
		for varI, item in x256218_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		for varI, item in x256218_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  	end
end


function x256218_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x256218_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x256218_var_QuestId) > 0 then
			if x256218_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256218_var_QuestName)
				TalkAppendString(varMap,x256218_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x256218_var_FileId, x256218_var_QuestId);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x256218_var_QuestName)
				TalkAppendString(varMap,x256218_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x256218_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x256218_var_FileId, x256218_var_QuestId);
			end
  elseif x256218_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x256218_var_QuestName)
			TalkAppendString(varMap,x256218_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x256218_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x256218_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x256218_var_QuestHelp )
			end
			x256218_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x256218_var_FileId, x256218_var_QuestId);
  end
	
end


function x256218_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
	return 1
		

end

function x256218_CheckSubmit( varMap, varPlayer, varTalknpc)  
                                                  
		if  IsHaveQuest(varMap, varPlayer,x256218_var_QuestId) ~=1 then
			return 0
		end
		
	   	local 	varQuestIdx = GetQuestIndexByID(varMap, varPlayer,x256218_var_QuestId)                                                  
	   	if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1) == 1 then
	   		return 1
	   	else 
	   		return 0
	   	end
	   	
	
end


function x256218_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x256218_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x256218_var_QuestId  )
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
		
		if x256218_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x256218_var_QuestId, x256218_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
			  			x256218_Msg2toplayer( varMap, varPlayer,0)
						for varI, item in x256218_var_DemandItem do
							local equip	=	GetEquipItemCountByLess(varMap, varPlayer, 3,0,item)
							local bag	=	GetBagItemCountByLess(varMap, varPlayer, 3,0,item)  
							if equip >= 1 or bag >=1 then
								
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x256218_var_QuestId)                                                  
			    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
			    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
			    				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 27,0 )
									LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 28,0 )
									LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 30,0 )
			    				break
							end
						end
					end
	 	end                                                                    
	     
end


function x256218_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x256218_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x256218_var_QuestId)
	  x256218_Msg2toplayer( varMap, varPlayer,1)
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 27,0 )
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 28,0 )
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 30,0 )	
end

function x256218_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x256218_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x256218_var_BonusChoiceItem do
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

function x256218_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x256218_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256218_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x256218_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，请清理后再来！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x256218_var_QuestId) > 0 then
				x256218_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x256218_var_QuestId)
				x256218_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x256218_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x256218_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x256218_var_QuestIdNext )	
end

function x256218_GetBonus( varMap, varPlayer,varTalknpc)
	  if x256218_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x256218_var_ExpBonus);
  	end
		if x256218_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x256218_var_BonusMoney1 )
	  end
		if x256218_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x256218_var_BonusMoney2 )
	  end
		if x256218_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x256218_var_BonusMoney3 )
		end
		if x256218_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x256218_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x256218_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x256218_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x256218_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x256218_var_BonusMoney6)
		end
end

function x256218_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务："..x256218_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务："..x256218_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256218_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x256218_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256218_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x256218_var_QuestName.."！", 0, 3)
				if x256218_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x256218_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x256218_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x256218_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x256218_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x256218_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x256218_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x256218_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x256218_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x256218_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x256218_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x256218_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x256218_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x256218_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x256218_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x256218_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x256218_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x256218_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x256218_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x256218_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x256218_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x256218_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x256218_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x256218_var_QuestId, varState, -1 )
				if x256218_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 27,1 )
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 28,1 )
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 30,1 )
				 end
		end
end

function x256218_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x256218_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x256218_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256218_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x256218_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x256218_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
