--DECLARE_QUEST_INFO_START--

x302624_var_ScriptId 	  = 302624
x302624_var_MissionName = "强化军粮镖车能力"
x302624_var_MissionName1 = "强化军粮镖车能力（当前为0级）"
x302624_var_MissionName2 = "强化军粮镖车能力（当前为1级）"
x302624_var_MissionName3 = "强化军粮镖车能力（当前为2级）"
x302624_var_MissionName4 = "强化军粮镖车能力（当前为3级）"
x302624_var_MissionName5 = "强化军粮镖车能力（当前为4级）"
x302624_var_MissionName6 = "强化军粮镖车能力（已为最高级）"
x302624_var_num =1


x302624_var_butonlevel ={}

x302624_CostGold		= { 400,800,1600,3200,6400}
x302624_var_Missioninfo1={
                          "\t您当前镖车没有任何护甲效果\n",
                          "\t您当前镖车护甲为皮质装甲，提升属性为：#G 20%移动速度，20%免伤\n",
                          "\t您当前镖车护甲为青铜装甲，提升属性为：#G 40%移动速度，40%免伤\n",
                          "\t您当前镖车护甲为铁质装甲，提升属性为：#G 60%移动速度，60%免伤\n",
                          "\t您当前镖车护甲为精钢装甲，提升属性为：#G 80%移动速度，80%免伤\n",
                          "\t您当前镖车护甲为黄金装甲，提升属性为：#G 100%移动速度，100%免伤\n"
                         }

x302624_var_Missioninfo2={
                         "\t您确定要花费#R现金#{_MONEY%d}#W，来为镖车添加一级增益效果吗?",
                         "\t您确定要花费#R现金#{_MONEY%d}#W，来为镖车添加二级增益效果吗?",
                         "\t您确定要花费#R现金#{_MONEY%d}#W，来为镖车添加三级增益效果吗?",
                         "\t您确定要花费#R现金#{_MONEY%d}#W，来为镖车添加四级增益效果吗?",
                         "\t您确定要花费#R现金#{_MONEY%d}#W，来为镖车添加五级增益效果吗?",
                         "\t您的镖车装甲已为最高级，请尽快将镖车送往目的地。"
                         }    
                         
x302624_var_Missioninfo3={
                          "\t提升后为镖车添加皮质装甲，提升属性为：#G 20%移动速度，20%免伤",
                          "\t提升后为镖车添加青铜装甲，提升属性为：#G 40%移动速度，40%免伤",
                          "\t提升后为镖车添加铁质装甲，提升属性为：#G 60%移动速度，60%免伤",
                          "\t提升后为镖车添加精钢装甲，提升属性为：#G 80%移动速度，80%免伤",
                          "\t提升后为镖车添加黄金装甲，提升属性为：#G 100%移动速度，100%免伤",
                          "\t"
                         }                                              
                         
x302624_var_selectId =-1


--DECLARE_QUEST_INFO_STOP--



x302624_var_SubMissionID		=	{
								  {	MisID=10317, DestPosX = 235, DestPosZ = 443, mapID = 250 },
								  {	MisID=10318, DestPosX = 167, DestPosZ = 187, mapID = 251 },
								  {	MisID=10319, DestPosX = 449, DestPosZ = 256, mapID = 251 },
								  {	MisID=10320, DestPosX = 449, DestPosZ = 256, mapID = 251 },
								  {	MisID=10321, DestPosX = 449, DestPosZ = 256, mapID = 251 },	
								  {	MisID=10322, DestPosX = 449, DestPosZ = 256, mapID = 251 }                                       
								}																		

								
								
								
function x302624_ProcEnumEvent( varMap, varPlayer, targetId, MissionId)

 local BusId = GetBusId(varMap, varPlayer)
	if x302624_var_butonlevel[varPlayer] ==nil then
		 x302624_var_butonlevel[varPlayer] =1
	end

