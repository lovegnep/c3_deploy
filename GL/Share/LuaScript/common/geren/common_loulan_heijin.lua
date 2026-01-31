--DECLARE_QUEST_INFO_START--

x300758_var_FileId 	  = 300758
x300758_var_QuestKind 				= 	1                       
x300758_var_Mis_Count   = 1
x300758_var_QuestId = 7549;
x300758_var_ExtTarget					=	{ {type=20,n=1,target="马车"} }

--DECLARE_QUEST_INFO_STOP--


x300758_var_SubQuestID				=	{ { MisID=7001,varQuestName = "【个人】官府押运",varLevelLess = 30,varLevelMax = 40  }, 
										  {	MisID=7009,varQuestName = "【个人】官府押运",varLevelLess = 40,varLevelMax = 50  },
										  {	MisID=7010,varQuestName = "【个人】官府押运",varLevelLess = 50,varLevelMax = 60  },
										  {	MisID=7543,varQuestName = "【个人】官府押运",varLevelLess = 60,varLevelMax = 70  },
										  {	MisID=7544,varQuestName = "【个人】官府押运",varLevelLess = 70,varLevelMax = 80  },	
										  {	MisID=7545,varQuestName = "【个人】官府押运",varLevelLess = 80,varLevelMax = 150  },											  
										}								

function x300758_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local varIndex = 0
	local varLevel = GetLevel(varMap,varPlayer)
	for varI,itm in x300758_var_SubQuestID do
		if varLevel >= itm.varLevelLess and varLevel < itm.varLevelMax then
			varIndex = varI
			break
		end
	end

	local varHaveQuest = x300758_IsHaveQuest(varMap, varPlayer)
	if varHaveQuest <= 0 and varIndex > 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300758_var_SubQuestID[varIndex].MisID)
		TalkAppendButton(varMap,x300758_var_SubQuestID[varIndex].MisID,x300758_var_SubQuestID[varIndex].varQuestName,varState,varIndex);
	end

end




function x300758_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
end


function x300758_IsHaveQuest( varMap, varPlayer )

	local varHaveQuest = 0
	for varI,itm in x300758_var_SubQuestID do
		varHaveQuest = IsHaveQuestNM(varMap, varPlayer,itm.MisID );
		if varHaveQuest > 0 then
			break
		end
	end
	
	return varHaveQuest
end





function x300758_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
end





function x300758_ProcAccept( varMap, varPlayer )
	
end



function x300758_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
end





function x300758_ProcQuestAbandon( varMap, varPlayer,varQuest )  	
end


function x300758_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
end




function x300758_QuestLogRefresh( varMap, varPlayer, varQuest)
end

function x300758_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

end




