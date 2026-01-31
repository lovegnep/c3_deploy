

x310327_var_FileId = 310327
x310327_var_ask ={"进入天上人间·麒麟(65级)","确定"}
x310327_var_answer ={"\t想进入大都天上人间·麒麟么？那里有着无数热闹好玩的新鲜玩法，钧窑和勾栏曲台也在其中。\n\t天上人间·麒麟在每周六、日的09：00——23：00开放！每周六、日第一次进入天上人间·麒麟需要#R花费25两现银或银卡#W。\n\t你想现在进去看看么？"}

x310327_var_Item = 12035005 

function x310327_IsEnterFirst(varMap ,varPlayer)
	local varToday = GetDayOfYear()
	local varLastday = GetPlayerGameData(varMap, varPlayer, MD_YOULECHANG_DATE[1], MD_YOULECHANG_DATE[2], MD_YOULECHANG_DATE[3])
	if varToday ~= varLastday then
		return 1
	end
	
	
	return 0
end

function x310327_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		
		local varLevel =GetLevel(varMap, varPlayer)
		if which == 0 then
				StartTalkTask(varMap)
				TalkAppendButton(varMap, x310327_var_FileId, x310327_var_ask[1],0,1)
		  	StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x310327_var_answer[1])
			TalkAppendButton(varMap, x310327_var_FileId, x310327_var_ask[2],0,2)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
		
			if IsInChariot(varMap, varPlayer) > 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"抱歉，乘坐战车状态不能进入天上人间·麒麟。")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
			end    
			
			if IsNewServer()==1 then
				if GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) < 70 then
					 Msg2Player(varMap,varPlayer,"很抱歉，等级排行榜最后一名玩家未到70级，无法进入天上人间·麒麟",8,3)
       		 return 0
    	  elseif GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) ) >= 85 then
    			 	if varLevel >=85 then
    				Msg2Player(varMap,varPlayer,"很抱歉，您等级过高，无法进入天上人间·麒麟",8,3)
    			 	return 0
   	 			 	end
   	 	 end
   	 end	
            
            
            
           
			
			
		
		
		
		
		
		
		
		
	
	
      if varLevel>= 65 then
        local subsillertype=1
       	if GetWeek() ~= 0 and GetWeek() ~= 6 then
            		StartTalkTask(varMap)
					TalkAppendString(varMap,"\t天上人间·麒麟只有在周六、日才会开启，到时候再来吧。")				
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
					return
				end
				
				local curTime = GetMinOfDay()
				if curTime < 540 then
					StartTalkTask(varMap)
					TalkAppendString(varMap,"\t天上人间·麒麟还未开放，请上午9：00以后再来。")				
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
					return
				end			
				
				if curTime >= 1380 then
					StartTalkTask(varMap)
					TalkAppendString(varMap,"\t天上人间·麒麟已经关闭，下次开放时间再来吧。")				
					StopTalkTask(varMap)
					DeliverTalkMenu(varMap,varPlayer,varTalknpc)
					return
				end
		
				








				local varRes =  GetSillerMode(varMap, varPlayer) 
				print("ss",varRes)
				local varRet = x310327_IsEnterFirst(varMap ,varPlayer)
   				if varRet == 1 then  
					if GetSillerMode(varMap, varPlayer) == 1 then
						if CostMoney(varMap, varPlayer, 0, 25000) == -1 then				
							if CostMoney(varMap, varPlayer, 1, 25000) == -1 then
								StartTalkTask(varMap)
								TalkAppendString(varMap, "很抱歉，当天第一次进入天上人间·麒麟要花费25两现银或银卡");
								StopTalkTask(varMap)
								DeliverTalkTips(varMap,varPlayer)	
								Msg2Player(varMap,varPlayer,"很抱歉，当天第一次进入天上人间·麒麟要花费25两现银或银卡",8,2)				
								return
							else
								subsillertype	=	0
							end
						else
							subsillertype	=	1
						end
					else
						if CostMoney(varMap, varPlayer,1, 25000) == -1 then
							if CostMoney(varMap, varPlayer, 0, 25000) == -1 then	
								StartTalkTask(varMap)
								TalkAppendString(varMap, "很抱歉，当天第一次进入天上人间·麒麟要花费25两现银或银卡");
								StopTalkTask(varMap)
								DeliverTalkTips(varMap,varPlayer)	
								Msg2Player(varMap,varPlayer,"很抱歉，当天第一次进入天上人间·麒麟要花费25两现银或银卡",8,2)				
								return
							else
								subsillertype	=	1
							end
						else
							subsillertype =	0
						end
					end
				end
				if LuaCallNoclosure(COUNTRY_BATTLE_LITE_SCRIPT,"CheckCountryBattleLiteSceneTrans",varMap,varPlayer,0) == 0 then
					
					return
				end
				
				if varRet == 1  then
					
					if HaveItemInBag(varMap, varPlayer, x310327_var_Item) <= 0 then
						StartItemTask( varMap )	
						ItemAppendBind( varMap, x310327_var_Item, 1)
						local varRet = StopItemTask( varMap, varPlayer )
						if varRet > 0 then
							DeliverItemListSendToPlayer(varMap,varPlayer)
							
							local varMsg = format("#Y获得#G1个#Y#{_ITEM%d}",x310327_var_Item)
							Msg2Player(varMap,varPlayer,varMsg,8,2)
						else	
							local varMsg = format("#Y背包空间不足，无法得到#{_ITEM%d}！",x310327_var_Item)			
							Msg2Player(varMap,varPlayer,varMsg,8,3)
							
							
							if subsillertype ==	1 then 
								AddMoney( varMap, varPlayer, 0, 25000 )
							elseif subsillertype == 0 then
								AddMoney( varMap, varPlayer, 1, 25000 )
							end
							return
						end
					end
					
					local varBagIdx = FindFirstBagIndexOfItem( varMap, varPlayer, x310327_var_Item)
					
					if varBagIdx >= 0 then
						GamePlayScriptLog(varMap, varPlayer, 1611)
						local varCount = GetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO1)
						SetCountryParam( varMap, 0, CD_YOULECHANG_CAIPIAO1, varCount+1)
						
						SetItemParam( varMap, varPlayer, varBagIdx, 4, 2, varCount )
						SetItemParam( varMap, varPlayer, varBagIdx, 8, 2, GetDayOfYear() )
					end
				end
				if IsHaveSpecificImpact( varMap, varPlayer, 7718) == 1 then
					CancelSpecificImpact( varMap, varPlayer, 7718)	
				end				
				if IsHaveSpecificImpact( varMap, varPlayer, 7717) == 1 then
					CancelSpecificImpact( varMap, varPlayer, 7717)	
				end
				SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 7717, 0)
								
				
				NewWorld( varMap, varPlayer, 39, 204 + random( -2,2 ), 203 + random( -2, 2), 310327)
				if varRet == 1 then  
           		if subsillertype	==	1 then
           			Msg2Player(varMap,varPlayer,"您花费了25两现银进入了天上人间·麒麟。",8,2)	
           		else
           			Msg2Player(varMap,varPlayer,"您花费了25两银卡进入了天上人间·麒麟。",8,2)		
	           		end
           		end
           		local varToday = GetDayOfYear()
           		SetPlayerGameData(varMap, varPlayer, MD_YOULECHANG_DATE[1], MD_YOULECHANG_DATE[2], MD_YOULECHANG_DATE[3], varToday)
           		
           		
            else 
            	StartTalkTask(varMap)
            	TalkAppendString(varMap,"\t很抱歉，只有不低于65级的玩家才能进入天上人间·麒麟。")
            	StopTalkTask()
            	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
      end
    end
	

	
	
end








function x310327_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
		local minlevel = GetTopListInfo_MinLevel(GetWorldID(varMap, varPlayer))
		
			TalkAppendButton(varMap, x310327_var_FileId, x310327_var_ask[1],3,1)
		
end








