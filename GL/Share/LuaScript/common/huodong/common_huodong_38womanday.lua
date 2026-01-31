--DECLARE_QUEST_INFO_START--

x270107_var_FileId = 270107   


-- 兑换目标道具名称
--x270107_var_ExcItemInfo[index].Name = "巾帼须眉"
-- 兑换目标道具ID
--x270107_var_ExcItemInfo[index].Id = 12035041
-- 兑换道具名称
x270107_var_ExcItemName = "柔滑的绸缎"
-- 兑换道具ID
x270107_var_ExcItemID = 11000305
-- 兑换道具需要数量
--x270107_var_ExcItemInfo[index].Num = 10

x270107_var_ExcItemInfo =
{
{Name ="巾帼须眉(7天)", Id =10306076 ,Num = 30},
{Name ="巾帼须眉(15天)", Id =10306077 ,Num = 120},
{Name ="巾帼须眉(30天)", Id =10306078 ,Num = 240},
{Name ="巾帼须眉(60天)", Id =10306079 ,Num = 480},
}

x270107_var_QuestName = ""
x270107_var_QuestInfo = ""
x270107_var_QuestError = ""


--DECLARE_QUEST_INFO_STOP--



function x270107_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	
	local year, month, day = GetYearMonthDay(); 
	local day1 = GetDayOfYear()
	if year ==2012 then
			if day1 > 66 and day1 < 71 then
			if seleteId == 199 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y".."妇女节活动兑换说明")
				TalkAppendString(varMap,"\t祝天下所有女人节日快乐！\n\t可以用一定数量的#G柔滑的绸缎#W到#G活动使者#W处兑换时装。女角色更有8折优惠哦！\n\t可兑换的时装分为#R巾帼须眉(7天)#W、#R巾帼须眉(15天)#W、#R巾帼须眉(30天)#W和#R巾帼须眉(60天)#W四种。\n\t活动日期：#R3月8日#W~#R3月11日#W\n\t#G小提示#W：兑换时装#R巾帼须眉#W所需的#G柔滑的绸缎#W可在#R3月8日#W~#R3月9日#W内在领地和迷宫地区击杀与自己等级相近的怪随机获得，也可在#G活动使者#W处购买。")
				AddQuestItemBonus(varMap, 10306076,1)
				AddQuestItemBonus(varMap, 10306077,1)
				AddQuestItemBonus(varMap, 10306078,1)
				AddQuestItemBonus(varMap, 10306079,1)
				StopTalkTask()
				DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x270107_var_FileId, -1)
				return
			end	
		




			if seleteId <5 then
				x270107_var_QuestName = format("【兑换】%s",x270107_var_ExcItemInfo[seleteId].Name)
				local sex =GetSex(varMap, varPlayer) 
				if sex == 0 then
					x270107_var_QuestInfo = format("\t使用#G%s#W可以兑换#R1件#W%s，你确定要兑换吗？\n\t将需要#R%d个#W#G%s#W。",x270107_var_ExcItemName,x270107_var_ExcItemInfo[seleteId].Name,x270107_var_ExcItemInfo[seleteId].Num * 0.8,x270107_var_ExcItemName)
				else
					x270107_var_QuestInfo = format("\t使用#G%s#W可以兑换#R1件#W%s，你确定要兑换吗？\n\t将需要#R%d个#W#G%s#W。",x270107_var_ExcItemName,x270107_var_ExcItemInfo[seleteId].Name,x270107_var_ExcItemInfo[seleteId].Num,x270107_var_ExcItemName)
				end
				x270107_var_QuestError = format("\t您没有足够数量的%s，无法兑换%s。",x270107_var_ExcItemName, x270107_var_ExcItemInfo[seleteId].Name)
					StartTalkTask(varMap)
						TalkAppendString(varMap,"#Y"..x270107_var_QuestName)
						TalkAppendString(varMap,x270107_var_QuestInfo)
						TalkAppendButton( varMap, x270107_var_FileId, "确定", 1, seleteId+5 )				
					StopTalkTask()
					DeliverTalkMenu(varMap, varPlayer, varTalknpc)
					return
			elseif seleteId < 10 then
				x270107_Accept( varMap, varPlayer, varTalknpc,seleteId-5 )
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y".."【兑换时装】妇女节活动")	
				TalkAppendString(varMap,"\t您确定要使用#G柔滑的绸缎#W兑换时装#R巾帼须眉#W吗？\n\t时装#R巾帼须眉#W分为#R巾帼须眉(7天)#W、#R巾帼须眉(15天)#W、#R巾帼须眉(30天)#W和#R巾帼须眉(60天)#W四个种类。请选择您要兑换的时装：")	
				TalkAppendButton( varMap, x270107_var_FileId, "【兑换时装】巾帼须眉(7天)", 1, 1 )		
				TalkAppendButton( varMap, x270107_var_FileId, "【兑换时装】巾帼须眉(15天)", 1, 2 )		
				TalkAppendButton( varMap, x270107_var_FileId, "【兑换时装】巾帼须眉(30天)", 1, 3 )
				TalkAppendButton( varMap, x270107_var_FileId, "【兑换时装】巾帼须眉(60天)", 1, 4 )			
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)		
			end
		end
	end
