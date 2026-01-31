

--DECLARE_QUEST_INFO_START--
x203335_var_FileId = 203335
x203335_var_QuestIdPre =2286
x203335_var_QuestId = 2287
x203335_var_LevelLess	= 	70
x203335_var_QuestIdNext = -1
x203335_var_Name	={}
x203335_var_ExtTarget={{type=20,n=1,target="赶往@npc_14044决战万奴冥王"}}
x203335_var_QuestName="【个人】勇义之战"
x203335_var_QuestInfo="\t耶律氏契丹勇士二十八人，即刻集结！用鲜血回报养育我们这片家土的时候到了！距此地向南不远即为关隘，将军先行前去，我等立刻赶至。"  
x203335_var_QuestTarget=""		
x203335_var_QuestCompleted="\t没想到赛赤竟然勾结万奴冥王，这个卖国求荣之人即刻关押待斩！多亏将军与众族勇士舍命保卫我大元国土，我以皇子身份代大元朝，拜谢！！"					
x203335_var_ContinueInfo=	""
x203335_var_QuestHelp =	""
x203335_var_DemandItem ={}
x203335_var_BonusMoney1 =700
x203335_var_BonusMoney2 =0
x203335_var_BonusMoney3 =0
x203335_var_BonusMoney4 =0
x203335_var_BonusMoney5 =81
x203335_var_BonusMoney6 =0
x203335_var_BonusItem	=	{}
x203335_var_BonusChoiceItem ={}
x203335_var_ExpBonus = 382000
x203335_var_NpcGUID ={{ guid = 144020, varName = "五皇子"}}

--DECLARE_QUEST_INFO_STOP--
x203335_var_doing = 0
x203335_var_wannumingwang= -1
x203335_var_mingwangzhanshi= -1
x203335_var_mingwangzhanshi1= -1
x203335_var_mingwangzhanshi2= -1
x203335_var_mingwangzhanshi3= -1
x203335_var_mingwangzhanshi4= -1
x203335_var_mingwangzhanshi5= -1
x203335_var_mingwangzhanshi6= -1
x203335_var_mingwangzhanshi7= -1
x203335_var_bosiwangzi= -1
x203335_var_bosijingrui= -1
x203335_var_bosijingrui1= -1
x203335_var_xiaolingfeng= -1
x203335_var_qidanyongshi= -1
x203335_var_qidanyongshi1= -1
x203335_var_qidanyongshi2= -1
x203335_var_qidanyongshi3= -1
x203335_var_yelvrong= -1
					
x203335_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}






function x203335_PlayeffectToNearPlayer(varMap,varTalknpc,nEffect)

	if IsObjValid(varMap,varTalknpc) ~= 1 then
		return
	end
	
	local varHumanCount = GetScenePlayerCount( varMap )
	for varI=0,varHumanCount do

		local varObj = GetScenePlayerObjId(varMap,varI)
		if IsPlayerStateNormal(varMap,varObj) == 1 then
			
			if GetDist(varMap,varObj,varTalknpc,25 ) <= 25 then
				LuaCallNoclosure(UTILITY_SCRIPT,"PlayEffect",varMap,varObj,nEffect)
			end
		end
	end

end

function x203335_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	if GetLevel( varMap, varPlayer) < x203335_var_LevelLess then
		return
   end

	if IsQuestHaveDone(varMap, varPlayer, x203335_var_QuestId) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x203335_var_QuestIdPre)> 0 then
	
						if IsHaveQuest(varMap,varPlayer, x203335_var_QuestId) <= 0 then
								local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203335_var_QuestId)
								TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203335_var_QuestId, varState, -1 )
						end
			
	end
end

function x203335_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
		if x203335_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x203335_var_ExpBonus )
		end
		if x203335_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x203335_var_BonusMoney1 )
		end
		if x203335_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x203335_var_BonusMoney2 )
		end
		if x203335_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x203335_var_BonusMoney3 )
		end
		if x203335_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x203335_var_BonusMoney4 )
		end
		if x203335_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x203335_var_BonusMoney5 )
		end
		if x203335_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x203335_var_BonusMoney6 )
		end
		for varI, item in x203335_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for varI, item in x203335_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end


