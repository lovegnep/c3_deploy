

--DECLARE_QUEST_INFO_START--
x203759_var_FileId = 203759
x203759_var_QuestIdPre =4213
x203759_var_QuestId = 4217
x203759_var_LevelLess	= 	20 
x203759_var_QuestIdNext = 2696
x203759_var_Name	={}
x203759_var_ExtTarget={{type=20,n=1,target="在@npc_126024处兑处换一件声望装"}}
x203759_var_QuestName="【个人】第一件声望装"
x203759_var_QuestInfo="\t亲爱的朋友，在我的手中有很多声望套装，换上这些套装你的能力会有明显的提升。\n\t点击声望商店后，左键点击#G换取世传君主套装#c000000的选项，会打开世传君主装备商店。其中有#G五件套装#c000000，选取你喜欢的一件#G右键点击该套装#c000000，在声望足够的情况下便兑换完成。\n\t这里我推荐你首先兑换世传君主套装中的兵器，如果你不小心将套装卖出，可点击商店中的#G回购#c000000再将套装买回。"  
x203759_var_QuestTarget=""		
x203759_var_QuestCompleted="\t这件装备必然对你日后成长和能力提高起到不可低估的作用。\n\t一定要记住，日后在获得足够的声望还可以来我这里兑换装备。"					
x203759_var_ContinueInfo="\t你不想兑换一件声望套装吗？"
x203759_var_QuestHelp =	""
x203759_var_DemandItem ={10014001,10024001,10034001,10044001,10054001,10064001,10074001,10084001,10094001,10104001,10114001,10124001,10234001,10234011,10234021,10234031,10234041,10234051,10254001,10254011,10254021,10254031,10254041,10254051,10274001,10274011,10274021,10274031,10274041,10274051,10354001,10414001,10204061,10239218,10259218,10269218,10279218,10249218,10364001,10424001,10204071,10239222,10259222,10269222,10279222,10249222,10374001,10434001,10204081,10239226,10259226,10269226,10279226,10249226,10384001,10444001,10204091,10239230,10259230,10269230,10279230,10249230,10394001,10455001,10204101,10239234,10259234,10269234,10279234,10249234,10404001,10464001,10204111,10239238,10259238,10269238,10279238,10249238,10354001,10414001,10239218,10259218,10279218,10364001,10424001,10239222,10259222,10279222,10374001,10434001,10239226,10259226,10279226,10384001,10444001,10239230,10259230,10279230,10394001,10454001,10239234,10259234,10279234,10404001,10464001,10239238,10259238,10279238}
x203759_var_ExpBonus = 10200
x203759_var_BonusMoney1 =0
x203759_var_BonusMoney2 =0
x203759_var_BonusMoney3 =0
x203759_var_BonusMoney4 =0
x203759_var_BonusMoney5 =0
x203759_var_BonusMoney6 =0
x203759_var_BonusItem	=	{{item=11000200,n=5}}
x203759_var_BonusChoiceItem ={}
x203759_var_NpcGUID ={{ guid = 126024, varName = "声望商店"} }
--DECLARE_QUEST_INFO_STOP--

x203759_var_MaxLevel   = 40

function x203759_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
    local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < x203759_var_LevelLess or varLevel >= x203759_var_MaxLevel then
		return
	end



	if IsQuestHaveDone(varMap, varPlayer, x203759_var_QuestId) > 0 then
		return 
	end
	
	if IsQuestHaveDone(varMap, varPlayer, x203759_var_QuestIdPre)> 0 then 
	if IsHaveQuest(varMap,varPlayer, x203759_var_QuestId) <= 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203759_var_QuestId)
		TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203759_var_QuestId, varState, -1 )
	end
	end

end

function x203759_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203759_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203759_var_ExpBonus )
		end
		if x203759_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203759_var_BonusMoney1 )
		end
		if x203759_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203759_var_BonusMoney2 )
		end
		if x203759_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203759_var_BonusMoney3 )
		end
		if x203759_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203759_var_BonusMoney4 )
		end
		if x203759_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203759_var_BonusMoney5 )
		end
		if x203759_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203759_var_BonusMoney6 )
		end
		for varI, item in x203759_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	 	end
		for varI, item in x203759_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  	end
