--DECLARE_QUEST_INFO_START-- 
x300937_var_FileId 					= 	300937
x300937_var_QuestName				= 	"【领地介绍】" 
x300937_var_QuestInfo				= 	"【领地争夺战说明】" 
--DECLARE_QUEST_INFO_STOP--

function x300937_ProcEnumEvent( varMap, varPlayer, varTalknpc )
end

function x300937_ProcEventEntry(varMap, varPlayer,varTalknpc)	
		StartTalkTask(varMap)
		local Readme_1 = "#Y【领地争夺战规则】#r #r#W"
		local Readme_2  = "1、领地争夺战将于#G每周六16点开启#W，#G17点结束#W。#r"
		local Readme_3  = "2、在每周六16：00-17：00期间，与报名帮会国籍相同的成员击杀领地内的领地图腾，则该报名帮会暂时成为领地占领者，同时需要保护领地图腾不被其他国家国民击杀。#r"
		local Readme_4  = "3、#G在领地争夺战结束前#W，如果有其它报名帮会同国籍的国民击杀领地图腾，则领地占领者变更。#r"
		local Readme_5  = "4、#G到达领地争夺战结束时间时#W，击杀领地图腾并且保护住已占领的领地图腾的帮会获得该领地的拥有权。#r"
		local Readme_6  = "5、在领地图腾附近不可以使用帮会召集令，队伍召集令和神行符。#r#r"
		local Readme_7  = "6、领地图腾每10分钟会回复总血量的5%，若领地争夺结束时，没有帮会击杀领地图腾，则该领地为非占领状态。#r"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5..Readme_6..Readme_7
		TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300937_var_FileId, -1 );
end 

function x300937_ProcAcceptCheck( varMap, varPlayer, varTalknpc )

end






function x300937_ProcAccept( varMap, varPlayer )
end



function x300937_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300937_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300937_CheckSubmit( varMap, varPlayer )
end



function x300937_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300937_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300937_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300937_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
