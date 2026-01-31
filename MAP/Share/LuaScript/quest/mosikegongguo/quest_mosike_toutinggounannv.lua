

--DECLARE_QUEST_INFO_START--
x203328_var_FileId = 203328
x203328_var_QuestIdPre = 810
x203328_var_QuestId = 811
x203328_var_LevelLess	= 	88 
x203328_var_QuestIdNext = 812
x203328_var_Name	={}
x203328_var_ExtTarget={{type=20,n=1,target="藏在@npc_117023内的#G竹筐#W中探查大公的秘密"}}
x203328_var_QuestName="【剧场】大公夫人"
x203328_var_QuestInfo="\t刚才看见基辅大公悄悄从另一个城门出去后又绕回到了城东的一个地方，似乎正在等着谁，很可能他约了什么人在此密谋，你身手敏捷，打探这件事真相的任务就要靠你了。"  
x203328_var_QuestTarget=""		
x203328_var_QuestCompleted="\t（拔都听后“嘿嘿”冷笑说道）\n\t哼哼，这一招果然阴险，一举将所有敌人全歼，到时候他们号令斯拉夫人一起反抗我们，还能众望所归般轻而易举夺得这几个大公的土地！\n\t只是想不到这亚米尼亚大公也真的甘心当这个乌龟？！"					
x203328_var_ContinueInfo="\t可有何发现？"
x203328_var_QuestHelp =	""
x203328_var_DemandItem ={}
x203328_var_ExpBonus = 684000
x203328_var_BonusMoney1 =880
x203328_var_BonusMoney2 =0
x203328_var_BonusMoney3 =0
x203328_var_BonusMoney4 =0
x203328_var_BonusMoney5 =106
x203328_var_BonusMoney6 =0
x203328_var_BonusItem	=	{}
x203328_var_BonusChoiceItem ={}
x203328_var_doing = 0
x203328_var_acceptid =0
x203328_var_jifudagong = -1
x203328_var_dagongfuren = -1
x203328_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x203328_var_NpcGUID ={{ guid = 117002	, varName = "伪装的拔都"} }
x203328_var_GroupPoint	={ {type=10,varId =125,target = "运输车"} } 
--DECLARE_QUEST_INFO_STOP--


function x203328_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if IsQuestHaveDone(varMap, varPlayer, x203328_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203328_var_QuestIdPre)> 0 then
		if IsHaveQuest(varMap,varPlayer, x203328_var_QuestId) <= 0 then	
			local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203328_var_QuestId)
			TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203328_var_QuestId, varState, -1 )
		end
	end
end

function x203328_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203328_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203328_var_ExpBonus )
		end
		if x203328_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203328_var_BonusMoney1 )
		end
		if x203328_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203328_var_BonusMoney2 )
		end
		if x203328_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203328_var_BonusMoney3 )
		end
		if x203328_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203328_var_BonusMoney4 )
		end
		if x203328_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203328_var_BonusMoney5 )
		end
		if x203328_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203328_var_BonusMoney6 )
		end
		for varI, item in x203328_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203328_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203328_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203328_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x203328_var_QuestId) > 0 then
			if x203328_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203328_var_QuestName)
						TalkAppendString(varMap,x203328_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203328_var_FileId, x203328_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203328_var_QuestName)
						TalkAppendString(varMap,x203328_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203328_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203328_var_FileId, x203328_var_QuestId);
			end
  elseif x203328_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
 
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203328_var_QuestName)
			TalkAppendString(varMap,x203328_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203328_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203328_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203328_var_QuestHelp )
			end
			x203328_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203328_var_FileId, x203328_var_QuestId);
  end
	
end


function x203328_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
		if IsHaveQuest(varMap, varPlayer, x203328_var_QuestId)<= 0 then
			return 1
		end
		return 0

end

function x203328_CheckSubmit( varMap, varPlayer, varTalknpc)
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203328_var_QuestId)
		if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==1 then 
	        return 1
	  end
	  return 0
