x700131_var_FileId = 700131

function x700131_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest, varScriptFileId)
	TalkAppendButton(varMap, x700131_var_FileId, "【个人】浮屠塔说明", 13, 90)                                                                                                                                                                                                                                                                                                                      
end

function x700131_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)                                                                                                                                                                                                                                                                                                         
	if nFlag == 90 then
		StartTalkTask(varMap)                                                                                                                                                                                                                                                                                                     
			TalkAppendString(varMap,"#Y【个人】浮屠塔说明#W")
			TalkAppendString(varMap,"\t1.玩家等级45级以上可以进入浮屠塔，浮屠塔共有150层，是将星卡的主要产出口之一。")
			TalkAppendString(varMap,"\t2.浮屠塔中有着各式各样的妖魔封印在其中，越往上层挑战难度也越大。")
			TalkAppendString(varMap,"\t3.玩家每天会获得至少1次免费的扫塔机会。但可以通过浮屠塔介面中增加次数功能来获得更多机会。")
			TalkAppendString(varMap,"\t4.随着玩家贵族VIP等级的提升，扫塔次数和免费次数都会有所提升。")
			TalkAppendString(varMap,"\t5.玩家手动挑战过的层数，可以使用系统自动代刷功能进行代刷。")
			TalkAppendString(varMap,"\t6.每次自动代刷最多只能选择30层，如果需要代刷的层数很多也可以多次使用此功能。")
			TalkAppendString(varMap,"\t7.手动挑战以及重置层数功能会消耗扫塔次数，但自动代刷不会消耗次数。")
		StopTalkTask()                                                                                                                                                                                                                                                                                                            
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)                                                                                                                                                                                                                                     
	end                                             
end  
