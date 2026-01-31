

function x300318_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_KINGBATTLE ) == 0 then
        return
    end

	TalkAppendButton(varMap,300318,"【守护战场说明】",0,1)
end


function x300318_ProcEventEntry( varMap, varPlayer, varTalknpc,varState,varIndex)

	
    if GetMergeDBToggle() == 1 then
        return
    end
    
  
	local UpdateDBflag = GetUpdateDBBeforeToggle()
	if UpdateDBflag==1 then
		return
	end
    
    
    
    
    

    
    if GetBattleSceneToggle( BATTLESCENE_TYPE_ZHUQUEBATTLELITE ) == 0 then
        return
    end

	local Readme_1   = "#Y【守护战场说明】#W#r"
	local Readme_2   = "#G一、挑战条件：#W#r"
	local Readme_3   = "  1、若本国已有国王，则在每#G周日20：25~20：40#W间可以向#G国家守护管理员#W挑战报名朱雀战场或青龙战场。#r"
	local Readme_4   = "  2、在本国没有守护时，第一个帮会报名后，如果在战场开始时，无其他帮会挑战则不会进入战场，直接成为相应守护。#r"
	local Readme_5   = "  3、在获得守护战场的胜利后，帮主则成为#G朱雀之主#W或#G青龙之主#W，帮会成员成为#G朱雀守护#W或#G青龙守护#W。#r"
	local Readme_6   = "在报名时间内，帮会实力高的帮会顶替帮会实力低的帮会，被顶替帮会无法再次申请相应守护。到达20：40，帮会实力高的帮会完成报名，参加当天的守护战场。守护战场将在当天20：40~21：00之间开启。#r"
	local Readme_7   = "#G二、战场规则：#W#r"
	local Readme_8  = "  1、进入战场时间为2分钟，战场开始20分钟内将对方全部清出战场方获胜，每人有5次复活机会。#r"
	local Readme_9  = "  2、20分钟内未分胜负，则有帮主方获胜。#r"
	local Readme_10  = "  3、双方帮主均在战场或均死亡，则人数多的一方获胜。#r"
	local Readme_11  = "  4、双方人数相等，则帮主死亡次数少的一方获胜。#r"
	local Readme_12  = "  5、双方帮主死亡次数相等，则守护方获胜。#r"
	local Readme_13  = "  6、双方都无帮主且人数相等时，守护方获胜。#r"	
	local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5..Readme_6..Readme_7..Readme_8..Readme_9..Readme_10..Readme_11..Readme_12..Readme_13
	StartTalkTask(varMap);TalkAppendString(varMap,varReadme);StopTalkTask(varMap);DeliverTalkMenu(varMap,varPlayer,varTalknpc)
end


function x300318_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end







function x300318_ProcAccept( varMap, varPlayer )
end




function x300318_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x300318_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x300318_CheckSubmit( varMap, varPlayer )

end




function x300318_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x300318_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x300318_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x300318_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end



