





x300705_var_FileId = 300705 
x300705_var_ItemID = 12250009
x300705_var_BanZhuanBuff				= 30560

x300705_var_xianrengu =
{
	[45]  = {{37,101},{73,115},{113,115},{108,72},{80,55},{47,83},{18,45},{47,40},{74,27 },{101,39 }},--粮仓1
	[46]  = {{69,31},{30,25},{56,64},{20,69},{52,95},{84,99},{114,109},{110,65},{97,50},{96,25}},--粮仓2
	[47]  = {{104,21},{100,39},{114,104},{113,62},{80,101},{49,103},{15,100},{25,76},{56,55},{36,30}},--粮仓3
	[48]  = {{115,96},{95,75},{114,35},{80,9},{23,16},{29,45},{78,43},{64,78},{54,114},{29,111}},--粮仓4
	[49]  = {{103,106},{102,77},{102,44},{101,25},{65,23},{26,24},{25,74},{28,104},{61,104},{48,50}},--粮仓5
	[465] = {{37,102},{26,79},{24,63},{31,29},{66,29},{87,26},{74,65},{96,97},{82,108},{75,64}},--仙人谷1
	[466] = {{104,31},{102,70},{106,104},{69,103},{40,103},{22,74},{21,32},{52,18},{72,71},{57,75}},--仙人谷2
	[467] = {{102,89},{103,55},{86,18},{71,67},{42,70},{52,38},{26,95},{20,68},{22,35},{45,51}},--仙人谷3
	[468] = {{103,16},{69,17},{34,35},{66,48},{102,49},{97,79},{48,80},{98,109},{68,106},{15,106}},--仙人谷4
	[469] = {{16,66},{20,28},{75,23},{107,46},{102,100},{59,98},{79,60},{45,63},{60,48},{60,64}},--仙人谷5
	[44] = {
			{484,474},{469,465},{449,457},{477,398},{472,360},{441,338},{381,421},{353,448},{343,477},{471,221},
		    {471,252},{449,254},{436,279},{391,296},{382,274},{357,243},{330,243},{313,206},{299,195},{295,186},
			{428,87},{420,102},{411,123},{471,81},{444,41},{394,56},{365,86},{299,64},{266,63},{230,63},
			{174,74},{173,39},{131,66},{169,103},{117,153},{141,188},{89,116},{63,227},{115,297},{153,316},
			{216,317},{213,357},{240,362},{144,392},{242,141},{305,150},{266,281},{38,168},{243,38},{355,228},
			{208,127},{217,175},{339,131},{126,243},{181,257},{270,314},{329,314},{279,392},{342,388},{365,358}--后花园
			},
	[567]={
			{89,70},{103,79},{92,93},{109,103},{101,108},{93,124},{117,125},{110,143},{112,156},{112,179},{142,193},{146,175},{161,161},{161,182},{148,205},{135,212},{109,228},{84,212},{85,235},{156,236},{154,262},{161,273},{175,255},{196,241},{194,250},{210,228},{185,213},{170,226},{231,230},{225,240},{251,221},{267,211},{260,210},{279,204},{282,196},{280,213},{279,183},{261,176},{257,183},{243,189},{238,198},{231,175},{221,166},{223,148},{219,138},{209,158},{263,140},{253,133},{261,159},{335,84},{336,104},{336,127},{333,137},{332,117},{343,148},{337,171},{383,160},{379,175},{363,174},{350,192},{333,201},{416,123},{426,113},{405,113},{397,75},{383,82},{358,86},{378,90},{394,123},{371,263},{330,242},{306,255},{338,225},{327,229},{346,279},{375,275},{369,294},{381,334},{372,347},{393,322},{411,322},{445,285},{456,286},{442,298},{255,283},{259,292},{261,366},{254,373},{244,353},{259,335},{220,360},{184,379},{191,364},{193,351},{207,354},{178,355},{168,330},{147,345},{144,330},{112,361},{125,335},{99,326},{72,319},{81,304},{72,293},{73,279},{56,253},{384,341},
	},--帕尔马港
	[569]={
			{71,263},{82,261},{80,267},{83,277},{86,287},{97,285},{76,303},{86,304},{96,310},{91,319},{82,325},{94,273},{95,262},{105,245},{89,243},{78,229},{77,216},{77,211},{98,222},{109,234},{118,223},{133,231},{131,219},{146,221},{150,229},{109,187},{113,168},{119,202},{148,195},{145,176},{131,147},{116,135},{101,121},{94,114},{137,109},{158,99},{178,88},{160,64},{176,61},{182,31},{202,38},{189,45},{169,38},{144,32},{114,32},{83,32},{231,133},{229,70},{261,70},{274,68},{296,83},{317,81},{326,91},{344,75},{349,94},{354,105},{361,117},{379,101},{394,87},{401,72},{418,109},{414,122},{420,123},{418,136},{436,219},{440,224},{412,196},{404,209},{399,222},{401,250},{386,324},{353,300},{347,278},{326,331},{334,243},{335,222},{305,257},{329,343},{318,368},{305,317},{272,314},{253,301},{249,349},{247,246},{256,234},{200,228},{180,216},{180,247},{201,248},{218,354},{197,347},{207,329},{242,354},{159,376},{122,329},
	},--卡迪兹港
}
x300705_var_mijing =
{
	[45]  = {{12,106}},--粮仓1
	[46]  = {{16,110}},--粮仓2
	[47]  = {{16,24}},--粮仓3
	[48]  = {{17,87}},--粮仓4
	[49]  = {{85,109}},--粮仓5
	[465] = {{99,77}},--仙人谷1
	[466] = {{48,42}},--仙人谷2
	[467] = {{66,105}},--仙人谷3
	[468] = {{20,80}},--仙人谷4
	[469] = {{21,102}},--仙人谷5
	[44] = {{10,10}},--后花园
	[567]={{180,380}},
	[569]={{97,285}},
}


