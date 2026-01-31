
x310840_var_FileId	= 310840


x310840_g_ItemList={"比翼双飞巧克力","真爱永恒巧克力"}
x310840_g_LevelLess=40
x310840_g_LevelMax=160

function x310840_ProcEventEntry()

end




function x310840_ProcIntervalOverEvent( varMap, varPlayer )
	local year, month, day = GetYearMonthDay()
	if year> 2012 or month > 2 or day > 20 or day < 14 then
			DispelSpecificImpact(varMap, varPlayer ,32701)
			return 
	end	

	local hour, minute, sec = GetHourMinSec()
	if GetLevel(varMap, varPlayer) < x310840_g_LevelLess or GetLevel(varMap, varPlayer) > x310840_g_LevelMax then
		 return 
	end


	if HasTeam(varMap, varPlayer) ~= 1 then --是否组队
			return 0
	end
	
		local varTeamSize = GetNearTeamCount(varMap, varPlayer)  --队伍中的玩家是否有自己的伴侣
   	local IshaveAR =0
   
		  for varI = 0, varTeamSize -1 do
		  	
				if varPlayer ~= GetNearTeamMember(varMap, varPlayer, varI) then
				  if IsSpouses(varMap, varPlayer, GetNearTeamMember(varMap, varPlayer, varI)) == 1 then 
				  	IshaveAR = 1
						 break			
					end		
				end
			end
			
			if IshaveAR == 0 then
			  Msg2Player( varMap, varPlayer, "请尽快和您的伴侣回到一起，获得情人节巧克力，一起享受情人节巧克力的温馨浪漫！", 8, 3)
			  return
			end









--local targetId = GetTeamSceneMember(varMap, varPlayer, 0)
--
--if IsSpouses(varMap, varPlayer, targetId) ~= 1 then --是否是夫妻
--		
--			
--		return 0
--	
--	end	
--if IsInDist(varMap, varPlayer, targetId, 10) ~= 1 then
--			
--			Msg2Player( varMap, varPlayer, "请尽快和您的伴侣回到一起，获得情人节巧克力，一起享受情人节巧克力的温馨浪漫！", 8, 3)
--			return 0
--end

if hour< 20 or hour >= 23 then
		
		--Msg2Player( varMap, varPlayer, "现在不是活动时间，无法领取情人节巧克力。", 8, 2)
		return 
		
		elseif hour ==22 and minute>30 then
		--Msg2Player( varMap, varPlayer, "现在不是活动时间，无法领取情人节巧克力。", 8, 2)
		return
		
		
		
end	   


x310840_AddBonus(varMap, varPlayer)





end


function x310840_ProcActiveEvent( varMap, varPlayer )
	--local nMyQuestId = x310840_GetQuestId( varMap, varPlayer )




end


function x310840_ProcFadeOutEvent( varMap, varPlayer )


end



function x310840_AddBonus(varMap, varPlayer)
	
		local randcountnum =0
		local rand1countnum =0
	
local rand =random(1,150)
		StartItemTask(varMap)
				if rand<=30 then
					randcountnum =1
					ItemAppendBind( varMap, 12260015, 1 ) --1分钟巧克力
				elseif 	rand ==31 then
				   randcountnum =2
					ItemAppendBind( varMap, 12260016, 1 ) --2小时巧克力
				end	
			if randcountnum ~= 0	then
				 local ret = StopItemTask(varMap,varPlayer)
			   if ret > 0 then 
					 DeliverItemListSendToPlayer(varMap,varPlayer)	
			   	 Msg2Player( varMap,varPlayer,"恭喜您获得了1个"..x310840_g_ItemList[randcountnum],8,3) 
			   	 SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 8322, 0)
		   	 else
				  StartTalkTask(varMap)
				  TalkAppendString(varMap,"背包空间不足！")	
				  StopTalkTask(varMap)
				  DeliverTalkTips(varMap,varPlayer)
			   end
			end			
		
		
		
		
		
		
		
	
	
		local rand1 =random(1,1000)
		
		if rand1<=57 then
			local rand1countnum =1
			StartItemTask(varMap)
			ItemAppendBind( varMap, 12260011, 1 ) --情人节首饰碎片
			 local ret = StopItemTask(varMap,varPlayer)
		   if ret > 0 then 
			
				DeliverItemListSendToPlayer(varMap,varPlayer)	
	   	 Msg2Player( varMap,varPlayer,"恭喜您获得了情人节首饰碎片一个",8,3) 
	   	 SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 8322, 0)
	   	 else
			  StartTalkTask(varMap)
			  TalkAppendString(varMap,"背包空间不足！")	
			  StopTalkTask(varMap)
			  DeliverTalkTips(varMap,varPlayer)
		   end
			
	  end


   

    if randcountnum ==0 and rand1countnum==0 then
		local targetName =0

		local varTeamSize = GetNearTeamCount(varMap, varPlayer)
   
		  for varI = 0, varTeamSize -1 do
				if   varPlayer ~= GetNearTeamMember(varMap, varPlayer, varI) then
				  if IsSpouses(varMap, varPlayer, GetNearTeamMember(varMap, varPlayer, varI)) == 1 then 
				  	targetName = GetNearTeamMember(varMap, varPlayer, varI)
				  	
						 break			
					end		
				end
			end
	

	--------
	  local countryName =GetCountryName(varMap, varPlayer)
	 
	  local PlayerName1 =GetName( varMap, varPlayer)
	  local PlayerName2 =GetName( varMap, targetName)
	  local msg = countryName.."的"..PlayerName1.."突然拿出一支钟情一生玫瑰出现在"..PlayerName2.."面前，大声的喊出了（此处省略3个字）"
	
	  local msg2 = countryName.."的"..PlayerName1.."搂着"..PlayerName2.."含情脉脉地给"..PlayerName2.."的右脸留下一个粉红的唇印后说:都老夫老妻了还搞得这么浪漫。"
		
		local msgrand =random(1,100)
		  if msgrand <=50  then
		   Msg2Player( varMap,varPlayer,msg,1,1) 
		  else
		   Msg2Player( varMap,varPlayer,msg2,1,1) 
	    end
	  end

end


function x310840_ProcessQuestFail(varMap, varPlayer, varQuest)

end
