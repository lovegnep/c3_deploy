

--DECLARE_QUEST_INFO_START--
x270012_var_FileId = 270012
x270012_var_QuestIdPre =3510
x270012_var_QuestId = 3513
x270012_var_LevelLess	= 	45 
x270012_var_QuestIdNext = 3514
x270012_var_Name	={}
x270012_var_noDemandItem ={{varId=13020324,varNum=1}}
x270012_var_ExtTarget={{type=20,n=1,target="到@npc_141226处使用@itemid_13020324之后按照道士的指示去做完成仪式"}}
x270012_var_QuestName="【主线】破镜重圆<一>"
x270012_var_QuestInfo="\t据我所知，这附近有一种叫做饕餮的异兽，生性贪吃法力却不小，你可以用我给你的水玉加上柳叶来喂它，等它缩小到一定的程度就可以擒住它来拼合破碎的镜子。\n\t至于能不能将它顺利地引诱出来复原镜子，贫道也没有把握。"  
x270012_var_QuestTarget=""		
x270012_var_QuestCompleted="\t这破镜重圆也是世间一桩逆天奇事，你居然能达成！看来这就是天意使然啊。"					
x270012_var_ContinueInfo="\t这件事能否达成就看缘分了！"
x270012_var_QuestHelp =	""
x270012_var_DemandItem ={}
x270012_var_BonusMoney1 =376
x270012_var_BonusMoney2 =0
x270012_var_BonusMoney3 =0
x270012_var_BonusMoney4 =0
x270012_var_BonusMoney5 =56
x270012_var_BonusMoney6 =0
x270012_var_BonusItem	=	{}
x270012_var_BonusChoiceItem ={}
x270012_var_ExpBonus = 112000
x270012_var_GroupPoint	={ {type=10,varId =16,target = "火腿"} }
--DECLARE_QUEST_INFO_STOP--
x270012_var_daotong =-1
x270012_var_taotie =-1
x270012_var_doing=0
x270012_var_doing2=0
x270012_var_accid =-1
x270012_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0,StartTime2 = 0}


function x270012_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)


	if IsQuestHaveDone(varMap, varPlayer, x270012_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x270012_var_QuestIdPre)> 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x270012_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x270012_var_QuestId, varState, -1 )
	end
end

function x270012_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x270012_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x270012_var_ExpBonus )
		end
		if x270012_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x270012_var_BonusMoney1 )
		end
		if x270012_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x270012_var_BonusMoney2 )
		end
		if x270012_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x270012_var_BonusMoney3 )
		end
		if x270012_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x270012_var_BonusMoney4 )
		end
		if x270012_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x270012_var_BonusMoney5 )
		end
		if x270012_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x270012_var_BonusMoney6 )
		end
		for varI, item in x270012_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x270012_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x270012_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x270012_var_QuestId) > 0 then
		return 
	end
	if IsHaveQuest(varMap,varPlayer, x270012_var_QuestId) > 0 then
			if x270012_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270012_var_QuestName)
						TalkAppendString(varMap,x270012_var_ContinueInfo)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x270012_var_FileId, x270012_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270012_var_QuestName)
						TalkAppendString(varMap,x270012_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x270012_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x270012_var_FileId, x270012_var_QuestId);
			end
  elseif x270012_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x270012_var_QuestName)
			TalkAppendString(varMap,x270012_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x270012_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x270012_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x270012_var_QuestHelp )
			end
			x270012_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x270012_var_FileId, x270012_var_QuestId);
  end
	
end


function x270012_ProcAcceptCheck(varMap, varPlayer, varTalknpc)
		
						return 1
		

end

function x270012_CheckSubmit( varMap, varPlayer, varTalknpc)
	local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x270012_var_QuestId)
	if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 1 then
			return 1
	end
	return 0
end

function x270012_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x270012_var_QuestId) > 0 then
				return 
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x270012_var_QuestId  )
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
		if x270012_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
		  StartItemTask(varMap)                                                    
			ItemAppend( varMap,x270012_var_noDemandItem[1].varId, x270012_var_noDemandItem[1].varNum )             
			local varRet = StopItemTask(varMap,varPlayer)                                 
	  		if varRet > 0 then
	  			local retmiss = AddQuest( varMap, varPlayer, x270012_var_QuestId, x270012_var_FileId, 0, 0, 0)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x270012_Msg2toplayer( varMap, varPlayer,0)
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


function x270012_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x270012_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x270012_var_QuestId)
	  x270012_Msg2toplayer( varMap, varPlayer,1)
	  for varI, item in x270012_var_noDemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
		end
			
end

function x270012_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x270012_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x270012_var_BonusChoiceItem do
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

function x270012_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x270012_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270012_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x270012_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x270012_var_QuestId) > 0 then
				x270012_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x270012_var_QuestId)
				x270012_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x270012_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x270012_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		for varI, item in x270012_var_noDemandItem do
	  				if DelItem( varMap,varPlayer,item.varId, item.varNum ) ~= 1 then return 0 end
				end
    		StopItemTask(varMap,varPlayer)
    		
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, varTalknpc, x270012_var_QuestIdNext )	
end

