

--DECLARE_QUEST_INFO_START--
x270003_var_FileId = 270003
x270003_var_QuestIdPre =3565
x270003_var_QuestId = 3566
x270003_var_LevelLess	= 	77 
x270003_var_QuestIdNext = 3567
x270003_var_Name	={}
x270003_var_ExtTarget={{type=20,n=1,target="从@npc_139322处要一坛杜康，到@npc_141007处使用诱走丐帮弟子后到@npc_141008处得到@itemid_13020310"}}
x270003_var_QuestName="【主线】智取药材"
x270003_var_QuestInfo="\t没有时间去等药铺的药材了，我的徒弟不能等了。既然药材都被丐帮买走了，那么就去他们那里碰碰运气吧，或许能找到药。在事情还没有弄清楚之前先不要和丐帮动手，悄悄的给我带回一个鹿茸就行。如果有看守的话，一坛酒或许能解决问题。去跟我的徒弟俞岱岩要一坛杜康，我知道他有这东西。"  
x270003_var_QuestTarget=""		
x270003_var_QuestCompleted="\t真及时，如果再晚些时候，我的两个徒儿怕是救不回来了！"					
x270003_var_ContinueInfo="\t你去过丐帮了吗？"
x270003_var_QuestHelp =	""
x270003_var_DemandItem ={{varId=13020309,varNum=1},{varId=13020310,varNum=1}}
x270003_var_BonusMoney1 =0
x270003_var_BonusMoney2 =0
x270003_var_BonusMoney3 =0
x270003_var_BonusMoney4 =0
x270003_var_BonusMoney5 =87
x270003_var_BonusMoney6 =0
x270003_var_BonusItem	=	{}
x270003_var_BonusChoiceItem ={}
x270003_var_ExpBonus = 480000
x270003_var_doing = 0
x270003_var_gaibangkanshou = -1
x270003_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x270003_var_NpcGUID ={{ guid = 139322, varName = "俞岱岩"} }
x270003_var_GroupPoint	={ {type=10,varId =14,target = "药材堆"} }
--DECLARE_QUEST_INFO_STOP--


function x270003_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270003_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270003_var_QuestIdPre)> 0 then
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270003_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270003_var_QuestId, varState, -1 )
	end
end

function x270003_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270003_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270003_var_ExpBonus )
		end
		if x270003_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270003_var_BonusMoney1 )
		end
		if x270003_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270003_var_BonusMoney2 )
		end
		if x270003_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270003_var_BonusMoney3 )
		end
		if x270003_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270003_var_BonusMoney4 )
		end
		if x270003_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270003_var_BonusMoney5 )
		end
		if x270003_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270003_var_BonusMoney6 )
		end
		for varI, item in x270003_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270003_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270003_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest, which)	
	if IsQuestHaveDone(varMap, varPlayer, x270003_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270003_var_QuestId) > 0 then
		if which == -1 then
			if x270003_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270003_var_QuestName)
						TalkAppendString(varMap,x270003_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270003_var_FileId, x270003_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270003_var_QuestName)
						TalkAppendString(varMap,x270003_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270003_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270003_var_FileId, x270003_var_QuestId);
			end
		elseif which == 1 then
				if GetItemCount(varMap,varPlayer,x270003_var_DemandItem[1].varId) < x270003_var_DemandItem[1].varNum then
						StartItemTask(varMap)
						ItemAppend( varMap, x270003_var_DemandItem[1].varId, x270003_var_DemandItem[1].varNum )
  					local varRet = StopItemTask(varMap,varPlayer)
    				if varRet > 0 then
    					DeliverItemListSendToPlayer(varMap,varPlayer)
    					StartTalkTask(varMap)
							TalkAppendString(varMap,"\t原来师父他老人家一直都知道我偷着喝酒，下次我不敢了！")
							StopTalkTask()
							DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270003_var_FileId, x270003_var_QuestId);
							Msg2Player(varMap, varPlayer, "得到一坛#G杜康酒#Y   1/1", 0, 3)
    				else
    					Msg2Player(varMap, varPlayer, "包裹已满", 0, 3)
    				end
    		end
    end
  elseif x270003_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270003_var_QuestName)
			TalkAppendString(varMap,x270003_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270003_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270003_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270003_var_QuestHelp )
			end
			x270003_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270003_var_FileId, x270003_var_QuestId);
  end
	
end


