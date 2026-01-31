

x310901_var_FileId 					= 310901

x310901_var_LevelMin				= 40
x310901_var_LevelMax				= 160


x310901_var_ItemIdBase			= 12035235
x310901_var_NeedItemCount1	= 1	
x310901_var_FillingId			= { 
																12035236,--豆沙    
																12035237,--莲蓉    
																12035238,--枣泥    
																12035239,--蛋黄    
																12035240,--优质豆沙
																12035241,--优质莲蓉
																12035242,--优质枣泥
																12035243,--优质蛋黄
														}	
x310901_var_FillingName ={ 
																"豆沙馅料",    
																"莲蓉馅料",    
																"枣泥馅料",    
																"蛋黄馅料",    
																"优质豆沙馅料",
																"优质莲蓉馅料",
																"优质枣泥馅料",
																"优质蛋黄馅料"
														}	


x310901_var_MooncakeId		= {
															12035244,--豆沙月饼    
															12035245,--莲蓉月饼    
															12035246,--枣泥月饼    
															12035247,--蛋黄月饼    
															12035248,--优质豆沙月饼
															12035249,--优质莲蓉月饼
															12035250,--优质枣泥月饼
															12035251,--优质蛋黄月饼
														}
x310901_var_MooncakeName		= {
															"豆沙月饼",    
															"莲蓉月饼",    
															"枣泥月饼",    
															"蛋黄月饼",    
															"优质豆沙月饼",
															"优质莲蓉月饼",
															"优质枣泥月饼",
															"优质蛋黄月饼"
														}
																												

x310901_var_QuestName					= "【个人】制作中秋月饼"
x310901_var_EnterInfo					= "\t1份#G月饼面粉#W和1份#G月饼馅料#W制作1个#G中秋月饼#W。中秋月饼分为#R增加经验的豆沙月饼#W、#R增加天赋的莲蓉月饼#W、#R增加声望的枣泥月饼#W和#R增加荣誉的蛋黄月饼#W。优质月饼是普通月饼的两倍效果。"


function x310901_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	local year, month, day = GetYearMonthDay();
	local varday = GetDayOfYear()
	if year ~= 2011 or varday < 251 or varday > 268 then   --2011年9月9日到9月27日
				return
	end
	TalkAppendButton(varMap, x310901_var_FileId, x310901_var_QuestName,3,0);
	
end


function x310901_DispatchEnterInfo( varMap, varPlayer, varTalknpc, nFlag )

	  StartTalkTask(varMap)
		local flournum = GetItemCount(varMap, varPlayer, x310901_var_ItemIdBase)      
		local filling = GetItemCount(varMap, varPlayer, x310901_var_FillingId[nFlag])       
		local strText1 = format("\n\t您现在有#R%d份#W月饼面粉#W！",flournum) 
		local strText2 = format("\n\t您现在有#R%d份#W"..x310901_var_FillingName[nFlag].."#W！",filling)    
		TalkAppendString(varMap,"#Y"..x310901_var_QuestName)
		TalkAppendString(varMap,x310901_var_EnterInfo)
		TalkAppendString(varMap,strText1)     
		TalkAppendString(varMap,strText2)     
    --AddQuestItemBonus(varMap, x310901_var_MooncakeId[nFlag],1)
		TalkAppendButton(varMap, x310901_var_FileId, "我要制作1个"..x310901_var_MooncakeName[nFlag],3,nFlag*10+1);
		TalkAppendButton(varMap, x310901_var_FileId, "我要制作5个"..x310901_var_MooncakeName[nFlag],3,nFlag*10+5);
		TalkAppendButton(varMap, x310901_var_FileId, "我要制作10个"..x310901_var_MooncakeName[nFlag],3,nFlag*10+9);
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc, x310901_var_FileId, -1);
	--DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x310901_var_FileId, 3240)
end



function x310901_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
    return 1
end


function x310901_ProcAccept( varMap, varPlayer )

	x310901_ProcRequestSubmit(varMap, varPlayer);
end