if 	BusId ~= -1 then
			if IsHaveSpecificImpact(varMap,BusId,32160) ==0 and IsHaveSpecificImpact(varMap,BusId,32161)==0 and IsHaveSpecificImpact(varMap,BusId,32162)==0 and IsHaveSpecificImpact(varMap,BusId,32163)==0 and IsHaveSpecificImpact(varMap,BusId,32164)==0 then
		 x302624_var_butonlevel[varPlayer] =1
		 end
			
			if IsHaveSpecificImpact(varMap,BusId,32160) ==1 or IsHaveSpecificImpact(varMap,BusId,32165) ==1 then 
		 x302624_var_butonlevel[varPlayer] =2
		end
		
		if IsHaveSpecificImpact(varMap,BusId,32161) ==1 or IsHaveSpecificImpact(varMap,BusId,32166) ==1 then 
		 x302624_var_butonlevel[varPlayer] =3
		end
		
		if IsHaveSpecificImpact(varMap,BusId,32162) ==1 or IsHaveSpecificImpact(varMap,BusId,32167) ==1 then 
		 x302624_var_butonlevel[varPlayer] =4
		end
		
		if IsHaveSpecificImpact(varMap,BusId,32163) ==1 or IsHaveSpecificImpact(varMap,BusId,32168) ==1 then 
		 x302624_var_butonlevel[varPlayer] =5
		end
		
		if IsHaveSpecificImpact(varMap,BusId,32164) ==1 or IsHaveSpecificImpact(varMap,BusId,32169) ==1 then 
		 x302624_var_butonlevel[varPlayer] =6
		end

else 
	x302624_var_butonlevel[varPlayer] =1

end
	local level = GetLevel( varMap, varPlayer )
	if ( level >= 50 ) then
		 if x302624_var_butonlevel[varPlayer]  ==1 then
	    TalkAppendButton( varMap, x302624_var_ScriptId, x302624_var_MissionName1, 3, 10 )
		end
	
		 if x302624_var_butonlevel[varPlayer] ==2 then
			TalkAppendButton( varMap, x302624_var_ScriptId, x302624_var_MissionName2, 3, 20 )
		 end
		 if x302624_var_butonlevel[varPlayer] ==3 then
			TalkAppendButton( varMap, x302624_var_ScriptId, x302624_var_MissionName3, 3, 30 )
		 end
		if x302624_var_butonlevel[varPlayer] ==4 then
			TalkAppendButton( varMap, x302624_var_ScriptId, x302624_var_MissionName4, 3, 40 )
		end
		if x302624_var_butonlevel[varPlayer] ==5 then
		TalkAppendButton( varMap, x302624_var_ScriptId, x302624_var_MissionName5, 3, 50 )
		end
			if x302624_var_butonlevel[varPlayer] ==6 then
		TalkAppendButton( varMap, x302624_var_ScriptId, x302624_var_MissionName6, 3, 60 )
		end
    StopTalkTask(varMap)
	end
end



--点击（按钮）点击该任务后执行此脚本
function x302624_ProcEventEntry( varMap, varPlayer, targetId, MissionId,seleteId )
 	if x302624_IsCanAccept( varMap, varPlayer )~=1 then
            return
   end

	if x302624_var_butonlevel[varPlayer] ==nil then
		 x302624_var_butonlevel[varPlayer] =1
	end

			 local InBus = IsBusMember(varMap, varPlayer)
		
			if InBus ~= 1 then
				   Msg2Player(varMap,varPlayer,"您没有领取镖车。",8,3)	
				return
			end

	    local BusId = GetBusId(varMap, varPlayer)


			for i,itm in x302624_var_SubMissionID do
		
				local bHaveMission = IsHaveQuestNM(varMap, varPlayer, itm.MisID )
				if bHaveMission > 0 then
				
					
						if BusId ~= -1 then
		  
							if seleteId ==10 then
							  StartTalkTask(varMap)
								TalkAppendString(varMap,"#Y强化军粮镖车能力" )
								TalkAppendString(varMap,x302624_var_Missioninfo1[x302624_var_butonlevel[varPlayer]] )
							
							  TalkAppendString(varMap,format(x302624_var_Missioninfo2[x302624_var_butonlevel[varPlayer]],x302624_CostGold[x302624_var_butonlevel[varPlayer]]) );
								TalkAppendString(varMap,x302624_var_Missioninfo3[x302624_var_butonlevel[varPlayer]] )
								TalkAppendButton(varMap, x302624_var_ScriptId, "我要升级镖车",13,1)
								StopTalkTask(varMap)
							DeliverTalkMenu(varMap, varPlayer, targetId, x302624_var_ScriptId, x302624_var_MissionName1);
--							  SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,31056,0)
--								Msg2Player(varMap,varPlayer,"您已为您的镖车添加一级增益效果。",8,3)	
							end
						  
						  if seleteId ==20 then
						   StartTalkTask(varMap)
				        TalkAppendString(varMap,"#Y强化军粮镖车能力" )
								TalkAppendString(varMap,x302624_var_Missioninfo1[x302624_var_butonlevel[varPlayer]] )
							
								TalkAppendString(varMap, format(x302624_var_Missioninfo2[x302624_var_butonlevel[varPlayer]],x302624_CostGold[x302624_var_butonlevel[varPlayer]]));
								TalkAppendString(varMap, x302624_var_Missioninfo3[x302624_var_butonlevel[varPlayer]])
								TalkAppendButton(varMap, x302624_var_ScriptId, "我要升级镖车",13,2)
								StopTalkTask(varMap)
						DeliverTalkMenu(varMap, varPlayer, targetId, x302624_var_ScriptId, -1);