function x270012_GetBonus( varMap, varPlayer,varTalknpc)
	  if x270012_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x270012_var_ExpBonus);
  	end
		if x270012_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x270012_var_BonusMoney1 )
	  end
		if x270012_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x270012_var_BonusMoney2 )
	  end
		if x270012_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x270012_var_BonusMoney3 )
		end
		if x270012_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x270012_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x270012_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x270012_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x270012_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x270012_var_BonusMoney6)
		end
end

function x270012_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x270012_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x270012_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270012_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x270012_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270012_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x270012_var_QuestName.."！", 0, 3)
				if x270012_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x270012_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x270012_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x270012_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x270012_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x270012_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x270012_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x270012_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x270012_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x270012_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x270012_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x270012_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x270012_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x270012_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x270012_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x270012_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
end

function x270012_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	
end

function x270012_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
end

function x270012_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x270012_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )

end

function x270012_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x270012_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x270012_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270012_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x270012_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x270012_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end

function x270012_useitem(varMap,varPlayer)
		local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )
		local distanceRet = 25 - (200 - PlayerPosX) * (200 - PlayerPosX) - (40 - PlayerPosZ) * (40 - PlayerPosZ)
		if distanceRet >= 0 then
			local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x270012_var_QuestId)
			if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 0 then
				if x270012_var_doing==0   then
						x270012_var_PROTECTINFO.StartTime = GetCurrentTime()
						x270012_var_PROTECTINFO.StartTime2 = GetCurrentTime()
						x270012_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 270012, "ProcScneneTimer", 1)
						if x270012_var_PROTECTINFO.ScneneTimerIndex >= 0 then
								x270012_var_doing = 1
								x270012_var_daotong=CreateMonster(varMap, 1619,195,45,3,1,-1,-1,20,98000,0,"巫山道人")
								x270012_var_accid =varPlayer
								return 0
						end
				else
						Msg2Player(varMap, varPlayer, "你暂时无法这样做", 0, 3)
				end
			end
		else
				Msg2Player(varMap, varPlayer, "这里无法使用这个物品", 0, 3)
				return 0
		end
end


function x270012_Growpoint(varMap,varPlayer,which)
		if IsHaveQuest(varMap,varPlayer, x270012_var_QuestId) <= 0 then
				return 1
		end
		if which ==0 then
							return 0
		elseif which == 1 then
				if x270012_var_doing == 5   then
					if IsObjValid (varMap,x270012_var_daotong) == 1 then
						SetPatrolId(varMap, x270012_var_daotong, 5)
					end
					if IsObjValid (varMap,x270012_var_taotie) == 1 then
						SetPatrolId(varMap, x270012_var_taotie, 4)
					end
					if IsObjValid (varMap,x270012_var_daotong) == 1 then
						NpcTalk(varMap, x270012_var_daotong, "好的，我们继续！", -1)
					end
						CreateMonster(varMap, 1622,185, 60,3,1,-1,-1,20,8000,0," ")
						x270012_var_PROTECTINFO.StartTime2 = GetCurrentTime()
						x270012_var_doing2= 0
    				return 1
    		elseif x270012_var_doing == 6   then
    			if IsObjValid (varMap,x270012_var_daotong) == 1 then
						SetPatrolId(varMap, x270012_var_daotong, 6)
						NpcTalk(varMap, x270012_var_daotong, "好的，我们继续！", -1)
					end
					if IsObjValid (varMap,x270012_var_taotie) == 1 then
						SetPatrolId(varMap, x270012_var_taotie, 5)
					end
						CreateMonster(varMap, 1622,180, 65,3,1,-1,-1,20,8000,0," ")
						x270012_var_PROTECTINFO.StartTime2 = GetCurrentTime()
						x270012_var_doing2= 0
    				return 1
    		elseif x270012_var_doing == 7   then
    			if IsObjValid (varMap,x270012_var_daotong) == 1 then
						SetPatrolId(varMap, x270012_var_daotong, 7)
						NpcTalk(varMap, x270012_var_daotong, "好的，我们继续！", -1)
					end
					if IsObjValid (varMap,x270012_var_taotie) == 1 then
						SetPatrolId(varMap, x270012_var_taotie, 6)
					end
						CreateMonster(varMap, 1622,172, 75,3,1,-1,-1,20,8000,0," ")
						x270012_var_PROTECTINFO.StartTime2 = GetCurrentTime()
						x270012_var_doing2= 0
    				return 1
    		elseif x270012_var_doing == 8   then
    			if IsObjValid (varMap,x270012_var_daotong) == 1 then
						SetPatrolId(varMap, x270012_var_daotong, 8)
						NpcTalk(varMap, x270012_var_daotong, "好了等它来就好了！", -1)
					end
					if IsObjValid (varMap,x270012_var_taotie) == 1 then
						SetPatrolId(varMap, x270012_var_taotie, 7)
					end
						CreateMonster(varMap, 1622,170, 90,3,1,-1,-1,20,8000,0," ")
						x270012_var_PROTECTINFO.StartTime2 = GetCurrentTime()
						x270012_var_doing2= 0
    				return 1
    		end
    end
		