end

function x203328_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203328_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203328_var_QuestId  )
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
		
		if x203328_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203328_var_QuestId, x203328_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203328_Msg2toplayer( varMap, varPlayer,0)
						if x203328_CheckSubmit(varMap, varPlayer, varTalknpc) > 0 then
							local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203328_var_QuestId)                                                  
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    				SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			end
		  		end
	 	end                                                                    
	     
end


function x203328_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203328_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203328_var_QuestId)
	  x203328_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203328_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203328_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203328_var_BonusChoiceItem do
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

function x203328_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203328_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203328_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203328_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203328_var_QuestId) > 0 then
				x203328_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203328_var_QuestId)
				x203328_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203328_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203328_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x203328_var_QuestIdNext )	
end

function x203328_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203328_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203328_var_ExpBonus);
  	end
		if x203328_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203328_var_BonusMoney1 )
	  end
		if x203328_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203328_var_BonusMoney2 )
	  end
		if x203328_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203328_var_BonusMoney3 )
		end
		if x203328_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203328_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203328_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203328_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203328_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203328_var_BonusMoney6)
		end
end

function x203328_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203328_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203328_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203328_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203328_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203328_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203328_var_QuestName.."！", 0, 3)
				if x203328_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203328_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203328_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203328_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203328_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203328_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203328_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203328_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203328_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203328_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203328_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203328_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203328_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203328_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203328_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203328_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203328_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203328_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203328_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203328_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203328_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203328_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203328_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203328_var_QuestId, varState, -1 )
		end
end

function x203328_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203328_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203328_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203328_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203328_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203328_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x203328_Growpoint( varMap, varPlayer,openorremove)
		if IsHaveQuest(varMap,varPlayer, x203328_var_QuestId) <= 0 then
				return 1
		end
		if IsHaveQuest(varMap,varPlayer, 7537) > 0 then
						Msg2Player(varMap, varPlayer, "您现在的状态无法这样做！", 0, 3)			
						return 0
		elseif IsHaveQuest(varMap,varPlayer, 7538) > 0 then
						Msg2Player(varMap, varPlayer, "您现在的状态无法这样做！", 0, 3)
						return 0
		elseif IsHaveQuest(varMap,varPlayer, 7539) > 0 then
						Msg2Player(varMap, varPlayer, "您现在的状态无法这样做！", 0, 3)
						return 0
		elseif IsHaveSpecificImpact(varMap, varPlayer, 7516) > 0 then
						Msg2Player(varMap, varPlayer, "您现在的状态无法这样做！", 0, 3)
						return 0
		elseif IsHaveSpecificImpact(varMap, varPlayer, 7517) > 0 then
						Msg2Player(varMap, varPlayer, "您现在的状态无法这样做！", 0, 3)
						return 0
		end
		local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203328_var_QuestId)
		if openorremove == 0 then
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==0 then
					return 0
			else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"\t你已经知道你想要的了，不用再躲在车内的竹筐里去受罪了。")
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varPlayer);
					return 1
			end
		elseif openorremove == 1 then
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) ==0 then
				if x203328_var_doing == 0 then
					x203328_var_PROTECTINFO.StartTime = GetCurrentTime()
					x203328_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 203328, "ProcScneneTimer", 1)
					if x203328_var_PROTECTINFO.ScneneTimerIndex >= 0 then
							x203328_var_doing = 1
							x203328_var_acceptid = varPlayer
							x203328_var_jifudagong=CreateMonster(varMap, 2110,206,50,3,1,-1,-1,20,41000,90,"基辅大公")
							x203328_var_dagongfuren=CreateMonster(varMap, 2115,210,50,3,1,-1,-1,20,41000,270,"亚米尼亚大公夫人")
						
						
						
						
						
						
						
					end
				else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"\t你刚刚要钻进车棚，发现里面已经有一个人了。")
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varPlayer);
					return 0
				end
			else
					StartTalkTask(varMap)
					TalkAppendString(varMap,"\t你已经知道你想要的了，不用再到这里面去受罪了。")
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varPlayer);
					return 0
			end
		end
