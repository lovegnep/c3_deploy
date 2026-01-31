

--DECLARE_QUEST_INFO_START--
x203365_var_FileId = 203365
x203365_var_QuestId = 3200
x203365_var_LevelLess	= 	1 
x203365_var_QuestIdNext = 3201
x203365_var_Name	={}
x203365_var_ExtTarget={{type=20,n=1,target="找到@npc_138000"}}
x203365_var_QuestName="【新手】长生天的召唤"
x203365_var_QuestInfo="\t欢迎来到成吉思汗的世界！请耐心阅读一下：#r　#r\t通过您的滑鼠#G左键#W点击地面可以#G行走#W，点击游戏中的人物可以和他#G交谈#W。#r\t#W若您看到的NPC头顶有#Y金色的问号#W“#Y？#W”，您可以使用滑鼠左键点击他#G完成任务#W。#r　#r\t现在，看到身旁的#G钥匙老人#W头顶的金色问号#Y？#W了吗？他已经等候你许久了，和他谈谈吧。"  
x203365_var_QuestTarget=""		
x203365_var_QuestCompleted="\t成吉思汗一统草原各部落，已有很多年了，本应和平的天下随着时间的流逝却逐渐混乱，作为蒙古人的勇士，维护大汗的王位是我们世世代代蒙古子民的荣耀。"					
x203365_var_ContinueInfo=""
x203365_var_QuestHelp =	"您可以用滑鼠#R左键#G点击雄鹰长老，和他对话。您可以点击键盘上的#RQ#G键，打开任务列表，选中你要完成的任务，点击#R任务目标#G中的蓝色字体来进行自动寻路。"
x203365_var_DemandItem ={}
x203365_var_ExpBonus = 6
x203365_var_BonusMoney1 =6
x203365_var_BonusMoney2 =0
x203365_var_BonusMoney3 =0
x203365_var_BonusMoney4 =0
x203365_var_BonusMoney5 =12
x203365_var_BonusMoney6 =0
x203365_var_BonusItem	=	{}
x203365_var_BonusChoiceItem ={}
x203365_var_NpcGUID = { }
--DECLARE_QUEST_INFO_STOP--
x203365_var_FileIdNext =203380
x203365_var_NPCTalk ={ 
"去吧，勇士，和成吉思汗一起征服世界！",
 }

function x203365_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	
	local varLevel = GetLevel( varMap, varPlayer)
    LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,0 )
 	
	if IsQuestHaveDone(varMap, varPlayer, x203365_var_QuestId) > 0 then
		return
	end
	if IsHaveQuest(varMap,varPlayer, x203365_var_QuestId) <= 0 then
		if varLevel >=10 then
			return 
		end		
	end
	local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203365_var_QuestId)
	TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203365_var_QuestId, varState, -1 )
	LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,1 ) 
end

function x203365_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203365_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203365_var_ExpBonus )
		end
		if x203365_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203365_var_BonusMoney1 )
		end
		if x203365_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203365_var_BonusMoney2 )
		end
		if x203365_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203365_var_BonusMoney3 )
		end
		if x203365_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203365_var_BonusMoney4 )
		end
		if x203365_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203365_var_BonusMoney5 )
		end
		if x203365_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203365_var_BonusMoney6 )
		end
		for varI, item in x203365_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203365_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203365_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	

	--if IsQuestHaveDone(varMap, varPlayer, x203365_var_QuestId) > 0 then
	--	return 
	--end
	if IsHaveQuest(varMap,varPlayer, x203365_var_QuestId) > 0 then

			if x203365_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203365_var_QuestName)
						TalkAppendString(varMap,x203365_var_QuestCompleted)
						StopTalkTask()
						
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203365_var_FileId, x203365_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203365_var_QuestName)
						TalkAppendString(varMap,x203365_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203365_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 2,0 ) 
						LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 3,1 ) 
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203365_var_FileId, x203365_var_QuestId);
			end
  elseif x203365_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  		TalkAppendString(varMap,"#Y"..x203365_var_QuestName)
			TalkAppendString(varMap,x203365_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")  
			for varI, item in x203365_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203365_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203365_var_QuestHelp )
			end
			x203365_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203365_var_FileId, x203365_var_QuestId);
  end
	
end


function x203365_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

					return 1

end

function x203365_CheckSubmit( varMap, varPlayer, varTalknpc)

	        return 1
	
end

function x203365_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203365_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203365_var_QuestId  )
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
		
		
		if x203365_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203365_var_QuestId, x203365_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203365_Msg2toplayer( varMap, varPlayer,0)
						if x203365_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203365_var_QuestId)                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
							--LuaCallNoclosure( UTILITY_SCRIPT, "ShowNewUITips", varMap, varPlayer, 1,1 )
	    			end
		  		end
	 	end                                                                    
	     
end


function x203365_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203365_var_QuestId) > 0 then
				return 
		end
	  	StartTalkTask(varMap)
		  TalkAppendString(varMap,"您无法放弃此任务！") 
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			
end

function x203365_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203365_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203365_var_BonusChoiceItem do
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

function x203365_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203365_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203365_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203365_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203365_var_QuestId) > 0 then
				x203365_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203365_var_QuestId)
				x203365_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203365_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203365_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		NpcTalk(varMap,varTalknpc,x203365_var_NPCTalk[1],varPlayer)
   end
  LuaCallNoclosure( x203365_var_FileIdNext, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203365_var_QuestIdNext)	
end

function x203365_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203365_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203365_var_ExpBonus);
  	end
		if x203365_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203365_var_BonusMoney1 )
	  end
		if x203365_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203365_var_BonusMoney2 )
	  end
		if x203365_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203365_var_BonusMoney3 )
		end
		if x203365_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203365_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203365_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203365_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203365_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203365_var_BonusMoney6)
		end
end

function x203365_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203365_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203365_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203365_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203365_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203365_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203365_var_QuestName.."！", 0, 3)
				if x203365_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G经验"..x203365_var_ExpBonus.."#cffcf00的奖励", 0, 2)
  			end
				if x203365_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G银卡"..x203365_var_BonusMoney1.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203365_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G现银"..x203365_var_BonusMoney2.."文#cffcf00的奖励", 0, 2)
	  		end
				if x203365_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#cffcf00获得#G金卡"..x203365_var_BonusMoney3.."文#cffcf00的奖励", 0, 2)
				end
				if x203365_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G朝廷声望值"..x203365_var_BonusMoney4.."#cffcf00的奖励", 0, 2)
				end
				if x203365_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G声望"..x203365_var_BonusMoney5.."#cffcf00的奖励", 0, 2)
				end
				if x203365_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#cffcf00获得#G荣誉"..x203365_var_BonusMoney6.."#cffcf00的奖励", 0, 2)
				end
		end
end

function x203365_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203365_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203365_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203365_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203365_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203365_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	    LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestAttach",varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
end

function x203365_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203365_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203365_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203365_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203365_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203365_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