end


function x270107_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
--	local year, month, day = GetYearMonthDay();
--	local varday = GetDayOfYear()
--	if year ~= 2011 or varday < 251 or varday > 268 then   --2011年9月9日到9月27日
--				return
--	end
	local year, month, day = GetYearMonthDay(); 
		local day1 = GetDayOfYear()
		if year ==2012 then
			if day1 > 66 and day1 < 71 then
				TalkAppendButton(varMap,x270107_var_FileId,"【兑换时装】妇女节活动",3,10);
				TalkAppendButton(varMap,x270107_var_FileId,"妇女节活动兑换说明",13,199);
			end
		end
end

function x270107_ProcAccept( varMap, varPlayer )
end

function x270107_Accept( varMap, varPlayer, varTalknpc ,seleteId )
--	local year, month, day = GetYearMonthDay();
--	local varday = GetDayOfYear()
--	if year ~= 2011 or varday < 251 or varday > 268 then   --2011年9月9日到9月27日
--				return
--	end

	if GetBagSpace(varMap, varPlayer) < 1 then
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,2)
		Msg2Player(varMap, varPlayer,"需要至少一格空余背包位置才能兑换！",8,3)
		return 0
	end
	
	local Num = GetItemCount( varMap, varPlayer, x270107_var_ExcItemID )
	--获取性别
	local sex1 = GetSex(varMap, varPlayer)
	local Num1 = 0
	if sex1 == 0 then
		Num1 = x270107_var_ExcItemInfo[seleteId].Num * 0.8
	else 
		Num1 = x270107_var_ExcItemInfo[seleteId].Num
	end
	if Num < Num1 then -- 道具数量不足
		StartTalkTask(varMap)
		TalkAppendString(varMap,x270107_var_QuestError)
		StopTalkTask()
		DeliverTalkTips(varMap, varPlayer)
	else
	
		local Num = Num1
--			for i=1 , Num  do 
--				local bagindex = FindFirstBagIndexOfItem(varMap, varPlayer, x270107_var_ExcItemID)
--				 if bagindex >= 0 and IsItemBind(varMap, varPlayer, bagindex) > 0 then 
--				 	bind = 1
--				 end
		if DelItem(varMap,varPlayer,x270107_var_ExcItemID,Num) ~= 1 then 
			return
		end
--		end
		
		StartItemTask(varMap)
			ItemAppendBind( varMap, x270107_var_ExcItemInfo[seleteId].Id, 1)
		local varRet = StopItemTask(varMap,varPlayer)
		
		if varRet > 0 then
			WriteLog(1, format("x270107_var_GiveBonus --- PlayerGUID = %u,WorldId = %d,Name = %s,Level = %d,ShouZhuoId = %d",
												 GetPlayerGUID( varMap,varPlayer ),GetWorldId(varMap,varPlayer),GetName( varMap,varPlayer ),GetLevel(varMap,varPlayer),x270107_var_ExcItemInfo[seleteId].Id))
				DeliverItemListSendToPlayer(varMap,varPlayer)
				Msg2Player(varMap, varPlayer,"兑换完成",8,3)
		else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"物品栏已满，无法获得物品！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
		end
		x270107_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	
		
	end
end
		
function x270107_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x270107_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x270107_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x270107_CheckSubmit( varMap, varPlayer )

end




function x270107_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x270107_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x270107_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x270107_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
