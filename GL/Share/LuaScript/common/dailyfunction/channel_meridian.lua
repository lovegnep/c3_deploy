--经脉相关脚本
x802010_Msg = 2			--向客户端发送UI显示
x802010_ItemId = 11000715		--需要的物品ID
x802010_Random = {
					{
						{nCount = 1, nRandom = 100}
					},
					
					{
						{nCount = 1, nRandom = 70},
						{nCount = 2, nRandom = 30}
					},
					
					{
						{nCount = 1, nRandom = 50},
						{nCount = 2, nRandom = 30},
						{nCount = 3, nRandom = 20}
					},
					
					{	
						{nCount = 1, nRandom = 20},
						{nCount = 2, nRandom = 30},
						{nCount = 3, nRandom = 30},
						{nCount = 4, nRandom = 20}
					}
				}
--随即属性
function x802010_CMRandomPro(varMap, varPlayer, nType, nFlag, param1, param2, param3, param4, nMsgType)
	if nType < 1 or nType > 3 or nType == nil then
		return
	end
	if nFlag < 0 or nFlag > 6 or nFlag == nil then
		return
	end 
	
	local nType1,nValue1,nType2,nValue2,nType3,nValue3,nType4,nValue4 = GetCMPro(varMap, varPlayer, nType, nFlag)
	local nRandomCount = 0;
	if param1 == 0 then
		nType1 = -1;
		nValue1 = 0
		nRandomCount = nRandomCount + 1;
	end
	if param2 == 0 then
		nType2 = -1;
		nValue2 = 0
		nRandomCount = nRandomCount + 1;
	end
	if param3 == 0 then
		nType3 = -1;
		nValue3 = 0
		nRandomCount = nRandomCount + 1;
	end
	if param4 == 0 then
		nType4 = -1;
		nValue4 = 0
		nRandomCount = nRandomCount + 1;
	end
	
	if nRandomCount==0 then
		Msg2Player(varMap, varPlayer, "全部锁定，无法进行改命操作", 8, 2)
		Msg2Player(varMap, varPlayer, "全部锁定，无法进行改命操作", 8, 3)
		return
	end
	
	local nMW = 0;
	local itemCount = 0;
	if nMsgType == x802010_Msg then
		--过关自动开启不需要掏钱
		Msg2Player(varMap,varPlayer,"符文开启",8,2)
		Msg2Player(varMap,varPlayer,"符文开启",8,3)
	else
		nMW,itemCount = x802010_CMCheckMoney(varMap,varPlayer,nType,nFlag,nRandomCount)
		if  nMW == 0 and itemCount == 0 then
			Msg2Player(varMap, varPlayer, "改命所需道具不足", 8, 2)
			Msg2Player(varMap, varPlayer, "改命所需道具不足", 8, 3)
			return
		end
	end
	
	--随属性
	if x802010_CMGetPro(varMap, varPlayer, nType, nFlag, nType1,nValue1,nType2,nValue2,nType3,nValue3,nType4,nValue4,nRandomCount) == 0 then
		if nMsgType == x802010_Msg then
			--没有自动开启成功,log记录
			local CMerror = "ChannelMeridian Open Errpr !! "..GetName(varMap,varPlayer).."  SNID = "..tostring(GetSNID(varMap,varPlayer)).."  nType = "..tostring(nType).."  nFlag = "..tostring(nFlag)
			WriteLog(2, CMerror)
		end
		
		Msg2Player(varMap,varPlayer,"改命失败,请重新改命",8,2)
		Msg2Player(varMap,varPlayer,"改命失败,请重新改命",8,3)
		
		return
	end
	
	if nMsgType == x802010_Msg then
		XCChannelMeridianMsg(varMap, varPlayer, nMsgType)
	else
		--扣钱
		x802010_CMcost(varMap, varPlayer, nMW, itemCount)
	end
end

function x802010_CMGetPro(varMap,varPlayer,nType,nFlag,nType1,nValue1,nType2,nValue2,nType3,nValue3,nType4,nValue4,nRandomCount)
	if nRandomCount <= 0 then
		return 0
	end
	
	nRandomCount = x802010_CMRandomCount(varMap,varPlayer,nRandomCount)
	if nRandomCount <= 0 or nRandomCount > 4 then
		return 0
	end

	--随即属性
	for i = 1, nRandomCount do
		local IsOk = 0;
		local nRcount = 0;
		while IsOk == 0 do
			local nRType,nMin,nMax,nRandom,nMaxCount = RandomCMPro(varMap, varPlayer, nType, nFlag)
			if nRType == -1 or nMin == 0 or nRandom == 0 or nMaxCount == 0 then
				--随即数值有问题,重新随
				i = i - 1
				break
			end
			
			nRcount = nRcount + 1;
			if nRcount > 50 then
				--规定一个随即次数,超过后让玩家从新洗
				return 0
			end
			
			local newCount = 0;
			if nType1 == nRType and nType1 ~= -1 then
				newCount = newCount + 1;
			end
			if nType2 == nRType and nType2 ~= -1 then
				newCount = newCount + 1;
			end
			if nType3 == nRType and nType3 ~= -1 then
				newCount = newCount + 1;
			end
			if nType4 == nRType and nType4 ~= -1 then
				newCount = newCount + 1;
			end

			if newCount < nMaxCount then
				local nValue = random(nMin, nMax)
				
				if nType1 == -1 then
					nType1 = nRType;
					nValue1 = nValue
					IsOk = 1
					break;
				end
				
				if nType2 == -1 then
					nType2 = nRType;
					nValue2 = nValue
					IsOk = 1
					break;
				end
				
				if nType3 == -1 then
					nType3 = nRType;
					nValue3 = nValue
					IsOk = 1
					break;
				end
				
				if nType4 == -1 then
					nType4 = nRType;
					nValue4 = nValue
					IsOk = 1
					break;
				end
			end
		end
	end
	
	--计算属性数量
	local nnCount = 0
	if nType1 ~= -1 then
		nnCount = nnCount + 1
	end
	if nType2 ~= -1 then
		nnCount = nnCount + 1
	end
	if nType3 ~= -1 then
		nnCount = nnCount + 1
	end
	if nType4 ~= -1 then
		nnCount = nnCount + 1
	end
	
	SetCMPro(varMap,varPlayer,nType,nFlag,nType1,nValue1,nType2,nValue2,nType3,nValue3,nType4,nValue4,nnCount)
	
	return 1
