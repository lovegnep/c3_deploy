
--好友经验加成

x802003_Friend_nPlayerLevel		= 50		--玩家等级
x802003_Friend_nExpRate_1		= 0.01;		--加成经验百分比
x802003_Friend_nMaxExpRate_1	= 0.1;		--加成经验最高百分比
x802003_Friend_nExpRate_2		= 0.005;
x802003_Friend_nMaxExpRate_2	= 0.05;
x802003_Friend_Amity 			= 300;		--友好度

x802003_Online_Friend			= 3;		--好友
x802003_Online_Spouse			= 4;		--夫妻
x802003_Online_Master			= 5;		--师傅

--进入地图初始化在线数据
function x802003_EnterMap(varMap, varPlaye)
	UpdateOnlineData(varMap, varPlaye);
end


--更新师徒,夫妻数据(拜师,解除师徒关系,结婚,离婚时更新)
function x802003_SetOlineData(varMap, varPlaye, varSNID, varType)
	
	if (varType == 0 or varType == 1) then
		varSNID = GetLuaVariable(varMap, 1, 2)
	end
	
	--上线更新夫妻,师徒数据
	if varType == 0 then
		--师傅上线

		--夫妻上线
		if IsMarried(varMap, varPlaye) and varSNID == GetSpouseGUID(varMap, varPlaye) then
			SetOnlineData(varMap, varPlaye, x802003_Online_Spouse, 1);
		end

		--好友上线
		if IsFriendBySnid(varMap, varPlaye, varSNID) then
			SetOnlineData(varMap, varPlaye, x802003_Online_Friend, GetFriendOnlineCount(varMap, varPlaye));
		end
		UpdateOnlineData(varMap, varPlaye);
	end
	
	--下线更新夫妻,师徒数据
	if varType == 1 then
		--师傅下线
		
		--夫妻下线
		if IsMarried(varMap, varPlaye) == 1 and varSNID == GetSpouseGUID(varMap, varPlaye) then
			SetOnlineData(varMap, varPlaye, x802003_Online_Spouse, 0);
		end
		
		--好友下线
		if IsFriendBySnid(varMap, varPlaye, varSNID) then
			SetOnlineData(varMap, varPlaye, x802003_Online_Friend, GetFriendOnlineCount(varMap, varPlaye));
		end
		UpdateOnlineData(varMap, varPlaye);
	end
	
	--更新好友
	if varType == 12 then
		SetOnlineData(varMap, varPlaye, x802003_Online_Friend, GetFriendOnlineCount(varMap, varPlaye));
		UpdateOnlineData(varMap, varPlaye);
	end
	
	--添加好友
	if varType == 13 then
		SetOnlineData(varMap, varPlaye, x802003_Online_Friend, GetFriendOnlineCount(varMap, varPlaye));
	end
	
	--删除或加把好友加黑名单
	if varType == 14 then
		SetOnlineData(varMap, varPlaye, x802003_Online_Friend, GetFriendOnlineCount(varMap, varPlaye));
	end
	
	--拜师
	if varType == 15 then
		local data = 1;
		local MemberCoun = GetTeamSize(varMap, varPlaye);
		for i = 0, MemberCoun - 1 do
			if varSNID == GetTeamMemberGuid(varMap, varPlaye, i) then
				data = 2;
				break;
			end
		end
		
		--排行榜最后一名等级
		--local TopListMinLevel = GetTopListInfo_MinLevel(GetWorldID( varMap, varPlayer));
		--if GetLevel(varMap, varPlayer) >= TopListMinLevel then
			--data = 0;
		--end
		
		SetOnlineData(varMap, varPlaye, x802003_Online_Master, data);
	end
	
	--离开师门
	if varType == 16 then
		SetOnlineData(varMap, varPlaye, x802003_Online_Master, -1);
	end
	
	if varType == 17 then
		--师徒组队
		if GetMasterGUID(varMap, varPlaye) == varSNID then
			local data = 2;
			--排行榜最后一名等级
			--local TopListMinLevel = GetTopListInfo_MinLevel(GetWorldID( varMap, varPlayer));
			--if GetLevel(varMap, varPlayer) >= TopListMinLevel then
				--data = 1;
			--end
			
			SetOnlineData(varMap, varPlaye, x802003_Online_Master, data);
		end
		
		--好友组队
		SetOnlineData(varMap, varPlaye, 6, 0);
	end
	
	if varType == 18 then
		--师傅离队
		if GetMasterGUID(varMap, varPlaye) == varSNID then
			local data = 1;
			--排行榜最后一名等级
			--local TopListMinLevel = GetTopListInfo_MinLevel(GetWorldID( varMap, varPlayer));
			--if GetLevel(varMap, varPlayer) >= TopListMinLevel then
				--data = 0;
			--end
			
			SetOnlineData(varMap, varPlaye, x802003_Online_Master, data);
		end
		
		--好友离队
		SetOnlineData(varMap, varPlaye, 6, 0);
	end
	
	--结婚
	if varType == 25 then
		SetOnlineData(varMap, varPlaye, x802003_Online_Spouse, 1);
	end
	
	--离婚
	if varType == 26 then
		SetOnlineData(varMap, varPlaye, x802003_Online_Spouse, -1);
	end
	
end


--计算在线加成经验
function x802003_CalculateFriendExp(varMap, varPlayer, varExp)
	--好友在线加成
	local nOlineCount = GetOnlineData(varMap, varPlayer, x802003_Online_Friend);
	if nOlineCount < 0 then
		return varExp;
	end
	
	local nExpRate_1 = x802003_Friend_nExpRate_2 * nOlineCount;
	if nExpRate_1 > x802003_Friend_nMaxExpRate_2 then
		nExpRate_1 = x802003_Friend_nMaxExpRate_2;
	end
	
	return varExp + varExp * nExpRate_1;

end
