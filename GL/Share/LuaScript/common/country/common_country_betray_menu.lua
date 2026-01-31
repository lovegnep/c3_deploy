x300819_var_FileId	= 300819
x300819_var_QuestName = "【国家】改变国籍"
x300819_var_GameOpenId = 1098
x300819_var_SubQuests = {
						{countryid=0,varScript=300820,varName="前往楼兰王国"},
						{countryid=1,varScript=300821,varName="前往天山王国"},
						{countryid=2,varScript=300822,varName="前往昆仑王国"},
						{countryid=3,varScript=300823,varName="前往敦煌王国"}
						}

x300819_var_DynamicBetrayLevelLimit = 70 --动态叛国的等级限制

function x300819_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	--配置控制开关
	if GetCountryBetrayConfig() == 0 then
		return
	end
	
	--玩法控制开关
	if x300819_var_GameOpenId > 0 and GetGameOpenById( x300819_var_GameOpenId ) <= 0 then
      return
  end
  
	local varLevel = GetLevel(varMap, varPlayer)
	if varLevel >= 40 then
		TalkAppendButton(varMap,300819,x300819_var_QuestName,3)
	end
end


function x300819_ProcEventEntry( varMap, varPlayer, varTalknpc)

	StartTalkTask(varMap)

		local Readme_1 = "#Y【国家】改变国籍#r#W #r"
		local Readme_2 = "   您是否想去一个崭新的国度发展呢？#r"
		local Readme_3 = "   我能帮您实现您的愿望，只要花费一些#Y现金#W，我立刻可以把您送到您想要去的国家，并成为他们国家的一员。#r#r"
		local Readme_4 ="    您可以通过选择以下按钮来进行改变国籍。#r"
		local Readme_5= "#G提示：放弃国籍需要扣除您一定数量现金。"
		local varReadme = Readme_1..Readme_2..Readme_3..Readme_4..Readme_5
		TalkAppendString( varMap,varReadme)

		local cid = GetCurCountry(varMap, varPlayer)
		for varI,item in x300819_var_SubQuests do
			if cid ~= item.countryid then
				local nCost = x300819_GetBetrayCost(varMap, varPlayer, item.countryid)
				local varName = item.varName .. "(#c780000现金" .. floor(nCost/1000) .. "两#K)"
				TalkAppendButton( varMap, item.varScript, varName, 3, item.countryid );
			end
		end

	StopTalkTask(varMap)

	DeliverTalkMenu(varMap,varPlayer,varTalknpc);

end

function x300819_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
end




function x300819_ProcAccept( varMap, varPlayer )
end



function x300819_ProcQuestAbandon( varMap, varPlayer, varQuest )
end



function x300819_ProcContinue( varMap, varPlayer, varTalknpc )
end



function x300819_CheckSubmit( varMap, varPlayer )
end



function x300819_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )
end



function x300819_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )
end



function x300819_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end



function x300819_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end

--验证动态叛国条件
function x300819_CheckDynamicBetrayCondition()
	local nWorldId = GetWorldIdEx()
	local level = GetTopListInfo_MaxLevel(nWorldId)
	WriteLog(1, format("x300819_CheckDynamicBetrayCondition --- LevelToplist max level = %d", level))
	if (level >= x300819_var_DynamicBetrayLevelLimit) then
		return 1
	end
	return 0
end

--获取所有国家强弱的总值
function x300819_GetStrongWeakTotal()
	local total = 0
	for i = 0, 3 do
		total = GetStrongWeakScore(i) + total
	end
	
	return total
end

function x300819_GetBetrayCost(varMap, varPlayer, countryId)

	local nRank = GetCountryRank(countryId)
	local nCost = 0
	
	if nRank == 0 then 
		nCost = 250000		
	elseif nRank == 1 or nRank == 2 then 
		nCost = 100000		
	elseif nRank == 3 then 
		nCost = 50000		
	end	

	local result = x300819_CheckDynamicBetrayCondition()
	WriteLog(1, format("x300819_GetBetrayCost --- result = %d", result))
	
	if (result == 1) then  --判断是否满足动态叛国的条件
		local total = x300819_GetStrongWeakTotal()
		local playerCountry = GetCurCountry(varMap, varPlayer)
		
		if (playerCountry ~= -1) then
		
			local playerCountryStrongWeak = GetStrongWeakScore(playerCountry)
			local betrayStrongWeak = GetStrongWeakScore(countryId) --判去的国家
			WriteLog(1, format("x300819_GetBetrayCost --- playerCountryStrongWeak = %d, total = %d, betrayStrongWeak = %d"
									, playerCountryStrongWeak, total, betrayStrongWeak))
		
			if (playerCountryStrongWeak * 4 <= total) then 
				--本国强弱值小于1/4	
				if (playerCountryStrongWeak * 5 > total) then 
					--本国强弱值大于1/5
					if (betrayStrongWeak * 4 > total) then
						nCost = 100000
					end
					
				else 
					-- 本国强弱值小于1/5
					if (betrayStrongWeak * 4 > total) then
						nCost = 250000
					end
				end
				
			end
		end
	end

	return nCost
	
end
