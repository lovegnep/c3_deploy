x800098_var_ScriptId = 800098
x800098_var_SpellId = 14 --冥甲术生活技能ID

--任务文本描述
x800098_var_MissionName="耶路撒冷冥甲术"

--消耗类型1（0非绑定银币，1绑定银币，2非绑定金子，3绑定金子，4声望，5荣誉，6帮贡，10英雄会积分）

x800098_table_HellLevel = {
														[0] = "银币",
														[1]	= "绑定银币",
														[2] = "非绑定金子",
														[3] = "绑定金子",
														[4] = "声望",
														[5] = "荣誉",
														[6] = "帮贡",
														[10] = "英雄会积分",
														[88] = "经验",
														[11000630] = "幽冥之华",
													}

--MisDescEnd
--**********************************
--任务入口函数
--**********************************
function x800098_ProcEventEntry( varMap, varPlayer, targetId, scriptId, handlerType )	--点击该任务后执行此脚本
	
	if handlerType == 8 then
			--处理点击升级
			local ret = x800098_Levelup( varMap, varPlayer )
			if ret == 0 then
				--Msg2Player( varMap ,varPlayer, "升级冥甲术成功！", 0, 3 )
			elseif ret == 2 then
				Msg2Player( varMap ,varPlayer, "冥甲术达到最大等级，无法升级！", 0, 3 )
			elseif ret == 3 then
				Msg2Player( varMap ,varPlayer, "货币不足，无法升级！", 0, 3 )	
			elseif ret == 4 then
				Msg2Player( varMap ,varPlayer, "经验不足，无法升级！", 0, 3 )	
			elseif ret == 5 then
				Msg2Player( varMap ,varPlayer, "幽冥之华不足，无法升级！", 0, 3 )
			elseif ret == 6 then
				Msg2Player( varMap ,varPlayer, "删除物品失败！", 0, 3 )
			elseif ret == 7 then
				Msg2Player( varMap, varPlayer, "您的等级不够，无法升级！", 0, 3 )
			end
	end
	
	local currentLevel = QueryPlayerAbilityLevel( varMap, varPlayer, x800098_var_SpellId )
	local reqLevel, m1,c1,m2,c2,m3,c3, matId, matCount, beyondLevelMax = GetHellLevelupInfo( currentLevel + 1)
	
	local str = x800098_GetShowInfo( varMap, varPlayer )
	StartTalkTask( varMap )
		TalkAppendString( varMap, "#Y【冥甲术升级】" )
		TalkAppendString( varMap, str ) 
		if beyondLevelMax == 0 then
			TalkAppendButton( varMap, x800098_var_ScriptId, "确定", 1, 8 );
		end
	StopTalkTask( varMap )
	--DeliverTalkInfo( varMap, varPlayer,  targetId, x800098_var_ScriptId, -1  )
	DeliverTalkMenu(varMap, varPlayer, targetId)
	
end

--**********************************
--列举事件
--**********************************
function x800098_ProcEnumEvent( varMap, varPlayer, targetId, MissionId )
	TalkAppendButton(varMap,x800098_var_ScriptId,x800098_var_MissionName,3);
end


--********************
--检测接受条件
--**********************************
function x800098_ProcAcceptCheck( varMap, varPlayer, NPCId )
		return 1
end

--**********************************
--接受
--**********************************
function x800098_ProcAccept( varMap, varPlayer )
	
end

--**********************************
--放弃
--**********************************
function x800098_ProcQuestAbandon( varMap, varPlayer, MissionId )

end

--**********************************
--继续
--**********************************
function x800098_ProcContinue( varMap, varPlayer, targetId )

end

--**********************************
--检测是否可以提交
--**********************************
function x800098_CheckSubmit( varMap, varPlayer )

end

--**********************************
--提交
--**********************************
function x800098_ProcQuestSubmit( varMap, varPlayer, targetId,selectRadioId, MissionId )

end

--**********************************
--杀死怪物或玩家
--**********************************
function x800098_ProcQuestObjectKilled( varMap, varPlayer, objdataId, objId, MissionId )

end

--**********************************
--进入区域事件
--**********************************
function x800098_ProcAreaEntered( varMap, varPlayer, zoneId, MissionId )
end

--**********************************
--道具改变
--**********************************
function x800098_ProcQuestItemChanged( varMap, varPlayer, itemdataId, MissionId )
end