function x310901_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)
	local year, month, day = GetYearMonthDay();
	local varday = GetDayOfYear()
	if year ~= 2011 or varday < 251 or varday > 268 then   --2011年9月9日到9月27日
				return
	end
	if nFlag== nil then
		return
	end

	if GetLevel(varMap,varPlayer) < x310901_var_LevelMin then 
		Msg2Player(varMap, varPlayer, "等级不足，请40级后再来制作", 0, 2)
		Msg2Player(varMap, varPlayer, "等级不足，请40级后再来制作", 0, 3)		
		return 
	end
	
	if nFlag == 0 then
	  StartTalkTask(varMap)
	  TalkAppendString(varMap,"#Y"..x310901_var_QuestName)
		TalkAppendString(varMap,x310901_var_EnterInfo)        
		for i, item in x310901_var_MooncakeName do
			TalkAppendButton(varMap, x310901_var_FileId, "我要制作"..item,3,i);
		end
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc, varScriptFileId, -1);
	elseif nFlag < 10 then
			x310901_DispatchEnterInfo( varMap, varPlayer, varTalknpc, nFlag )
	else
			x310901_ProcApproveRequest(varMap, varPlayer,varTalknpc, nFlag)
	end
end


function x310901_ProcRequestSubmit(varMap, varPlayer)

	--local iRet = x310901_CheckRequest(varMap, varPlayer)
  --
	--if iRet>0 then
	--	x310901_ProcApproveRequest(varMap, varPlayer)
	--end
end

function x310901_CheckRequest(varMap, varPlayer, nFlag)
	local year, month, day = GetYearMonthDay();
	local varday = GetDayOfYear()
	if year ~= 2011 or varday < 251 or varday > 268 then   --2011年9月9日到9月27日
				return
	end


	local index = floor(nFlag/10)
	local flourCnt = GetItemCount( varMap, varPlayer, x310901_var_ItemIdBase )
	local FillingCnt = GetItemCount( varMap, varPlayer, x310901_var_FillingId[index] )
	local n =mod(nFlag,10)
	if n == 9 then n = 10 end
	
	
	if flourCnt< n then
		local varStr =  format("月饼面粉不足%d个！",n)
		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end
	
	if FillingCnt< n then
		local varStr =  format(x310901_var_FillingName[index].."不足%d个！",n)
		StartTalkTask(varMap);
			TalkAppendString(varMap, varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, varPlayer);
		return 0;
	end	
	

	if GetBagSpace(varMap, varPlayer) <= 0 then
		Msg2Player(varMap, varPlayer, "背包已满，无法制作", 0, 2)
		Msg2Player(varMap, varPlayer, "背包已满，无法制作", 0, 3)
		return 0
	end
	

	return 1;
	
end

function x310901_ProcApproveRequest(varMap, varPlayer, varTalknpc, nFlag)
		local iRet = x310901_CheckRequest(varMap, varPlayer ,nFlag)
 		if iRet == 0 then return end
 		local index = floor(nFlag/10)
		local n =mod(nFlag,10)
		if n == 9 then n = 10 end 
					
		local iRet	= DelItem(varMap, varPlayer,x310901_var_ItemIdBase,n)
    local iRet1 = DelItem(varMap, varPlayer,x310901_var_FillingId[index],n)

			
		if iRet ~= 1 or iRet1 ~= 1 then 
				WriteLog(1, format("x310901_DelItem_fail --- PlayerGUID = %u,WorldId = %d,Name = %s,Level = %d,nFlag = %d,ItemIdBase =%d,FillingId = %d,iRet = %d,iRet1 = %d", 
														GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),nFlag,x310901_var_ItemIdBase,x310901_var_FillingId[index],iRet,iRet1))
			return 
		end
		x310901_GetBonus(varMap, varPlayer ,varTalknpc, nFlag)
end


function x310901_GetBonus(varMap, varPlayer,varTalknpc, nFlag)
	local index = floor(nFlag/10)
	local n =mod(nFlag,10)
	if n == 9 then n = 10 end 
	StartItemTask(varMap)
	ItemAppendBind( varMap, x310901_var_MooncakeId[index], n )
	local varRet = StopItemTask(varMap,varPlayer)
	if varRet > 0 then
		DeliverItemListSendToPlayer(varMap,varPlayer)
			WriteLog(1, format("x310901_DelItem_GetBonus --- PlayerGUID = %u,WorldId = %d,Name = %s,Level = %d,nFlag = %d,MooncakeName =%s,Count = %d", 
													GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),nFlag,x310901_var_MooncakeName[index],n))			
			
			
		StartTalkTask(varMap)
			TalkAppendString(varMap,format("制作完成！获得%d个%s",n,x310901_var_MooncakeName[index]))
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		x310901_DispatchEnterInfo( varMap, varPlayer, varTalknpc, index )	
		return 1;
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"物品栏已满，无法得到物品！")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		return 0;
	end


end

