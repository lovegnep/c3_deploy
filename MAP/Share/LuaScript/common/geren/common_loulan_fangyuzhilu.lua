--DECLARE_QUEST_INFO_START--


x300980_var_FileId = 300980

x300980_var_PrintLogToggle = 0

x300980_var_QuestId_List = {
							7800,	
							7801,	
							7802,	
							7803,	
							}
x300980_var_QuestId = 7800


x300980_var_Title = "防御之路"

x300980_var_Profession_Enum = {	
								0,	
								1,	
								2, 	
								3, 	
								4, 	
								5,	
								6, 	
								7, 	
								8, 	
								9, 	
								10,	
								11,	
								0,	
								2, 	
								3, 	
								4, 	
								5,	
								6, 	
								8, 	
								10,	
								2, 	
								3, 	
								4, 	
								8, 	
							}
							
x300980_var_Profession_Desc = {	
								"武士",
								"剑侠",  
								"骑射",  
								"火枪",  
								"先知",  
								"萨满",  
								"十字军",
								"圣火使",
								"刺客",  
								"近卫军",
								"隐修士",
								"僧侣",
								"武士", 
								"骑射",  
								"火枪",  
								"先知",  
								"萨满",  
								"十字军",
								"刺客",  
								"隐修士",
								"骑射",  
								"火枪",  
								"先知",   
								"刺客",  
							}							





x300980_var_Quest_Max_Count = 1	


x300980_var_QuestName = "【个人】防御之路"
x300980_var_QuestInfo				= 	"\t防御与攻击的关系很微妙。想要追求至高的防御，没有一定的攻击也是没有意义的。所以我要给你一个考验——击败某一个职业的6名敌国高手。通过了这个考验之后我会帮你接近那至高的防御。#G（击败的玩家不低于自己20级才有效。）" 
x300980_var_Quest_Kill_Cnt = 6				   

x300980_var_CommitNPC     = "@npc_141103"



function x300980_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	
	if GetCurCountry(varMap,varPlayer) ~=0 or GetLevel(varMap, varPlayer) < 80 then
		return -1
	end	

	
	local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300980_var_QuestId)
	TalkAppendButtonNM( varMap, varPlayer, varTalknpc, x300980_var_QuestId, varState, -1 )

end