function x203335_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest)	
	if IsQuestHaveDone(varMap, varPlayer, x203335_var_QuestId) > 0 then
		return 
	end
	if GetLevel( varMap, varPlayer) < x203335_var_LevelLess then
		return
   end
	if IsHaveQuest(varMap,varPlayer, x203335_var_QuestId) > 0 then
			if x203335_CheckSubmit(varMap, varPlayer, varTalknpc) <= 0 then
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203335_var_QuestName)
						TalkAppendString(varMap,x203335_var_QuestCompleted)
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varTalknpc, x203335_var_FileId, x203335_var_QuestId);
			else
						StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x203335_var_QuestName)
						TalkAppendString(varMap,x203335_var_QuestCompleted)
						TalkAppendString(varMap," ")
						x203335_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
						StopTalkTask()
						DeliverTalkContinueNM(varMap, varPlayer, varTalknpc, x203335_var_FileId, x203335_var_QuestId);
			end
  elseif x203335_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x203335_var_QuestName)
			TalkAppendString(varMap,x203335_var_QuestInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for varI, item in x203335_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x203335_var_QuestHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x203335_var_QuestHelp )
			end
			x203335_DispatchQuestInfo( varMap, varPlayer, varTalknpc )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x203335_var_FileId, x203335_var_QuestId);
  end
	
end


function x203335_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

		
						return 1
		

end

function x203335_CheckSubmit( varMap, varPlayer, varTalknpc)


	        return 1
	
end

function x203335_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
		if IsQuestHaveDone(varMap, varPlayer, x203335_var_QuestId) > 0 then
				return 
		end
			if GetLevel( varMap, varPlayer) < x203335_var_LevelLess then
		return
   end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		
		
		local varFrontQuest1, varFrontQuest2, varFrontQuest3 = GetFrontQuestIdNM( varMap, varPlayer,x203335_var_QuestId  )
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
	
		if x203335_ProcAcceptCheck(varMap, varPlayer, varTalknpc) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x203335_var_QuestId, x203335_var_FileId, 0, 0, 0,1)
					if retmiss ==0 then
				
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x203335_Msg2toplayer( varMap, varPlayer,0)
		  			StartItemTask(varMap)
							for varI, item in x203335_var_DemandItem do
 								ItemAppend( varMap, item.item, item.varNum )
							end
    				StopItemTask(varMap,varPlayer)
    				
						
								--local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,x203335_var_QuestId)								                                                  
	    					--SetQuestByIndex(varMap,varPlayer,varQuestIdx,0,1)
	    					--SetQuestByIndex(varMap,varPlayer,varQuestIdx,7,1)
	    			
		  		end
	 	end                                                                    
	     
end


function x203335_ProcQuestAbandon(varMap, varPlayer, varQuest)
		if IsHaveQuest(varMap,varPlayer, x203335_var_QuestId) <= 0 then
				return 
		end
		DelQuest(varMap, varPlayer, x203335_var_QuestId)
	  x203335_Msg2toplayer( varMap, varPlayer,1)
			
end

function x203335_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected )
	local result = 1
	local j = 0
	local bAdd = 0 
	StartItemTask(varMap)
	for j, item in x203335_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x203335_var_BonusChoiceItem do
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

function x203335_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	if IsHaveQuest(varMap,varPlayer, x203335_var_QuestId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203335_CheckSubmit( varMap, varPlayer, varTalknpc) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x203335_CheckPlayerBagFull( varMap ,varPlayer,varRadioSelected ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x203335_var_QuestId) > 0 then
				x203335_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x203335_var_QuestId)
				x203335_GetBonus( varMap, varPlayer,varTalknpc)
				StartItemTask(varMap)
				for varI, item in x203335_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for varI, item in x203335_var_BonusChoiceItem do
						if item.item == varRadioSelected then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)
    		
    		
    			
	 	end        
									
    		

   
end

