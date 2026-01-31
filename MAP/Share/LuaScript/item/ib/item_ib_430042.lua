
x430042_var_ModelTable =
 {
	[12035252]={7539,7542,7545},
	[12035253]={7540,7543,7546},
	[12035254]={7541,7544,7547}
}

x430042_var_BassTable ={7994,7995,7996}
x430042_var_ExTable ={7991,7992,7993}


x430042_var_NoBuf = {7516,7517,7536,7537,7538,7539,7540,7541,7542,7543,7544,7545,7546,7547,7605,7606,7607,7608,7609,7610,7611,7612,7613,7614,7615,7616,7617,7618,7619,7620,7621,7622,7623,7624,7625,7626,7627,7628,7629,7640,7641,7651,7652,7653,7654,7655,7656,7657,7658,7659,7660,7661,7662,7663,7664,7900,7901,8700,8704,8705,8706,8707,8708,8709,8710,8716,8717,8718,8719,8720,8721,8722,8723,8724,8725,8726,9400,9401,9402,9403,9404,9405,9406,9407,9408,9409,9410,9411,9412,9413,9414,9415,9416,9417,9418,9419,9420,9421,9422,9423,9424,9425,9426,9427,9428,9429,9430,9431,9432,9433,9434,9435,14000,21020,21021,21022,21023,21024,21025,21026,21027,21028,21029,22090,22091,22092,22093,22094,22095,22096,22097,22098,22099,23471,23472,23473,23474,23475,23476,23477,23478,23479,23480}

function x430042_ProcEventEntry( varMap, varPlayer, varBagIdx )
	return 0;
end

function x430042_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end

function x430042_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x430042_ProcConditionCheck( varMap, varPlayer )
	for i, item in x430042_var_NoBuf do
		if(IsHaveSpecificImpact(varMap, varPlayer, item) > 0) then
			StartTalkTask(varMap)
				TalkAppendString(varMap, "很抱歉当前状态下不能使用此道具")
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			return 0
		end
		
		if 1 == IsInChariot(varMap, varPlayer) then
			StartTalkTask(varMap)
				TalkAppendString(varMap, "战车状态无法使用该道具")
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			
			return 0
		end

		if varMap == 14 then
			StartTalkTask(varMap)
				TalkAppendString(varMap, "不能在美丽会中使用此道具")
			StopTalkTask()
			DeliverTalkTips(varMap, varPlayer)
			
			return 0
		end


		return 1; 

	end
end

function x430042_ProcDeplete( varMap, varPlayer )
	if(DepletingUsedItem(varMap, varPlayer) > 0) then
		return 1;
	end
	return 0;
end

function x430042_ProcActivateOnce( varMap, varPlayer )
	local itemTableID = GetActuveItemTableIndex(varMap, varPlayer)
	local n = 1
	local buff =-1
	local buff1 =-1
	local buff2 =-1
	local ran =random(3)
	if ran <1 then ran =1 end
	if ran >3 then ran =3 end
	buff = x430042_var_ModelTable[itemTableID][ran]
	if itemTableID == 12035253 then
		n = 2
	elseif itemTableID ==12035254 then
		n =3
	end		
	buff1 =x430042_var_BassTable[n]
	buff2 =x430042_var_ExTable[n]
	if(-1~=buff) and (-1~=buff1) and (-1~=buff2) then 
		--ReCallHorse( varMap, varPlayer )      
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, buff, 0);
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, buff1, 0);
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, buff2, 0);
	end
	return 1;
end

function x430042_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end