function x300980_ProcEventEntry(varMap, varPlayer, varTalknpc,varScriptFileId, nFlag)
	
	if GetGameOpenById(1060)<=0 then
		Msg2Player(varMap, varPlayer, "此活动已关闭，请耐心等待开启。", 0, 3)
		return
	end
	
	--如果有任务,而且跨天，则把次数重置为1
	--如果有任务,而且跨天，则把次数重置为1
	if IsHaveQuestNM( varMap, varPlayer, x300980_var_QuestId ) ~= 0 then
	    local today = GetDayOfYear()
		local lastday = GetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3])
		if lastday ~= today then
			SetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3], today)
			SetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DAYCOUNT[1], MD_FANGYUZHILU_DAYCOUNT[2], MD_FANGYUZHILU_DAYCOUNT[3], 1)		
		end

	end
	

	
	local nCntItem_tuozhanzhishu = GetItemCountInBag( varMap, varPlayer, 11010125)
	
	
	
	local nCnt = x300980_GetDayCount(varMap, varPlayer) + 1
	
	if x300980_var_PrintLogToggle == 1 then
		print("-----------------nCntItem_tuozhanzhishu",nCntItem_tuozhanzhishu,"nCnt",nCnt)
  end
    
    if IsHaveQuestNM( varMap, varPlayer, x300980_var_QuestId ) == 0 then	
				
				if nCnt == 1 then 
							x300980_DistachQuest_Info(varMap,varPlayer,varTalknpc,1)
				elseif  nCnt == 2 then
							if nCntItem_tuozhanzhishu > 0  then 
															
															
															
															
															x300980_DistachQuest_Info(varMap,varPlayer,varTalknpc,2)
															
							else
															StartTalkTask(varMap)
															TalkAppendString( varMap, "#Y"..x300980_var_QuestName)
															TalkAppendString(varMap,"\t您今天已经完成一次本任务了，如果有#G专精之书·防御#W可以再领取一次本任务。\n\t#G专精之书·防御#W可以在我这里的#G专精天赋金币商店#W购买。")															
															StopTalkTask(varMap)
															DeliverTalkMenu(varMap, varPlayer, varTalknpc)
															return -1  
							end
				else 
							StartTalkTask(varMap)
							TalkAppendString( varMap, "#Y"..x300980_var_QuestName)
							TalkAppendString(varMap,"\t今天已经达到接任务的上限，请改天再来。\n")
							StopTalkTask(varMap)
							DeliverTalkMenu(varMap, varPlayer, varTalknpc)
							return -1  
				end
					
					
					
    else
				local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300980_var_QuestId)
		        local isFinish = GetQuestParam( varMap, varPlayer, varQuestIdx, 7)
		        
				if isFinish > 0 then 
							    
							  	StartTalkTask( varMap)
								TalkAppendString( varMap, "#Y"..x300980_var_QuestName.."#W\n\t不错，不错。按照咱们的约定，我会帮助你的防御更上一层楼。" )
								TalkAppendString( varMap, "\n#Y任务奖励： ")
								TalkAppendString( varMap, "专防训练点数：13点 ")	
								StopTalkTask( varMap)
								DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300980_var_FileId, x300980_var_QuestId)
								
								
				else
								
								
								
								local nRemain = 0
								local varToday = GetDayOfYear()
								local varLastday = GetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3])
								if varLastday ~= varToday then 
									nRemain = x300980_var_Quest_Kill_Cnt
								else										
									local nKillCnt = GetQuestParam( varMap, varPlayer, varQuestIdx , 2 )
									nRemain = x300980_var_Quest_Kill_Cnt - nKillCnt
								end
								
								local nIdx		 = GetQuestParam( varMap, varPlayer, varQuestIdx , 3) 
								
								if x300980_var_PrintLogToggle == 1 then         
									print("------------------------------->",nIdx)
								end
								
								if nIdx <=0 or nIdx > getn(x300980_var_Profession_Desc) then
									return -1
								end
								local strPro   = x300980_var_Profession_Desc[nIdx]								
								StartTalkTask( varMap)
								TalkAppendString( varMap, "#Y"..x300980_var_QuestName)
							    TalkAppendString( varMap, "\t这个很困难吗？继续加油吧，只有付出才有回报。\n\t你还需要击败"..nRemain.."个#R"..strPro.."#W职业的敌国玩家或者#R练功人偶")
								StopTalkTask()
							    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
							    
				end
    end
end

function x300980_DistachQuest_Info(varMap,varPlayer,varTalknpc,nFlag)
							
							local varIndex  = random(1,24)           
							
							SetPlayerRuntimeData(varMap,varPlayer,RD_GUILDCONTEND_KILL_OTHER,varIndex)	
							
							
							
							
							
							
							
								
							
							if nFlag == 2 then		
												StartTalkTask( varMap)
												TalkAppendString( varMap, "#Y"..x300980_var_QuestName)
												TalkAppendString( varMap, x300980_var_QuestInfo)
												
												TalkAppendString( varMap, "#Y任务目标：")
												TalkAppendString( varMap, format( "击败某种职业的敌国玩家或者练功人偶#R6个#W。") )
												TalkAppendString( varMap, "\n#G小提示：\n\t接本次任务需要消耗一本专精之书·防御，您确认要接受此任务吗?")
												TalkAppendString( varMap, "\n#Y任务奖励： ")
												TalkAppendString( varMap, "专防训练点数：13点 ")	
												StopTalkTask()
					
												DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300980_var_FileId, x300980_var_QuestId);
							else
												StartTalkTask( varMap)
												TalkAppendString( varMap, "#Y"..x300980_var_QuestName)
												TalkAppendString( varMap, x300980_var_QuestInfo)
												
												TalkAppendString( varMap, "#Y任务目标：")
												TalkAppendString( varMap, format( "击败某种职业的敌国玩家或者练功人偶#R6个#W。") )
												TalkAppendString( varMap, "\n#Y任务奖励： ")
												TalkAppendString( varMap, "专防训练点数：13点 ")	
													
												StopTalkTask()
					
												DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300980_var_FileId, x300980_var_QuestId);
							end
											

end