function x203335_CreateNpc(varMap, varPlayer)
		if x203335_var_doing==0 then
			if x203335_var_wannumingwang==-1 then
    			x203335_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
					x203335_var_doing =1
					x203335_var_wannumingwang=CreateMonster(varMap, 3920,440,439,20,1,-1,-1,22,20000,180,"万奴冥王")
				  x203335_var_mingwangzhanshi=CreateMonster(varMap, 3921,441,442,20,1,-1,-1,22,20000,180,"冥王战士")
				  x203335_var_mingwangzhanshi1=CreateMonster(varMap, 3921,438,440,20,1,-1,-1,22,20000,180,"冥王战士")
				  x203335_var_mingwangzhanshi2=CreateMonster(varMap, 3921,442,445,20,1,-1,-1,22,20000,180,"冥王战士")
				  x203335_var_mingwangzhanshi3=CreateMonster(varMap, 3921,440,445,20,1,-1,-1,22,20000,180,"冥王战士")
				  x203335_var_mingwangzhanshi4=CreateMonster(varMap, 3921,436,443,20,1,-1,-1,22,20000,180,"冥王战士")
				  x203335_var_mingwangzhanshi5=CreateMonster(varMap, 3921,435,442,20,1,-1,-1,22,20000,180,"冥王战士")
				  x203335_var_mingwangzhanshi6=CreateMonster(varMap, 3921,444,441,20,1,-1,-1,22,20000,180,"冥王战士")
				  x203335_var_mingwangzhanshi7=CreateMonster(varMap, 3921,438,444,20,1,-1,-1,22,20000,180,"冥王战士")
				  x203335_var_bosiwangzi=CreateMonster(varMap, 3922,439,436,20,1,-1,-1,23,20000,0,"波斯王子")
				  x203335_var_bosijingrui=CreateMonster(varMap, 3923,438,433,20,1,-1,-1,23,20000,0,"波斯精锐")
				  x203335_var_bosijingrui1=CreateMonster(varMap, 3923,441,434,20,1,-1,-1,23,20000,0,"波斯精锐")
					x203335_var_xiaolingfeng=CreateMonster(varMap, 3924,443,438,20,1,-1,-1,23,20000,0,"萧凌风")
					x203335_var_qidanyongshi=CreateMonster(varMap, 3926,445,436,20,1,-1,-1,23,20000,0,"契丹勇士")
					x203335_var_qidanyongshi1=CreateMonster(varMap, 3926,443,435,20,1,-1,-1,23,20000,0,"契丹勇士")
					x203335_var_qidanyongshi2=CreateMonster(varMap, 3926,434,435,20,1,-1,-1,23,20000,0,"契丹勇士")
					x203335_var_qidanyongshi3=CreateMonster(varMap, 3926,436,433,20,1,-1,-1,23,20000,0,"契丹勇士")
					x203335_var_yelvrong=CreateMonster(varMap, 3925,436,437,20,1,-1,-1,23,20000,0,"耶律荣")
					x203335_var_PROTECTINFO.StartTime = GetCurrentTime()
					x203335_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 203335, "ProcScneneTimer", 1)
			  end								
			end
end			


function x203335_ProcScneneTimer(varMap)


	if x203335_var_doing==1   then
		if GetCurrentTime() - x203335_var_PROTECTINFO.StartTime >= 3   then
						x203335_var_doing = 2
						if IsObjValid (varMap,x203335_var_wannumingwang) == 1 then
								NpcTalk(varMap, x203335_var_wannumingwang, "可恶，为什么他们会知道我此刻前来？", -1)
						end
		end
	elseif x203335_var_doing==2   then
		if GetCurrentTime() - x203335_var_PROTECTINFO.StartTime >= 8   then
						x203335_var_doing = 3
						if IsObjValid (varMap,x203335_var_bosiwangzi) == 1 then
								NpcTalk(varMap, x203335_var_bosiwangzi, "万奴冥王，我等誓死守护此地，绝不会让你阴谋得逞。", -1)
						end
						if IsObjValid (varMap,x203335_var_xiaolingfeng) == 1 then
								NpcTalk(varMap, x203335_var_xiaolingfeng, "万奴冥王，我等誓死守护此地，绝不会让你阴谋得逞。", -1)
						end
						if IsObjValid (varMap,x203335_var_yelvrong) == 1 then
								NpcTalk(varMap, x203335_var_yelvrong, "万奴冥王，我等誓死守护此地，绝不会让你阴谋得逞。", -1)
						end
		end
	elseif x203335_var_doing==3   then
		if GetCurrentTime() - x203335_var_PROTECTINFO.StartTime >= 18   then
						x203335_var_doing = 4
						if IsObjValid (varMap,x203335_var_wannumingwang) == 1 then
								NpcTalk(varMap, x203335_var_wannumingwang, "啊！今日之事作罢，众将听命，撤退。保存实力，我还会再回来的！", -1)
						end
		end
	elseif x203335_var_doing==4   then
		if GetCurrentTime() - x203335_var_PROTECTINFO.StartTime >= 20   then
						x203335_var_doing = 5
						x203335_CloseTimer(varMap, x203335_var_PROTECTINFO.ScneneTimerIndex)
					end
	end