function x800098_GetShowInfo( varMap, varPlayer )

	---local currentLevel = GetHumanSkillLevel( varMap, varPlayer, x800098_var_SpellId );
	local currentLevel = QueryPlayerAbilityLevel( varMap, varPlayer, x800098_var_SpellId )
	if currentLevel < 0 then
		currentLevel = 0
	end
	local str = "";
	local nextLevel = currentLevel + 1
	if nextLevel <= 0 then 
		str = "error"
	else
		local reqLevel, m1,c1,m2,c2,m3,c3, matId, matCount, beyondLevelMax = GetHellLevelupInfo( nextLevel )
		if beyondLevelMax == 1 then
			str = "\t您当前冥甲术等级为"..currentLevel.."级,已经达到了最大等级!"
		else
			if nextLevel == 1 then
				str = "\t您还没有学习冥甲术。"
			else
				str = "\t您当前冥甲术等级为"..currentLevel.."级,"
			end
			
			str = str.."学习下一级冥甲术需要： \n\t#G个人等级 "..reqLevel.."#W\n\t"
			
			
			if m1 >= 0 and c1 > 0 then
				str = str.."#G"..x800098_table_HellLevel[m1].." "..x800098_GetMoneyStr(m1,c1).."#W\n\t"
			end
			
			if m2 >= 0 and c2 > 0 then
				str = str.."#G"..x800098_table_HellLevel[m2].." "..x800098_GetMoneyStr(m2,c2).."#W\n\t"
			end
			
			if m3 >= 0 and c3 > 0 then
				str = str.."#G"..x800098_table_HellLevel[m3].." "..x800098_GetMoneyStr(m3,c3).."#W\n\t"
			end
			
			if matId > 0 and matCount > 0 then
				str = str.."#G"..x800098_table_HellLevel[matId].." "..matCount.."个#W\n\t"
			end
			
			str = str.."\n您确定要学习吗？"
			if nextLevel == 1 then
				str = str.."\n \n#G小提示：学习此生活技能不受学习生活技能数量的限制。"
			end
		end
	end
	
	return str

end

function x800098_Levelup( varMap, varPlayer )
		--local currentLevel = GetHumanSkillLevel( varMap, varPlayer, x800098_var_SpellId );
			local currentLevel = QueryPlayerAbilityLevel( varMap, varPlayer, x800098_var_SpellId )
		if currentLevel < 0 then
			currentLevel = 0
		end
		local nextLevel = currentLevel + 1
		if nextLevel <= 0 then
			return 1
		end
		
		local reqLevel, m1,c1,m2,c2,m3,c3, matId, matCount, beyondLevelMax = GetHellLevelupInfo( nextLevel )
		if beyondLevelMax == 1 then
			return 2
		end
		
		if reqLevel > GetLevel( varMap, varPlayer ) then
			return 7
		end
		
		if m1 >=0 and c1 > 0 then
			 if m1 == 88 then
			 		 if GetExp( varMap, varPlayer ) < c1 then
			 		 		return 4
			 		 end
			 else
			 		if IsMoneyEnoughEx( varMap, varPlayer, m1, c1 ) == 0 then
			 				return 3
					end
			 end
		end 
			
		if m2 >=0 and c2 > 0 then
			 if m2 == 88 then
			 		 if GetExp( varMap, varPlayer ) < c2 then
			 		 		return 4
			 		 end
			 else
			 		if IsMoneyEnoughEx( varMap, varPlayer, m2, c2 ) == 0 then
			 				return 3
					end
			 end
		end 
		
		if m3 >=0 and c3 > 0 then
			 if m3 == 88 then
			 		 if GetExp( varMap, varPlayer ) < c3 then
			 		 		return 4
			 		 end
			 else
			 		if IsMoneyEnoughEx( varMap, varPlayer, m3, c3 ) == 0 then
			 				return 3
					end
			 end
		end 
		
		if matId > 0 and matCount > 0 then
				if HaveItemInBagNew( varMap, varPlayer, matId ) < matCount then
						return 5
				end
		else
		
		end
		
		
		--东西都充足，开始减东西
		if matId > 0 and matCount > 0 then
				if DelItem( varMap, varPlayer, matId, matCount ) <= 0 then
					return 6
				end
		end
		
		local currencyActType = 400
		if m1 > 0 and c1 > 0 then
				if m1 == 88 then
						DecreaseExp( varMap, varPlayer, c1 )
				else
						SpendMoneyEx( varMap, varPlayer, m1, c1, currencyActType )
				end
		end
		
		if m2 > 0 and c2 > 0 then
				if m2 == 88 then
						DecreaseExp( varMap, varPlayer, c2 )
				else
						SpendMoneyEx( varMap, varPlayer, m2, c2, currencyActType )
				end
		end
		
		if m3 > 0 and c3 > 0 then
				if m3 == 88 then
						DecreaseExp( varMap, varPlayer, c3 )
				else
						SpendMoneyEx( varMap, varPlayer, m3, c3, currencyActType )
				end
		end
	
				
		--AddSkillToPlayer( varMap, varPlayer, x800098_var_SpellId, nextLevel, 2  )
		SetPlayerAbilityLevel( varMap, varPlayer, x800098_var_SpellId, nextLevel )
		return 0	

end


function x800098_GetMoneyStr( varType, varCount )
	
	 if varType ~= 0 and varType ~= 1 and varType ~= 2 and varType ~= 3 then
	 		return tostring(varCount)
	 end
	
	 local	ding = floor( varCount / (1000*1000) )
	 local	liang = floor( mod(varCount,1000*1000)/ 1000 )
	 local  wen = mod(varCount,1000)
	 
	 local str = ""
	 if ding > 0 then
	 		str = ding.."锭"
	 end
	 
	 if liang > 0 then
	 		str = str..liang.."两"
	 end
	 
	 if wen > 0 then
	 		str = str..wen.."文"
	 end
	 
	 return str
	 
end