function x300980_ProcQuestAccept(varMap, varPlayer, varTalknpc, varQuest)
	
		if GetInherenceLevel(varMap, varPlayer) < 50  then
			Msg2Player(varMap, varPlayer, "天赋等级不到50级，不能领取此任务", 0, 2)
			Msg2Player(varMap, varPlayer, "天赋等级不到50级，不能领取此任务", 0, 3)
			return -1
		end
    if IsHaveQuestNM( varMap, varPlayer, x300980_var_QuestId) == 0 then   
				        

				        
						
						
						
						
						
						
						
				        
						
						if GetCurCountry(varMap, varPlayer) ~= 0 then
							
							return -1
						end
						
						local nCnt = x300980_GetDayCount(varMap, varPlayer)
						if nCnt == 1 then 
								local nCntItem_tuozhanzhishu = GetItemCountInBag( varMap, varPlayer, 11010125)
								if nCntItem_tuozhanzhishu > 0 then
										if DelItemByIDInBag( varMap, varPlayer, 11010125, 1) ~= 1 then return 0 end
										Msg2Player( varMap, varPlayer, "消耗专精之书·防御道具一个", 8, 2)
										Msg2Player( varMap, varPlayer, "消耗专精之书·防御道具一个", 8, 3)
								else
										Msg2Player( varMap, varPlayer, "没有消耗专精之书·防御道具，无法接第二次任务", 8, 2)
										Msg2Player( varMap, varPlayer, "没有消耗专精之书·防御道具，无法接第二次任务", 8, 3)
										return -1
								end
						end
							
						
						local varRet	= AddQuest( varMap, varPlayer, x300980_var_QuestId, x300980_var_FileId, 1, 0, 0) 
						if varRet == 0 then
											local varStr = "任务已满，任务接受失败！"
											StartTalkTask( varMap)
											TalkAppendString( varMap, varStr )
											StopTalkTask( varMap)
											DeliverTalkTips( varMap, varPlayer)
											Msg2Player(varMap, varPlayer, varStr, 8, 2)
											return 0
						else
											local varIndex = GetPlayerRuntimeData(varMap, varPlayer,RD_GUILDCONTEND_KILL_OTHER)
											local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300980_var_QuestId)
											
											
											SetQuestByIndex(varMap, varPlayer,varQuestIdx,3,varIndex)
											
											x300980_SetDayCount(varMap, varPlayer)   								
											StartTalkTask( varMap)
											TalkAppendString( varMap, "您接受了【个人】防御之路的任务");
											StopTalkTask( varMap);
											DeliverTalkTips( varMap, varPlayer);
											Msg2Player( varMap, varPlayer, "您接受了【个人】防御之路的任务", 8, 2)
											Msg2Player( varMap, varPlayer, "您接受了【个人】防御之路的任务", 8, 3)
								
			
					    end
    else
						DelQuest(varMap, varPlayer , x300980_var_QuestId) 
						
			        
						
						
						
						local nExp = 13
						SetInherenceZhuanFangExp(varMap, varPlayer, nExp)
						
						
						Msg2Player( varMap, varPlayer, "您获得了13点专防技能点数", 8, 2)
						Msg2Player( varMap, varPlayer, "您获得了13点专防技能点数", 8, 3)
						
			        
    end
end


















