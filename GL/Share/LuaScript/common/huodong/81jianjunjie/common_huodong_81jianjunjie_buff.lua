
x302539_var_Xinbing_FileId			=	302539
x302539_var_levelupexp ={30,60,90}
x302539_var_buff = 7774

x302539_var_buffstep = {26382,26383,26384,26385,26386,26387}

x302539_var_temp = 1

x302539_var_IsAward ={}

x302539_var_bingqiitem = 12032035

x302539_var_moneytype = {
	{10,11,12,13,14,15},
	{0.5,0.6,0.7,0.8,0.9,1},
	{100,110,120,130,140,150},
	{50,55,60,65,70,80},
}

x302539_var_buff = {

	{26376,26375,26374,26373,26372,26371,26370,},--暴击伤害
	{26366,26365,26364,26363,26362,26361,26360,},--闪避
	{26356,26355,26354,26353,26352,26351,26350,},--韧性
	{26346,26345,26344,26343,26342,26341,26340,},--命中
	{26336,26335,26334,26333,26332,26331,26330,},--暴击
	{26326,26325,26324,26323,26322,26321,26320,},--血量
	{26316,26315,26314,26313,26312,26311,26310,},--防御
	{26306,26305,26304,26303,26302,26301,26300,},--攻击

}

function x302539_ProcIntervalOverEvent( varMap, varPlayer )
	
	if GetItemIsOverTimeByBagPos(varMap, varPlayer,14,1) == 1 then
			
		if IsHaveSpecificImpact( varMap, varPlayer, 7774) >0 then
			CancelSpecificImpact(varMap, varPlayer, 7774)
		end
	end
	
	x302539_var_temp = LuaCallNoclosure(302538,"GetGiftnum",varMap, varPlayer) + 1
	
	local mintime = GetMinOfDay() 
	local playerLevel =GetLevel(varMap,varPlayer)
	local day = GetDayOfYear()
	for k,v in x302539_var_buffstep do
		if IsHaveSpecificImpact( varMap, varPlayer, v) == 1 then
			CancelSpecificImpact(varMap, varPlayer, v)
		end
	end
	if day < 211 or day > 218 then return end
	
	if 	playerLevel < 40 then return end
	
	if varMap ~=3 and varMap ~= 544 then return end
	
	if mintime == 23*60 and x302539_var_IsAward[GetGUID(varMap, varPlayer)] ~=1 then
		x302539_var_IsAward[GetGUID(varMap, varPlayer)] = 1
		Msg2Player( varMap, varPlayer,format( "您获得了#G%d经验",playerLevel*10000), 8, 3)
		AddExp(varMap,varPlayer,playerLevel*10000)
		StartItemTask(varMap)
		ItemAppendBind( varMap, x302539_var_bingqiitem,1 )
		local ret = StopItemTask(varMap,varPlayer)
		if ret > 0 then
			DeliverItemListSendToPlayer(varMap,varPlayer)
			GamePlayScriptLog( varMap, varPlayer, 3872)
		end
	elseif mintime < 22*60 +20 or mintime > 23*60 then
		return
	end



	for k,v in x302539_var_buffstep do

		if k == x302539_var_temp then
			--if IsHaveSpecificImpact( varMap, varPlayer, v) ~= 1 then
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, v, 0)
			--end
		end
	
	end
	local temp = random(100)
	
	if temp <= 62 then
		Msg2Player( varMap, varPlayer,format( "您获得了#G%d经验",playerLevel*45), 8, 3)
		AddExp(varMap,varPlayer,playerLevel*45)
	elseif temp <= 66 then
		Msg2Player( varMap, varPlayer,format( "您获得了#{_MONEY%d}银卡",x302539_var_moneytype[1][x302539_var_temp]*1000), 8, 3)
		AddMoney( varMap, varPlayer, 1, x302539_var_moneytype[1][x302539_var_temp]*1000)
	elseif temp <= 70 then
		Msg2Player( varMap, varPlayer,format( "您获得了#{_MONEY%d}金卡",x302539_var_moneytype[2][x302539_var_temp]*1000), 8, 3)
		AddMoney( varMap, varPlayer, 3, x302539_var_moneytype[2][x302539_var_temp]*1000)
	elseif temp <= 80 and playerLevel >= 70 then
		Msg2Player( varMap, varPlayer,format( "您获得了#G%d灵力",x302539_var_moneytype[3][x302539_var_temp]), 8, 3)
		AddMingWang(varMap, varPlayer,x302539_var_moneytype[3][x302539_var_temp])
	elseif temp <= 100 then
		Msg2Player( varMap, varPlayer,format( "您获得了#G%d声望",x302539_var_moneytype[4][x302539_var_temp]), 8, 3)
		local nShengWang = GetShengWang( varMap, varPlayer )
		nShengWang = nShengWang + x302539_var_moneytype[4][x302539_var_temp]
		SetShengWang( varMap, varPlayer, nShengWang )
	end

	local tempcount = random(10)
	if tempcount == 1 then
 		local tempbuff = random(getn(x302539_var_buff))
 		if IsHaveSpecificImpact( varMap, varPlayer, x302539_var_buff[tempbuff][x302539_var_temp]) ~= 1 then
			SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x302539_var_buff[tempbuff][x302539_var_temp], 0)
		end
 	end
end


function x302539_ProcActiveEvent( varMap, varPlayer )

end


function x302539_ProcFadeOutEvent( varMap, varPlayer )

end

function x302539_ProcEventEntry()

end

function x302539_CheckPlayerInArea(varMap, varPlayer)

end