function x300705_ProcEventEntry( varMap, varPlayer, varBagIdx,varOpType )

end






function x300705_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300705_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300705_ProcConditionCheck( varMap, varPlayer, varBagIdx)
	if IsHaveSpecificImpact(varMap, varPlayer, x300705_var_BanZhuanBuff) == 1 then
		Msg2Player(varMap,varPlayer,"携带寒玉状态无法使用随机卷轴！",8,3)
		Msg2Player(varMap,varPlayer,"携带寒玉状态无法使用随机卷轴！",8,2)
		return
	end

	if varMap ~= 45  and varMap ~= 46  and varMap ~= 47  and varMap ~= 48  and varMap ~= 49  and varMap ~= 465 and varMap ~= 466 and varMap ~= 467 and varMap ~= 468 and  varMap ~= 469 and varMap ~= 44 and varMap ~= 567 and varMap ~= 569 then
		local varMsg = "只有仙人谷、粮仓、后花园、帕尔马港、卡迪兹港才可使用随机卷轴！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
	end	
	
	local varLevel = GetLevel(varMap, varPlayer)
	if varLevel < 10 then
		local varMsg = "10级以上才能使用随机卷轴！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return
	end
	
	if IsBusMember(varMap, varPlayer) == 1 then
		local varMsg = "运镖、乘坐公车或者护送状态时不能使用随机卷轴！"
		StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 
	end
	if IsInChariot(varMap, varPlayer) > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "战车状态时不能使用随机卷轴！");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"战车状态时不能使用随机卷轴！",8,2)
		return 0
	end			
	if IsHaveSpecificImpact( varMap, varPlayer, 7702 ) > 0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "扛着旗子不能使用随机卷轴！");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"扛着旗子不能使用随机卷轴！",8,2)
		return 0
	end
	if IsHaveSpecificImpact( varMap, varPlayer, 7062 ) > 0 
		or IsHaveSpecificImpact( varMap, varPlayer, 7063 ) >0 
		or IsHaveSpecificImpact( varMap, varPlayer, 7064 ) >0
		or IsHaveSpecificImpact( varMap, varPlayer, 7065 ) >0 then
		StartTalkTask(varMap);
		TalkAppendString(varMap, "携带龙魂状态不能来参与活动");
		StopTalkTask(varMap);
		DeliverTalkTips(varMap,varPlayer);
		Msg2Player(varMap,varPlayer,"携带龙魂状态不能来参与活动",8,2)
		return 0
	end
	
	local IsHaveFlag = IsHaveSpecificImpact(varMap, varPlayer, 7536  )
    if IsHaveFlag ~= 0 then
    	local varMsg = "在暴龙大作战期间，不能传送"
    	StartTalkTask(varMap)
			TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return 0
    end
	
	-- local selfType = GetObjType(varMap, varPlayer)
	
	-- if selfType == 1 then 
		
		-- if IsHaveQuestNM( varMap, varPlayer, 7537) ~= 0 or  IsHaveQuestNM( varMap, varPlayer, 7538) ~= 0 or IsHaveQuestNM( varMap, varPlayer, 7539) ~= 0 then
			-- Msg2Player(varMap,varPlayer,"很抱歉，未完成铁人三项任务时无法通往其他场景！",8,2)
			-- return
		-- end		
		
	-- end
	
	if GetSceneType(varMap) == 2 then
		local varMsg = "战场内，不能传送"
    	StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return -1
	end
	
	if GetSceneType(varMap) == 1 then
		local varMsg = "副本内，不能传送"
    	StartTalkTask(varMap)
		TalkAppendString(varMap, varMsg);
		StopTalkTask(varMap)
		DeliverTalkTips(varMap,varPlayer)
		Msg2Player(varMap,varPlayer,varMsg,8,2)
		return -1
	end
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; 
end


function x300705_ProcAddItem(varMap, varPlayer, varItem)
end






function x300705_ProcDeplete( varMap, varPlayer,varBagIdx )

	local n = random(1, 999)
	local randx = -1
	local randy = -1
	local x, y = GetWorldPos(varMap, varPlayer)	
	while (0) do
		if n <=999 then
			local i = random(1, getn(x300705_var_xianrengu[varMap]))
			local rx = random(-3,3)
			local ry = random(-3,3)
			randx = x300705_var_xianrengu[varMap][i][1] + rx
			randy = x300705_var_xianrengu[varMap][i][2] + ry
			
		elseif n > 999 then
			local j = random(1, getn(x300705_var_mijing[varMap]))
			randx = x300705_var_mijing[varMap][j][1]
			randy = x300705_var_mijing[varMap][j][2]
		end
		
		if abs(randx - x) > 10 or abs(randy - y) > 10 then
			SetPos(varMap,varPlayer,randx,randy)
			break
		end
	end
	
	if varImpact ~= -1 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 7719, 0);
	end

	DepletingUsedItem(varMap, varPlayer)
 return 1
end

function x300705_ProcAddMoney(varMap, varPlayer)
end

function x300705_ProcAddItemByLevel(varMap, varPlayer)	
end








function x300705_ProcActivateOnce( varMap, varPlayer, varImpact )	
end







function x300705_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