end





function x203335_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x203335_var_doing = 0
	x203335_var_wannumingwang= -1
	x203335_var_mingwangzhanshi= -1
	x203335_var_mingwangzhanshi1= -1
	x203335_var_mingwangzhanshi2= -1
	x203335_var_mingwangzhanshi3= -1
	x203335_var_mingwangzhanshi4= -1
	x203335_var_mingwangzhanshi5= -1
	x203335_var_mingwangzhanshi6= -1
	x203335_var_mingwangzhanshi7= -1
	x203335_var_bosiwangzi= -1
	x203335_var_bosijingrui= -1
	x203335_var_bosijingrui1= -1
	x203335_var_xiaolingfeng= -1
	x203335_var_qidanyongshi= -1
	x203335_var_qidanyongshi1= -1
	x203335_var_qidanyongshi2= -1
	x203335_var_qidanyongshi3= -1
	x203335_var_yelvrong= -1
	x203335_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
end


function x203335_GetBonus( varMap, varPlayer,varTalknpc)
	  if x203335_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x203335_var_ExpBonus);
  	end
		if x203335_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x203335_var_BonusMoney1 )
	  end
		if x203335_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x203335_var_BonusMoney2 )
	  end
		if x203335_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x203335_var_BonusMoney3 )
		end
		if x203335_var_BonusMoney4 > 0 then
		local varRongYu = GetRongYu( varMap, varPlayer )
			varRongYu = varRongYu + x203335_var_BonusMoney4
			SetRongYu( varMap, varPlayer, varRongYu )
		end
		if x203335_var_BonusMoney5 > 0 then
			local varShengWang = GetShengWang( varMap, varPlayer )
			varShengWang = varShengWang + x203335_var_BonusMoney5
			SetShengWang( varMap, varPlayer, varShengWang )
		end
		if x203335_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x203335_var_BonusMoney6)
		end
end

function x203335_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x203335_var_QuestName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x203335_var_QuestName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203335_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x203335_var_QuestName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203335_var_QuestName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x203335_var_QuestName.."！", 0, 3)
				if x203335_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x203335_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x203335_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x203335_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x203335_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x203335_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x203335_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x203335_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x203335_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x203335_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x203335_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x203335_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x203335_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x203335_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x203335_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x203335_ProcAreaEntered(varMap, varPlayer, varArea, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaEntered",varMap, varPlayer, varArea, varQuest )	

end

function x203335_ProcMapTimerTick(varMap, varPlayer, varScript, varQuest)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcMapTimerTick",varMap, varPlayer, varScript, varQuest )
		
end

function x203335_ProcAreaLeaved(varMap, varPlayer, varScript, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, varScript, varQuest)
end

function x203335_ProcQuestItemChanged(varMap, varPlayer, varItemData, varQuest)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcQuestItemChanged",varMap, varPlayer, varItemData, varQuest )
end


function x203335_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
	  local bFind  = 0
    for varI ,item in x203335_var_NpcGUID do
        if item.guid == varTalkNpcGUID then
            bFind = 1
            break
        end
    end
    if bFind == 0 then
        return
    end
		if IsHaveQuest(varMap,varPlayer, x203335_var_QuestId) > 0 then
				local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x203335_var_QuestId)
				TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x203335_var_QuestId, varState, -1 )
		end
end

function x203335_QuestComplate( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
	return LuaCallNoclosure( QUEST_SCRIPT, "QuestComplate", varMap, varPlayer, varTalknpc, varButtonClick, varQuest  )
end

function x203335_PositionUseItem( varMap, varPlayer, varBagIdx, varImpact )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, varBagIdx, varImpact)
end

function x203335_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpOpenItemBox",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203335_ProcGpRecycle( varMap, varPlayer, varTalknpc, varGpType, varNeedItem )
	return LuaCallNoclosure( QUEST_SCRIPT, "ProcGpRecycle",varMap, varPlayer, varTalknpc, varGpType, varNeedItem)
end

function x203335_ProcGpProcOver( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "ProcGpProcOver",varMap, varPlayer, varTalknpc)
end

function x203335_OpenCheck( varMap, varPlayer, varTalknpc )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, varTalknpc )
end
