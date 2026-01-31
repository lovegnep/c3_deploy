x800068_var_FileId = 800068
x800068_var_ask ={"装备保值（跨级装备）说明"}
x800068_var_answer ={"\t跨级装备保值，可以将原有装备的升星，灵魂铭刻，麻将铭刻，打孔，紫色属性完美的复制到新装备上。\n\t只能将神字级装备的相关属性复制到天字级装备上，且神字级装备必须为紫色装备，所保值装备的品质，部件必须完全一致，保值后的装备会成为绑定装备。\n\t注意：原有装备的#g升星#w，#g灵魂铭刻#w，#g麻将铭刻#w，#g打孔#w，#g紫色属性#w五项属性，将会完全替换新装备的此五项属性，#r如果原有装备没有某项属性，新装备也将会没有。"}

function x800068_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,which)	
		if which == 0 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800068_var_answer[1])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 1 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800068_var_answer[2])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 2 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800068_var_answer[3])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 3 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800068_var_answer[4])
			
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif which == 4 then
			StartTalkTask(varMap)
			TalkAppendString(varMap,x800068_var_answer[5])
			TalkAppendButton(varMap, x800068_var_FileId, x800068_var_ask[1],0,0)
      TalkAppendButton(varMap, x800068_var_FileId, x800068_var_ask[2],0,1)
      TalkAppendButton(varMap, x800068_var_FileId, x800068_var_ask[3],0,2)
      TalkAppendButton(varMap, x800068_var_FileId, x800068_var_ask[4],0,3)
		  StopTalkTask()
			DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		end

	
	
end








function x800068_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
			TalkAppendButton(varMap, x800068_var_FileId, x800068_var_ask[1],0,0)
end