function x300980_UpdateKillCountProfession(varMap,varPlayer,dieId)
	if varPlayer == dieId then 
		return -1
	end
	
	local killerId = x300980_DealKilledBy_Pet(varMap,varPlayer,dieId)
	x300980_Reset_Cnt(varMap,killerId)

	
	if IsHaveQuestNM( varMap, killerId, x300980_var_QuestId ) == 0 then	
							return
	else	

						    local varTeamSize = GetNearTeamCount( varMap, killerId)
						    if varTeamSize <= 1 then 
						    
											local varQuestIdx 		=  GetQuestIndexByID( varMap, killerId, x300980_var_QuestId )
											local varIndex 		=  GetQuestParam(varMap, killerId, varQuestIdx,3)
											local nProfession   =  x300980_var_Profession_Enum[varIndex]
											
											
											local varToday = GetDayOfYear()
											local varLastday = GetPlayerGameData(varMap, killerId, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3])
											if varLastday ~= varToday then 
														if nProfession      == GetZhiye(varMap, dieId) and GetCurCountry(varMap,dieId) ~=0  then 
																local nKillCnt = GetQuestParam( varMap, killerId, varQuestIdx , 2 )
																nKillCnt       = nKillCnt + 1
																SetQuestByIndex(varMap, killerId, varQuestIdx,2,nKillCnt)
																SetPlayerGameData(varMap, killerId, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3], varToday)
																x300980_QuestLogRefresh( varMap, killerId, x300980_var_QuestId)
														end
											else	
														if nProfession      == GetZhiye(varMap, dieId) and GetCurCountry(varMap,dieId) ~=0 then          
																local nKillCnt = GetQuestParam( varMap, killerId, varQuestIdx , 2 )
																nKillCnt       = nKillCnt + 1
																SetQuestByIndex(varMap, killerId, varQuestIdx,2,nKillCnt) 
																if nKillCnt >= x300980_var_Quest_Kill_Cnt then
																	SetQuestByIndex(varMap, killerId, varQuestIdx,7, 1 ) 
																	SetQuestByIndex(varMap, killerId, varQuestIdx,0, 1 ) 
																end
																x300980_QuestLogRefresh( varMap, killerId, x300980_var_QuestId)
														end	
											 end
						    
						    else
								        for varI = 0, varTeamSize - 1 do
								            local memberId = GetNearTeamMember( varMap, killerId, varI)
								            if memberId >= 0 and IsPlayerStateNormal( varMap, memberId) == 1 then
													if IsHaveQuestNM( varMap, memberId, x300980_var_QuestId) ~= 0 then 
																				local varQuestIdx = GetQuestIndexByID( varMap, memberId, x300980_var_QuestId)
															                    if GetQuestParam( varMap, memberId, varQuestIdx, 0) == 0 or GetQuestParam( varMap, memberId, varQuestIdx, 7) == 0 then
																								local varQuestIdx 		=  GetQuestIndexByID( varMap, memberId, x300980_var_QuestId )
																								local varIndex 		=  GetQuestParam(varMap, memberId, varQuestIdx,3)
																								local nProfession   =  x300980_var_Profession_Enum[varIndex]
																								
																								
																								local varToday = GetDayOfYear()
																								local varLastday = GetPlayerGameData(varMap, memberId, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3])
																								if varLastday ~= varToday then 
																											if nProfession      == GetZhiye(varMap, dieId) and GetCurCountry(varMap,dieId) ~=0  then 
																													local nKillCnt = GetQuestParam( varMap, killerId, varQuestIdx , 2 )
																													nKillCnt       = nKillCnt + 1
																													SetQuestByIndex(varMap, memberId, varQuestIdx,2,nKillCnt)
																													SetPlayerGameData(varMap, memberId, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3], varToday)
																													x300980_QuestLogRefresh( varMap, memberId, x300980_var_QuestId)
																											end
																								else	
																											if nProfession      == GetZhiye(varMap, dieId) and GetCurCountry(varMap,dieId) ~=0 then          
																													local nKillCnt = GetQuestParam( varMap, memberId, varQuestIdx , 2 )
																													nKillCnt       = nKillCnt + 1
																													SetQuestByIndex(varMap, memberId, varQuestIdx,2,nKillCnt) 
																													if nKillCnt >= x300980_var_Quest_Kill_Cnt then
																														SetQuestByIndex(varMap, memberId, varQuestIdx,7, 1 ) 
																														SetQuestByIndex(varMap, memberId, varQuestIdx,0, 1 ) 
																													end
																													x300980_QuestLogRefresh( varMap, memberId, x300980_var_QuestId)
																											end	
																								 end
																				end
													end
										  end
									end
							end


	end
end




function x300980_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
	
	local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x300980_var_QuestId);
	local varQuestIdx 		=  GetQuestIndexByID( varMap, varPlayer, varQuest )
	local nKillCnt 		=  GetQuestParam(varMap, varPlayer, varQuestIdx,2)
	if varHaveQuest > 0 then
				if nKillCnt >= x300980_var_Quest_Kill_Cnt then
						local varStr = "完成任务"
						Msg2Player(varMap,varPlayer,varStr,8,2)
						StartTalkTask(varMap);
						TalkAppendString(varMap, varStr);
						StopTalkTask();
						DeliverTalkTips(varMap, varPlayer)						
						
						
						x300980_SetDayCount(varMap, varPlayer)
						
						
						
						return
				end
	end