function x270003_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		if IsQuestHaveDone(varMap, varPlayer, x270003_var_QuestIdPre)> 0 then
					return 1
		end
		return 0

end

function x270003_CheckSubmit( varMap, varPlayer, varTalknpc)
		if GetItemCount(varMap,varPlayer,x270003_var_DemandItem[2].varId) >= x270003_var_DemandItem[2].varNum then
				local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270003_var_QuestId)
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    	SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	      return 1
	  else
	  		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270003_var_QuestId)
				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,0)
	    	SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,0)
	  end
	  return 0
	
end

function x270003_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270003_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270003_var_QuestId  )
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
		if x270003_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x270003_var_QuestId, x270003_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270003_Msg2toplayer( varMap, varPlayer,0)
		  		end
	 	end                                                                    
	     
end


function x270003_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270003_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270003_var_QuestId)
	  x270003_Msg2toplayer( varMap, varPlayer,1)
	  for varI, item in x270003_var_DemandItem do
	  	if GetItemCount(varMap,varPlayer,item.varId) >= item.varNum then
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
	  	end
		end
end

function x270003_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270003_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270003_var_BonusChoiceItem do
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

function x270003_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270003_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270003_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270003_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270003_var_QuestId) > 0 then
				x270003_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270003_var_QuestId)
				x270003_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270003_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270003_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		for varI, item in x270003_var_DemandItem do
    			if GetItemCount(varMap,varPlayer,item.varId) >= item.varNum then
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
	  			end
				end
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x270003_var_QuestIdNext )	
end

function x270003_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270003_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270003_var_ExpBonus);
  	end
		if x270003_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270003_var_BonusMoney1 )
	  end
		if x270003_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270003_var_BonusMoney2 )
	  end
		if x270003_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270003_var_BonusMoney3 )
		end
		if x270003_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270003_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270003_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270003_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270003_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270003_var_BonusMoney6)
		end
end

function x270003_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270003_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270003_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270003_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270003_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270003_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270003_var_QuestName.."！", 0, 3)
				if x270003_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270003_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270003_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270003_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270003_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270003_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270003_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270003_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270003_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270003_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270003_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270003_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270003_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270003_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270003_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x270003_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x270003_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x270003_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x270003_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270003_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x270003_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x270003_var_QuestId) > 0 then
			if GetItemCount(varMap,varPlayer,x270003_var_DemandItem[1].varId) < x270003_var_DemandItem[1].varNum then
				TalkAppendButton(varMap, x270003_var_QuestId, "给我一坛杜康",0, 1)
			end
		end
end

function x270003_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270003_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270003_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270003_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270003_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270003_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x270003_useitem(varMap,varPlayer)
		local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )
		local distanceRet = 25 - (67 - PlayerPosX) * (67 - PlayerPosX) - (48 - PlayerPosZ) * (48 - PlayerPosZ)
		if distanceRet >= 0 then
				if x270003_var_doing==0   then
						x270003_var_PROTECTINFO.StartTime = GetCurrentTime()
						x270003_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 270003, "ProcScneneTimer", 1)
						if x270003_var_PROTECTINFO.ScneneTimerIndex >= 0 then
								x270003_var_doing = 1
								x270003_var_gaibangkanshou =FindMonsterByGUID( varMap,139336)
								if IsObjValid (varMap,x270003_var_gaibangkanshou) == 1 then
										SetPatrolId(varMap, x270003_var_gaibangkanshou, 39)
								end
						end
				end
				if DelItem( varMap,varPlayer,x270003_var_DemandItem[1].varId, x270003_var_DemandItem[1].varNum ) ~= 1 then return 0 end
				return 1
		else
				Msg2Player(varMap, varPlayer, "这里无法使用这个物品", 0, 3)
				return 0
		end
end


