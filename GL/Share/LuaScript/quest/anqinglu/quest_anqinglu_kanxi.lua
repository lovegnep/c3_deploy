

--DECLARE_QUEST_INFO_START--
x203316_var_FileId = 203316
x203316_var_QuestIdPre =2172
x203316_var_QuestId = 2173
x203316_var_LevelLess	= 80
x203316_var_QuestIdNext = -1
x203316_var_Name	={}
x203316_var_ExtTarget={{type=20,n=1,target="询问@npc_142103"}}
x203316_var_QuestName="【剧情】名剧诞生"
x203316_var_QuestInfo="\t我的徒儿们已经换好了戏装，待他们演上一折，客官给做个评判，看看老朽调教的如何。"  
x203316_var_QuestTarget=""		
x203316_var_QuestCompleted="\t呵呵，你要定睛看仔细，哪里不好和老朽直说，莫让郑光祖和罗贯中两位公子失望。"	
x203316_var_ContinueInfo=	""
x203316_var_QuestHelp =	""
x203316_var_DemandItem ={}
x203316_var_BonusMoney1 =800
x203316_var_BonusMoney2 =0
x203316_var_BonusMoney3 =0
x203316_var_BonusMoney4 =0
x203316_var_BonusMoney5 =91
x203316_var_BonusMoney6 =0
x203316_var_BonusItem	=	{}
x203316_var_BonusChoiceItem ={}
x203316_var_ExpBonus = 528000
x203316_var_NpcGUID ={{ guid = 142103, varName = "谭老先生"}}

--DECLARE_QUEST_INFO_STOP--
x203316_var_doing = 0
x203316_var_huadan = -1
x203316_var_xiaoshen = -1
x203316_var_xiaonvhai = -1
x203316_var_xiaonanhai = -1
x203316_var_qiaofu = -1
x203316_var_cungu = -1
x203316_var_kanke = -1
x203316_var_alibuge = -1
x203316_var_baierda = -1
x203316_var_mengguyongshi1 = -1
x203316_var_mengguyongshi2 = -1
x203316_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}





  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

function x203316_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel( varMap, varPlayer) < x203316_var_LevelLess then
		return
   end

	if IsQuestHaveDone(varMap, varPlayer, x203316_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203316_var_QuestIdPre)> 0 then
	
						if IsHaveQuest(varMap,varPlayer, x203316_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203316_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203316_var_QuestId, varState, -1 )
						end
			
	end
end

function x203316_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203316_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203316_var_ExpBonus )
		end
		if x203316_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203316_var_BonusMoney1 )
		end
		if x203316_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203316_var_BonusMoney2 )
		end
		if x203316_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203316_var_BonusMoney3 )
		end
		if x203316_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203316_var_BonusMoney4 )
		end
		if x203316_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203316_var_BonusMoney5 )
		end
		if x203316_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203316_var_BonusMoney6 )
		end
		for varI, item in x203316_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203316_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203316_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203316_var_QuestId) > 0 then
		return 
	end
	if GetLevel( varMap, varPlayer) < x203316_var_LevelLess then
		return
   end
	if IsHaveQuest(varMap,varPlayer, x203316_var_QuestId) > 0 then
			if x203316_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203316_var_QuestName)
						TalkAppendString(varMap,x203316_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203316_var_FileId, x203316_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203316_var_QuestName)
						TalkAppendString(varMap,x203316_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203316_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203316_var_FileId, x203316_var_QuestId);
			end
  elseif x203316_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203316_var_QuestName)
			TalkAppendString(varMap,x203316_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203316_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203316_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203316_var_QuestHelp )
			end
			x203316_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203316_var_FileId, x203316_var_QuestId);
  end
	
end


function x203316_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

		
						return 1
		

end

function x203316_CheckSubmit( varMap, varPlayer, varTalknpc)


	        return 1
	
end