end

function x270012_ProcScneneTimer(varMap, varPlayer)
	if x270012_var_doing==1   then
		if GetCurrentTime() - x270012_var_PROTECTINFO.StartTime >= 1   then
			if IsObjValid (varMap,x270012_var_daotong) == 1 then
				NpcTalk(varMap, x270012_var_daotong, "饕餮马上出来了，记得跟在我的后面，当我放下诱饵之后立刻将水玉涂抹在上面！", -1)
			end
        x270012_var_doing = 2
		end
	elseif x270012_var_doing == 2   then
			if GetCurrentTime() - x270012_var_PROTECTINFO.StartTime >= 5   then
				if IsObjValid (varMap,x270012_var_daotong) == 1 then
						NpcTalk(varMap, x270012_var_daotong, "他出来了，跟着我！", -1)
						SetPatrolId(varMap, x270012_var_daotong, 4)
				end
        x270012_var_doing =3
			end
	elseif x270012_var_doing == 3   then
			if GetCurrentTime() - x270012_var_PROTECTINFO.StartTime >= 6   then
						x270012_var_taotie=CreateMonster(varMap, 1620,193,50,3,1,-1,-1,20,96000,0,"饕餮")
						x270012_var_PROTECTINFO.StartTime2 = GetCurrentTime()
        x270012_var_doing =4
			end
	elseif GetCurrentTime() - x270012_var_PROTECTINFO.StartTime >= 95   then
			if IsObjValid (varMap,x270012_var_daotong) == 1 then
						NpcTalk(varMap, x270012_var_daotong, "没有时间了，看来要重新试一次了！", -1)
			end
						x270012_CloseTimer(varMap, x270012_var_PROTECTINFO.ScneneTimerIndex)
  end
	if x270012_var_doing2== 0 then
		if GetCurrentTime() - x270012_var_PROTECTINFO.StartTime2 >= 8   then
			if x270012_var_doing == 4   then
						ItemBoxEnterScene(185, 60, 16, varMap, 0, 13020324,90000)
						if IsObjValid (varMap,x270012_var_daotong) == 1 then
								NpcTalk(varMap, x270012_var_daotong, "快来把水玉涂在上面！", -1)
						end
						
						x270012_var_doing =5
        		x270012_var_doing2= 1
      elseif x270012_var_doing == 5   then
						ItemBoxEnterScene(180, 65, 16, varMap, 0, 13020324,80000)
						if IsObjValid (varMap,x270012_var_daotong) == 1 then
								NpcTalk(varMap, x270012_var_daotong, "快来把水玉涂在上面！", -1)
						end
						if IsObjValid (varMap,x270012_var_taotie) == 1 then
						NpcTalk(varMap, x270012_var_taotie, "呼噜呼噜！", -1)
						end
						
        		x270012_var_doing =6
        		x270012_var_doing2= 1
     elseif x270012_var_doing == 6   then
						ItemBoxEnterScene(172, 75, 16, varMap, 0, 13020324,70000)
						if IsObjValid (varMap,x270012_var_daotong) == 1 then
								NpcTalk(varMap, x270012_var_daotong, "快来把水玉涂在上面！", -1)
						end
						if IsObjValid (varMap,x270012_var_taotie) == 1 then
								NpcTalk(varMap, x270012_var_taotie, "呼噜呼噜！", -1)
						end
						
        		x270012_var_doing =7
        		x270012_var_doing2= 1
     elseif x270012_var_doing == 7   then
						ItemBoxEnterScene(170, 90, 16, varMap, 0, 13020324,60000)
						if IsObjValid (varMap,x270012_var_daotong) == 1 then
								NpcTalk(varMap, x270012_var_daotong, "快来把水玉涂在上面！", -1)
						end
						if IsObjValid (varMap,x270012_var_taotie) == 1 then
								NpcTalk(varMap, x270012_var_taotie, "呼噜呼噜！", -1)
						end
						
        		x270012_var_doing =8
        		x270012_var_doing2= 1
     elseif x270012_var_doing == 8   then
     				if IsObjValid (varMap,x270012_var_daotong) == 1 then
     						SetMonsterDir(varMap,x270012_var_daotong,60)
     						NpcTalk(varMap, x270012_var_daotong, "顺利完成了，拿到想要的东西了，稍后真人会帮你修好镜子。", -1)
     				end
     				if IsPlayerStateNormal(varMap,x270012_var_accid) ==1 then
     						local varQuestIdx = GetQuestIndexByID(varMap, x270012_var_accid, x270012_var_QuestId)
								SetQuestByIndex(varMap,x270012_var_accid,varQuestIdx,0,1)
								SetQuestByIndex(varMap,x270012_var_accid,varQuestIdx,7,1)
								DeleteMonster (varMap,x270012_var_daotong )
								DeleteMonster (varMap,x270012_var_taotie )
						end
     				x270012_var_doing =9
     end
  	end
  end
end

function x270012_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x270012_var_doing = 0
	x270012_var_doing2= 0
	x270012_var_daotong =-1
	x270012_var_taotie =-1
	x270012_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0,StartTime2 = 0}
end