--							 SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,31056,0)
--							 Msg2Player(varMap,varPlayer,"您已为您的镖车添加二级增益效果。",8,3)	
							end
					    
					    if seleteId ==30 then
                StartTalkTask(varMap)
							  TalkAppendString(varMap,"#Y强化军粮镖车能力" )
							  TalkAppendString(varMap,x302624_var_Missioninfo1[x302624_var_butonlevel[varPlayer]] )
							
								TalkAppendString(varMap, format(x302624_var_Missioninfo2[x302624_var_butonlevel[varPlayer]],x302624_CostGold[x302624_var_butonlevel[varPlayer]]));
								TalkAppendString(varMap, x302624_var_Missioninfo3[x302624_var_butonlevel[varPlayer]])
								TalkAppendButton(varMap, x302624_var_ScriptId, "我要升级镖车",13,3)
								StopTalkTask(varMap)
								DeliverTalkMenu(varMap, varPlayer, targetId, x302624_var_ScriptId, -1);
--							  SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,31057,0)
--								Msg2Player(varMap,varPlayer,"您已为您的镖车添加三级增益效果。",8,3)	
							end
						 
						  if seleteId ==40 then
						   StartTalkTask(varMap)
							  TalkAppendString(varMap,"#Y强化军粮镖车能力" )
							  TalkAppendString(varMap,x302624_var_Missioninfo1[x302624_var_butonlevel[varPlayer]])
							
								TalkAppendString(varMap, format(x302624_var_Missioninfo2[x302624_var_butonlevel[varPlayer]],x302624_CostGold[x302624_var_butonlevel[varPlayer]]));
								TalkAppendString(varMap, x302624_var_Missioninfo3[x302624_var_butonlevel[varPlayer]])
								TalkAppendButton(varMap, x302624_var_ScriptId, "我要升级镖车",13,4)
								StopTalkTask(varMap)
								DeliverTalkMenu(varMap, varPlayer, targetId, x302624_var_ScriptId, -1);
--							 SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,31058,0)
--							 Msg2Player(varMap,varPlayer,"您已为您的镖车添加四级增益效果。",8,3)	
							end
							if seleteId ==50 then
							 StartTalkTask(varMap)
								TalkAppendString(varMap,"#Y强化军粮镖车能力" )
								TalkAppendString(varMap, x302624_var_Missioninfo1[x302624_var_butonlevel[varPlayer]])
							
								TalkAppendString(varMap, format(x302624_var_Missioninfo2[x302624_var_butonlevel[varPlayer]],x302624_CostGold[x302624_var_butonlevel[varPlayer]]));
								TalkAppendString(varMap, x302624_var_Missioninfo3[x302624_var_butonlevel[varPlayer]])
								TalkAppendButton(varMap, x302624_var_ScriptId, "我要升级镖车",13,5)
								StopTalkTask(varMap)
							DeliverTalkMenu(varMap, varPlayer, targetId, x302624_var_ScriptId, -1);
--							 SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,31059,0)
--							 Msg2Player(varMap,varPlayer,"您已为您的镖车添加五级增益效果。",8,3)	
--							end
						end
						if seleteId ==60 then
							 StartTalkTask(varMap)
								TalkAppendString(varMap,"#Y强化军粮镖车能力" )
								TalkAppendString(varMap, x302624_var_Missioninfo1[x302624_var_butonlevel[varPlayer]])
							
								TalkAppendString(varMap, format(x302624_var_Missioninfo2[x302624_var_butonlevel[varPlayer]],x302624_CostGold[x302624_var_butonlevel[varPlayer]]));
								TalkAppendString(varMap, x302624_var_Missioninfo3[x302624_var_butonlevel[varPlayer]])
								--TalkAppendButton(varMap, x302624_var_ScriptId, "我要升级镖车",13,5)
								StopTalkTask(varMap)
							DeliverTalkMenu(varMap, varPlayer, targetId, x302624_var_ScriptId, -1);