end

function x203328_ProcScneneTimer(varMap)
	if x203328_var_jifudagong < 0 then
			x203328_CloseTimer(varMap, x203328_var_PROTECTINFO.ScneneTimerIndex)
	elseif x203328_var_dagongfuren < 0 then
			x203328_CloseTimer(varMap, x203328_var_PROTECTINFO.ScneneTimerIndex)
	end
	if x203328_var_doing==1   then
		if GetCurrentTime() - x203328_var_PROTECTINFO.StartTime <= 1   then
			if IsPlayerStateNormal(varMap,x203328_var_acceptid) ==1 then
				SetPos(varMap,x203328_var_acceptid,203,47)
				
				SendSpecificImpactToUnit(varMap, x203328_var_acceptid, x203328_var_acceptid, x203328_var_acceptid, 8704, 0);
			end
		elseif GetCurrentTime() - x203328_var_PROTECTINFO.StartTime >= 5   then
						x203328_var_doing = 2
						if IsObjValid (varMap,x203328_var_jifudagong) == 1 then
								NpcTalk(varMap, x203328_var_jifudagong, "我来晚了！甩掉他们的跟随可真不容易。", -1)
						end
		end
	elseif x203328_var_doing==2   then
		if GetCurrentTime() - x203328_var_PROTECTINFO.StartTime >= 8   then
						x203328_var_doing = 3
						if IsObjValid (varMap,x203328_var_dagongfuren) == 1 then
								NpcTalk(varMap, x203328_var_dagongfuren, "死鬼，才来！罗瑟夫那个废物，知道了又敢怎么样？", -1)
						end
		end
	elseif x203328_var_doing==3   then
		if GetCurrentTime() - x203328_var_PROTECTINFO.StartTime >= 11   then
						x203328_var_doing = 4
						if IsObjValid (varMap,x203328_var_jifudagong) == 1 then
								NpcTalk(varMap, x203328_var_jifudagong, "毕竟现在是非常时期，要先灭了这些蒙古人，我不希望在这个时候闹出事来，坏了我们的大计！", -1)
						end
		end
	elseif x203328_var_doing==4   then
		if GetCurrentTime() - x203328_var_PROTECTINFO.StartTime >= 14   then
						x203328_var_doing = 5
						if IsObjValid (varMap,x203328_var_dagongfuren) == 1 then
								NpcTalk(varMap, x203328_var_dagongfuren, "那你打算什么时候才能娶我？整天让我跟着那个窝囊废！", -1)
						end
		end
	elseif x203328_var_doing==5   then
		if GetCurrentTime() - x203328_var_PROTECTINFO.StartTime >= 17   then
						x203328_var_doing = 6
						if IsObjValid (varMap,x203328_var_jifudagong) == 1 then
								NpcTalk(varMap, x203328_var_jifudagong, "哎呀，你就先忍耐一下么，等我们准备好了，我要把这些蒙古人和立陶宛、喀山还有罗瑟夫这些人一网打尽，对外就说是他们自相残杀而死，到时候，嘿嘿，宝贝，还不都由你做主？", -1)
						end
		end
	elseif x203328_var_doing==6   then
		if GetCurrentTime() - x203328_var_PROTECTINFO.StartTime >= 20   then
						x203328_var_doing = 7
						if IsObjValid (varMap,x203328_var_dagongfuren) == 1 then
								NpcTalk(varMap, x203328_var_dagongfuren, "你，可不能骗我，否则我哥哥可饶不了你！", -1)
						end
		end
	elseif x203328_var_doing==7   then
		if GetCurrentTime() - x203328_var_PROTECTINFO.StartTime >= 23   then
						x203328_var_doing = 8
						if IsObjValid (varMap,x203328_var_jifudagong) == 1 then
								NpcTalk(varMap, x203328_var_jifudagong, "当然，当然，到时候我们一起动手，这整个斯拉夫地区就是我们的天下了，就算是波兰大公，也不能把我们怎么样！", -1)
						end
		end
	elseif x203328_var_doing==8   then
		if GetCurrentTime() - x203328_var_PROTECTINFO.StartTime >= 26   then
						x203328_var_doing = 9
						if IsObjValid (varMap,x203328_var_dagongfuren) == 1 then
								NpcTalk(varMap, x203328_var_dagongfuren, "哼，瞧把你美的！", -1)
						end
		end
	elseif x203328_var_doing==9   then
		if GetCurrentTime() - x203328_var_PROTECTINFO.StartTime >= 29   then
						x203328_var_doing = 10
						if IsObjValid (varMap,x203328_var_jifudagong) == 1 then
								NpcTalk(varMap, x203328_var_jifudagong, "嘿嘿，到时候，我把你光明正大的娶过来。", -1)
						end
		end
	elseif x203328_var_doing==10   then
		if GetCurrentTime() - x203328_var_PROTECTINFO.StartTime >= 32   then
						x203328_var_doing = 11
						if IsObjValid (varMap,x203328_var_dagongfuren) == 1 then
								NpcTalk(varMap, x203328_var_dagongfuren, "油嘴滑舌的，哼！", -1)
            		SetMonsterDir(varMap,x203328_var_dagongfuren,60)
            end
		end
	elseif x203328_var_doing==11   then
		if GetCurrentTime() - x203328_var_PROTECTINFO.StartTime >= 35   then
						x203328_var_doing = 12
						if IsObjValid (varMap,x203328_var_jifudagong) == 1 then
								NpcTalk(varMap, x203328_var_jifudagong, "好了，宝贝，我得先回去了，晚上我再来找你，你就等着我的好消息吧。", -1)
						end
						if IsObjValid (varMap,x203328_var_dagongfuren) == 1 then
           	 		SetMonsterDir(varMap,x203328_var_dagongfuren,120)
            end
		end
	elseif x203328_var_doing==12   then
		if GetCurrentTime() - x203328_var_PROTECTINFO.StartTime >= 38   then
						x203328_var_doing = 13
						if IsObjValid (varMap,x203328_var_dagongfuren) == 1 then
								NpcTalk(varMap, x203328_var_dagongfuren, "好，记得晚上来找我！", -1)
						end
		end
	elseif x203328_var_doing==13 then
			if GetCurrentTime() - x203328_var_PROTECTINFO.StartTime >= 41   then
				if IsPlayerStateNormal(varMap,x203328_var_acceptid) ==1 then
									local varQuestIdx = GetQuestIndexByID(varMap, x203328_var_acceptid, x203328_var_QuestId)
									SetQuestByIndex(varMap,x203328_var_acceptid,varQuestIdx,0,1)
									SetQuestByIndex(varMap,x203328_var_acceptid,varQuestIdx,7,1)
									StartTalkTask(varMap)
									TalkAppendString(varMap,format("探查基辅大公的秘密   %d/1", GetQuestParam(varMap,x203328_var_acceptid,varQuestIdx,0) ))
									StopTalkTask(varMap)
									DeliverTalkTips(varMap,x203328_var_acceptid)
									CancelSpecificImpact(varMap,x203328_var_acceptid,8704)
				end
				x203328_var_doing=14
				x203328_CloseTimer(varMap, x203328_var_PROTECTINFO.ScneneTimerIndex)
			end
	end
end





function x203328_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x203328_var_doing =0
	x203328_var_acceptid =-1
	x203328_var_jifudagong = -1
	x203328_var_dagongfuren = -1
	x203328_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end
