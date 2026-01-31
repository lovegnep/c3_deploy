
x400201_var_FileId = 400201
x400201_var_Buf1 = 7528 

function x400201_ProcEventEntry( varMap, varPlayer, varBagIdx )
						StartTalkTask(varMap)
						TalkAppendString(varMap,"沾有血迹的黑羽密信")
						TalkAppendString(varMap,"\n\t感谢你的加入，当我们的计划完成时，你就是王国新的领导者，海都大王也已经奉命开始行动，海湾的能量晶石会使我们的巫师部队的能力大大提升。那些迦色尼人都是一群唯利是图的蛮荒人，他们的智力甚至不如那些失败了的阿兰人。\n \n\t秘密的聚集地已经初具规模，相信举杯庆祝的日子已经不远了。\n \n \n\t\t\t\t勃鲁合")
						StopTalkTask()
						DeliverTalkMenu(varMap, varPlayer, varPlayer, 400201, 2700);
		
end

function x400201_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0;     
	
	

end

function x400201_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x400201_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x400201_ProcDeplete( varMap, varPlayer )
	return 1
end

function x400201_ProcActivateOnce( varMap, varPlayer )
end

function x400201_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
