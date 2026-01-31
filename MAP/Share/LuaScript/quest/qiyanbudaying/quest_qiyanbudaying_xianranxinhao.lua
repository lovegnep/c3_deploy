

--DECLARE_QUEST_INFO_START--
x200501_var_FileId = 200501
x200501_var_QuestIdPre =58
x200501_var_QuestId = 63
x200501_var_LevelLess	= 	15 
x200501_var_QuestIdNext = 64
x200501_var_Name	={}
x200501_var_noDemandItem ={{varId=13020003,varNum=1}}
x200501_var_ExtTarget={{type=20,n=1,target="到@npc_14020点燃烟花"}}
x200501_var_QuestName="【剧场】点燃信号"
x200501_var_QuestInfo="\t现在我的安答和义父都已经来了，我要让蔑里岂人尝尝我的愤怒。你，快去营外的巴根台点燃烟花给我的安答指路，我随后就到。\n\t对了，点完烟花之后你去找速不台吧，他负责留守大营。再次感谢你！"  
x200501_var_QuestTarget=""		
x200501_var_QuestCompleted="\t消灭蔑里乞人的战斗居然没有让我参加，不去战斗我怎么来抓奴隶呢？ "					
x200501_var_ContinueInfo="\t你手里拿着烟花做什么呢？"
x200501_var_QuestHelp =	"#G您可以点击键盘上的#RB#G键，打开背包。然后右键点击#R铁木真的烟花#G进行使用。"
x200501_var_DemandItem ={}
x200501_var_BonusMoney1 =242
x200501_var_BonusMoney2 =0
x200501_var_BonusMoney3 =0
x200501_var_BonusMoney4 =0
x200501_var_BonusMoney5 =31
x200501_var_BonusMoney6 =0
x200501_var_BonusItem	=	{{item = 11000200,n=5}}
x200501_var_BonusChoiceItem ={}
x200501_var_ExpBonus = 3877
x200501_var_NpcGUID ={{ guid = 102006, varName = "速不台"} }
--DECLARE_QUEST_INFO_STOP--
x200501_var_doing = 0
x200501_var_muhuali =-1
x200501_var_zhamuhe =-1
x200501_var_tiemuzhen =-1
x200501_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x200501_var_Buf1   = 7520


function x200501_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x200501_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x200501_var_QuestIdPre)> 0 then
						if IsHaveQuest(varMap,varPlayer, x200501_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x200501_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x200501_var_QuestId, varState, -1 )
						end
	end
end

function x200501_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x200501_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x200501_var_ExpBonus )
		end
		if x200501_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x200501_var_BonusMoney1 )
		end
		if x200501_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x200501_var_BonusMoney2 )
		end
		if x200501_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x200501_var_BonusMoney3 )
		end
		if x200501_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x200501_var_BonusMoney4 )
		end
		if x200501_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x200501_var_BonusMoney5 )
		end
		if x200501_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x200501_var_BonusMoney6 )
		end
		for varI, item in x200501_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x200501_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x200501_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x200501_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x200501_var_QuestId) > 0 then
			if x200501_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x200501_var_QuestName)
						TalkAppendString(varMap,x200501_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x200501_var_FileId, x200501_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x200501_var_QuestName)
						TalkAppendString(varMap,x200501_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x200501_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x200501_var_FileId, x200501_var_QuestId);
			end
  elseif x200501_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x200501_var_QuestName)
			TalkAppendString(varMap,x200501_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x200501_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x200501_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x200501_var_QuestHelp )
			end
			x200501_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x200501_var_FileId, x200501_var_QuestId);
  end
	
end


function x200501_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x200501_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x200501_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then
			return 1
	end
	return 0
end

