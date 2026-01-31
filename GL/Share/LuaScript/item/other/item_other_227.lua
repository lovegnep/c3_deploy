x418227_var_FileId 					= 418227
x418227_var_LimitLevel			= 65			--最低级别
---------------道具与奖励相关
x418227_var_Item 						=	12030557
x418227_var_Gift						= 30000
---------------提示相关
x418227_hint_DeleteItemFail = "礼包扣除失败，请稍后再试!" --删除失败的提示
x418227_hint_LackLevel			=	"请65级之后再使用此道具"  --等级不足提示
x418227_hint_GetGift				= "打开@item_%d#cffcf00,获得%d两金卡" --获取奖励的提示

-- 空接口
function x418227_ProcIsSpellLikeScript(varMap, varPlayer)
	return 1
end


-- 空接口
function x418227_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end

-- 空接口
function x418227_ProcConditionCheck( varMap, varPlayer)
	return 1; 
end


function x418227_ProcDeplete( varMap, varPlayer)
    return 1
end

--等级验证
function x418227_CheckGrade(varMap, varPlayer)

	local level = GetLevel(varMap,varPlayer)
	if level < x418227_var_LimitLevel then
		return -1
	end
	
	return 1
end

function x418227_ProcActivateOnce( varMap, varPlayer)
	WriteLog(1, format("x418227_ProcActivateOnce --- varMap=%d, varPlayer=%d", varMap, varPlayer))
	
	--检测等级
  if x418227_CheckGrade(varMap, varPlayer) ~= 1 then
  	Msg2Player(varMap, varPlayer, x418227_hint_LackLevel, 8, 2)
  	Msg2Player(varMap, varPlayer, x418227_hint_LackLevel, 8, 3)
  	return 0
  end
	
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then --扣除成功
		x418227_GetGift(varMap, varPlayer)
	else
		Msg2Player(varMap, varPlayer, x418227_hint_DeleteItemFail, 8, 2)
		Msg2Player(varMap, varPlayer, x418227_hint_DeleteItemFail, 8, 3)
	end
end

function x418227_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

-- 不需要这个接口，但要保留空函数
function x418227_ProcEventEntry(varMap, varPlayer, bagIndex)
end

--给奖励
function x418227_GetGift(varMap, varPlayer)
	WriteLog(1, format("x418227_GetGift --- varMap=%d, varPlayer=%d, giftValue=%d" , varMap, varPlayer, x418227_var_Gift))
	AddMoney(varMap, varPlayer, 3, x418227_var_Gift)
	Msg2Player(varMap, varPlayer, format(x418227_hint_GetGift, x418227_var_Item, x418227_var_Gift/1000), 8, 2)
	Msg2Player(varMap, varPlayer, format(x418227_hint_GetGift, x418227_var_Item, x418227_var_Gift/1000), 8, 3)
end