end



















function x300980_ProcQuestAbandon( varMap, varPlayer, varQuest )
	
	
	DelQuest( varMap, varPlayer, x300980_var_QuestId )
	
	Msg2Player(varMap, varPlayer, "您放弃了任务【个人】防御之路！", 0, 2)
end






function x300980_GetDayCount(varMap, varPlayer)
	
	if x300980_var_Quest_Max_Count > 0 then
		local varToday = GetDayOfYear()
		local varLastday = GetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3])
		if varLastday ~= varToday then
			return 0
		end

		local varDaycount =  GetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DAYCOUNT[1], MD_FANGYUZHILU_DAYCOUNT[2], MD_FANGYUZHILU_DAYCOUNT[3])
		return varDaycount

	end
	return 0
end







function x300980_SetDayCount(varMap, varPlayer)
	
    local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3])
	if varLastday ~= varToday then
			
		SetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3], varToday)
		SetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DAYCOUNT[1], MD_FANGYUZHILU_DAYCOUNT[2], MD_FANGYUZHILU_DAYCOUNT[3], 1)		
	else
				
		local varDaycount = GetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DAYCOUNT[1], MD_FANGYUZHILU_DAYCOUNT[2], MD_FANGYUZHILU_DAYCOUNT[3])
		SetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DAYCOUNT[1], MD_FANGYUZHILU_DAYCOUNT[2], MD_FANGYUZHILU_DAYCOUNT[3], varDaycount+1)		
	end
end








function x300980_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest) 
	
	
	
	if varObjData ~= 9526 and varObjData ~= 9527 then 
		return -1
	end
	
    local varTeamSize = GetNearTeamCount( varMap, varPlayer)
    if varTeamSize <= 1 then 
    
				local varQuestIdx 		=  GetQuestIndexByID( varMap, varPlayer, x300980_var_QuestId )
				local nKillCnt = GetQuestParam( varMap, varPlayer, varQuestIdx , 2 )
				
				
				
				local varToday = GetDayOfYear()
				local varLastday = GetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3])
				if varLastday ~= varToday then 
					nKillCnt = 1
					SetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3], varToday)
					SetPlayerGameData(varMap,varPlayer, MD_FANGYUZHILU_DAYCOUNT[1], MD_FANGYUZHILU_DAYCOUNT[2], MD_FANGYUZHILU_DAYCOUNT[3], 1)
					SetQuestByIndex(varMap, varPlayer, varQuestIdx,7, 0 )
				else
					nKillCnt       = nKillCnt + 1
				end
				
				SetQuestByIndex(varMap, varPlayer, varQuestIdx,2,nKillCnt) 
				if nKillCnt >= x300980_var_Quest_Kill_Cnt then
				
				if x300980_var_PrintLogToggle == 1 then
					print("...........................................................")
				end
				
					SetQuestByIndex(varMap, varPlayer, varQuestIdx,7, 1 ) 
					SetQuestByIndex(varMap, varPlayer, varQuestIdx,0, 1 ) 
				end
				
				x300980_QuestLogRefresh( varMap, varPlayer, varQuest)
    
    else
		        for varI = 0, varTeamSize - 1 do
		            local memberId = GetNearTeamMember( varMap, varPlayer, varI)
		            if memberId >= 0 and IsPlayerStateNormal( varMap, memberId) == 1 then
							if IsHaveQuestNM( varMap, memberId, x300980_var_QuestId) ~= 0 then 
														local varQuestIdx = GetQuestIndexByID( varMap, memberId, x300980_var_QuestId)
									                    if GetQuestParam( varMap, memberId, varQuestIdx, 0) == 0 or GetQuestParam( varMap, memberId, varQuestIdx, 7) == 0 then
																		local varQuestIdx 		=  GetQuestIndexByID( varMap, memberId, x300980_var_QuestId )
																		local nKillCnt = GetQuestParam( varMap, memberId, varQuestIdx , 2 )
																		
																		
																		
																		local varToday = GetDayOfYear()
																		local varLastday = GetPlayerGameData(varMap, memberId, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3])
																		if varLastday ~= varToday then 
																			nKillCnt = 1
																			SetPlayerGameData(varMap, memberId, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3], varToday)
																			SetQuestByIndex(varMap, memberId, varQuestIdx,7, 0 )
																		else
																			nKillCnt       = nKillCnt + 1
																		end
																		
																		SetQuestByIndex(varMap, memberId, varQuestIdx,2,nKillCnt) 
																		if nKillCnt >= x300980_var_Quest_Kill_Cnt then
																		
																		if x300980_var_PrintLogToggle ==1 then
																			print("...........................................................")
																		end
																		
																			SetQuestByIndex(varMap, memberId, varQuestIdx,7, 1 ) 
																			SetQuestByIndex(varMap, memberId, varQuestIdx,0, 1 ) 
																		end
																		
																		x300980_QuestLogRefresh( varMap, memberId, varQuest)
														end
							end
				  end
			end
