--DECLARE_QUEST_INFO_START--

x300612_var_FileId 	  = 300612
x300612_var_QuestKind 				= 	1                       
x300612_var_ExtTarget					=	{ {type=20,n=1,target="马车"} }
x300612_QuestName = "【黑金】理赔"

--DECLARE_QUEST_INFO_STOP--	  
						

x300612_var_SubQuestID				=	{ { varQuest=7556,BaoDanId=13080017,ReturnMoney=2500 }, 
										  {	varQuest=7557,BaoDanId=13080018,ReturnMoney=5000 },
										  {	varQuest=7558,BaoDanId=13080019,ReturnMoney=7500 },
										  {	varQuest=7546,BaoDanId=13080020,ReturnMoney=15000 },
										  { varQuest=7547,BaoDanId=13080021,ReturnMoney=20000 },
										  { varQuest=7548,BaoDanId=13080022,ReturnMoney=25000 },
										}

function x300612_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap,x300612_var_FileId,x300612_QuestName,3);

end




function x300612_ProcEventEntry( varMap, varPlayer, varTalknpc )

	StartTalkTask(varMap)
	local Readme_1 ="\t朋友，在这种乱世之下，还是有保险比较可靠吧？虽然不能挽回全部损失，但总比血本无归要强很多，您说是吧？#r"
	local Readme_2="\t好吧，现在把#G理赔单#W拿来，我们马上对您进行赔付。"
	local varReadme = Readme_1..Readme_2
	TalkAppendString(varMap,varReadme)
	StopTalkTask(varMap)
	DeliverTalkInfo(varMap, varPlayer, varTalknpc, x300612_var_FileId, -1);

end




function x300612_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	
	local IsHaveBaoDan = 0

	for varI,itm in x300612_var_SubQuestID do
		local varItemCount = GetItemCountInBag(varMap, varPlayer,itm.BaoDanId)
		if varItemCount > 0 then
			IsHaveBaoDan = 1
			
			if DelItem(varMap, varPlayer,itm.BaoDanId,varItemCount)	 ~= 1 then return 0 end
			AddMoney(varMap,varPlayer,0,varItemCount * itm.ReturnMoney) 	
			local varReadme = "理赔完成，返回现银#R#{_MONEY"..varItemCount * itm.ReturnMoney.."}"

			StartTalkTask(varMap)
			TalkAppendString(varMap,varReadme)
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)		
			Msg2Player(varMap,varPlayer,varReadme,8,2)
		end
	end

	if IsHaveBaoDan == 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"很抱歉，你没有理赔单")
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)	
		Msg2Player(varMap,varPlayer,"很抱歉，你没有理赔单",8,2)
	end
	
end




function x300612_ProcAccept( varMap, varPlayer )
end



function x300612_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
end





function x300612_ProcQuestAbandon( varMap, varPlayer,varQuest )
end