function x203316_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203316_var_QuestId) > 0 then
				return 
		end
			if GetLevel( varMap, varPlayer) < x203316_var_LevelLess then
		return
   end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203316_var_QuestId  )
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
	
		if x203316_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203316_var_QuestId, x203316_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
				
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203316_Msg2toplayer( varMap, varPlayer,0)
		  			StartItemTask(varMap)
							for varI, item in x203316_var_DemandItem do
 								ItemAppend( varMap, item.item, item.varNum )
							end
    				StopItemTask(varMap,varPlayer)
    				
						
								local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203316_var_QuestId)								                                                  
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x203316_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203316_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203316_var_QuestId)
	  x203316_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203316_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203316_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203316_var_BonusChoiceItem do
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

function x203316_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203316_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203316_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203316_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203316_var_QuestId) > 0 then
				x203316_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203316_var_QuestId)
				x203316_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203316_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203316_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
    		
    			if x203316_var_doing==0 then
						if x203316_var_huadan==-1 then
    			    			x203316_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
										x203316_var_doing =1
										x203316_var_huadan=CreateMonster(varMap,351,111,104,3,1,-1,-1,20,30000,90,"倩女")
									  x203316_var_xiaoshen=CreateMonster(varMap,334,111,98,3,1,-1,-1,20,30000,90,"王文举")
									  x203316_var_xiaonanhai=CreateMonster(varMap,10,116,102,3,1,-1,-1,20,30000,270)
									  x203316_var_xiaonvhai=CreateMonster(varMap,24,116,100,3,1,-1,-1,20,30000,270)
									  x203316_var_qiaofu=CreateMonster(varMap,1128,118,94,3,1,-1,-1,20,30000,300)
									  x203316_var_cungu=CreateMonster(varMap,1920,117,101,3,1,-1,-1,20,30000,270)
									  x203316_var_kanke=CreateMonster(varMap,1917,117,99,3,1,-1,-1,20,30000,270)
									  x203316_var_PROTECTINFO.StartTime = GetCurrentTime()
										x203316_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 203316, "ProcScneneTimer", 1)
    			  end
    			
    								
												
										
									
										
						  		
					  			
					
								
								
								
								
								
					end
	 	end        
									
    		

   
end