end
	

	
end

function x300980_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
	x300980_QuestLogRefresh( varMap, varPlayer, varQuest );
end

function x300980_QuestLogRefresh( varMap, varPlayer, varQuest)
	
    if IsHaveQuestNM( varMap, varPlayer, x300980_var_QuestId ) == 0 then	
    		return
    end
    
	local quest = "  击败#G"
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x300980_var_QuestId)
	local nIdx		 = GetQuestParam( varMap, varPlayer, varQuestIdx , 3)          
	if nIdx <=0 or nIdx > getn(x300980_var_Profession_Desc) then
		return
	end
	local strPro   = x300980_var_Profession_Desc[nIdx]	
	quest = quest..strPro.."#W职业的敌国玩家或者#G练功人偶#W"							
	
	local nRemain = 0
	local nKillCnt = 0;
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3])
	if varLastday ~= varToday then 
		nKillCnt = GetQuestParam( varMap, varPlayer, varQuestIdx , 2 )
		nRemain = x300980_var_Quest_Kill_Cnt
	else										
		nKillCnt = GetQuestParam( varMap, varPlayer, varQuestIdx , 2 )
		nRemain = x300980_var_Quest_Kill_Cnt - nKillCnt
	end
		
	local strTarget  = format("%d",nKillCnt) 				
	StartTalkTask(varMap)
	if nKillCnt < x300980_var_Quest_Kill_Cnt then
				AddQuestLogCustomText( varMap,
										x300980_var_QuestName,		
										x300980_var_QuestName,      
										quest.."("..strTarget.."/6)",					
										x300980_var_CommitNPC,		
										quest,               		
										x300980_var_QuestInfo.."\n \n#Y任务奖励：#W\n专防训练点数：13点 ",				
										"使用专精之书·防御道具每天可以多接一次任务"			
										)
	else
				AddQuestLogCustomText( varMap,
										x300980_var_QuestName,		
										x300980_var_QuestName,      
										quest.."(6/6)",		
										x300980_var_CommitNPC,		
										quest,               		
										x300980_var_QuestInfo.."\n \n#Y任务奖励：#W\n专防训练点数：13点 ",				
										"使用专精之书·防御道具每天可以多接一次任务"			
										)
	end
	StopTalkTask()
	DeliverTalkRefreshQuest(varMap, varPlayer, x300980_var_QuestId);
end

function x300980_DealKilledBy_Pet(varMap,varPlayer,dieId)
	local killerId = varPlayer
	--如果是宠物杀死,需要取得主人的信息
	local ObjType = GetObjType(varMap, varPlayer)
	if ObjType == 3 then
		killerId = GetOwnerID(varMap, varPlayer)
	else
		killerId = varPlayer
	end
	return killerId
end


function x300980_Reset_Cnt(varMap,varPlayer)
	--如果有任务,而且跨天，则把次数重置为1
	if IsHaveQuestNM( varMap,varPlayer, x300980_var_QuestId ) ~= 0 then
	    local today = GetDayOfYear()
		local lastday = GetPlayerGameData(varMap,varPlayer, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3])
		if lastday ~= today then
			SetPlayerGameData(varMap,varPlayer, MD_FANGYUZHILU_DATE[1], MD_FANGYUZHILU_DATE[2], MD_FANGYUZHILU_DATE[3], today)
			SetPlayerGameData(varMap,varPlayer, MD_FANGYUZHILU_DAYCOUNT[1], MD_FANGYUZHILU_DAYCOUNT[2], MD_FANGYUZHILU_DAYCOUNT[3], 1)		
		end

	end
end
