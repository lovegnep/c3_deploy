
--DECLARE_QUEST_INFO_START--

x310937_var_FileId = 310937   


-- 兑换目标道具名称
--x310937_var_ExcItemInfo[index].Name = "骑乘资质丹兑换券"
-- 兑换目标道具ID
--x310937_var_ExcItemInfo[index].Id = 12035041
-- 兑换道具名称
x310937_var_ExcItemName = "骑乘资质丹兑换券碎片"
-- 兑换道具ID
x310937_var_ExcItemID = 12030810
-- 兑换道具需要数量
--x310937_var_ExcItemInfo[index].Num = 10

x310937_var_ExcItemInfo =
{
{Name ="一级勇力丹", Id =12050055 ,Num = 5},
{Name ="一级追影丹", Id =12050065 ,Num = 5},
{Name ="一级心智丹", Id =12050075 ,Num = 5},
{Name ="一级强身丹", Id =12050085 ,Num = 5},
}


x310937_var_Excount ={MD_EXCHANGE_HORSEPOINT1,MD_EXCHANGE_HORSEPOINT2,MD_EXCHANGE_HORSEPOINT3,MD_EXCHANGE_HORSEPOINT4}
x310937_var_QuestName = ""
x310937_var_QuestInfo = ""
x310937_var_QuestError = ""


--DECLARE_QUEST_INFO_STOP--



function x310937_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	
if seleteId == 199 then
	StartTalkTask(varMap)
	TalkAppendString(varMap,"#Y".."骑乘资质丹说明")
	TalkAppendString(varMap,"\t骑乘资质丹分为一级勇力丹，一级追影丹，一级心智丹和一级强身丹四种。分别可以增加2点力量，敏捷，智力和体质。每种资质丹可以兑换10次。")
	AddQuestItemBonus(varMap, 12050055,1)
	AddQuestItemBonus(varMap, 12050065,1)
	AddQuestItemBonus(varMap, 12050075,1)
	AddQuestItemBonus(varMap, 12050085,1)
	StopTalkTask()
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x310937_var_FileId, -1)
	return
end	




	if seleteId <5 then
		local Mdate =x310937_var_Excount[seleteId]
		local Count = GetPlayerGameData( varMap, varPlayer, Mdate[ 1], Mdate[ 2], Mdate[ 3] )
		x310937_var_QuestName = format("【兑换】兑换%s",x310937_var_ExcItemInfo[seleteId].Name)
		x310937_var_QuestInfo = format("\t使用#G%s#W可以兑换#R10次#W%s，你确定要兑换吗？\n\t将需要#R%d个#W#G%s#W。",x310937_var_ExcItemName,x310937_var_ExcItemInfo[seleteId].Name,x310937_var_ExcItemInfo[seleteId].Num,x310937_var_ExcItemName)
		x310937_var_QuestError = format("\t您没有足够数量的%s，无法兑换%s。",x310937_var_ExcItemName, x310937_var_ExcItemInfo[seleteId].Name)
		local varItemNum = GetItemCount(varMap, varPlayer, x310937_var_ExcItemID)
		local varText = format("\t您现在有#R%d个#W#G%s#W！\n \n\t您已经兑换过#R%d次#W了", varItemNum, x310937_var_ExcItemName,Count)
			if Count >= 10 then 
				x310937_var_QuestInfo =format("\t您已经兑换过#R%d次#W%s了。",Count,x310937_var_ExcItemInfo[seleteId].Name)
				varText =""
			end	
			StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x310937_var_QuestName)
				TalkAppendString(varMap,x310937_var_QuestInfo)
				TalkAppendString(varMap,varText)
				TalkAppendButton( varMap, x310937_var_FileId, "确定", 1, seleteId+5 )
				
			StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
			return
	elseif seleteId < 10 then
		x310937_Accept( varMap, varPlayer, varTalknpc,seleteId-5 )
	else
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y".."【兑换】骑乘资质丹兑换券")	
		TalkAppendString(varMap,"\t您确定要使用骑乘资质丹兑换券碎片兑换骑乘资质丹兑换券吗？\n\t骑乘资质丹兑换券分为一级勇力丹、一级追影丹、一级心智丹和一级强身丹四个种类。请选择您要兑换的资质丹：")	
		TalkAppendButton( varMap, x310937_var_FileId, "兑换一级勇力丹", 1, 1 )		
		TalkAppendButton( varMap, x310937_var_FileId, "兑换一级追影丹", 1, 2 )		
		TalkAppendButton( varMap, x310937_var_FileId, "兑换一级心智丹", 1, 3 )
		TalkAppendButton( varMap, x310937_var_FileId, "兑换一级强身丹", 1, 4 )			
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)		
	end
end


function x310937_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
--	local year, month, day = GetYearMonthDay();
--	local varday = GetDayOfYear()
--	if year ~= 2011 or varday < 251 or varday > 268 then   --2011年9月9日到9月27日
--				return
--	end
		TalkAppendButton(varMap,x310937_var_FileId,"【兑换】骑乘资质丹兑换券",3,10);
		TalkAppendButton(varMap,x310937_var_FileId,"骑乘资质丹兑换券说明",13,199);
	
end

function x310937_ProcAccept( varMap, varPlayer )
end

function x310937_Accept( varMap, varPlayer, varTalknpc ,seleteId )
--	local year, month, day = GetYearMonthDay();
--	local varday = GetDayOfYear()
--	if year ~= 2011 or varday < 251 or varday > 268 then   --2011年9月9日到9月27日
--				return
--	end

	local Mdate =x310937_var_Excount[seleteId]
	local Count = GetPlayerGameData( varMap, varPlayer, Mdate[ 1], Mdate[ 2], Mdate[ 3] )
	if Count >= 10 then 
		Msg2Player(varMap, varPlayer,"很抱歉，您已经兑换过10次了",8,2)
		Msg2Player(varMap, varPlayer,"很抱歉，您已经兑换过10次了",8,3)
		return 0		
	end



	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	local bind = 0
	
	local Num = GetItemCount( varMap, varPlayer, x310937_var_ExcItemID )

	if Num < x310937_var_ExcItemInfo[seleteId].Num then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,x310937_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	else
	
		local Num = x310937_var_ExcItemInfo[seleteId].Num
--			for i=1 , Num  do 
--				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x310937_var_ExcItemID)
--				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
--				 	bind = 1
--				 end
			if DelItem(varMap,varPlayer,x310937_var_ExcItemID,Num) ~= 1 then return end
--		end
		
		StartItemTask(varMap)
			ItemAppendBind( varMap, x310937_var_ExcItemInfo[seleteId].Id, 1)
		local varRet = StopItemTask(varMap,varPlayer)
		
		if varRet > 0 then
			WriteLog(1, format("x310937_var_GiveBonus --- PlayerGUID = %u,WorldId = %d,Name = %s,Level = %d,ShouZhuoId = %d",
												 GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),x310937_var_ExcItemInfo[seleteId].Id))
				DeliverItemListSendToPlayer(varMap,varPlayer)
				Msg2Player(varMap, varPlayer,"兑换完成",8,3)
				SetPlayerGameData( varMap, varPlayer, Mdate[ 1], Mdate[ 2], Mdate[ 3], Count+1)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		x310937_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	
		
	end
end
		
function x310937_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x310937_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x310937_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x310937_CheckSubmit( varMap, varPlayer )

end




function x310937_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x310937_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x310937_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x310937_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