function x203316_ProcScneneTimer(varMap)
	if x203316_var_doing==1   then
		if GetCurrentTime() - x203316_var_PROTECTINFO.StartTime >= 5   then
						x203316_var_doing = 2
						if IsObjValid (varMap,x203316_var_xiaoshen) == 1 then
								NpcTalk(varMap, x203316_var_xiaoshen, "小生王文举，自与小姐在折柳亭相别，使小生切切于怀，放心不下。今夜舣舟江岸，小生横琴于膝，操一曲以适闷咱！", -1)
						end
		end
	elseif x203316_var_doing==2   then
		if GetCurrentTime() - x203316_var_PROTECTINFO.StartTime >= 2 then
						x203316_var_doing = 3
						if IsObjValid (varMap,x203316_var_huadan) == 1 then
								NpcTalk(varMap, x203316_var_huadan, "妾身倩女，自与王生相别，思想的无奈，不如跟他同去，背着母亲，一径的赶来。王生也，你只管去了，争知我如何过遣也呵！", -1)
						end
		end
	elseif x203316_var_doing==3   then
		if GetCurrentTime() - x203316_var_PROTECTINFO.StartTime >= 2 then
						x203316_var_doing = 4
						if IsObjValid (varMap,x203316_var_xiaonvhai) == 1 then
								NpcTalk(varMap, x203316_var_xiaonvhai, "将来长大了，我也要学唱戏！", -1)
						end
		end
	elseif x203316_var_doing==4   then
		if GetCurrentTime() - x203316_var_PROTECTINFO.StartTime >= 5  then
						x203316_var_doing = 5
						if IsObjValid (varMap,x203316_var_xiaoshen) == 1 then
								NpcTalk(varMap, x203316_var_xiaoshen, "人去阳台，云归楚峡。不争他江渚停舟，几时得门庭过马。悄悄冥冥，潇潇洒洒，我这里踏岸沙，步月华。我觑着这万水千山，都只在一时半霎！", -1)
						end
		end
	elseif x203316_var_doing==5   then
		if GetCurrentTime() - x203316_var_PROTECTINFO.StartTime >= 2  then
						x203316_var_doing = 6
						if IsObjValid (varMap,x203316_var_cungu) == 1 then
								NpcTalk(varMap, x203316_var_cungu, "这戏里演的故事，太感人了，我的眼泪止不住的流，倩女真好，可以找的如意郎君！", -1)
						end
	  end
	elseif x203316_var_doing==6   then
		if GetCurrentTime() - x203316_var_PROTECTINFO.StartTime >= 2 then
						x203316_var_doing = 7
						if IsObjValid (varMap,x203316_var_kanke) == 1 then
								NpcTalk(varMap, x203316_var_kanke, "原来这戏演的是《倩女离魂》，这戏文写真的很感人，不知是哪位才子所做！", -1)
						end
		end
	elseif x203316_var_doing==7   then
		if GetCurrentTime() - x203316_var_PROTECTINFO.StartTime >= 5   then
						x203316_var_doing = 8
						if IsObjValid (varMap,x203316_var_huadan) == 1 then
								NpcTalk(varMap, x203316_var_huadan, "走了半日，来到江边，听的人语喧闹，我试觑咱！", -1)
						end
		end
	elseif x203316_var_doing==8   then
		if GetCurrentTime() - x203316_var_PROTECTINFO.StartTime >= 5   then
						x203316_var_doing = 9
						if IsObjValid (varMap,x203316_var_qiaofu) == 1 then
								NpcTalk(varMap, x203316_var_qiaofu, "好，好，太好了，看过这戏我都要流泪了，想不到人间有如此真情！", -1)
						end						
		end
	elseif x203316_var_doing==9   then
		if GetCurrentTime() - x203316_var_PROTECTINFO.StartTime >= 5  then
						x203316_var_doing = 10
						if IsObjValid (varMap,x203316_var_hedan) == 1 then
								NpcTalk(varMap, x203316_var_xiaoshen, "你好是舒心的伯牙，我做了没路的浑家。你道我为甚么私离绣榻？待和伊同走天涯！", -1)					
						end
		end
	elseif x203316_var_doing==10  then
		if GetCurrentTime() - x203316_var_PROTECTINFO.StartTime >= 5   then
						x203316_var_doing = 11
						x203316_CloseTimer(varMap, x203316_var_PROTECTINFO.ScneneTimerIndex)
		        end
    end
   
end





function x203316_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x203316_var_doing = 0
	x203316_var_huadan = -1
	x203316_var_xiaoshen = -1
	x203316_var_xiaonanhai = -1
	x203316_var_xiaonvhai = -1
	x203316_var_qiaofu = -1
	x203316_var_cungu = -1
	x203316_var_kanke = -1
	x203316_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end


function x203316_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203316_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203316_var_ExpBonus);
  	end
		if x203316_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203316_var_BonusMoney1 )
	  end
		if x203316_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203316_var_BonusMoney2 )
	  end
		if x203316_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203316_var_BonusMoney3 )
		end
		if x203316_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203316_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203316_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203316_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203316_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203316_var_BonusMoney6)
		end
end

function x203316_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203316_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203316_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203316_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203316_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203316_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203316_var_QuestName.."！", 0, 3)
				if x203316_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203316_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203316_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203316_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203316_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203316_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203316_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203316_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203316_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203316_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203316_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203316_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203316_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203316_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203316_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203316_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203316_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203316_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203316_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203316_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203316_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203316_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203316_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203316_var_QuestId, varState, -1 )
		end
end

function x203316_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203316_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203316_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203316_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203316_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203316_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
