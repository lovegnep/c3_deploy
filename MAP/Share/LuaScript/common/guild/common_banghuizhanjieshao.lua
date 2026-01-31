
x300746_var_FileId = 300746










x300746_var_QuestName="【帮会战场介绍】"
x300746_var_QuestName0="【帮会战场】"

--Gameopen
x300746_var_GameOpen = 1097



--DECLARE_QUEST_INFO_STOP--



function x300746_ProcEventEntry( varMap, varPlayer, varTalknpc )	
	
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

	local Readme_1 = "#Y【帮会战场介绍】#W#r"
	
	local Readme_2 = "#G一、帮战报名：#W#r帮主可在每周二和周五的17：00-18：30之间报名，系统将在20：00自动开启帮会战场。#r"
	
	local Readme_3 = "#G二、胜负判定：#W#r1、规定时间内，积分最先达到100分的一方获胜。#r2、在规定时间内未分出胜负，则积分高的一方获胜。#r3、在战场结束前，击倒敌方战旗，可提前获得胜利。#r"
	
	local Readme_4 = "#G三、战场规则：#W#r1、战场中的4个粮仓可以占领，占领后每个粮仓每10秒将产出1点积分和1点战场资源。#r2、占领全部4个粮仓将获得双倍产出。#r3、在夺取军旗时不可使用技能，每提交一次获得10积分。#r4、军旗可以在本方仓库交付，也可在已占领的2个临近粮仓中任意一个交付。#r"	
	
	local Readme_5 = "5、在战场中，帮主可以消耗60战场资源为本方成员购买持续20分钟的增加10暴击或增加10韧性的Buff，也可以消耗20战场资源为本方战旗补充10%的生命值。"
	
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
	
	StartTalkTask(varMap);TalkAppendString(varMap,varReadme)
	
	
	
	
	
	
	
	StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	
end




function x300746_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

		if GetGameOpenById( x300746_var_GameOpen ) <= 0 then
		    return
		end
	
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
    
	local pos = GetLevel(varMap, varPlayer)
	if pos >= 20 then
		TalkAppendButton(varMap,x300746_var_FileId,x300746_var_QuestName,1);
	end
	
end





function x300746_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
		return 1
end




function x300746_ProcAccept( varMap, varPlayer )

end




function x300746_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300746_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300746_CheckSubmit( varMap, varPlayer )

end




function x300746_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300746_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300746_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300746_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
