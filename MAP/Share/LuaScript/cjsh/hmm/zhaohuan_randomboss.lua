x930142_var_FileId = 930142 


x930142_var_DestSceneName = ""
x930142_var_DestSceneId = {17}
x930142_var_BossType = {17021,17022,17023,17024,17025,17026,17027}

--怪物生存时间 1小时
x930142_var_alivetime = 60*60*1000
x930142_var_Boss = {
    --80级部将
    {id=17021,prob=100,price=1},
    --18魔君
    {id=3211,prob=100,price=1},

    --幸运红蜂
    {id=56061,prob=100,price=1},

    --3F宝箱
    {id=43510,prob=100,price=1},

    --代币
    {id=18126,prob=100,price=1},

    --蓝装
    {id=18121,prob=100,price=1},

    --生活材料
    {id=18122,prob=100,price=1},
    {id=18101,prob=100,price=1},--#G米底亚酋长
    {id=18103,prob=100,price=1},--#G游荡的葛龙
    {id=18105,prob=100,price=1},--#G狮心王
    {id=18106,prob=100,price=1},--#G古察
    {id=18090,name="咆哮战狼",prob=10,price=100},--咆哮战狼
    {id=18089,name="大猫神兽（牛逼世界boss）",prob=10,price=90},--大猫神兽（牛逼世界boss）  现金boss
}

function x930142_ProcEventEntry( varMap, varPlayer, varBagIdx )
	local PlayerPosX,PlayerPosZ = GetWorldPos( varMap, varPlayer )


    -- 先求总概率
    local totalProb = 0
    for i, iter in x930142_var_Boss do
        local prob = iter.prob
        totalProb = totalProb + prob
    end

    local result = random( 1, totalProb)

    local top = 1
    local bottom = 1
    local itemIndex = 1
    for varI, item in x930142_var_Boss do
        local prob = item.prob
        top = top + prob
        if result >= bottom and result < top then
            itemIndex = varI
            break
        end
        bottom = bottom + prob
    end

    local varRet = CreateMonster( varMap, x930142_var_Boss[itemIndex].id, PlayerPosX, PlayerPosZ, 1, -1, x930142_var_FileId, -1, 21,x930142_var_alivetime)

    if varRet > 0 then
        local message = "成功召唤出对应怪物！"
        Msg2Player(varMap,varPlayer,message, 8, 2)
        Msg2Player(varMap,varPlayer,message, 8, 3)

        if DelItem( varMap, varPlayer, 12274070, 1) ~= 1 then
            return 0
        end

        if x930142_var_Boss[itemIndex].price >= 50 then
            local killerName = GetName(varMap,varPlayer)
            local countryId = GetCurCountry(varMap, varPlayer)
            local countryName = GetCountryName(countryId)

            local monname = x930142_var_Boss[itemIndex].name
            if monname == nil or monname == "" then
                monname = "稀有怪物"
            end

            local varMsg = "恭喜"..countryName.."的"..killerName.."使用随机召唤符召唤出了"..format("#G%s#W。", monname)
            LuaAllScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
            LuaAllScenceM2Wrold(varMap, varMsg, CHAT_LEFTDOWN, 1)
            LuaAllScenceM2Wrold(varMap, varMsg, CHAT_MAIN_RIGHTDOWN, 1)
        end


    else
        local message = format("召唤%d失败！", x930142_var_Boss[itemIndex].id)
        Msg2Player(varMap,varPlayer,message, 8, 2)
        Msg2Player(varMap,varPlayer,message, 8, 3)
    end
end

function x930142_ProcIsSpellLikeScript( varMap, varPlayer)
	return 0; 
	
	
end

function x930142_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end

function x930142_ProcConditionCheck( varMap, varPlayer )
	return 0
end

function x930142_ProcDeplete( varMap, varPlayer )

	return 0
end

function x930142_ProcActivateOnce( varMap, varPlayer )
end

function x930142_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x930142_ProcDie(varMap, varPlayer, varKiller)
	
	GamePlayScriptLog(varMap, varKiller, 551)
				
end

