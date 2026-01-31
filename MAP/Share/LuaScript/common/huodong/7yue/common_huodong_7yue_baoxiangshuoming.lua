x302535_var_FileId = 302535
x302535_var_ask1 ="【活动】不知来历的宝箱"

x302535_var_answer1 ="【不知来历的宝箱】#W\n \n活动日期：#R7月24日#W至#R7月30日#W上午#R11：00#W\n \n#W活动地点：\n大都城外南部\n \n#W活动说明：#W\n\t经过勇士们的奋战，天狼军的袭击渐渐的退出了对领地的袭击，不过勇士们还是不能掉以轻心，不知道他们又在打什么主意！"
x302535_var_answer2 = "\t据小道消息说宝箱是天狼国的大巫师施展巫术想要将这些箱子从空中运回天狼国却没达成掉落下来的.我还听说里面有#G恶灵的诅咒#W还有#G神器#W！当然这些都是大都子民的传闻，想要清楚的知道里面有什么还要靠勇士你自己去发现了！祝你好运！"
function x302535_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	


	if which == 1 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,x302535_var_answer1)
		TalkAppendString(varMap,x302535_var_answer2)
		StopTalkTask()
		DeliverTalkMenu(varMap, varPlayer, varTalknpc)

	end
	

			
end


function x302535_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x302535_var_FileId, x302535_var_ask1,0,1)
end


