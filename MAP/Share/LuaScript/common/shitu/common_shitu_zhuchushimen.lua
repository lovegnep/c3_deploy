


x800011_var_FileId	= 800011

x800011_var_QuestName	= "【师徒】开除徒弟"


x800011_var_Gold			= 5000
x800011_var_CostMoneyType  		= 2
x800011_var_Item = 11990111
x800011_var_PrenticeCount = 5



function x800011_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton(varMap, x800011_var_FileId, x800011_var_QuestName,3,0);
end

function x800011_ProcEventEntry(varMap, varPlayer, varTalknpc, eventId, varIndex)
	local	key	= varIndex
	local guid
	local PrenticeName
	local	isHavePrentice	= 0
	local	varStr
	if key == 0 then
		StartTalkTask( varMap )
		for varI=0, x800011_var_PrenticeCount - 1 do
			guid = GetPrenticeGUID( varMap, varPlayer, varI )
			if guid ~= -1 then
				isHavePrentice	= 1
				PrenticeName	= GetFriendName( varMap, varPlayer, guid )
				TalkAppendString( varMap, "#Y"..x800011_var_QuestName.."#W")
				TalkAppendString( varMap, "\t开除徒弟后，不会再从此人及其徒弟那里获得威望收益。请慎重考虑后选择与哪位徒弟解除师徒关系。")
				TalkAppendButton( varMap, x800011_var_FileId, "与"..PrenticeName.."解除师徒关系", -1, (varI+1)*100 )
			end
		end
		if isHavePrentice == 0 then
			TalkAppendString( varMap, "很抱歉，您还不是师傅，无法开除徒弟。" )
		end
		StopTalkTask( varMap )
		DeliverTalkMenu( varMap, varPlayer, varTalknpc )
	end
	
	if key >= 100 and key < 10000 then
		key = floor(key/100)-1
		guid	= GetPrenticeGUID( varMap, varPlayer, key )
		if guid ~= -1 then
			PrenticeName	= GetFriendName( varMap, varPlayer, guid )
		end
		varStr	= format( "此处说明需要的东西" )
		StartTalkTask( varMap )
			
			TalkAppendButton( varMap, x800011_var_FileId, "是", -1, (key+1)*10000 )
		StopTalkTask( varMap )
		DeliverTalkMenu( varMap, varPlayer, varTalknpc )
	end
	
	if key >= 10000 then
			key = floor(key/10000)-1
			x800011_ProcAccept( varMap, varPlayer, key )
	end
		
	
	
	
	
	
	
	

end







function x800011_ProcAcceptCheck(varMap, varPlayer, varTalknpc)

	return 1;

end









function x800011_ProcAccept( varMap, varPlayer, varIndex )
	
	local PrenticeGUID = GetPrenticeGUID( varMap, varPlayer, varIndex )
	if PrenticeGUID == -1 then
		Msg2Player(varMap,varPlayer,"很抱歉，您还不是师傅，无法开除徒弟。",8,2)
		Msg2Player(varMap,varPlayer,"很抱歉，您还不是师傅，无法开除徒弟。",8,3)
		return
	end
	
	
	
	
	
	
	
	
	
	
	
	
	
	local PrenticeName	= GetFriendName( varMap, varPlayer, PrenticeGUID )
	local selfName	= GetName( varMap, varPlayer )

	
	
	
	
	
	
	
	
	
	
	local Msg = format("很遗憾，您解除了与徒弟%s的师徒关系", PrenticeName);
	Msg2Player(varMap,varPlayer,Msg,8,2)
	Msg2Player(varMap,varPlayer,Msg,8,3)
	
	SendSystemPost( varMap, PrenticeName, "很遗憾，您的师傅" .. selfName .. "与您解除了师徒关系。" )
	
	SendScriptPost( varMap, PrenticeName, MAIL_EXPELPRENTICE, 1, GetGUID(varMap, varPlayer), 0, varPlayer )
	
	ExpelPrentice( varMap, varPlayer, PrenticeGUID, 2 )
	
	--在线好友,师徒,夫妻加成更新
	LuaCallNoclosure(802003, "SetOlineData", varMap, varPlayer, PrenticeGUID, 16)
end
