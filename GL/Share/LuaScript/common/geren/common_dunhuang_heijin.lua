--DECLARE_QUEST_INFO_START--

x300873_var_FileId 	  = 300873
x300873_var_QuestKind 				= 	1                       
x300873_var_Mis_Count   = 1
x300873_var_QuestId = 7647;
x300873_var_ExtTarget					=	{ {type=20,n=1,target="马车"} }

--DECLARE_QUEST_INFO_STOP--


x300873_var_SubQuestID				=	{ { MisID=7608,varQuestName = "【个人】官府押运",varLevelLess = 30,varLevelMax = 40  }, 
										  {	MisID=7609,varQuestName = "【个人】官府押运",varLevelLess = 40,varLevelMax = 50  },
										  {	MisID=7610,varQuestName = "【个人】官府押运",varLevelLess = 50,varLevelMax = 60  },
										  {	MisID=7611,varQuestName = "【个人】官府押运",varLevelLess = 60,varLevelMax = 70  },
										  {	MisID=7612,varQuestName = "【个人】官府押运",varLevelLess = 70,varLevelMax = 80  },	
										  {	MisID=7613,varQuestName = "【个人】官府押运",varLevelLess = 80,varLevelMax = 150  },											  
										}								

function x300873_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local varIndex = 0
	local varLevel = GetLevel(varMap,varPlayer)
	for varI,itm in x300873_var_SubQuestID do
		if varLevel >= itm.varLevelLess and varLevel < itm.varLevelMax then
			varIndex = varI
			break
		end
	end

	local varHaveQuest = x300873_IsHaveQuest(varMap, varPlayer)
	if varHaveQuest <= 0 and varIndex > 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300873_var_SubQuestID[varIndex].MisID)
		TalkAppendButton(varMap,x300873_var_SubQuestID[varIndex].MisID,x300873_var_SubQuestID[varIndex].varQuestName,varState,varIndex);
	end

end




function x300873_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest,varExtIdx )
end


function x300873_IsHaveQuest( varMap, varPlayer )

	local varHaveQuest = 0
	for varI,itm in x300873_var_SubQuestID do
		varHaveQuest = IsHaveQuestNM(varMap, varPlayer,itm.MisID );
		if varHaveQuest > 0 then
			break
		end
	end
	
	return varHaveQuest
end





function x300873_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
end





function x300873_ProcAccept( varMap, varPlayer )
	
end



function x300873_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest )
end





function x300873_ProcQuestAbandon( varMap, varPlayer,varQuest )  	
end


function x300873_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID,varQuestIdx, varQuest )
end




function x300873_QuestLogRefresh( varMap, varPlayer, varQuest)
end

function x300873_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

end




