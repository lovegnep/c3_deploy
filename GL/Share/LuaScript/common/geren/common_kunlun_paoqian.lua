--DECLARE_QUEST_INFO_START--

x300877_var_FileId 					= 	300877                  
x300877_var_QuestId 				= 	7645                    

x300877_var_QuestKind 				= 	1                       

x300877_var_QuestName				= 	"【个人】黑金押运"                
x300877_var_QuestTarget				= 	"杀死@npc_72005"          
x300877_var_QuestInfo				= 	"\t杀死@npc_72004的@npc_72005,找到@npc_137600"            
x300877_var_ContinueInfo				= 	"@npc_137602一直请求我帮他清除@npc_72004的@npc_72005，我却一直抽不开身。"  
x300877_var_QuestCompleted			= 	"@npc_137602已经把信件给我了，看来海都又把元素魔这怪物派来了，必须赶快通知@npc_137400。"  
x300877_var_QuestHelp				=	""          


x300877_var_ExtTarget					=	{ {type=20,n=3,target="@npc_72005"} }



x300877_var_ExpBonus					= 	1000                    	
x300877_var_BonusItem					=	{}	

x300877_var_BonusMoney1               = 	0    
x300877_var_BonusMoney2               =   0    
x300877_var_BonusMoney3               =   0    
x300877_var_BonusMoney4               =   0  
x300877_var_BonusMoney5               =   0  
x300877_var_BonusMoney6               =   10  

x300877_var_BonusChoiceItem           =   {}

--DECLARE_QUEST_INFO_STOP--



x300877_var_SubQuestID				=	{ { MisID=7632,varQuestName = "【黑金】黑金押运",varLevelLess = 30,varLevelMax = 40  }, 
										  {	MisID=7633,varQuestName = "【黑金】黑金押运",varLevelLess = 40,varLevelMax = 50  },
										  {	MisID=7634,varQuestName = "【黑金】黑金押运",varLevelLess = 50,varLevelMax = 60  },
										  {	MisID=7635,varQuestName = "【黑金】黑金押运",varLevelLess = 60,varLevelMax = 70  },
										  {	MisID=7636,varQuestName = "【黑金】黑金押运",varLevelLess = 70,varLevelMax = 80  },	
										  {	MisID=7637,varQuestName = "【黑金】黑金押运",varLevelLess = 80,varLevelMax = 150  },											  
										}								





function x300877_ProcEnumEvent( varMap, varPlayer, varTalknpc )

	local varIndex = 0
	local varLevel = GetLevel(varMap,varPlayer)
	for varI,itm in x300877_var_SubQuestID do
		if varLevel >= itm.varLevelLess and varLevel < itm.varLevelMax then
			varIndex = varI
			break
		end
	end
	
	local varHaveQuest = x300877_IsHaveQuest(varMap, varPlayer)
	if varHaveQuest <= 0 and varIndex > 0 then
		local varState = GetQuestStateNM(varMap,varPlayer,varTalknpc,x300877_var_SubQuestID[varIndex].MisID)
		TalkAppendButton(varMap,x300877_var_SubQuestID[varIndex].MisID,x300877_var_SubQuestID[varIndex].varQuestName,varState,varIndex);
	end
end





function x300877_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,varExtIdx)	
end


function x300877_IsHaveQuest( varMap, varPlayer )

	local varHaveQuest = 0
	for varI,itm in x300877_var_SubQuestID do
		varHaveQuest = IsHaveQuestNM(varMap, varPlayer,itm.MisID );
		if varHaveQuest > 0 then
			break
		end
	end
	
	return varHaveQuest
end




function x300877_ProcQuestAbandon(varMap, varPlayer, varQuest)
end





function x300877_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)
end

function x300877_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
end