end


function x203759_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203759_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203759_var_QuestId) > 0 then
			if x203759_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203759_var_QuestName)
				TalkAppendString(varMap,x203759_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203759_var_FileId, x203759_var_QuestId);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x203759_var_QuestName)
				TalkAppendString(varMap,x203759_var_QuestCompleted)
				TalkAppendString(varMap," ")
				x203759_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203759_var_FileId, x203759_var_QuestId);
			
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
				LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_QUEDING,1)
   			end
  elseif x203759_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x203759_var_QuestName)
			TalkAppendString(varMap,x203759_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203759_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203759_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#c000000")
				TalkAppendString(varMap,x203759_var_QuestHelp )
			end
			x203759_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203759_var_FileId, x203759_var_QuestId);
 
  			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_WANCHENG_WENHAO,0)				 
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_GANTANHAO,0)
			LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer,MAOPAO_JIESHOU_QUEDING,1)
   end
	
end


function x203759_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
	return 1
		

end

function x203759_CheckSubmit( varMap, varPlayer, varTalknpc)  
                                                  
		if  IsHaveQuest(varMap, varPlayer,x203759_var_QuestId) ~=1 then
			return 0
		end
		
	   	local 	varQuestIdx = GetQuestIndexByID(varMap, varPlayer,x203759_var_QuestId)                                                  
	   	if GetQuestParam(varMap, varPlayer,varQuestIdx,7,1) == 1 then
	   		return 1
	   	else 
	   		return 0
	   	end
	   	
	
end


function x203759_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203759_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203759_var_QuestId  )
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
		
		if x203759_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then

					local retmiss = AddQuest( varMap, varPlayer, x203759_var_QuestId, x203759_var_FileId, 0, 0, 1,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203759_Msg2toplayer( varMap, varPlayer,0)
		  			
					for varI, item in x203759_var_DemandItem do
						if GetItemCount(varMap,varPlayer,x203759_var_DemandItem[varI]) >= 1 then		
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203759_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 32,0 )
								
						end
					end
					
					end
		  			
	 	end                                                                    
	     
end


function x203759_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203759_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203759_var_QuestId)
	  x203759_Msg2toplayer( varMap, varPlayer,1)
		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 32,0 )
		
end

function x203759_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203759_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x203759_var_BonusChoiceItem do
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

function x203759_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203759_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203759_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203759_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"背包空间不足，请清理后再来！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203759_var_QuestId) > 0 then
				x203759_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203759_var_QuestId)
				x203759_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203759_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x203759_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203759_var_QuestIdNext )	
end

function x203759_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203759_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203759_var_ExpBonus);
  	end
		if x203759_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203759_var_BonusMoney1 )
	  end
		if x203759_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203759_var_BonusMoney2 )
	  end
		if x203759_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203759_var_BonusMoney3 )
		end
		if x203759_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203759_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203759_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203759_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203759_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203759_var_BonusMoney6)
		end
end

function x203759_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务："..x203759_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务："..x203759_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x203759_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务："..x203759_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203759_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203759_var_QuestName.."！", 0, 3)
				if x203759_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203759_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203759_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203759_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203759_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203759_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203759_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203759_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203759_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203759_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203759_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203759_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203759_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203759_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203759_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203759_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203759_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203759_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203759_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest,optype)
	if	optype	==	0	then
		return
	end
	
	for varI, item in x203759_var_DemandItem do
	
		if varItemData == item then

			if GetItemCount(varMap,varPlayer,item) >= 1 then
					local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203759_var_QuestId)                                                  
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
		    		LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 32,0 )
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 33,0 )
		  	else
		  			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203759_var_QuestId)                                                  
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
		    		SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
		  	end
		  	
		  	break
	  	
	  	end
	  	
	end

end


function x203759_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203759_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203759_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203759_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203759_var_QuestId, varState, -1 )
				if x203759_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 32,1 )
					LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 33,0 )
				end	
		end
end

function x203759_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203759_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203759_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203759_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203759_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203759_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