--							 SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,31059,0)
--							 Msg2Player(varMap,varPlayer,"您已为您的镖车添加五级增益效果。",8,3)	
--							end
						end
				 
				 end
			 end
      end
            
            
            
          local BusId = GetBusId(varMap, varPlayer)
					if seleteId < 10 then		
						if GetMoney(varMap, varPlayer,2) < x302624_CostGold[seleteId] then
							StartTalkTask(varMap)
							TalkAppendString(varMap, "很抱歉，您身上携带的现金不够支付本次添加增益效果费用。");
							StopTalkTask(varMap)
							DeliverTalkTips(varMap,varPlayer)
							Msg2Player(varMap,varPlayer,"很抱歉，您身上携带的现金不够支付本次添加增益效果费用。",8,2)	
						return 
					end
					if x302624_ProcAcceptCheck( varMap, varPlayer, targetId, MissionId,seleteId ) ~= 1 then
				  	return
				  end

				end
							
							if seleteId ==1 then
				
							  SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,32160,0)
							   SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,32165,0)
							  local CarMaxHp =GetMaxHp(varMap,BusId)

							 
								Msg2Player(varMap,varPlayer,"您已为您的镖车添加一级增益效果。",8,3)	
								x302624_var_butonlevel[varPlayer] =2
								
								
						   StartTalkTask(varMap)
						   TalkAppendString(varMap,"#Y强化军粮镖车能力" )
								TalkAppendString(varMap,x302624_var_Missioninfo1[x302624_var_butonlevel[varPlayer]] )
							
								TalkAppendString(varMap, format(x302624_var_Missioninfo2[x302624_var_butonlevel[varPlayer]],x302624_CostGold[x302624_var_butonlevel[varPlayer]]));
								TalkAppendString(varMap, x302624_var_Missioninfo3[x302624_var_butonlevel[varPlayer]])
								TalkAppendButton(varMap, x302624_var_ScriptId, "我要升级镖车",13,2)
								StopTalkTask(varMap)
								DeliverTalkMenu(varMap, varPlayer, targetId, x302624_var_ScriptId, -1);				
								
							end
						  
						  if seleteId ==2 then
						  
								  SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,32161,0)
							   SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,32166,0)
							 Msg2Player(varMap,varPlayer,"您已为您的镖车添加二级增益效果。",8,3)
							 x302624_var_butonlevel[varPlayer] =3	
							
						   StartTalkTask(varMap)
						   TalkAppendString(varMap,"#Y强化军粮镖车能力" )
								TalkAppendString(varMap,x302624_var_Missioninfo1[x302624_var_butonlevel[varPlayer]] )
							
								TalkAppendString(varMap, format(x302624_var_Missioninfo2[x302624_var_butonlevel[varPlayer]],x302624_CostGold[x302624_var_butonlevel[varPlayer]]));
								TalkAppendString(varMap, x302624_var_Missioninfo3[x302624_var_butonlevel[varPlayer]])
								TalkAppendButton(varMap, x302624_var_ScriptId, "我要升级镖车",13,3)
								StopTalkTask(varMap)
								DeliverTalkMenu(varMap, varPlayer, targetId, x302624_var_ScriptId, -1);
							end
					    
					    if seleteId ==3 then
								  SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,32162,0)
							   SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,32167,0)
								Msg2Player(varMap,varPlayer,"您已为您的镖车添加三级增益效果。",8,3)	
								 x302624_var_butonlevel[varPlayer] =4	
						   StartTalkTask(varMap)
						   TalkAppendString(varMap,"#Y强化军粮镖车能力" )
								TalkAppendString(varMap,x302624_var_Missioninfo1[x302624_var_butonlevel[varPlayer]] )
							
								TalkAppendString(varMap, format(x302624_var_Missioninfo2[x302624_var_butonlevel[varPlayer]],x302624_CostGold[x302624_var_butonlevel[varPlayer]]));
								TalkAppendString(varMap, x302624_var_Missioninfo3[x302624_var_butonlevel[varPlayer]])
								TalkAppendButton(varMap, x302624_var_ScriptId, "我要升级镖车",13,4)
								StopTalkTask(varMap)
								DeliverTalkMenu(varMap, varPlayer, targetId, x302624_var_ScriptId, -1);
							end
						 
						  if seleteId ==4 then
							 	  SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,32163,0)
							   SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,32168,0)
							 Msg2Player(varMap,varPlayer,"您已为您的镖车添加四级增益效果。",8,3)	
							  x302624_var_butonlevel[varPlayer] =5	
						   StartTalkTask(varMap)
						   TalkAppendString(varMap,"#Y强化军粮镖车能力" )
								TalkAppendString(varMap,x302624_var_Missioninfo1[x302624_var_butonlevel[varPlayer]] )
							
								TalkAppendString(varMap, format(x302624_var_Missioninfo2[x302624_var_butonlevel[varPlayer]],x302624_CostGold[x302624_var_butonlevel[varPlayer]]));
								TalkAppendString(varMap, x302624_var_Missioninfo3[x302624_var_butonlevel[varPlayer]])
								TalkAppendButton(varMap, x302624_var_ScriptId, "我要升级镖车",13,5)
								StopTalkTask(varMap)
								DeliverTalkMenu(varMap, varPlayer, targetId, x302624_var_ScriptId, -1);
							end
							if seleteId ==5 then
								  SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,32164,0)
							   SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,BusId,32169,0)
							 Msg2Player(varMap,varPlayer,"您已为您的镖车添加五级增益效果。",8,3)
							 x302624_var_butonlevel[varPlayer] =6		
						   StartTalkTask(varMap)
						   TalkAppendString(varMap,"#Y强化军粮镖车能力" )
								TalkAppendString(varMap,x302624_var_Missioninfo1[x302624_var_butonlevel[varPlayer]] )
							
								TalkAppendString(varMap, format(x302624_var_Missioninfo2[x302624_var_butonlevel[varPlayer]],x302624_CostGold[x302624_var_butonlevel[varPlayer]]));
								TalkAppendString(varMap, x302624_var_Missioninfo3[x302624_var_butonlevel[varPlayer]])
