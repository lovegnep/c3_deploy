

--DECLARE_QUEST_INFO_START--
x310321_var_FileId = 310321
x310321_var_QuestId = 9045

x310321_var_QuestName="【个人】暴龙大作战"


x310321_var_HongNpc 		= 145002
x310321_var_HongName		="我要支持暴红！"
x310321_var_HongChaxun	="查询支持暴红的人数"
x310321_var_HongBuff		= 7536

x310321_var_LanNpc 		= 145001
x310321_var_LanName		="我要支持暴蓝！"
x310321_var_LanChaxun		="查询支持暴蓝的人数"
x310321_var_LanBuff		= 7537

x310321_var_MainScriptId	=	310320

--DECLARE_QUEST_INFO_STOP--

x310321_var_HongNum	= 0
x310321_var_LanNum	= 0
x310321_var_MinLevel	= 65


function x310321_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)




	local varTalkNpcGUID = GetMonsterGUID(varMap, varTalknpc)
	
	if IsHaveQuest(varMap,varPlayer, x310321_var_QuestId) > 0 and  IsQuestHaveDone(varMap, varPlayer, x310321_var_QuestId) < 1 then
		if varTalkNpcGUID == x310321_var_HongNpc then
			TalkAppendButton( varMap, x310321_var_FileId, x310321_var_HongName, 3, 0 )
			TalkAppendButton( varMap, x310321_var_FileId, x310321_var_HongChaxun, 3, 1 )
		else
			TalkAppendButton( varMap, x310321_var_FileId,  x310321_var_LanName, 3, 2 )
			TalkAppendButton( varMap, x310321_var_FileId,  x310321_var_LanChaxun, 3, 3 )
		end
	else
		StartTalkTask(varMap)
        TalkAppendString(varMap,"\t你还没有接取【个人】暴龙大作战任务！")
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
	end
	
end

function x310321_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)
	
end

function x310321_ProcEventEntry(varMap ,varPlayer, varTalknpc,idScript,idExt )	
	
	
	if IsHaveQuest(varMap,varPlayer, x310321_var_QuestId) < 1 then
		StartTalkTask(varMap)
        TalkAppendString(varMap,"\t你还没有接取【个人】暴龙大作战任务！")
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x310321_var_QuestId)
	
	if GetQuestParam( varMap, varPlayer, varQuestIdx, 0) == 1 and GetQuestParam( varMap, varPlayer, varQuestIdx, 7) == 1 then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"你已完成此任务")
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
		return
	end	








		
	if idExt == 0 then
		if IsHaveSpecificImpact( varMap, varPlayer, x310321_var_HongBuff) == 1 then
			StartTalkTask(varMap)
        	TalkAppendString(varMap,"\t你刚才已经选择支持暴红了。你可以去暴蓝那里改变你的选择。")
        	StopTalkTask(varMap)
        	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
        	return
        	
        	
		elseif IsHaveSpecificImpact( varMap, varPlayer, x310321_var_LanBuff) == 1 then
			CancelSpecificImpact( varMap, varPlayer, x310321_var_LanBuff)
			
			LuaCallNoclosure(x310321_var_MainScriptId,"SetLanNumInc",varMap,varPlayer, -1)
			
      	end
      	local varRet = SendSpecificImpactToUnit(varMap ,varPlayer,varPlayer,varPlayer,x310321_var_HongBuff, 0)
      	
      	ReCallHorse( varMap, varPlayer)
		LuaCallNoclosure(x310321_var_MainScriptId,"SetHongNumInc",varMap,varPlayer, 1)
		StartTalkTask(varMap)
        TalkAppendString(varMap,"\t你决定支持暴红，为了表达它的谢意，暴红将你变成了它的模样......")
        StopTalkTask(varMap)

        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
        
        
	elseif idExt == 1 then
	    if IsHaveSpecificImpact( varMap, varPlayer, x310321_var_HongBuff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, x310321_var_LanBuff) == 1 then
		    local varNum = LuaCallNoclosure(x310321_var_MainScriptId,"GetHongNum",varMap,varPlayer)
		    StartTalkTask(varMap)
            TalkAppendString(varMap,format("\t根据统计，目前暴红有%d位支持者。", varNum))
            StopTalkTask(varMap)
            DeliverTalkMenu(varMap,varPlayer,varTalknpc)
        else
            Msg2Player(varMap, varPlayer, "只有在支持了某位暴龙之后才能查询支持人数", 0, 2)
		    Msg2Player(varMap, varPlayer, "只有在支持了某位暴龙之后才能查询支持人数", 0, 3)
		end    
        
        
        
	elseif idExt == 2 then
		local s = IsHaveSpecificImpact( varMap, varPlayer, x310321_var_LanBuff )
		
		if IsHaveSpecificImpact( varMap, varPlayer, x310321_var_LanBuff) == 1 then
			StartTalkTask(varMap)
        	TalkAppendString(varMap,"\t你刚才已经选择支持暴蓝了。你可以去暴红那里改变你的选择。")
        	StopTalkTask(varMap)
        	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
        	return
		elseif IsHaveSpecificImpact( varMap, varPlayer, x310321_var_HongBuff) == 1 then
			CancelSpecificImpact( varMap, varPlayer, x310321_var_HongBuff)
			
			LuaCallNoclosure(x310321_var_MainScriptId,"SetHongNumInc",varMap,varPlayer, -1)
        end
		
		local varRet = SendSpecificImpactToUnit(varMap ,varPlayer,varPlayer,varPlayer,x310321_var_LanBuff, 0)
		
		ReCallHorse( varMap, varPlayer)
		
		local varNum1 = LuaCallNoclosure(x310321_var_MainScriptId,"SetLanNumInc",varMap,varPlayer, 1)
		local varNum =  LuaCallNoclosure(x310321_var_MainScriptId,"GetLanNum",varMap,varPlayer)	
		
		StartTalkTask(varMap)
        TalkAppendString(varMap,"\t你决定支持暴蓝，为了表达它的谢意，暴蓝将你变成了它的模样......")
        StopTalkTask(varMap)
       	DeliverTalkMenu(varMap,varPlayer,varTalknpc)
        
	elseif idExt == 3 then
	   if IsHaveSpecificImpact( varMap, varPlayer, x310321_var_HongBuff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, x310321_var_LanBuff) == 1 then
		local varNum =  LuaCallNoclosure(x310321_var_MainScriptId,"GetLanNum",varMap,varPlayer)	
		StartTalkTask(varMap)
        TalkAppendString(varMap,format("\t根据统计，目前暴蓝有%d位支持者。", varNum))
        StopTalkTask(varMap)
        DeliverTalkMenu(varMap,varPlayer,varTalknpc)
        
       else
        Msg2Player(varMap, varPlayer, "只有在支持了某位暴龙之后才能查询支持人数", 0, 2)
		Msg2Player(varMap, varPlayer, "只有在支持了某位暴龙之后才能查询支持人数", 0, 3)
	   end   
	end
end	

