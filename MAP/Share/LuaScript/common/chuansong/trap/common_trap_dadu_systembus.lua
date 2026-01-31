

x310083_var_FileId = 310083
x310083_var_table ={}

--注意 varplayer是实际为飞艇的ID，因为飞艇进入区域触发下面ProcAreaEntered函数
function x310083_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )

    local busid =varPlayer
		if x310083_var_table[busid] ==nil then
		 x310083_var_table[busid] =0
		end


	local selfType = GetObjType(varMap, varPlayer)

	 
	 if selfType == 9 then	
		  local BusType =GetBusType(varMap, varPlayer)	
		
			if 	BusType~=1 then
			
			 return
			end
	    
	    local RandomEvent = random(1,100)
	    
	  
	  	local memberCount = GetBusSize(varMap, varPlayer)
	  	for	varI = 0, memberCount - 1 do
				local varObj = GetBusMemberObjId(varMap, varPlayer, varI)
				if varObj ~= -1 then
--	       local BusId =	LuaCallNoclosure( 310080, "GetBusId")
	      if x310083_var_table[busid]<4 then
	        if RandomEvent <=33 then
	        Msg2Player(varMap,varObj,"莫名的一阵东风袭来，请坐稳，我们要加速了！！！",8,3)

					
					SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer, 31056,3000)
					end
					 if RandomEvent >33 and RandomEvent<=66 then
	     
	        Msg2Player(varMap,varObj,"哦，不好。。。飞艇起火了！！！",8,3)

					
					SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer, 31057,3000)
					SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer, 31059,10000)
					SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer, 31059,15000)
					SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer, 31059,20000)
					SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer, 31059,25000)
					
--					SendSpecificImpactToUnit(varMap,varObj,varObj,varObj, 32105,1000)
--					SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer, 32105,1000)
					local nLevel = GetLevel( varMap, varObj )
					local bonusExp = nLevel * 200 
		  	  AddExp( varMap,varObj, bonusExp )
		  	  
		  	  local varStr = "#Y特殊事件特别奖励！获得经验："..bonusExp.."点"
			
					StartTalkTask( varMap )
					TalkAppendString( varMap, varStr )
					StopTalkTask()
					DeliverTalkTips( varMap, varObj )
					
					
					end
					
					if RandomEvent >66 and RandomEvent<=100 then
	        Msg2Player(varMap,varObj,"哦。。天气不太好，我们还是慢点吧！！！",8,3)
	        local nLevel = GetLevel( varMap, varObj )
	        local bonusExp = nLevel * 50 
		  	  AddExp( varMap,varObj, bonusExp )
          local varStr = "#Y特殊事件特别奖励！获得经验："..bonusExp.."点"
			
					StartTalkTask( varMap )
					TalkAppendString( varMap, varStr )
					StopTalkTask()
					DeliverTalkTips( varMap, varObj )
					
					SendSpecificImpactToUnit(varMap,varPlayer,varPlayer,varPlayer, 31058,3000)
					end
				end
	     end
	    end
	  
	  x310083_var_table[busid] =x310083_var_table[busid]+1

			if x310083_var_table[busid]>5 then
		local busType = GetBusType(varMap, varPlayer)
		if busType == 1 then 
			local memberCount = GetBusSize(varMap, varPlayer)
			for	varI = 0, memberCount - 1 do
				local varObj = GetBusMemberObjId(varMap, varPlayer, varI)
				if varObj ~= -1 then
					DelBusMember(varMap, varObj, varPlayer)
					SetWanFaExpMult(  varMap, varObj,  0 )
					CancelSpecificImpact(varMap,varObj, 7060)
					CancelSpecificImpact(varMap,varObj, 32105)
					x310083_var_table[busid] ={}
					ChangePlayerProperty(varMap, varObj, 0, 0)
				end
			end
			
			DeleteBus(varMap, varPlayer,1)
		end
	 end
	 end
	
end


function x310083_ProcMapTimerTick( varMap, monsterobjid )

end


function x310083_ProcAreaLeaved( varMap, monsterobjid, varScript, varQuest )

end

function x310083_ProcEventEntry( varMap, monsterobjid )

end

	
