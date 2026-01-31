----------------------------
--未开放玩法查询
----------------------------

x270301_var_FileId 		= 	270301
x270301_var_QuestName 	=	"玩法开放进度查询"
x270301_var_QuestDescription	=	"#Y玩法开放进度查询#W\n\t游戏中部分玩法将根据本服等级排行榜最后一名玩家的等级适时开启，根据排行榜等级状态，目前本服务器玩法开启状态为：\n\t"
x270301_var_QuestDescription1 = "\t目前本服务器所有玩法都已开启！"
x270301_var_xinbingQuestDescription = {varlimit = "开启条件\n\t排行榜第一名玩家等级不低于65级，新兵速成玩法开启",varnpc = "任务发布人\n呼蚩满 各国王城"}
x270301_var_GameTable ={
{level = 60 , varName = "\n \n[芝华士、轩尼诗理查]", varlimit = "开启条件\n\t排行榜最后一名玩家等级不低于60级，芝华士、轩尼诗理查对所有60级以上玩家开启",varnpc = "任务发布人\n‘美高美’美丽会招待杜十娘 大都（97，60）" },
{level = 70 , varName = "\n \n[天上人间·麒麟]", varlimit = "开启条件\n\t排行榜最后一名玩家等级不低于70级，天上人间·麒麟对所有65级以上玩家开启",varnpc = "任务发布人\n天上人间传送人赤和宛勒 大都南郊（128，70）"},
{level = 70 , varName = "\n \n[战车护送]", varlimit = "开启条件\n\t排行榜最后一名玩家等级不低于70级，战车护送对所有70级以上玩家开启",varnpc = "任务发布人\n战车押运官脱占彻 各国王城"},
{level = 80 , varName = "\n \n[轮回台(天赋)]", varlimit = "开启条件\n\t排行榜最后一名玩家等级不低于80级，轮回台(天赋)玩法开启",varnpc = "任务发布人\n轮回台传送人祖堆莱 各国王城"},
{level = 85 , varName = "\n \n[天上人间·梦聊]", varlimit = "开启条件\n\t排行榜最后一名玩家等级不低于85级，天上人间·梦聊对所有85级以上玩家开启",varnpc = "任务发布人\n天上人间传送人赤和宛勒 大都南郊（128，70）"}
}




function x270301_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest)
	if IsNewServer() ~=1 then
		 return --test
	end
	TalkAppendButton(varMap, x270301_var_FileId, x270301_var_QuestName, 3)

end

function x270301_ProcEventEntry( varMap ,varPlayer, varTalknpc, idScript, idExt)
local minlevel =  GetTopListInfo_MinLevel( GetWorldID( varMap, varPlayer) )
	if IsNewServer() ~= 1 then		
		 return -- test
	end
	StartTalkTask( varMap)
	TalkAppendString( varMap, x270301_var_QuestDescription)
				
	 for varI, item in x270301_var_GameTable do	 	 		 
	 	 		 if item.level <=	minlevel then
	 	 		 TalkAppendString( varMap, "#B"..x270301_var_GameTable[varI].varName.."已开启")
	 	 		 TalkAppendString( varMap, "#B"..x270301_var_GameTable[varI].varnpc)
	 	 		 else
	 	 		 TalkAppendString( varMap, "#R"..x270301_var_GameTable[varI].varName.."未开启")
	 	 		 TalkAppendString( varMap, "#R"..x270301_var_GameTable[varI].varlimit)
	 	 		 
	 	 		 
	 	 		 
	 	 		 
		end
	end
	StopTalkTask()
	DeliverTalkMenu( varMap, varPlayer, varTalknpc)


end

function x270301_ProcAcceptCheck( varMap, varPlayer, varTalknpc)

	
end