function x270003_Growpoint(varMap,varPlayer,which)
		if IsHaveQuest(varMap,varPlayer, x270003_var_QuestId) <= 0 then
				return 1
		end
		if which ==0 then
				if x270003_var_doing > 0 then
					if GetItemCount(varMap,varPlayer,x270003_var_DemandItem[2].varId) < x270003_var_DemandItem[2].varNum then
							return 0
					else
							Msg2Player(varMap, varPlayer, "你已经拿到了药材", 0, 3)
							return 1
					end
				else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"\t当你走进这堆药材，旁边看守的丐帮弟子一直在看着你。你想起了张真人的话，先不与丐帮发生冲突，还是想个办法把他引走吧。")
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varPlayer, x270003_var_FileId, x270003_var_QuestId);
					return 1
				end
		elseif which == 1 then
				if GetItemCount(varMap,varPlayer,x270003_var_DemandItem[2].varId) < x270003_var_DemandItem[2].varNum then
						StartItemTask(varMap)
						ItemAppend( varMap, x270003_var_DemandItem[2].varId, x270003_var_DemandItem[2].varNum )
  					local varRet = StopItemTask(varMap,varPlayer)
    				if varRet > 0 then
    					DeliverItemListSendToPlayer(varMap,varPlayer)
    					Msg2Player(varMap, varPlayer, "得到了#G鹿茸#Y   1/1", 0, 3)
    					x270003_CheckSubmit( varMap, varPlayer)
    				else
    					Msg2Player(varMap, varPlayer, "包裹已满", 0, 3)
    				end
    		end
    		return 0
    end
		
end

function x270003_ProcScneneTimer(varMap)
	if x270003_var_gaibangkanshou < 0 then
			x270003_CloseTimer(varMap, x270003_var_PROTECTINFO.ScneneTimerIndex)
			return
	end
	if x270003_var_doing==1   then
		if GetCurrentTime() - x270003_var_PROTECTINFO.StartTime >= 1   then
						x270003_var_doing = 2
						if IsObjValid (varMap,x270003_var_gaibangkanshou) == 1 then
								NpcTalk(varMap, x270003_var_gaibangkanshou, "好香的酒味啊！", -1)
						end
		end
	elseif x270003_var_doing==2   then
		if GetCurrentTime() - x270003_var_PROTECTINFO.StartTime >= 5   then
						x270003_var_doing = 3
						if IsObjValid (varMap,x270003_var_gaibangkanshou) == 1 then
								NpcTalk(varMap, x270003_var_gaibangkanshou, "一定是什么人不小心把酒忘在这里了！", -1)
						end
		end
	elseif x270003_var_doing==3   then
		if GetCurrentTime() - x270003_var_PROTECTINFO.StartTime >= 9   then
						x270003_var_doing = 4
						if IsObjValid (varMap,x270003_var_gaibangkanshou) == 1 then
								NpcTalk(varMap, x270003_var_gaibangkanshou, "真的有一坛杜康！如此美酒不喝它就是罪过了。", -1)
						end
		end
	elseif x270003_var_doing==4   then
		if GetCurrentTime() - x270003_var_PROTECTINFO.StartTime >= 13   then
						x270003_var_doing = 5
						if IsObjValid (varMap,x270003_var_gaibangkanshou) == 1 then
								NpcTalk(varMap, x270003_var_gaibangkanshou, "对酒当歌，人生几何？", -1)
						end
		end
	elseif x270003_var_doing==5   then
		if GetCurrentTime() - x270003_var_PROTECTINFO.StartTime >= 17   then
						x270003_var_doing = 6
						if IsObjValid (varMap,x270003_var_gaibangkanshou) == 1 then
								NpcTalk(varMap, x270003_var_gaibangkanshou, "譬如朝露，去日苦多。", -1)
						end
		end
	elseif x270003_var_doing==6   then
		if GetCurrentTime() - x270003_var_PROTECTINFO.StartTime >= 21   then
						x270003_var_doing = 7
						if IsObjValid (varMap,x270003_var_gaibangkanshou) == 1 then
								NpcTalk(varMap, x270003_var_gaibangkanshou, "慨当以慷，忧思难忘。", -1)
						end
		end
	elseif x270003_var_doing==7   then
		if GetCurrentTime() - x270003_var_PROTECTINFO.StartTime >= 25   then
						x270003_var_doing = 8
						if IsObjValid (varMap,x270003_var_gaibangkanshou) == 1 then
								NpcTalk(varMap, x270003_var_gaibangkanshou, "何以解忧，唯有杜康。", -1)
						end
		end
	elseif x270003_var_doing==8 then
			if GetCurrentTime() - x270003_var_PROTECTINFO.StartTime >= 42   then
				x270003_var_doing=9
				x270003_CloseTimer(varMap, x270003_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
end





function x270003_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x270003_var_doing =0
	if IsObjValid (varMap,x270003_var_gaibangkanshou) == 1 then
			SetPatrolId(varMap, x270003_var_gaibangkanshou, -1)
	end
	x270003_var_gaibangkanshou =-1
end
