--DECLARE_QUEST_INFO_START--

x300875_var_FileId 	  = 300875
x300875_var_QuestKind 				= 	1                       
x300875_var_Mis_Count   = 1
x300875_var_QuestId = 7649;
x300875_var_ExtTarget					=	{ {type=20,n=1,target="马车"} }

--DECLARE_QUEST_INFO_STOP--


x300875_var_SubQuestID				=	{ { MisID=7620,varQuestName = "【个人】官府押运",varLevelLess = 30,varLevelMax = 40  }, 
										  {	MisID=7621,varQuestName = "【个人】官府押运",varLevelLess = 40,varLevelMax = 50  },
										  {	MisID=7622,varQuestName = "【个人】官府押运",varLevelLess = 50,varLevelMax = 60  },
										  {	MisID=7623,varQuestName = "【个人】官府押运",varLevelLess = 60,varLevelMax = 70  },
										  {	MisID=7624,varQuestName = "【个人】官府押运",varLevelLess = 70,varLevelMax = 80  },	
										  {	MisID=7625,varQuestName = "【个人】官府押运",varLevelLess = 80,varLevelMax = 150  },											  
										}								

function x300875_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local varIndex = 0
	local varLevel = GetLevel(varMap,varPlayer)
	for varI,itm in x300875_var_SubQuestID do
		if varLevel >= itm.varLevelLess and varLevel < itm.varLevelMax then
			varIndex = varI
			break
		end
	end

	local varHaveQuest = x300875_IsHaveQuest(varMap, varPlayer)
	if varHaveQuest <= 0 and varIndex > 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300875_var_SubQuestID[varIndex].MisID)
		TalkAppendButton(varMap,x300875_var_SubQuestID[varIndex].MisID,x300875_var_SubQuestID[varIndex].varQuestName,varState,varIndex);
	end

end




function x300875_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
end


function x300875_IsHaveQuest( varMap, varPlayer )

	local varHaveQuest = 0
	for varI,itm in x300875_var_SubQuestID do
		varHaveQuest = IsHaveQuestNM(varMap, varPlayer,itm.MisID );
		if varHaveQuest > 0 then
			break
		end
	end
	
	return varHaveQuest
end





function x300875_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
end





function x300875_ProcAccept( varMap, varPlayer )
	
end



function x300875_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
end





function x300875_ProcQuestAbandon( varMap, varPlayer,varQuest )  	
end


function x300875_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
end




function x300875_QuestLogRefresh( varMap, varPlayer, varQuest)
end

function x300875_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

end




