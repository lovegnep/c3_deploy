x300932_var_FileId = 300932
x300932_var_QuestName = "【国家】放弃领地"

function x300932_ProcEnumEvent( varMap, varPlayer, varTalknpc, varIndex )
	if GetGuildID( varMap, varPlayer ) == -1 then
		
		return
	end
	
	
		TalkAppendButton(varMap,x300932_var_FileId, x300932_var_QuestName, 3)
	
end

function x300932_ProcEventEntry( varMap , varPlayer , varTalknpc , varState , varIndex )
	StartTalkTask(varMap)
	local Readme_1 = "#Y【国家】放弃领地#r#W"
	local Readme_2 = "\t您好，尊敬的领地占有者！您可以在我这里对您当前的领地进行处置，如果您选择放弃领地，您将不会获得任何收益，您现在要放弃对领地的所有权吗？"
	local varReadme = Readme_1..Readme_2
	TalkAppendString(varMap, varReadme);StopTalkTask(varMap);DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300932_var_FileId, -1 );
end

function x300932_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1
end

function x300932_ProcAccept( varMap, varPlayer)
	
	
	
	
	local nGuildId = GetGuildID(varMap,varPlayer)
	if nGuildId < 0 then
		return
	end
	
	
    local pos = GetGuildOfficial(varMap, varPlayer)
	if pos ~= 5 then
		Msg2Player(varMap,varPlayer,"很抱歉，您没有权利",8,3)
		Msg2Player(varMap,varPlayer,"只有帮主才可以放弃对领地的拥有权！",8,2)
        return
    end
	
	
	local nMapId0,nMapId1,nMapId2 = GetGuildLairdSceneId(nGuildId)
	if nMapId0 <= 0 then
		Msg2Player(varMap,varPlayer,"你不是领地的主人",8,3)
		Msg2Player(varMap,varPlayer,"很抱歉，您的帮会目前没有领地所有权",8,2)
		return
	end
	
	
	if IsPasswordProtect(varMap,varPlayer ) == 1 then
		return
	end
	
	
	GameBattleCancleLaird(varMap,varPlayer)
	Msg2Player(varMap,varPlayer,"顺利放弃领地",8,3)
	Msg2Player(varMap,varPlayer,"很遗憾，您放弃了领地所有权。",8,2)
	Msg2Player(varMap,varPlayer,"很遗憾，帮主放弃了领地所有权！",6,1)
	
end
