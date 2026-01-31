


x302502_var_FileId = 302502
x302502_var_Buf1 = 7520 
x302502_var_item = 12271021



function x302502_ProcEventEntry( varMap, varPlayer, varBagIdx )
		





  
end

function x302502_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1;     
	
	

end

function x302502_ProcCancelImpacts( varMap, varPlayer )
	return 0; 

end

function x302502_ProcConditionCheck( varMap, varPlayer )
	
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end

function x302502_ProcDeplete( varMap, varPlayer )
	return 1
end

function x302502_ProcActivateOnce( varMap, varPlayer )
	
	local questID = {3200	,3201,3202,3203,3204,3205,3206,3207,3208,3209,3210,3211,3212,3213,3214,}
	local nodoneQuestId = {}
	local ishavenodonwQuestId = {}
	for k , v in questID do
		if IsQuestHaveDone(varMap, varPlayer,v) <=0  then
			additemintable(nodoneQuestId,v)
		end
		if IsHaveQuest(varMap, varPlayer,v) >0 then
			additemintable(ishavenodonwQuestId,v)
		end
	end
	if nodoneQuestId == nil then return end
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		
		if nodoneQuestId ~= nil then
			for k,v in nodoneQuestId do
				QuestCom(varMap, varPlayer,v)
			end
		end
		
		if ishavenodonwQuestId ~= nil then
			for k,v in ishavenodonwQuestId do
				DelQuest(varMap, varPlayer,v)
			end
		end
		
		local level = GetLevel(varMap,varPlayer)
		local xinshoucun = {87,187,287,387}
		local country = GetCurCountry(varMap,varPlayer)
		if level < 10 then
			SetLevel(varMap,varPlayer,10)
		end
		if varMap == xinshoucun[country+1] then
			SetPos(varMap,varPlayer,320,155)
		else
			NewWorld(varMap,varPlayer,xinshoucun[country+1],320,155,x302502_var_FileId)
		end
		
	else
			StartTalkTask(varMap)
			TalkAppendString(varMap,"使用物品异常！")
			StopTalkTask(varMap)
			DeliverTalkTips(varMap,varPlayer)
	end

end

--往TABLE里面添加元素
function additemintable(table,value)
	local tablelong = getn(table)
	table[tablelong+1] = value
end

function x302502_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
