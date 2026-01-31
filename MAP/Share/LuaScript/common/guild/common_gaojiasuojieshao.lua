
x300747_var_FileId = 300747



x300747_var_QuestName="高加索之战"


--DECLARE_QUEST_INFO_STOP--



function x300747_ProcEventEntry( varMap, varPlayer, varTalknpc )	

			
		    if GetMergeDBToggle() == 1 then
		        return
		    end
		    
		  
				local UpdateDBflag = GetUpdateDBBeforeToggle()
				if UpdateDBflag==1 then
					return
				end
		    
		    
		    
		    
		    
		
		    
		    if GetBattleSceneToggle( BATTLESCENE_TYPE_GUILDBATTLE ) == 0 then
		        return
		    end

			StartTalkTask(varMap);
		
			local localexp = (GetLevel( varMap, varPlayer )) * 1000*0.3*5		
		
			local Readme_1 = "#Y【帮会战场】#W#r"
		
			local Readme_2 = "#G一，帮战报名：#W#r"
			
			local Readme_3 = "帮主可在每周二和周五的17：00-18：30之间报名，系统将在20：00自动开启帮战。#r"
			
			local Readme_4 = "#G二，胜负判定：#W#r"
			
			local Readme_5 = "  1，规定时间内，积分最先达到100分的一方获胜。#r"
			
			local Readme_6 = "  2，在规定时间内未分出胜负，则积分高的一方获胜。#r"

			local Readme_7 = "#G三，战场规则：#W#r"	
			
			local Readme_8 = "  1，战场中的4个粮仓可以占领，占领后每个粮仓将产出一点积分。#r"
			
			local Readme_9= "  2，占领全部4个粮仓将获得粮仓的双倍产出积分。#r"
			
			local Readme_10= "  3，在夺取军旗时不可使用技能，每提交一次记10分。#r"
			
			local Readme_11= "  4，军旗可以在本方仓库交付，也可在已经占领的2个临近粮仓中任意一个交付。"
			
			local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5..Readme_6..Readme_7..Readme_8..Readme_9..Readme_10..Readme_11
				
			TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc);DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, -1, -1,2 );
	
	
end




function x300747_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

end





function x300747_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300747_ProcAccept( varMap, varPlayer )

	
end




function x300747_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300747_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300747_CheckSubmit( varMap, varPlayer )

end




function x300747_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300747_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300747_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300747_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