--								TalkAppendButton(varMap, x302624_var_ScriptId, "我要升级镖车",13,2)
								StopTalkTask(varMap)
								DeliverTalkMenu(varMap, varPlayer, targetId, x302624_var_ScriptId, -1);
							end
   
	 end

--检查是否能接受此任务
--返回值：-2--现金不够  -1--没有相关任务 0--镖车不在有效距离	1--可以接受任务
function x302624_IsCanAccept( varMap, varPlayer )

	local bHaveMission = 0
	for i,itm in x302624_var_SubMissionID do

		bHaveMission = IsHaveQuestNM(varMap, varPlayer,itm.MisID )
		if bHaveMission > 0 then
			local valid = IsValidMyselfBus(varMap, varPlayer, itm.MisID)
			if valid == 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，您护送的镖车没在附近，无法添加增益效果,请找到镖车再来。");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,"很抱歉，您护送的镖车没在附近，无法添加增益效果,请找到镖车再来。",8,2)
				return 0
			end
			
			local misIndex = GetQuestIndexByID( varMap, varPlayer, itm.MisID )
			local missionNum = GetQuestParam(varMap, varPlayer, misIndex, 3)
			if ( missionNum ~= 1 ) then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，只有护送军粮镖车才能使用此功能。");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,"很抱歉，只有护送军粮镖车才能使用此功能。",8,2)	
				return 0
			end
		
			return 1
		end
	end

	 --没有任何分舵护送
	 StartTalkTask(varMap)
	 TalkAppendString(varMap, "很抱歉，只有护送军粮镖车才能使用此功能。");
	 StopTalkTask(varMap)
	 DeliverTalkTips(varMap,varPlayer)
	 Msg2Player(varMap,varPlayer,"很抱歉，只有护送军粮镖车才能使用此功能。",8,2)
	 return 0

end


--**********************************
--接受
--**********************************


function x302624_ProcAcceptCheck( varMap, varPlayer, targetId, MissionId,seleteId )

	local bRet = x302624_IsCanAccept( varMap, varPlayer )

	if bRet ~= 1 then
		return 0
	end     
			--现金模式
			if CostMoney( varMap, varPlayer, 2, x302624_CostGold[seleteId], 301 ) == -1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉，您身上携带的现金不够支付本次添加增益效果费用。");
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				Msg2Player(varMap,varPlayer,"很抱歉，您身上携带的现金不够支付本次添加增益效果费用。",8,2)	
				return 0
			end
			return 1

end
function x302624_ProcAccept( varMap, varPlayer )	
							
							
end

--完成任务
--返回1代表成功，0代表交任务失败
function x302624_ProcQuestSubmit( varMap, varPlayer, targetId, selectId, MissionId )

end


--********************************************************************
--放弃
--********************************************************************
function x302624_ProcQuestAbandon( varMap, varPlayer,MissionId )  	


end


function x302624_ProcQuestAttach( varMap, varPlayer, npcId, npcGuid,misIndex, MissionId )
end

---------------------------------------------------------------------------------------------------
--任务日志刷新
---------------------------------------------------------------------------------------------------
function x302624_QuestLogRefresh( varMap, varPlayer, MissionId)
end

function x302624_ProcQuestLogRefresh( varMap, varPlayer, MissionId)

end




