--冥装图谱学习处理

x404912_var_HellSpellId = 14 --冥甲术生活技能ID

function x404912_ProcEventEntry( varMap, varPlayer, varBagIdx )

end


function x404912_ProcIsSpellLikeScript( varMap, varPlayer )
	return 1; 
end



function x404912_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end



function x404912_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end

	return x404912_doCheck( varMap, varPlayer, 1 )

end


function x404912_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then
		return 1;
	end
	return 0;
end

function x404912_ProcActivateOnce( varMap, varPlayer )
	
	return x404912_doCheck( varMap, varPlayer, 0 )
	
end


function x404912_ProcActivateEachTick( varMap, varPlayer)
		return 1; 
end

function x404912_doCheck( varMap, varPlayer , varOnlyCheck )

	local varLevel = QueryPlayerAbilityLevel( varMap, varPlayer, x404912_var_HellSpellId );
	if varLevel <= 0 then
						
			StartTalkTask(varMap);
			TalkAppendString(varMap, "您还没有学习冥甲术，无法使用此物品！");
			StopTalkTask();
			DeliverTalkTips(varMap, varPlayer);
			return 0
	end
	
	local itemId = GetActuveItemTableIndex( varMap, varPlayer )
	local skillId, needHellLevel, hasStudied = GetPlayerHellSubSkillInfo( varMap, varPlayer, itemId )
	if skillId > 0 then
					
			
			if hasStudied > 0 then
					StartTalkTask(varMap);
					TalkAppendString(varMap, "您已经学过了此配方！");
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					return 0
			end
			
			if needHellLevel > varLevel then
					StartTalkTask(varMap);
					TalkAppendString(varMap, "冥甲术等级达到"..needHellLevel.."级才能使用此物品！");
					StopTalkTask();
					DeliverTalkTips(varMap, varPlayer);
					return 0
			
			end
			
				if varOnlyCheck > 0 then
						return 1
				end
				SetPlayerHellSubSkill( varMap, varPlayer, skillId, 1 )
				StartTalkTask(varMap);
				TalkAppendString(varMap, "你学会了此配方！");
				StopTalkTask();
				DeliverTalkTips(varMap, varPlayer);
				return 1
		
	end		
	
	return 0

end