function x200501_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x200501_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x200501_var_QuestId  )
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
		
		if x200501_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
		  StartItemTask(varMap)                                                    
			ItemAppend( varMap,x200501_var_noDemandItem[1].varId, x200501_var_noDemandItem[1].varNum )             
			local varRet = StopItemTask(varMap,varPlayer)                                 
	  		if varRet > 0 then
	  			local retmiss = AddQuest( varMap, varPlayer, x200501_var_QuestId, x200501_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x200501_Msg2toplayer( varMap, varPlayer,0)
						DeliverItemListSendToPlayer(varMap,varPlayer) 
		  		end
	  		else                                                             
		  		StartTalkTask(varMap)                                      
		  		TalkAppendString(varMap,"物品栏已满，请整理下再来！")                    
		  		StopTalkTask(varMap)                                        
		  		DeliverTalkTips(varMap,varPlayer)                      
	   		end           	        
	 	end                                                                    
	     
end


function x200501_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x200501_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x200501_var_QuestId)
	  x200501_Msg2toplayer( varMap, varPlayer,1)
	  for varI, item in x200501_var_noDemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
		end
			
end

function x200501_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x200501_var_BonusItem do
		ItemAppendBind( varMap, item.item, item.n )
  end
  for j, item in x200501_var_BonusChoiceItem do
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

function x200501_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x200501_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x200501_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x200501_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x200501_var_QuestId) > 0 then
				x200501_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x200501_var_QuestId)
				x200501_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x200501_var_BonusItem do
 						ItemAppendBind( varMap, item.item, item.n )
				end
				for varI, item in x200501_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		DeliverItemListSendToPlayer(varMap,varPlayer)
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x200501_var_QuestIdNext )	
end

function x200501_GetBonus( varMap, varPlayer,varTalknpc)
	  if x200501_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x200501_var_ExpBonus);
  	end
		if x200501_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x200501_var_BonusMoney1 )
	  end
		if x200501_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x200501_var_BonusMoney2 )
	  end
		if x200501_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x200501_var_BonusMoney3 )
		end
		if x200501_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x200501_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x200501_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x200501_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x200501_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x200501_var_BonusMoney6)
		end
end

function x200501_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x200501_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x200501_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x200501_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x200501_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x200501_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x200501_var_QuestName.."！", 0, 3)
				if x200501_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x200501_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x200501_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x200501_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x200501_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x200501_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x200501_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x200501_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x200501_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x200501_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x200501_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x200501_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x200501_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x200501_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x200501_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x200501_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x200501_var_QuestId)
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,1)
end

function x200501_ProcMapTimerTick(ssceneId, varPlayer, varScript, varQuest)
	
end

function x200501_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x200501_var_QuestId)
			SetQuestByIndex(varMap,varPlayer,varQuestIdx,1,0)
end

function x200501_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x200501_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x200501_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x200501_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x200501_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x200501_var_QuestId, varState, -1 )
		end
end