end

--开启新属性
function x802010_CMOpenPro(varMap, varPlayer)
	local nValue = random(0, 3)
	local param = {0,0,0,0}
	
	for i = 1, nValue do
		param[i] = 1
	end
	
	local nType = -1
	local nFlag = -1
	local nMD = GetPlayerGameData(varMap, varPlayer, MD_JINGYING_INDEX[1], MD_JINGYING_INDEX[2], MD_JINGYING_INDEX[3])
	
	nMD = nMD - 1
	if nMD <= 100 then
		nType = 1
		if nMD == 100 then
			nFlag = 7
		else
			if mod(nMD,3) == 0 then
				nFlag = nMD/3
			end
		end
	end
	
	if nMD >100 and nMD <= 200 then
		nType = 2
		if nMD == 200 then
			nFlag = 7
		else
			nMD = nMD - 100
			if mod(nMD,3) == 0 then
				nFlag = nMD/3
			end
		end
	end
	
	if nMD > 200 then
		nType = 3
		if nMD == 221 then
			nFlag = 7
		else
			nMD = nMD - 200
			if mod(nMD,3) == 0 then
				nFlag = nMD/3
			end
		end
	end
	
	--下标从0开始
	nFlag = nFlag - 1
	
	if nType < 0 or nType > 3 or nFlag < 0 or nFlag > 6 then
		return
	end
	
	if x802010_CheckLevel(varMap, varPlayer, nType, nFlag) == 0 then
		return
	end
		
	if CheckCMType(varMap, varPlayer, nType, nFlag) == 1 then
		--通过关了不在刷属性
		return
	end

	x802010_CMRandomPro(varMap, varPlayer, nType, nFlag, param[1], param[2], param[3], param[4], x802010_Msg)
end

--GM命令开启新属性
function x802010_GMCMOpenPro(varMap, varPlayer, nType, nFlag)
	local nValue = random(0, 3)
	local param = {0,0,0,0}
		
	if x802010_CheckLevel(varMap, varPlayer, nType, nFlag) == 0 then
		return
	end
	
	for i = 1, nValue do
		param[i] = 1
	end

	x802010_CMRandomPro(varMap, varPlayer, nType, nFlag, param[1], param[2], param[3], param[4], x802010_Msg)
end

--进入地图
function x802010_ProcPlayerEnterFinished(varMap, varPlayer)
	XCChannelMeridianMsg(varMap, varPlayer, x802010_Msg)
end

--检测金钱
function x802010_CMCheckMoney(varMap, varPlayer, nType, nFlag, nCount)
	local nMW = 10
	local itemCount = 1;
	
	if nCount <= 0 or nCount > 4 then
		return 0,0
	end
	
	if nCount == 4 then
		itemCount = 1
	elseif nCount == 3 then
		itemCount = 2
	elseif nCount == 2 then
		itemCount = 4
	elseif nCount == 1 then
		itemCount = 8
	end
	
	
	if GetMingWang(varMap, varPlayer) < nMW then
		return 0, 0
	end
	
	if GetItemCountInBag(varMap, varPlayer, x802010_ItemId) < itemCount then
		return 0, 0
	end

	return nMW, itemCount
end

--扣钱
function x802010_CMcost(varMap, varPlayer, costMingwang, itemCount)
	SubMingWang(varMap, varPlayer, costMingwang)
	DelItem(varMap, varPlayer, x802010_ItemId, itemCount)
end

--改命的时候随即属性条数
function x802010_CMRandomCount(varMap, varPlayer, nCount)
	if nCount <= 0 or nCount > 4 then
		return 0
	end
	
	if nCount == 1 then
		return nCount
	end
	
	local nValue = 0
	local nRandom = random(1, 100)
	for i = 1, getn(x802010_Random[nCount]) do
		nValue = nValue + x802010_Random[nCount][i].nRandom;
		if nValue >= nRandom then 
			return x802010_Random[nCount][i].nCount
		end
	end
	
	return 0
end

--检测开启等级
function x802010_CheckLevel(varMap, varPlayer, nType, nFlag)
	local level = GetLevel(varMap, varPlayer)
	local str = nil;
	if nType == 1 and level < 70 then
			str = "等级不足70,不能开启"
	elseif nType == 2 and level < 80 then
			str = "等级不足80,不能开启"
	elseif nType == 3 and level < 90 then
			str = "等级不足90,不能开启"
	end	
		
	if str ~= nil then
			Msg2Player(varMap,varPlayer,str,8,2)
			Msg2Player(varMap,varPlayer,str,8,3)
			return 0
	end
	
	return 1
end
