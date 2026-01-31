
x400202_var_FileId = 400202
x400202_var_Buf1 = 7528 

function x400202_ProcEventEntry( varMap, varPlayer, varBagIdx )
						StartTalkTask(varMap)
						TalkAppendString(varMap,"浸湿的黑羽密信")
						TalkAppendString(varMap,"\n\t受命于帖木儿陛下，笃哇大王将出兵边塞地区，夺取西凉三宝。珍珠渔港的能量晶矿对我们巫师部队的能力有很大的提升，我希望你能顺利地把它们运回来给我，至于那个富裕的渔港，所有的东西都是你们的。\n \n\t等你们带回我们想要的东西，一定还会有更丰厚的报酬，能力晶矿能不能破解佛光塔的机关目前还没有被验证，如果能够完成进入佛光塔，除了那件东西之外，所有的宝物都是你的。\n \n\t另外你的另一支部队，在波斯海湾也取得了不错的战绩，我们期待举杯同庆的日子。\n \n \n\t\t\t\t海都")
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varPlayer, 400202, 2700);
		
end

function x400202_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x400202_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400202_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400202_ProcDeplete( varMap, varPlayer )
	return 1
end

function x400202_ProcActivateOnce( varMap, varPlayer )
end

function x400202_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