function x200501_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x200501_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x200501_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x200501_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x200501_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x200501_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x200501_ProcScneneTimer(varMap, varPlayer)
	if x200501_var_doing==1   then
		if GetCurrentTime() - x200501_var_PROTECTINFO.StartTime >= 8   then
			if IsObjValid (varMap,x200501_var_muhuali) == 1 then
				NpcTalk(varMap, x200501_var_muhuali, "老远就看见这烟火了！", -1)
			end
			if IsObjValid (varMap,x200501_var_zhamuhe) == 1 then
				SetPatrolId(varMap, x200501_var_zhamuhe, 1)	
			end
        x200501_var_doing = 2
		end
	elseif x200501_var_doing == 2   then
			if GetCurrentTime() - x200501_var_PROTECTINFO.StartTime >= 13   then
				if IsObjValid (varMap,x200501_var_zhamuhe) == 1 then
						NpcTalk(varMap, x200501_var_zhamuhe, "看来我来的还不算晚！", -1)
				end
				if IsObjValid (varMap,x200501_var_tiemuzhen) == 1 then
						SetPatrolId(varMap, x200501_var_tiemuzhen, 0)	
				end
        x200501_var_doing =3
			end
	elseif x200501_var_doing == 3   then
			if GetCurrentTime() - x200501_var_PROTECTINFO.StartTime >= 18   then
				if IsObjValid (varMap,x200501_var_tiemuzhen) == 1 then
						NpcTalk(varMap, x200501_var_tiemuzhen, "好！有你二人相助，一定能灭了蔑里岂部。", -1)
				end
						x200501_var_doing =4
			end
	
	elseif x200501_var_doing == 4   then
			if GetCurrentTime() - x200501_var_PROTECTINFO.StartTime >= 22   then
             LuaThisScenceM2Wrold (varMap,  "【剧场】铁木真：出征！", 0, -1)
             LuaThisScenceM2Wrold (varMap,  "【剧场】木华黎，札木合：灭了蔑里岂部！", 0, -1)
          if IsObjValid (varMap,x200501_var_tiemuzhen) == 1 then
						NpcTalk(varMap, x200501_var_tiemuzhen, "出发！", -1)
					end
					if IsObjValid (varMap,x200501_var_muhuali) == 1 then
						SetPatrolId(varMap, x200501_var_muhuali, 7)
					end
					if IsObjValid (varMap,x200501_var_tiemuzhen) == 1 then
        		SetPatrolId(varMap, x200501_var_tiemuzhen, 6)
        	end
        	if IsObjValid (varMap,x200501_var_zhamuhe) == 1 then
        		SetPatrolId(varMap, x200501_var_zhamuhe, 8)
        	end
						x200501_var_doing =5
			end
	elseif x200501_var_doing == 5   then
			if GetCurrentTime() - x200501_var_PROTECTINFO.StartTime >= 25   then
						x200501_var_doing =6
						x200501_CloseTimer(varMap, x200501_var_PROTECTINFO.ScneneTimerIndex)
			end

	end
end

function x200501_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x200501_var_doing = 0
	x200501_var_muhuali =-1
	x200501_var_zhamuhe =-1
	x200501_var_tiemuzhen =-1
	x200501_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
	
end

function x200501_useitem(varMap,varPlayer)
			local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x200501_var_QuestId)
  		if (GetQuestParam(varMap,varPlayer,varQuestIdx,1)==1) then
         SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x200501_var_Buf1, 0);
  		    SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
		 			if x200501_var_doing==0 then
		 					StartTalkTask(varMap)
							TalkAppendString(varMap,"点燃烟花 1/1")
							DeliverTalkTips(varMap,varPlayer) 
							StopTalkTask(varMap)
							SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
				 			x200501_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 200501, "ProcScneneTimer", 1)
				 			if x200501_var_PROTECTINFO.ScneneTimerIndex >= 0 then
									x200501_var_muhuali=CreateMonster(varMap, 310,105,123,3,1,-1,-1,20,25000)
        					x200501_var_tiemuzhen=CreateMonster(varMap, 309,102,147,3,1,-1,-1,20,25000)
        					x200501_var_zhamuhe=CreateMonster(varMap, 300,126,130,3,1,-1,-1,20,25000)
        					if IsObjValid (varMap,x200501_var_muhuali) == 1 then
        							SetPatrolId(varMap, x200501_var_muhuali, 2)
        					end
        					x200501_var_doing =1
									x200501_var_PROTECTINFO.StartTime = GetCurrentTime()
									if DelItem(varMap, varPlayer, 13020003, 1) ~= 1 then return 0 end
							end
					else
							StartTalkTask(varMap)
							TalkAppendString(varMap,"点燃烟花 1/1")
							DeliverTalkTips(varMap,varPlayer) 
							StopTalkTask(varMap)
							if DelItem(varMap, varPlayer, 13020003, 1) ~= 1 then return 0 end
							SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
					end
     			  	return 1
			end
			if (GetQuestParam(varMap,varPlayer,varQuestIdx,1)==0) then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"请先到营外再使用")
				DeliverTalkTips(varMap,varPlayer) 
				StopTalkTask(varMap)
			end
           
			return 0

end
