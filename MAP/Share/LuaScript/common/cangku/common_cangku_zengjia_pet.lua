
--DECLARE_QUEST_INFO_START--

x561005_var_FileId = 561005




x561005_var_MainName="增加骑乘仓库扩展空间说明"
x561005_var_QuestName="增加骑乘仓库扩展空间"
x561005_var_Readme = "\t增加骑乘仓库扩展空间的花费如下：\n\t第二格  #G200两#W银子\n\t第三格  #G600两#W银子\n\t第四格  #G1.5锭#W银子\n\t第五格  #G3锭#W银子\n"
x561005_var_Opt_Fail = "\t您的银子不足！无法完成增加扩展骑乘仓库操作！"
x561005_var_Opt_Succ = "\t操作完成！已增加了骑乘仓库的扩展空间！"

x561005_var_NeedMoney1 = 200000
x561005_var_NeedMoney2 = 600000
x561005_var_NeedMoney3 = 1500000
x561005_var_NeedMoney4 = 3000000


--DECLARE_QUEST_INFO_STOP--



function x561005_ProcEventEntry( varMap, varPlayer, varTalknpc,varScript,extid )	

		local activeBankPetSlot = LuaGetActiveBankPetSlot(varMap,varPlayer)
		StartTalkTask(varMap)
			TalkAppendString(varMap,"#Y"..x561005_var_MainName)
			TalkAppendString(varMap,x561005_var_Readme);
			TalkAppendString(varMap,"\t您当前的激活格数为 #G"..activeBankPetSlot)
			TalkAppendString(varMap,"\n\t#W您确定要扩展骑乘仓库吗？")
		StopTalkTask(varMap)	
		DeliverTalkInfo(varMap, varPlayer, varTalknpc, varScript, -1)
	
end




function x561005_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	TalkAppendButton(varMap, x561005_var_FileId, x561005_var_QuestName,3,1)

end




function x561005_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end





function x561005_GetSelected(varMap, varPlayer)
end




function x561005_SetSelected(varMap, varPlayer, varFlag)
end

function x561005_ActiveBankPetSlot( varMap, varPlayer, needmoney )

		if IsEnoughMoney( varMap, varPlayer, needmoney ) == 0  then
			StartTalkTask(varMap,varPlayer)
				TalkAppendString(varMap,x561005_var_Opt_Fail)
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		else
			
			local bRet = LuaActiveBankPetSlot(varMap,varPlayer)
			if 1 == bRet then
				SpendMoney( varMap, varPlayer, needmoney )
				
				
				
				
			end
		end

end




function x561005_ProcAccept( varMap, varPlayer )

		local activeBankPetSlot = LuaGetActiveBankPetSlot(varMap,varPlayer)
		if 1==activeBankPetSlot then
			x561005_ActiveBankPetSlot(varMap,varPlayer,x561005_var_NeedMoney1)
		elseif 2==activeBankPetSlot then
			x561005_ActiveBankPetSlot(varMap,varPlayer,x561005_var_NeedMoney2)
		elseif 3==activeBankPetSlot then
			x561005_ActiveBankPetSlot(varMap,varPlayer,x561005_var_NeedMoney3)
		elseif 4==activeBankPetSlot then
			x561005_ActiveBankPetSlot(varMap,varPlayer,x561005_var_NeedMoney4)
		elseif 5==activeBankPetSlot then
			StartTalkTask(varMap,varPlayer)
				TalkAppendString(varMap,"骑乘仓库已达上限，无法激活！")
			StopTalkTask()
			DeliverTalkTips(varMap,varPlayer)
		end
		
end




function x561005_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x561005_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x561005_CheckSubmit( varMap, varPlayer )

end




function x561005_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x561005_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x561005_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x561005_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
