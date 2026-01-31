
x310842_var_FileId 					= 310842
x310842_var_QuestName				= "【情人节】亲密爱人称号"

x310842_var_Title_Cachet_Table 					= {
										{titleID = 176, titleName = "亲密爱人", cachet = 0, varNum = 1}
}

x310842_var_Title_Cachet_Table_Count				=1

x310842_g_LevelLess =40
x310842_g_LevelMax  =160
function x310842_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)

	TalkAppendButton(varMap,x310842_var_FileId,x310842_var_QuestName,3,0);
	
	
	

	TalkAppendButton(varMap,x310842_var_FileId,"【情人节】情人节活动说明",1,1);
end

function x310842_ProcEventEntry(varMap, varPlayer, varTalknpc ,varScript,seleteId)

if seleteId==1 then
  local varString ="#R情人节活动说明#W\n"
  local varStr0 = "\t#G2012年2月14日~2012年2月20日#W期间，夫妻玩家可以到活动使者处领取称号#G【亲密爱人#W\n"
	local varStr1 = "\t每天#G20：00~22：30#W，拥有称号#G【亲密爱人】#W的夫妻，只要组队，便可以获得一个增益效果：#R【心跳】#W\n"
  local varStr2 = "\t当时间超过#G2012年2月20日#W后，自动移除玩家身上此效果\n"
  local varStr3 = "\t拥有#R【心跳】#W效果的玩家每分钟有一定几率获得三种巧克力中的其中一种\n"
  local varStr4 = "\t2012年2月14日~2012年2月20日期间，对好友使用爱无止境或者钟情一生有一定几率随机获得情人节首饰碎片。\n"
  local varStr5 = "\t不同情人节首饰碎片可以兑换不同情人节戒指或手镯。"
  local varStr  = varString..varStr0..varStr1..varStr2..varStr3..varStr4..varStr5


	StartTalkTask(varMap);
	TalkAppendString(varMap, varStr);
	
	StopTalkTask();
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x310842_var_FileId,-1)
	
	return
 end






local year, month, day = GetYearMonthDay();
		if year> 2012 or month > 2 or day > 20 or day < 14 then
				Msg2Player( varMap, varPlayer, "现在不是活动时间", 8, 3)
				
				return 0
		end	
		
		if (GetLevel(varMap, varPlayer) < x310842_g_LevelLess) or (GetLevel(varMap, varPlayer) > x310842_g_LevelMax) then
					  Msg2Player( varMap, varPlayer, "很抱歉，40级以上的玩家才能参与此活动", 8, 3)
					 return 0
					
				end
		if IsHaveTitle(varMap,varPlayer,176)==1 then
		
		  Msg2Player( varMap, varPlayer, "您已经领取过称号【亲密爱人】", 8, 3)
			return 0
		end
		
		if HasTeam(varMap, varPlayer) ~= 1 then
						Msg2Player( varMap, varPlayer, "很抱歉，您还未进行组队无法领取称号。", 8, 3)
						return 0
						
		end
		
		
		local varTeamSize = GetNearTeamCount(varMap, varPlayer)
   	local IshaveAR =0
		  for varI = 0, varTeamSize -1 do
				if   varPlayer ~= GetNearTeamMember(varMap, varPlayer, varI) then
				  if IsSpouses(varMap, varPlayer, GetNearTeamMember(varMap, varPlayer, varI)) == 1 then 
				  	IshaveAR = 1
						 break			
					end		
				end
			end
			if IshaveAR == 0 then
			  Msg2Player( varMap, varPlayer, "很抱歉，您的伴侣不在附近，无法领取称号。", 8, 3)
			  return
			end
		
	
		
		
		AwardTitle(varMap, varPlayer, 176)
		SendSpecificImpactToUnit(varMap, varPlayer,varPlayer,varPlayer, 32701, 0);
		Msg2Player( varMap, varPlayer, "您获得了称号【亲密爱人】", 8, 3)	
		Msg2Player( varMap, varPlayer, "您获得了效果【心跳】", 8, 3)
		print("GetImpactListCount="..GetImpactListCount(varMap, varPlayer))
end

function x310842_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1;

end

function x310842_ProcAccept(varMap, varPlayer, varTalknpc)
	


end
