x418226_var_FileId 					= 418226
x418226_var_LimitLevel			= 55			--最低级别
---------------道具与奖励相关
x418226_var_Item 						=	12030556
x418226_var_Gift						= 25000
---------------提示相关
x418226_hint_DeleteItemFail = "礼包扣除失败，请稍后再试!" --删除失败的提示
x418226_hint_LackLevel			=	"请55级之后再使用此道具"  --等级不足提示
x418226_hint_GetGift				= "打开@item_%d#cffcf00,获得%d两金卡" --获取奖励的提示

-- 空接口
function x418226_ProcIsSpellLikeScript(varMap, varPlayer)
	return 1
end


-- 空接口
function x418226_ProcCancelImpacts( varMap, varPlayer)
	return 0; 
end

-- 空接口
function x418226_ProcConditionCheck( varMap, varPlayer)
	return 1; 
end


function x418226_ProcDeplete( varMap, varPlayer)
    return 1
end

--等级验证
function x418226_CheckGrade(varMap, varPlayer)

	local level = GetLevel(varMap,varPlayer)
	if level < x418226_var_LimitLevel then
		return -1
	end
	
	return 1
end

function x418226_ProcActivateOnce( varMap, varPlayer)
	WriteLog(1, format("x418226_ProcActivateOnce --- varMap=%d, varPlayer=%d", varMap, varPlayer))
	
	--检测等级
  if x418226_CheckGrade(varMap, varPlayer) ~= 1 then
  	Msg2Player(varMap, varPlayer, x418226_hint_LackLevel, 8, 2)
  	Msg2Player(varMap, varPlayer, x418226_hint_LackLevel, 8, 3)
  	return 0
  end
	
	if(DepletingUsedItem(varMap, varPlayer)) == 1 then --扣除成功
		x418226_GetGift(varMap, varPlayer)
	else
		Msg2Player(varMap, varPlayer, x418226_hint_DeleteItemFail, 8, 2)
		Msg2Player(varMap, varPlayer, x418226_hint_DeleteItemFail, 8, 3)
	end
end

function x418226_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

-- 不需要这个接口，但要保留空函数
function x418226_ProcEventEntry(varMap, varPlayer, bagIndex)
end

--给奖励
function x418226_GetGift(varMap, varPlayer)
	WriteLog(1, format("x418226_GetGift --- varMap=%d, varPlayer=%d, giftValue=%d", varMap, varPlayer, x418226_var_Gift))
	AddMoney(varMap, varPlayer, 3, x418226_var_Gift)
	Msg2Player(varMap, varPlayer, format(x418226_hint_GetGift, x418226_var_Item, x418226_var_Gift/1000), 8, 2)
	Msg2Player(varMap, varPlayer, format(x418226_hint_GetGift, x418226_var_Item, x418226_var_Gift/1000), 8, 3)
end
