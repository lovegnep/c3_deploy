
x300615_var_FileId 					= 300615

x300615_var_Name                      = "【帮会】世界杯"

x300615_var_SceneName                 = "zhanchang_shijiebeizhanchang/zhanchang_shijiebeizhanchang.scn"
x300615_var_SceneScript               = { { Name = "zhanchang_shijiebeizhanchang/zhanchang_shijiebeizhanchang.scn", varScript = 300615} }



x300615_State_Prepare               = 1

x300615_State_Start                 = 2

x300615_State_End                   = 3

x300615_State_Finished              = 4

x300615_var_FightTime                 = 1800

x300615_var_strNotJoinGuild           = "\t你尚未加入任何帮会！"
x300615_var_strOnlyforLeader          = "\t只有帮主才能使用此模块。"
x300615_var_strSignupTimePassed       = "\t现在不是报名时间！"


GCR_SIGNUP_SUCCESS                  = 0     
GCR_SIGNUP_HASSIGNEDUP              = 1     
GCR_SIGNUP_STRENGTHNOTENOUGH        = 2     
GCR_SIGNUP_NOTEXIST                 = 3     
GCR_WASHOUT                         = 4     
GCR_NOTPATICIPATE                   = 5     
GCR_INHIGHGROUP                     = 6     
GCR_NOMATCHTOJOIN                   = 7     

x300615_var_RedInitPosX               = 23
x300615_var_RedInitPosZ               = 123
x300615_var_BlueInitPosX              = 229
x300615_var_BlueInitPosZ              = 123

x300615_var_PosX                      = 127
x300615_var_PosZ                      = 117

x300615_var_TotalScore                = 2000

x300615_var_ItemId                    = 13080024
x300615_var_MutexTable                = {
                                        PLAYER_STATE_STALL                , 
                                        PLAYER_STATE_FUBEN                , 
                                        PLAYER_STATE_GUILDBATTLEFIELDSCENE, 
                                        PLAYER_STATE_ARENASSCENE          , 
                                        PLAYER_STATE_CITSCENE             , 
                                        PLAYER_STATE_PRISONSCENE          , 
                                        PLAYER_STATE_DIE                  , 
                                        PLAYER_STATE_BUS                  , 
                                        PLAYER_STATE_CRASHBOX             , 
                                        PLAYER_STATE_EXCHANGE             , 
                                        PLAYER_STATE_MENTALGAME           , 
                                        PLAYER_STATE_AUTOPLAY             , 
                                        PLAYER_STATE_SUBTRAIN             , 
                                        PLAYER_STATE_PRISON               , 
                                        PLAYER_STATE_OPENBOX              , 
                                        PLAYER_STATE_KEYBORDMOVE          , 
                                        PLAYER_STATE_TIESAN               , 
                                        PLAYER_STATE_READYFUBEN           , 
                                        PLAYER_STATE_DUOQIBUFF			  , 
                                        PLAYER_STATE_TONGQUBUFF			  , 
                                        PLAYER_STATE_FORBID_RIDE		  , 
                                        PLAYER_STATE_WEDDING			  , 
                                        PLAYER_STATE_ENJAIL				  , 
                                        PLAYER_STATE_Award				  , 
                                        PLAYER_STATE_TransGold			  , 
                                        PLAYER_STATE_DANCERY              , 
}

x300615_GT_Miracle                  = 727

x300615_GT_ArmyFlag                 = 726

x300615_GT_Flag_A                   = 728

x300615_GT_Flag_B                   = 729

x300615_var_Occupy                    = {}

x300615_var_Occupy_B                  = {}

x300615_var_FlagScore                 = 2

x300615_var_MiracleId                 = 7800

x300615_var_MaxCountInBattleScene     = 50

x300615_var_HideTowerTable            = {
                                        { typeid = 9732, varX = 60,  z = 121, guid = 129721, base_ai = 22, aiscript = -1, campid = 5, faceDir = 270, title = "", varName = "", score = 200 }, 
                                        { typeid = 9732, varX = 60,  z = 127, guid = 129722, base_ai = 22, aiscript = -1, campid = 5, faceDir = 270, title = "", varName = "", score = 200 }, 
                                        { typeid = 9732, varX = 195, z = 127, guid = 129726, base_ai = 22, aiscript = -1, campid = 6, faceDir = 270, title = "", varName = "", score = 200 }, 
                                        { typeid = 9732, varX = 195, z = 120, guid = 129727, base_ai = 22, aiscript = -1, campid = 6, faceDir = 270, title = "", varName = "", score = 200 }, 
}

x300615_var_ShowTowerTable            = {
                                        { typeid = 9737, varX = 60,  z = 121, guid = 129741, base_ai = 3, aiscript = -1, campid = 5, faceDir = 270, title = "汗国联军", varName = "箭塔", score = 200 }, 
                                        { typeid = 9737, varX = 60,  z = 127, guid = 129742, base_ai = 3, aiscript = -1, campid = 5, faceDir = 270, title = "汗国联军", varName = "箭塔", score = 200 }, 
                                        { typeid = 9737, varX = 195, z = 127, guid = 129746, base_ai = 3, aiscript = -1, campid = 6, faceDir = 270, title = "大元联军", varName = "箭塔", score = 200 }, 
                                        { typeid = 9737, varX = 195, z = 120, guid = 129747, base_ai = 3, aiscript = -1, campid = 6, faceDir = 270, title = "大元联军", varName = "箭塔", score = 200 }, 
}







x300615_var_NPCTable                  = {
                                        129730,
                                        129731,
                                        129732,
                                        129733,
                                        129734,
                                        129735,
                                        129736,
                                        129737,
                                        129738,
                                        129739,
}

x300615_var_RewardTable               = {
                                       { groupType = 2, turnNumber = 0, 
                                            rewards = { 
                                            { xpCoff = 65000, merit = 18, bangGong = 360, gxp = 180, gmoney = 7200000, gshiming = 65, }, 
                                            { xpCoff = 32500, merit = 10, bangGong = 180, gxp = 90,  gmoney = 3600000, gshiming = 35, }, 
                                                      }
                                        }, 
                                        { groupType = 2, turnNumber = 1, 
                                            rewards = { 
                                            { xpCoff = 80000, merit = 22, bangGong = 440, gxp = 220, gmoney = 8800000, gshiming = 80, }, 
                                            { xpCoff = 40000, merit = 15, bangGong = 220, gxp = 110, gmoney = 4400000, gshiming = 40, }, 
                                                      }
                                        }, 
                                        { groupType = 2, turnNumber = 2, 
                                            rewards = { 
                                            { xpCoff = 90000, merit = 28, bangGong = 500, gxp = 250, gmoney = 10000000, gshiming = 90, }, 
                                            { xpCoff = 45000, merit = 20, bangGong = 250, gxp = 125, gmoney = 5000000, gshiming = 45, }, 
                                                      }
                                        }, 
                                        { groupType = 2, turnNumber = 3, 
                                            rewards = { 
                                            { xpCoff = 126000, merit = 35, bangGong = 700, gxp = 350, gmoney = 14000000, gshiming = 125, }, 
                                            { xpCoff = 90000,  merit = 25, bangGong = 500, gxp = 250, gmoney = 10000000, gshiming = 90, }, 
                                                      }
                                        }, 
                                        { groupType = 1, turnNumber = 0, 
                                            rewards = { 
                                            { xpCoff = 43335, merit = 15, bangGong = 240, gxp = 120, gmoney = 4800000, gshiming = 45, }, 
                                            { xpCoff = 21670, merit = 10, bangGong = 120, gxp = 60,  gmoney = 2400000, gshiming = 25, }, 
                                                      }
                                        }, 
                                        { groupType = 1, turnNumber = 1, 
                                            rewards = { 
                                            { xpCoff = 53335, merit = 15, bangGong = 295, gxp = 150, gmoney = 5870000, gshiming = 55, }, 
                                            { xpCoff = 26670, merit = 10, bangGong = 150, gxp = 75,  gmoney = 2940000, gshiming = 30, }, 
                                                      }
                                        }, 
                                        { groupType = 1, turnNumber = 2, 
                                            rewards = { 
                                            { xpCoff = 60000, merit = 15, bangGong = 345, gxp = 170, gmoney = 6670000, gshiming = 65, }, 
                                            { xpCoff = 30000, merit = 10, bangGong = 170, gxp = 85,  gmoney = 3340000, gshiming = 35, }, 
                                                      }
                                        }, 
                                        { groupType = 1, turnNumber = 3, 
                                            rewards = { 
                                            { xpCoff = 84000, merit = 25, bangGong = 470, gxp = 235, gmoney = 9340000, gshiming = 85, }, 
                                            { xpCoff = 60000, merit = 20, bangGong = 335, gxp = 170, gmoney = 6670000, gshiming = 60, }, 
                                                      }
                                        }, 
}

x300615_var_DescriptionTable          = {
                                        "\t您好，我是【帮会】世界杯传送人，【帮会】世界杯开启后，您可以通过我进入【帮会】世界杯战场.", 
                                        "\t【帮会】世界杯大赛规则如下：", 
                                        "一，开启条件：如果等级排行榜第一名大于70级，则会开启【帮会】世界杯大赛，开启时间为本月或下月的第一个周日16：00-16：30。#r", 
                                        
                                        "二，大赛分组：首次开启时，取帮会实力榜前16名进行对抗，前8名为世界杯大赛A组，后8名为世界杯大赛B组。次月比赛时，A组前4名及B组前4名帮会，重新组成为A组，B组则需由其他帮会报名组成。#r", 
                                        
                                        "三，比赛时间：开启后，每月的第一个周日会进行8进4，第二个周日进行4进2，第三个周日进行第三、四名争夺战，第四个周日进行第一、二名争夺战。#r", 
                                        
                                        "四，淘汰规则：A组8进4比赛，胜者为前四名直接晋级次月参加A组比赛，排名为A组1-4名，负者降级，负者次月参赛时需要报名参加；4进2比赛，胜者争夺一、二名，负者争夺三、四名。\nB组8进4比赛，胜者直接晋级次月参加A组比赛，排名为A组5-8名，负者降级，次月参赛时需要报名参加；4进2比赛，胜者争夺B组一、二名，负者争B组夺三、四名。#r", 
                                         
                                        "五，报名规则：当月世界杯全部结束时开始报名，次月的第一个周日14：00截止报名。若报名名额已满，则按帮会实力榜由排行高的顶替排行低的，被顶替帮会，将会收到邮件通知。#r", 
                                         
                                         "\t【帮会】世界杯战场规则如下：", 
										"1、每个参赛帮会最多可以进入50人。",
                                        "2、战场采用积分制，占领苏鲁锭战旗每10秒得2分，在龙魂处夺取龙珠交给本方联军统帅每次50分，摧毁敌方箭塔得200分，夺取龙珠的玩家不可以使用技能。#r", 
                                        "3、在战场内通过采集龙谷水晶得到幽谷玄冰，交给本方联军统帅每次得1分。#r", 
                                        "4、世界杯大赛时间为30分钟，先得到2000分的一方，直接获得胜利，若其中一方在世界杯大赛场景人数为0时，则直接判负。世界杯大赛结束后，均未达到2000分，则分高者取胜，分数一样时，A组赛前排名低者胜，B组帮会积分排名低者胜。#r", 
                                        "5、战场内不能进行原地复活。", 
}

x300615_var_ToStopEffectList          = {}

x300615_var_ClearPerSecond            = 20

x300615_var_RuinList                  = {}

x300615_var_TowerObjID = {}

x300615_var_TowerBuff  = 7989    --箭塔免疫加血BUFF

function x300615_ProcMapCreate( varMap)
    x300615_var_ToStopEffectList[ varMap] = {}
    x300615_var_Occupy[ varMap] = 0
    x300615_var_Occupy_B[ varMap] = 0
    x300615_var_RuinList[ varMap] = {}
end

function x300615_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )
	TalkAppendButton( varMap, x300615_var_FileId, "【帮会】世界杯介绍", 1, 1)
    local varState = GetWorldCupState( varMap)

    
    
    if varState == STATE_GUILD_WORLDCUP_PREPARE or varState == STATE_GUILD_WORLDCUP_START then
        TalkAppendButton( varMap, x300615_var_FileId, "进入【帮会】世界杯", 3, 2)
    end

    
    if varState == STATE_GUILD_WORLDCUP_SIGNUP then
        TalkAppendButton( varMap, x300615_var_FileId, "【帮会】世界杯报名", 3, 3)
    end

    if varState > STATE_GUILD_WORLDCUP_SIGNUP then
        TalkAppendButton( varMap, x300615_var_FileId, "【帮会】世界杯查询", 3, 4)
    end
end


function x300615_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest, indexId)
    if indexId == 1 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x300615_var_Name)
            for varI, item in x300615_var_DescriptionTable do
                TalkAppendString( varMap, item)
            end
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    elseif indexId == 2 then
        x300615_ShowGuildContendInfo( varMap, varPlayer, varTalknpc)
    elseif indexId == 3 then
        x300615_Signup( varMap, varPlayer, varTalknpc)
    elseif indexId == 4 then
        x300615_Query( varMap, varPlayer, varTalknpc)
    end
end


function x300615_Query( varMap, varPlayer, varTalknpc)
    
    local vsInfo = {}
    vsInfo[ 1] = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_VERSUS1)
    vsInfo[ 2] = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_VERSUS2)
    vsInfo[ 3] = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_VERSUS3)
    vsInfo[ 4] = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_VERSUS4)
    vsInfo[ 5] = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_VERSUS5)
    vsInfo[ 6] = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_VERSUS6)
    vsInfo[ 7] = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_VERSUS7)
    vsInfo[ 8] = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_VERSUS8)

    
    local versus = {}
    local varCount = 0
    for varI, item in vsInfo do
        versus[ varI] = {}
        if item <= 0 then
            versus[ varI][ 1] = -1
            versus[ varI][ 2] = -1
        else
            if item >= 100000 then
                versus[ varI][ 1] = floor( item / 100000) - 1
            else
                versus[ varI][ 1] = -1
            end

            local g2 = mod( item, 100000)
            if g2 == 0 then
                versus[ varI][ 2] = -1
            else
                versus[ varI][ 2] = g2 - 1
            end
            varCount = varCount + 1
        end
    end

    local strA = ""
    local strB = ""
    for varI, item in versus do
        if varI < 5 then
            if item[ 1] ~= -1 and item[ 2] ~= -1 then
                strA = strA..format( "帮会#R%s#W VS 帮会#R%s#W\n", GetGuildName( item[ 1] ), GetGuildName( item[ 2] ) )
            elseif item[ 1] ~= -1 then
                strA = strA..format( "帮会#R%s#W轮空\n", GetGuildName( item[ 1] ) )
            elseif item[ 2] ~= -1 then
                strA = strA..format( "帮会#R%s#W轮空\n", GetGuildName( item[ 2] ) )
            end
        else
            if item[ 1] ~= -1 and item[ 2] ~= -1 then
                strB = strB..format( "帮会#R%s#W VS 帮会#R%s#W\n", GetGuildName( item[ 1] ), GetGuildName( item[ 2] ) )
            elseif item[ 1] ~= -1 then
                strB = strB..format( "帮会#R%s#W轮空\n", GetGuildName( item[ 1] ) )
            elseif item[ 2] ~= -1 then
                strB = strB..format( "帮会#R%s#W轮空\n", GetGuildName( item[ 2] ) )
            end
        end
    end

    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y本周世界杯大赛对阵帮会：" )
        TalkAppendString( varMap, " " )
        if varCount > 0 then
            TalkAppendString( varMap, "A组：" )
            TalkAppendString( varMap, strA)
            TalkAppendString( varMap, "B组：" )
            TalkAppendString( varMap, strB)
        else
            TalkAppendString( varMap, "本周没有比赛。" )
        end
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end


function x300615_Signup( varMap, varPlayer, varTalknpc)
    
    local guildId = GetGuildID( varMap, varPlayer)
    if guildId < 0 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x300615_var_Name)
            TalkAppendString( varMap, x300615_var_strNotJoinGuild)
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc, x300615_var_FileId, -1)
        return
    end

    
    local guildStatus = GetGuildOfficial( varMap, varPlayer)
    if guildStatus ~= 5 then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x300615_var_Name)
            TalkAppendString( varMap, x300615_var_strOnlyforLeader)
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc, x300615_var_FileId, -1)
        return
    end

    
    if GetWorldCupState( varMap) ~= STATE_GUILD_WORLDCUP_SIGNUP then
        StartTalkTask( varMap)
            TalkAppendString( varMap, "#Y"..x300615_var_Name)
            TalkAppendString( varMap, x300615_var_strSignupTimePassed)
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc, x300615_var_FileId, -1)
        return
    end

    
    GuildContendSignup( varMap, varPlayer, varTalknpc, guildId)
end


function x300615_ProcReply( varMap, varPlayer, varTalknpc, ReplyCode)
    local strInfo = ""
    if ReplyCode == GCR_SIGNUP_SUCCESS then
        strInfo = "\t报名完成。"
    elseif ReplyCode == GCR_SIGNUP_HASSIGNEDUP then
        strInfo = "\t你的帮会已经报过名了！"
    elseif ReplyCode == GCR_SIGNUP_STRENGTHNOTENOUGH then
        strInfo = "\t你的帮会的帮会实力榜上的排名过低，报名失败！"
    elseif ReplyCode == GCR_SIGNUP_NOTEXIST then
        strInfo = "\t你的帮会已经解散了！"
    elseif ReplyCode == GCR_WASHOUT then
        strInfo = "\t你所在帮会已被淘汰了！"
    elseif ReplyCode == GCR_NOTPATICIPATE then
        strInfo = "\t你所在帮会没有报名参加本届的【帮会】世界杯！"
    elseif ReplyCode == GCR_INHIGHGROUP then
        strInfo = "\t你的帮会已经进入世界杯决赛圈，不能报名参加预选赛！"
    elseif ReplyCode == GCR_NOMATCHTOJOIN then
        strInfo = "\t很抱歉，您所在的帮会不在赛程内，没有可参加的比赛。"
    end

    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y"..x300615_var_Name)
        TalkAppendString( varMap, strInfo)
    StopTalkTask()
    DeliverTalkMenu( varMap, varPlayer, varTalknpc)
end


function x300615_ShowGuildContendInfo( varMap, varPlayer, varTalknpc)
    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y"..x300615_var_Name)
        TalkAppendString( varMap, "\t【帮会】世界杯已经开始，你确认要进入战场么？" )
    StopTalkTask()
    DeliverTalkInfo( varMap, varPlayer, varTalknpc, x300615_var_FileId, -1)
end


function x300615_IsGuildContendScene( varMap)
    
    local varMapType = GetSceneType( varMap)
    if varMapType ~= 2 then
        return 0
    end

    
    if GetBattleSceneName( varMap) ~= x300615_var_SceneName then
        return 0
    end

    return 1
end


function x300615_UpdateTitle( varMap, varPlayer, title)
    AwardTitle( varMap, varPlayer, title)
end


function x300615_ClearTitle( varMap, varPlayer, title)
    if IsHaveTitle( varMap, varPlayer, title) == 1 then
        DeleteTitle( varMap, varPlayer, title)
    end
end


function x300615_ProcChangeState( varMap, stateId, turnNumber, guildCount)
    local varMapType = GetSceneType( varMap)

    if varMapType == 0 then 
        if stateId == STATE_GUILD_WORLDCUP_FINISHED then
            SetWorldCupState( varMap, STATE_GUILD_WORLDCUP_FINISHED)
            
            return
        elseif stateId == STATE_GUILD_WORLDCUP_PREPARE then
            SetWorldCupState( varMap, STATE_GUILD_WORLDCUP_PREPARE)
            
            return
        elseif stateId == STATE_GUILD_WORLDCUP_END then
            SetWorldCupState( varMap, STATE_GUILD_WORLDCUP_END)
            return
        elseif stateId == STATE_GUILD_WORLDCUP_SIGNUP then
            SetWorldCupState( varMap, STATE_GUILD_WORLDCUP_SIGNUP)
            return
        elseif stateId == STATE_GUILD_WORLDCUP_SIGNUPEND then
            SetWorldCupState( varMap, STATE_GUILD_WORLDCUP_SIGNUPEND)
            return
        elseif stateId == STATE_GUILD_WORLDCUP_DISABLESIGNUP then
            SetWorldCupState( varMap, STATE_GUILD_WORLDCUP_DISABLESIGNUP)
            return
        end
    elseif varMapType == 2 then 
        if x300615_IsGuildContendScene( varMap) == 0 then
            
            return
        end

        
        if GetWorldCupState( varMap) == stateId then
            return
        else
            SetWorldCupState( varMap, stateId)
        end

        if stateId == STATE_GUILD_WORLDCUP_PREPARE then
            
            SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD, -1)
            SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD, -1)
            SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE, 0)
            SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE, 0)

            x300615_InitBattleField( varMap)

            
            GuildContendAskInit( varMap)
        elseif stateId == STATE_GUILD_WORLDCUP_START then
            
            x300615_ProcBattleBegin( varMap)
        elseif stateId == STATE_GUILD_WORLDCUP_END then
            
            x300615_ProcBattleEnd( varMap)
        end
    end
end


function x300615_InitBattleField( varMap)
    if x300615_IsGuildContendScene( varMap) == 0 then
        return
    end

    
    local show = 0
    local hide = 0
    local ruin = 0
	local nMonsterCount = GetMonsterCount( varMap)
	for varI = 0, nMonsterCount - 1 do
		local varObj = GetMonsterObjID( varMap, varI)
        hide = 0
        for j, item in x300615_var_HideTowerTable do
        	if -1 == varObj then
        		WriteLog(1, "x300615_InitBattleField error")
        	end
        	
          if -1 ~= varObj and item.guid == GetMonsterGUID( varMap, varObj) then
              hide = 1
              break
          end
        end
        show = 0
        for j, item in x300615_var_ShowTowerTable do
            if -1 ~= varObj and item.guid == GetMonsterGUID( varMap, varObj) then
                show = 1
                break
            end
        end
        ruin = 0
        for j, item in x300615_var_RuinList[ varMap] do
            if -1 ~= varObj and item == GetMonsterGUID( varMap, varObj) then
                ruin = 1
                break
            end
        end
        if show == 1 or hide == 1 or ruin == 1 then
            if IsObjValid( varMap, varObj) == 1 and GetHp( varMap, varObj) > 0 then
                DeleteMonster( varMap, varObj)
            end
        end
	end

    
    x300615_var_RuinList[ varMap] = {}
		x300615_var_TowerObjID        = {}
		local index = 1
    
    for varI, item in x300615_var_HideTowerTable do
       x300615_var_TowerObjID[index] = CreateMonster( varMap, item.typeid, item.varX, item.z, item.base_ai, item.aiscript, x300615_var_FileId, item.guid, item.campid, 3600000, item.faceDir, item.varName, item.title)
    	 index = index + 1
    end
    for varI, item in x300615_var_ShowTowerTable do
        CreateMonster( varMap, item.typeid, item.varX, item.z, item.base_ai, item.aiscript, x300615_var_FileId, item.guid, item.campid, 3600000, item.faceDir, item.varName, item.title)
    end

    for i , item in x300615_var_TowerObjID do
    	SendSpecificImpactToUnit(varMap, item, item, item, x300615_var_TowerBuff, 0)  --给箭塔添加加血免疫BUFF
    end
    
    AddSceneTempImpassable( varMap, 195, 116, 199, 131)
    AddSceneTempImpassable( varMap,  56, 116,  60, 131)
end


function x300615_RegisterScene( varMap, GuildIdA, GuildIdB)
    SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD, GuildIdA)
    SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD, GuildIdB)
end


function x300615_ProcBattleBegin( varMap)
    if x300615_IsGuildContendScene( varMap) == 0 then
        return
    end

    local GuildIdA = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD)
    local GuildIdB = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD)

    if GuildIdA == -1 and GuildIdB == -1 then
        return
    end

    
    if GuildIdA == -1 and GuildIdB ~= -1 then
        local groupType = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_GROUPTYPE)
        
        SetGuildQuestData( varMap, GuildIdB, GD_GUILD_INDEX_CONTEND_WIN_COUNT,  1, 1)
        
        UpdateGuildContendTurnsInfo( varMap, GuildIdB, 1, 0, groupType)
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD, -1)
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD, -1)
        return
    end
    if GuildIdB == -1 and GuildIdA ~= -1 then
        local groupType = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_GROUPTYPE)
        
        SetGuildQuestData( varMap, GuildIdA, GD_GUILD_INDEX_CONTEND_WIN_COUNT,  1, 1)
        
        UpdateGuildContendTurnsInfo( varMap, GuildIdA, 1, 0, groupType)
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD, -1)
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD, -1)
        return
    end

    LuaThisScenceM2Wrold( varMap, "【帮会】世界杯开始！", 5, 1)

    SetSceneMapDataFlag( varMap, 1, 7, "龙珠", 126, 124, -1)

    
    DelSceneTempImpassable( varMap, 195, 116, 199, 131)
    DelSceneTempImpassable( varMap,  56, 116,  60, 131)

    
    SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE, 0)
    SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE, 0)
    
    SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_FLAGOCCUPY, -1)
    
    x300615_var_Occupy[ varMap] = 0
    x300615_var_Occupy_B[ varMap] = 0
    SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_CATCHFLAG_A, -1)
    SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_CATCHFLAG_B, -1)

    
    local varHumanCount = GetScenePlayerCount( varMap)
    for varI = 0, varHumanCount - 1 do
        local varObj = GetScenePlayerObjId( varMap, varI)
        if varObj >= 0 and IsPlayerStateNormal( varMap, varObj) == 1 then
            SetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_LEADER, 0)
            SetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_ASSIST, 0)
            SetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_FAMILY, 0)
            SetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_GOLD, 0)
            SetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_OTHER, 0)
            SetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_SCORE, 0)
            SetPlayerRuntimeData( varMap, varObj, RD_DANCERY_BODYID, 0)
        end

        
        local guildId = GetGuildID( varMap, varObj)
        local rx = random( 2, 5)
        local rz = random( 2, 5)
        if guildId == GuildIdA then
            SetCurCamp( varMap, varObj, 5)
            
        elseif guildId == GuildIdB then
            SetCurCamp( varMap, varObj, 6)
            
        else
            
            x300615_ProcPlayerAskLeave( varMap, varObj)
        end
        
        x300615_var_ToStopEffectList[ varMap][ getn( x300615_var_ToStopEffectList[ varMap] ) + 1] = varObj
		
		
    end
end


function x300615_ProcBattleEnd( varMap)
    
    local GuildIdA = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD)
    local GuildIdB = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD)
    local turnNumber = GetWorldCupSceneData_Param( varMap, LD_GUILD_CONTEND_TURNNUMBER)
    local groupType = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_GROUPTYPE)
    local matchFlag = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_FLAG)
    local varIndex = 1

    
    for varI, item in x300615_var_RewardTable do
        if turnNumber == item.turnNumber and groupType == item.groupType then
            varIndex = varI
            break
        end
    end

    
    if GuildIdA == -1 and GuildIdB == -1 then
        return
    end

    
    if GuildIdA == -1 then
        UpdateGuildContendTurnsInfo( varMap, GuildIdB, 0, 0, groupType)
        SetGuildQuestData( varMap, GuildIdB, GD_GUILD_INDEX_CONTEND_STATE, STATE_GUILD_WORLDCUP_END, 0)
        return
    end
    if GuildIdB == -1 then
        UpdateGuildContendTurnsInfo( varMap, GuildIdA, 0, 0, groupType)
        SetGuildQuestData( varMap, GuildIdA, GD_GUILD_INDEX_CONTEND_STATE, STATE_GUILD_WORLDCUP_END, 0)
        return
    end

    local TitleBlue = GetGuildName( GuildIdA)
    local TitleRed  = GetGuildName( GuildIdB)
    local varHumanCount = GetScenePlayerCount( varMap)
    local scoreA = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE)
    local scoreB = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE)
    SetGuildQuestData( varMap, GuildIdA, GD_GUILD_INDEX_CONTEND_STATE, STATE_GUILD_WORLDCUP_END, 0)
    SetGuildQuestData( varMap, GuildIdB, GD_GUILD_INDEX_CONTEND_STATE, STATE_GUILD_WORLDCUP_END, 0)

    
    
    local nTime = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_COUNT_ITME)

    
    local Winner = 0
    if scoreA == scoreB then
        
        local gbA = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GB_SCORE)
        local gbB = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GB_SCORE)
        if gbA > gbB then
            Winner = 1
        elseif gbA < gbB then
            Winner = 0
        else
            
            if random( 1, 2) == 1 then
                Winner = 0
            else
                Winner = 1
            end
        end
    else
        if scoreA > scoreB then
            Winner = 0
        else
            Winner = 1
        end
    end

    
    GuildContendSendBaseInfo( varMap, TitleBlue, TitleRed, Winner, nTime)
    
    local varI = 0
    local nGuildFlag = 0
    local firstWin = 0
    local firstLose = 0
    local allResult = {}
    for varI = 0, varHumanCount - 1 do
        local varObj = GetScenePlayerObjId( varMap, varI)
        allResult[ varI + 1] = { kill = 0, collect = 0, occour = 0, varFlag = 0, tower = 0, score = 0, nGuildFlag = 0, nCountryId = 0, varName = "" }
        RestoreHp( varMap, varObj, 0)
        if varObj >= 0 and IsPlayerStateNormal( varMap, varObj) == 1 then
            local nGuildId = GetGuildID( varMap, varObj)

            
            SetCurCamp( varMap, varObj, 4)

            
            if IsPlayerMutexState( varMap, varObj, PLAYER_STATE_DIE) > 0 then
                RelivePlayerNM( varMap, varObj, 2)
            end

            
            local isWin = 1
            local oppoGuildName = ""
            if Winner == 0 then 
                if nGuildId == GuildIdA then
                    isWin = 1
                    nGuildFlag = 0
                    oppoGuildName = GetGuildName( GuildIdB)
                else
                    isWin = 0
                    nGuildFlag = 1
                    oppoGuildName = GetGuildName( GuildIdA)
                end
            else 
                if nGuildId == GuildIdB then
                    isWin = 1
                    nGuildFlag = 1
                    oppoGuildName = GetGuildName( GuildIdA)
                else
                    isWin = 0
                    nGuildFlag = 0
                    oppoGuildName = GetGuildName( GuildIdB)
                end
            end
            
            if isWin == 0 then
                
                local varLevel = GetLevel( varMap, varObj)
                local varName = GetName( varMap, varObj)

                local strInfo = "比赛结束，很遗憾你所在的帮会被淘汰！"
                if groupType == 0 then
                    if turnNumber == 0 then
                        strInfo = "【帮会】世界杯C组1/8决赛你们的帮会被#R"..oppoGuildName.."#cffcf00淘汰出局。"
                    elseif turnNumber == 1 then
                        strInfo = "【帮会】世界杯C组1/4决赛你们的帮会被#R"..oppoGuildName.."#cffcf00淘汰出局。"
                    elseif turnNumber == 2 then
                        strInfo = "【帮会】世界杯C组半决赛你们的帮会被#R"..oppoGuildName.."#cffcf00击败，失去晋级决赛资格，下轮将参加争夺三四名的比赛。"
                    elseif turnNumber == 3 then
                        if matchFlag == 1 then
                            strInfo = "本届【帮会】世界杯C组三四名决赛中你们的帮会被#R"..oppoGuildName.."#cffcf00击败，以C组第四名晋级B组。"
                        else
                            strInfo = "本届【帮会】世界杯C组决赛中你们的帮会被#R"..oppoGuildName.."#cffcf00击败，以C组亚军的身份晋级B组。"
                        end
                    end
                elseif groupType == 1 then
                    if turnNumber == 0 then
                        strInfo = "【帮会】世界杯B组1/4决赛你们的帮会被#R"..oppoGuildName.."#cffcf00击败，失去晋级A组资格。"
                    elseif turnNumber == 1 then
                        strInfo = "【帮会】世界杯B组半决赛你们的帮会被#R"..oppoGuildName.."#cffcf00击败，失去晋级决赛资格，下轮将参加争夺三四名的比赛。"
                    elseif turnNumber == 2 then
                        strInfo = "【帮会】世界杯B组三四名决赛你们的帮会被#R"..oppoGuildName.."#cffcf00击败，获得B组第四名。"
                    elseif turnNumber == 3 then
                        strInfo = "【帮会】世界杯B组决赛你们的帮会被#R"..oppoGuildName.."#cffcf00击败，获得B组亚军。"
                    end
                elseif groupType == 2 then
                    if turnNumber == 0 then
                        strInfo = "【帮会】世界杯A组1/4决赛你们的帮会被#R"..oppoGuildName.."#cffcf00击败，从A组降级到B组。"
                    elseif turnNumber == 1 then
                        strInfo = "【帮会】世界杯A组半决赛你们的帮会被#R"..oppoGuildName.."#cffcf00击败，失去晋级决赛资格，下轮将参加争夺三四名的比赛。"
                    elseif turnNumber == 2 then
                        strInfo = "【帮会】世界杯A组三四名决赛你们的帮会被#R"..oppoGuildName.."#cffcf00击败，获得A组第四名。"
                    elseif turnNumber == 3 then
                        strInfo = "【帮会】世界杯A组决赛你们的帮会被#R"..oppoGuildName.."#cffcf00击败，获得A组亚军。"
                    end
                end
                LuaScenceM2Player( varMap, varObj, strInfo, varName, 2, 1)

                
                local nCountryId   = GetCurCountry( varMap, varObj)
                local nBeKilled    = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_DIECOUNT)

                allResult[ varI + 1].kill = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_LEADER)
                allResult[ varI + 1].collect = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_ASSIST)
                allResult[ varI + 1].occour = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_FAMILY)
                allResult[ varI + 1].varFlag = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_GOLD)
                allResult[ varI + 1].tower = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_OTHER)
                allResult[ varI + 1].score = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_SCORE)
                allResult[ varI + 1].nGuildFlag = nGuildFlag
                allResult[ varI + 1].nCountryId = nCountryId
                allResult[ varI + 1].varName = varName
                Msg2Player( varMap, varObj, format( "获得#R#{_MONEY%d}#cffcc00帮会金钱", x300615_var_RewardTable[ varIndex].rewards[ 2].gmoney), 8, 2)
                Msg2Player( varMap, varObj, format( "获得#R%d#cffcc00帮会使命", x300615_var_RewardTable[ varIndex].rewards[ 2].gshiming), 8, 2)
                Msg2Player( varMap, varObj, format( "获得#R%d点#cffcc00帮会经验", x300615_var_RewardTable[ varIndex].rewards[ 2].gxp), 8, 2)
                if firstLose == 0 then
                    
                    firstLose = 1
                    AddGuildMoney( varMap, varObj, x300615_var_RewardTable[ varIndex].rewards[ 2].gmoney)
                    AddGuildShiMing( varMap, varObj, x300615_var_RewardTable[ varIndex].rewards[ 2].gshiming)
                    AddGuildExp( varMap, varObj, x300615_var_RewardTable[ varIndex].rewards[ 2].gxp)
                end
            else
                
                local varLevel = GetLevel( varMap, varObj)
                local varName = GetName( varMap, varObj)

                local strInfo = "你所在的帮会顺利晋级！"
                if groupType == 0 then
                    if turnNumber == 0 then
                        strInfo = "【帮会】世界杯C组1/8决赛你们的帮会淘汰#R"..oppoGuildName.."#cffcf00，顺利晋级8强。"
                    elseif turnNumber == 1 then
                        strInfo = "【帮会】世界杯C组1/4决赛你们的帮会淘汰#R"..oppoGuildName.."#cffcf00，顺利晋级4强，并在下届升级到b组。"
                    elseif turnNumber == 2 then
                        strInfo = "【帮会】世界杯C组半决赛你们的帮会击败#R"..oppoGuildName.."#cffcf00，顺利晋级决赛，下轮将争夺C组冠军。"
                    elseif turnNumber == 3 then
                        if matchFlag == 1 then
                            strInfo = "本届【帮会】世界杯C组三四名决赛中你们的帮会击败#R"..oppoGuildName.."#cffcf00，获得C组季军。"
                        else
                            strInfo = "本届【帮会】世界杯C组决赛中你们的帮会击败#R"..oppoGuildName.."#cffcf00，获得C组冠军！"
                        end
                    end
                elseif groupType == 1 then
                    if turnNumber == 0 then
                        strInfo = "【帮会】世界杯B组1/4决赛你们的帮会淘汰#R"..oppoGuildName.."#cffcf00，顺利晋级4强，并在下届升级到a组。"
                    elseif turnNumber == 1 then
                        strInfo = "【帮会】世界杯B组半决赛你们的帮会击败#R"..oppoGuildName.."#cffcf00，顺利晋级B组决赛。"
                    elseif turnNumber == 2 then
                        strInfo = "【帮会】世界杯B组三四名决赛你们的帮会击败#R"..oppoGuildName.."#cffcf00，获得B组季军。"
                    elseif turnNumber == 3 then
                        strInfo = "【帮会】世界杯B组决赛你们的帮会击败#R"..oppoGuildName.."#cffcf00，获得B组冠军！"
                    end
                elseif groupType == 2 then
                    if turnNumber == 0 then
                        strInfo = "【帮会】世界杯A组1/4决赛你们的帮会淘汰#R"..oppoGuildName.."#cffcf00，顺利晋级4强。"
                    elseif turnNumber == 1 then
                        strInfo = "【帮会】世界杯A组半决赛你们的帮会击败#R"..oppoGuildName.."#cffcf00，顺利晋级决赛，两轮后将争夺本届【帮会】世界杯桂冠。"
                    elseif turnNumber == 2 then
                        strInfo = "【帮会】世界杯A组三四名决赛你们的帮会击败#R"..oppoGuildName.."#cffcf00，获得A组季军。"
                    elseif turnNumber == 3 then
                        strInfo = "【帮会】世界杯A组决赛你们的帮会击败#R"..oppoGuildName.."#cffcf00，获得A组冠军！"
                    end
                end
                LuaScenceM2Player( varMap, varObj, strInfo, varName, 2, 1)

                
                local nCountryId   = GetCurCountry( varMap, varObj)
                local nBeKilled    = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_DIECOUNT)

                allResult[ varI + 1].kill = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_LEADER)
                allResult[ varI + 1].collect = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_ASSIST)
                allResult[ varI + 1].occour = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_FAMILY)
                allResult[ varI + 1].varFlag = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_GOLD)
                allResult[ varI + 1].tower = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_KILL_OTHER)
                allResult[ varI + 1].score = GetPlayerRuntimeData( varMap, varObj, RD_GUILDCONTEND_SCORE)
                allResult[ varI + 1].nGuildFlag = nGuildFlag
                allResult[ varI + 1].nCountryId = nCountryId
                allResult[ varI + 1].varName = varName
                Msg2Player( varMap, varObj, format( "获得#R#{_MONEY%d}#cffcc00帮会金钱", x300615_var_RewardTable[ varIndex].rewards[ 1].gmoney), 8, 2)
                Msg2Player( varMap, varObj, format( "获得#R%d#cffcc00帮会使命", x300615_var_RewardTable[ varIndex].rewards[ 1].gshiming), 8, 2)
                Msg2Player( varMap, varObj, format( "获得#R%d点#cffcc00帮会经验", x300615_var_RewardTable[ varIndex].rewards[ 1].gxp), 8, 2)
                if firstWin == 0 then
                    
                    firstWin = 1
                    AddGuildMoney( varMap, varObj, x300615_var_RewardTable[ varIndex].rewards[ 1].gmoney)
                    AddGuildShiMing( varMap, varObj, x300615_var_RewardTable[ varIndex].rewards[ 1].gshiming)
                    AddGuildExp( varMap, varObj, x300615_var_RewardTable[ varIndex].rewards[ 1].gxp)
                end
            end
        end
    end

    
    sort( allResult, function ( a, b) return a.score > b.score end)
    
    for varI, item in allResult do
        if varI > 20 then
            break
        end
        GuildContendSendPlayerInfo( varMap, item.varName, item.nCountryId, 
            item.kill, 
            item.collect, 
            item.occour, 
            item.varFlag, 
            item.tower, 
            item.score, 
            item.nGuildFlag)
    end

    
    if Winner == 0 then
        SetGuildQuestData( varMap, GuildIdA, GD_GUILD_INDEX_CONTEND_WIN_COUNT,  1, 1)
        SetGuildQuestData( varMap, GuildIdB, GD_GUILD_INDEX_CONTEND_LOSE_COUNT, 1, 1)
        UpdateGuildContendTurnsInfo( varMap, GuildIdA, 0, 0, groupType)
    else
        SetGuildQuestData( varMap, GuildIdA, GD_GUILD_INDEX_CONTEND_LOSE_COUNT, 1, 1)
        SetGuildQuestData( varMap, GuildIdB, GD_GUILD_INDEX_CONTEND_WIN_COUNT,  1, 1)
        UpdateGuildContendTurnsInfo( varMap, GuildIdB, 0, 0, groupType)
    end

    
    SetWorldCupState( varMap, STATE_GUILD_WORLDCUP_END)
end


function x300615_ProcPlayerRelive( varMap, varPlayer, varReliveOp)
    if x300615_IsGuildContendScene( varMap) == 0 then
        return
    end

    local nGuildId = GetGuildID( varMap, varPlayer)
    local nGuildA = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD)
    local nGuildB = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD)
    local rx = random( 1, 3)
    local rz = random( 1, 3)

    if nGuildId == nGuildA then
        SetPos( varMap, varPlayer, x300615_var_RedInitPosX + rx, x300615_var_RedInitPosZ + rz)
    else
        SetPos( varMap, varPlayer, x300615_var_BlueInitPosX + rx, x300615_var_BlueInitPosZ + rz)
    end

    ClearRageRecoverTick( varMap, varPlayer)
    RestoreHp( varMap, varPlayer, 100)
    RestoreRage( varMap, varPlayer, 100)
    ClearMutexState( varMap, varPlayer, 6)
    SendReliveResult( varMap, varPlayer, 1)
end


function x300615_ProcWinLose( varMap, varPlayer, winGuild, loseGuild, turnNumber)
    
end


function x300615_ProcSyncGuildBattleTime( varMap, iTime)
    if x300615_IsGuildContendScene( varMap) == 0 then
        return
    end

    

    
    local remainTime = x300615_var_FightTime - iTime
    SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_COUNT_ITME, remainTime)

    
    local varHumanCount = GetScenePlayerCount( varMap)
    local varI = 0
    for varI = 0, varHumanCount - 1 do
        local varObj = GetScenePlayerObjId( varMap, varI)
        if varObj >= 0 then
            TimerCommand( varMap, varObj, 1, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, GUILD_CONTEND_SCRIPT, -1, -1)

            if iTime > 0 then
                TimerCommand( varMap, varObj, 2, GUILDBATTLE_TIMERID, GUILDBATTLE_TIMERTYPE, GUILD_CONTEND_SCRIPT, remainTime, remainTime)
            end
        end
    end
end





function x300615_ProcInformJoin( varMap, varPlayer, turnNumber, groupType, matchFlag, oppoGuildId)
    local strInfo = "参加【帮会】世界杯。"
    local oppoGuildName = GetGuildName( oppoGuildId)

    
    for varI, item in x300615_var_MutexTable do
        if IsPlayerMutexState( varMap, varPlayer, item) > 0 then
            return
        end
    end

    
    if IsHaveSpecificImpact( varMap, varPlayer, 7702) == 1 then
        return
    end

    if GetPKMode( varMap, varPlayer) ~= 0 then
        return
    end

    if IsHideName( varMap, varPlayer) == 1 then
        return
    end

	if IsPlayerStateNormal( varMap, varPlayer) ~= 1 then
        return
	end

	if IsCharacterLiving( varMap, varPlayer) == 0 then
		return
	end

    if groupType == 0 then
        if turnNumber == 0 then
            strInfo = "准备参加【帮会】世界杯C组1/8决赛。"
        elseif turnNumber == 1 then
            strInfo = "准备参加【帮会】世界杯C组1/4决赛。"
        elseif turnNumber == 2 then
            strInfo = "准备参加【帮会】世界杯C组半决赛。"
        elseif turnNumber == 3 then
            if matchFlag == 1 then
                strInfo = "准备参加【帮会】世界杯C组三四名决赛。"
            else
                strInfo = "准备参加【帮会】世界杯C组决赛。"
            end
        end
    elseif groupType == 1 then
        if turnNumber == 0 then
            strInfo = "准备参加【帮会】世界杯B组1/4决赛。"
        elseif turnNumber == 1 then
            strInfo = "准备参加【帮会】世界杯B组半决赛。"
        elseif turnNumber == 2 then
            strInfo = "准备参加【帮会】世界杯B组三四名决赛。"
        elseif turnNumber == 3 then
            strInfo = "准备参加【帮会】世界杯B组决赛。"
        end
    elseif groupType == 2 then
        if turnNumber == 0 then
            strInfo = "准备参加【帮会】世界杯A组1/4决赛。"
        elseif turnNumber == 1 then
            strInfo = "准备参加【帮会】世界杯A组半决赛。"
        elseif turnNumber == 2 then
            strInfo = "准备参加【帮会】世界杯A组三四名决赛。"
        elseif turnNumber == 3 then
            strInfo = "准备参加【帮会】世界杯A组决赛。"
        end
    end
    Msg2Player( varMap, varPlayer, strInfo, 8, 2)

    local strMsg = format( "WCL: Inform player %s enter world cup. varMap=%d, GroupID=%d, OpponentGuild=%d", GetName( varMap, varPlayer), varMap, groupType, oppoGuildId)
    WriteLog( 1, strMsg)

    if oppoGuildId ~= -1 then
        AskPlayerToJoinWorldCup( varMap, varPlayer, turnNumber, groupType, matchFlag, oppoGuildName)
    end
end


function x300615_ProcPromotion( varMap, varPlayer, groupType, turnNumber, matchFlag)
    local strInfo = "直接晋级。"

    if groupType == 0 then
        if turnNumber == 0 then
            strInfo = "【帮会】世界杯C组1/8决赛你们的帮会轮空，直接进入8强。"
        elseif turnNumber == 1 then
            strInfo = "【帮会】世界杯C组1/4决赛你们的帮会轮空，直接进入4强。"
        elseif turnNumber == 2 then
            strInfo = "【帮会】世界杯C组半决赛你们的帮会轮空，直接进入决赛。"
        elseif turnNumber == 3 then
            if matchFlag == 1 then
                strInfo = "【帮会】世界杯C组三四名决赛中你们的帮会轮空，直接获得C组季军。"
            else
                strInfo = "【帮会】世界杯C组决赛中你们的帮会轮空，直接获得C组冠军。"
            end
        end
    elseif groupType == 1 then
        if turnNumber == 0 then
            strInfo = "【帮会】世界杯B组1/4决赛你们的帮会轮空，直接进入B组4强。"
        elseif turnNumber == 1 then
            strInfo = "【帮会】世界杯B组半决赛你们的帮会轮空，直接进入决赛。"
        elseif turnNumber == 2 then
            strInfo = "【帮会】世界杯B组三四名决赛你们的帮会轮空，直接成为B组季军。"
        elseif turnNumber == 3 then
            strInfo = "【帮会】世界杯B组决赛你们的帮会轮空，直接成为B组冠军。"
        end
    elseif groupType == 2 then
        if turnNumber == 0 then
            strInfo = "【帮会】世界杯A组1/4决赛你们的帮会轮空，直接进入4强。"
        elseif turnNumber == 1 then
            strInfo = "【帮会】世界杯A组半决赛你们的帮会轮空，直接进入决赛。"
        elseif turnNumber == 2 then
            strInfo = "【帮会】世界杯A组三四名决赛你们的帮会轮空，直接成为A组季军。"
        elseif turnNumber == 3 then
            strInfo = "【帮会】世界杯A组决赛你们的帮会轮空，直接成为A组冠军。"
        end
    end
    Msg2Player( varMap, varPlayer, strInfo, 8, 2)

    local strMsg = format( "WCL: Inform player %s promotion. varMap=%d, GroupID=%d", GetName( varMap, varPlayer), varMap, groupType)
    WriteLog( 1, strMsg)
end


function x300615_ProcPlayerAskLeave( varMap, varPlayer)
    if x300615_IsGuildContendScene( varMap) == 0 then
        return
    end

    RestoreHp( varMap, varPlayer, 100)
    RelivePlayerNM( varMap, varPlayer, 2)
    
    SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_DIE, 0)

    if IsHaveSpecificImpact( varMap, varPlayer, 7801) == 1 then
        CancelSpecificImpact( varMap, varPlayer, 7801)
        
        SetGrowPointPos( varMap, x300615_GT_ArmyFlag, 126, 124)
        SetGrowPointIntervalContainer( varMap, x300615_GT_ArmyFlag, 1000)
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 0)
        SetSceneMapDataFlag( varMap, 1, 7, "龙珠", 126, 124, -1)
    end
    if IsHaveSpecificImpact( varMap, varPlayer, 7802) == 1 then
        CancelSpecificImpact( varMap, varPlayer, 7802)
    end

    
    local nCountryId = GetCurCountry( varMap, varPlayer)
    SetCurCamp( varMap, varPlayer, nCountryId)

    
    
        
    

    
    local varCount = GetItemCountInBag( varMap, varPlayer, x300615_var_ItemId)
    if varCount > 0 then
        if DelItem( varMap, varPlayer, x300615_var_ItemId, varCount) ~= 1 then return 0 end
    end

    
    local nBakSceneId,varX,z = GetPlayerBakSceneInfo(varMap,varPlayer )
    if nBakSceneId >= 0 and varX ~= 0 and z ~= 0 then
        SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_GUILDBATTLEFIELDSCENE, 0)
        NewWorld( varMap, varPlayer, nBakSceneId, varX, z, x300615_var_FileId)
        return
    end

    
    local varCountry = GetCurCountry( varMap, varPlayer)
    local nDestSceneId = 0
    if varCountry == 0 then
        
        nDestSceneId = 50
    elseif varCountry == 1 then
        
        nDestSceneId = 150
    elseif varCountry == 2 then
        
        nDestSceneId = 250
    elseif varCountry == 3 then
        
        nDestSceneId = 350
    end

    local nOffsetX = random( 8, 12)
    local nOffsetZ = random( 8, 12)
    SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_GUILDBATTLEFIELDSCENE, 0)
    NewWorld( varMap, varPlayer, nDestSceneId, x300615_var_PosX + nOffsetX, x300615_var_PosZ + nOffsetZ, 300615)
end


function x300615_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    x300615_ProcPlayerAskEnter( varMap, varPlayer, varTalknpc)
end

function x300615_ProcPlayerAskEnter( varMap, varPlayer, varTalknpc)
    local nGuildId = GetGuildID( varMap, varPlayer)
    if nGuildId < 0 or nGuildId > 1024 then
        if varTalknpc ~= 0 then
            StartTalkTask( varMap)
                TalkAppendString( varMap, "#Y"..x300615_var_Name)
                TalkAppendString( varMap, "你尚未加入任何帮会！不能进入战场。" )
            StopTalkTask()
            DeliverTalkMenu( varMap, varPlayer, varTalknpc)
            return
        end
    end

    
    for varI, item in x300615_var_MutexTable do
        if IsPlayerMutexState( varMap, varPlayer, item) > 0 then
            Msg2Player( varMap, varPlayer, "你现在不能进入世界杯战场", 8, 3)
            return
        end
    end

    
    if IsHaveSpecificImpact( varMap, varPlayer, 7702) == 1 then
        Msg2Player( varMap, varPlayer, "异国夺旗时不能进入世界杯战场", 8, 3)
        return
    end

    if GetPKMode( varMap, varPlayer) ~= 0 then
        Msg2Player( varMap, varPlayer, "处于pk模式不能进入世界杯战场", 8, 3)
        return
    end

    if IsHideName( varMap, varPlayer) == 1 then
        Msg2Player( varMap, varPlayer, "蒙面状态不能进入世界杯战场", 8, 3)
        return
    end

    GuildContendAskEnter( varMap, varPlayer)
end


function x300615_ProcRejectEnter( varMap, varPlayer)
    Msg2Player( varMap, varPlayer, "你所在的帮会没有入选本届的【帮会】世界杯！不能进入战场。", 8, 2)
end


function x300615_ProcNotBelongGuild( varMap, varPlayer)
    Msg2Player( varMap, varPlayer, "你尚未加入任何帮会！不能进入战场。", 8, 2)
end


function x300615_ProcNotOpponent( varMap, varPlayer)
    Msg2Player( varMap, varPlayer, "你所在的帮会本轮世界杯轮空，不能进入战场！", 8, 2)
end


function x300615_GetGuildContendScript( varMap)
    local sceneName = GetBattleSceneName( varMap)
    for varI, item in x300615_var_SceneScript do
        if item.Name == sceneName then
            return item.varScript
        end
    end

    return 0
end


function x300615_ProcPlayerEnter( varMap, varPlayer)
    if x300615_IsGuildContendScene( varMap) == 0 then
        return
    end

    local nGuildA = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD)
    local nGuildB = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD)

    if x300615_GetGuildContendScript( varMap) == 0 then
        return
    end

    local strGuildA = GetGuildName( nGuildA)
    local strGuildB = GetGuildName( nGuildB)
    local rx = random( 1, 3)
    local rz = random( 1, 3)

    local nGuildId = GetGuildID( varMap, varPlayer)
    if nGuildA == nGuildId then
        
        SendGuildContendDisable( varMap, varPlayer, 0, 0)
        SetPos( varMap, varPlayer, x300615_var_RedInitPosX + rx, x300615_var_RedInitPosZ + rz)
    elseif nGuildB == nGuildId then
        
        SendGuildContendDisable( varMap, varPlayer, 0, 1)
        SetPos( varMap, varPlayer, x300615_var_BlueInitPosX + rx, x300615_var_BlueInitPosZ + rz)
    end

    
    local scenePre = GetPlayerRuntimeData( varMap,varPlayer, RD_HUMAN_SCENE_PRE)
    if scenePre >= 0 then
        local CurX = GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_POSX_PRE)
        local CurZ = GetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_POSZ_PRE)

        SetPlayerBakSceneInfo( varMap, varPlayer, scenePre, CurX, CurZ)

        SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_SCENE_PRE, 0)
        SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_POSX_PRE, 0)
        SetPlayerRuntimeData( varMap, varPlayer, RD_HUMAN_POSZ_PRE, 0)
    end

    
    if GetWorldCupState( varMap) == STATE_GUILD_WORLDCUP_START then
        local guildId = GetGuildID( varMap, varPlayer)
        if guildId == nGuildA then
            SetCurCamp( varMap, varPlayer, 5)
        elseif guildId == nGuildB then
            SetCurCamp( varMap, varPlayer, 6)
        else
            
            x300615_ProcPlayerAskLeave( varMap, varPlayer)
        end
    else
        
        SetCurCamp( varMap, varPlayer, 4)
        
		LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 30)
		LuaCallNoclosure( UTILITY_SCRIPT, "PlayEffect", varMap, varPlayer, 31)
    end
end

function x300615_ProcPlayerLeaveGuild( varMap, varPlayer)
    if x300615_IsGuildContendScene( varMap) == 0 then
        return
    end
    
    x300615_ProcPlayerAskLeave( varMap, varPlayer)
    
end

function x300615_ProcPlayerLeave( varMap, varPlayer)
    if x300615_IsGuildContendScene( varMap) == 0 then
        return
    end

    RestoreHp( varMap, varPlayer, 100)
    if IsPlayerMutexState( varMap, varPlayer, PLAYER_STATE_DIE) == 1 then
        
        RelivePlayerNM( varMap, varPlayer, 2)
        SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_DIE, 0)
    end

    
    local nCountryId = GetCurCountry( varMap, varPlayer)
    SetCurCamp( varMap, varPlayer, nCountryId)

    
    
        
    

    
    local varCount = GetItemCountInBag( varMap, varPlayer, x300615_var_ItemId)
    if varCount > 0 then
        if DelItem( varMap, varPlayer, x300615_var_ItemId, varCount) ~= 1 then return 0 end
    end

    
    local nBakSceneId,varX,z = GetPlayerBakSceneInfo(varMap,varPlayer )
    if nBakSceneId >= 0 then
        SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_GUILDBATTLEFIELDSCENE, 0)
        NewWorld( varMap, varPlayer, nBakSceneId, varX, z, x300615_var_FileId)
        return
    end

    
    local varCountry = GetCurCountry( varMap, varPlayer)
    local nDestSceneId = 0
    if varCountry == 0 then
        
        nDestSceneId = 50
    elseif varCountry == 1 then
        
        nDestSceneId = 150
    elseif varCountry == 2 then
        
        nDestSceneId = 250
    elseif varCountry == 3 then
        
        nDestSceneId = 350
    end

    local nOffsetX = random( 8, 12)
    local nOffsetZ = random( 8, 12)
    SetPlayerMutexState( varMap, varPlayer, PLAYER_STATE_GUILDBATTLEFIELDSCENE, 0)
    NewWorld( varMap, varPlayer, nDestSceneId, x300615_var_PosX + nOffsetX, x300615_var_PosZ + nOffsetZ, 300615)
end




function x300615_ProcPlayerDie( varMap, varPlayer, varKiller)
    if x300615_IsGuildContendScene( varMap) == 0 then
        return
    end

    
    local varCount = GetItemCountInBag( varMap, varPlayer, x300615_var_ItemId)
    if varCount > 0 then
        if DelItem( varMap, varPlayer, x300615_var_ItemId, varCount) ~= 1 then return 0 end
    end

    local ownerId = GetOwnerID( varMap, varKiller)
    local muderer = varKiller
    if ownerId ~= -1 then
        
        SetPlayerRuntimeData( varMap, ownerId, RD_GUILDCONTEND_KILL_LEADER, GetPlayerRuntimeData( varMap, varKiller, RD_GUILDCONTEND_KILL_LEADER) + 1)
        muderer = ownerId
    else
        SetPlayerRuntimeData( varMap, varKiller, RD_GUILDCONTEND_KILL_LEADER, GetPlayerRuntimeData( varMap, varKiller, RD_GUILDCONTEND_KILL_LEADER) + 1)
    end

    if IsHaveSpecificImpact( varMap, varPlayer, 7801) == 1 then
        
        CancelSpecificImpact( varMap, varPlayer, 7801)
        CancelSpecificImpact( varMap, varPlayer, 7802)
        local growPointid = GetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID)
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 0)
        
        if IsPlayerStateNormal( varMap, muderer) == 1 and 
            IsPlayerMutexState( varMap, muderer, PLAYER_STATE_DIE) ~= 1 and 
            GetDist( varMap, varPlayer, muderer, 30) <= 30 then
            ReCallHorse( varMap, muderer)
            SendSpecificImpactToUnit( varMap, muderer, muderer, muderer, 7801, 0)
            SendSpecificImpactToUnit( varMap, muderer, muderer, muderer, 7802, 0)
            local varX,varY = GetWorldPos( varMap, muderer)
            SetSceneMapDataFlag( varMap, 1, 7, "龙珠", varX, varY, -1)
            SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_FLAGOCCUPY, muderer)
            SetPlayerRuntimeData( varMap, muderer, RD_DANCERY_BODYID, growPointid)
        else
            
            local varX,varY = GetWorldPos( varMap, varPlayer)
            SetGrowPointPos( varMap, growPointid, varX + 1, varY + 1)
            SetGrowPointIntervalContainer( varMap, growPointid, 1000)
            SetSceneMapDataFlag( varMap, 1, 7, "龙珠", varX + 1, varY + 1, -1)
            SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_FLAGOCCUPY, -2)
        end
    end

    
    SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_DIECOUNT, GetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_DIECOUNT) + 1)
end


function x300615_ProcPlayerNewConnectEnter( varMap, varPlayer)
    if x300615_IsGuildContendScene( varMap) == 0 then
        return
    end

    if GetWorldCupState( varMap) ~= STATE_GUILD_WORLDCUP_START then
        x300615_ProcPlayerAskLeave( varMap, varPlayer)
    end
end


function x300615_ProcMapTimerTick( varMap, nowTime)
    if x300615_IsGuildContendScene( varMap) == 0 then
        return
    end

    local varState = GetWorldCupState( varMap)
    
    if varState == STATE_GUILD_WORLDCUP_FINISHED then
        local varHumanCount = GetScenePlayerCount( varMap)
        for varI = 0, varHumanCount - 1 do
            local varObj = GetScenePlayerObjId( varMap, varI)
            if varObj >= 0 and IsPlayerStateNormal( varMap, varObj) == 1 then
                
                local nCountryId = GetCurCountry( varMap, varObj)
                SetCurCamp( varMap, varObj, nCountryId)
                x300615_ProcPlayerAskLeave( varMap, varObj)
            end
        end
        return
    end

    local GuildIdA = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD)
    local GuildIdB = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD)
    local varFlag = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_CATCHFLAG_A)

    
    if varState == STATE_GUILD_WORLDCUP_END then
        return
    end

    if varState == STATE_GUILD_WORLDCUP_START and varFlag ~= -1 then
        x300615_var_Occupy[ varMap] = x300615_var_Occupy[ varMap] + 1
        if x300615_var_Occupy[ varMap] >= 10 then
            if varFlag == GuildIdA then
                SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE, GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE) + x300615_var_FlagScore)
            elseif varFlag == GuildIdB then
                SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE, GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE) + x300615_var_FlagScore)
            end
            x300615_var_Occupy[ varMap] = 0
        end
    end
    varFlag = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_CATCHFLAG_B)
    if varState == STATE_GUILD_WORLDCUP_START and varFlag ~= -1 then
        x300615_var_Occupy_B[ varMap] = x300615_var_Occupy_B[ varMap] + 1
        if x300615_var_Occupy_B[ varMap] >= 10 then
            if varFlag == GuildIdA then
                SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE, GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE) + x300615_var_FlagScore)
            elseif varFlag == GuildIdB then
                SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE, GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE) + x300615_var_FlagScore)
            end
            x300615_var_Occupy_B[ varMap] = 0
        end
    end

    if GuildIdA == -1 and GuildIdB == -1 then
        return
    end

    
    local scoreA = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE)
    local scoreB = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE)
    BroadcastGuildContendScore( varMap, 0, scoreA)
    BroadcastGuildContendScore( varMap, 1, scoreB)

    local nSize = getn( x300615_var_ToStopEffectList[ varMap] )
    if nSize > 0 then
        local temp = x300615_var_ToStopEffectList[ varMap]
        x300615_var_ToStopEffectList[ varMap] = {}
        if nSize > x300615_var_ClearPerSecond then
            for varI = nSize - x300615_var_ClearPerSecond + 1, nSize do
                if IsPlayerStateNormal( varMap, temp[ varI] ) == 1 and IsObjValid( varMap, temp[ varI] ) == 1 then
                    LuaCallNoclosure( UTILITY_SCRIPT, "StopEffect", varMap, temp[ varI], 30)
                    LuaCallNoclosure( UTILITY_SCRIPT, "StopEffect", varMap, temp[ varI], 31)
                end
            end
            for varI = 1, nSize - x300615_var_ClearPerSecond do
                x300615_var_ToStopEffectList[ varMap][ varI] = temp[ varI]
            end
        else
            for varI = 1, nSize do
                if IsPlayerStateNormal( varMap, temp[ varI] ) == 1 and IsObjValid( varMap, temp[ varI] ) == 1 then
                    LuaCallNoclosure( UTILITY_SCRIPT, "StopEffect", varMap, temp[ varI], 30)
                    LuaCallNoclosure( UTILITY_SCRIPT, "StopEffect", varMap, temp[ varI], 31)
                end
            end
        end
    end

    
	local capflag = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_FLAGOCCUPY)
	if capflag > -1 then
		if IsObjValid( varMap, capflag) == 0 or IsPlayerStateNormal( varMap, capflag) ~= 1 or IsPlayerMutexState( varMap, capflag, PLAYER_STATE_DIE) == 1 then
			SetGrowPointPos( varMap, x300615_GT_ArmyFlag, 126, 124)
			SetGrowPointIntervalContainer( varMap, x300615_GT_ArmyFlag, 1000)
			SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_FLAGOCCUPY, -1)
            SetSceneMapDataFlag( varMap, 1, 7, "龙珠", 126, 124, -1)
        else
            local varX, z = GetWorldPos( varMap, capflag)
            SetSceneMapDataFlag( varMap, 1, 7, "龙珠", varX, z, -1)
		end
    elseif capflag ~= -2 then
        
        SetSceneMapDataFlag( varMap, 1, 7, "龙珠", 126, 124, -1)
	end

    
    local CountA = 0
    local CountB = 0
    local varHumanCount = GetScenePlayerCount( varMap)
    for varI = 0, varHumanCount - 1 do
        local varObj = GetScenePlayerObjId( varMap, varI)
        if varObj >= 0 and IsPlayerStateNormal( varMap, varObj) == 1 then
            local nGuildId = GetGuildID( varMap, varObj)
            if nGuildId == GuildIdA then
                CountA = CountA + 1
            elseif nGuildId == GuildIdB then
                CountB = CountB + 1
            end
        end
    end
    SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_COUNT, CountA)
    SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_COUNT, CountB)
    
    if CountA > x300615_var_MaxCountInBattleScene or CountB > x300615_var_MaxCountInBattleScene then
        for varI = 0, varHumanCount - 1 do
            local varObj = GetScenePlayerObjId( varMap, varI)
            if GetPlayerRuntimeData( varMap, varObj, RD_COLLECT_HORSE_HIGH) == 1 then
                Msg2Player( varMap, varObj, format( "你所在帮会进入战场人数已达上限%d人，不能再进人了。", x300615_var_MaxCountInBattleScene), 8, 2)
                x300615_ProcPlayerLeave( varMap, varObj)
            end
        end
    end

    
    local groupType = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_GROUPTYPE)
    local turnNumber = GetWorldCupSceneData_Param( varMap, LD_GUILD_CONTEND_TURNNUMBER)
    local matchFlag = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_FLAG)
    if varState == STATE_GUILD_WORLDCUP_START and CountB == 0 and CountA > 0 then
        x300615_GenResult( varMap, GuildIdA, GuildIdB)
        x300615_PerfectVictory( varMap, turnNumber, groupType, matchFlag, GetGuildName( GuildIdB) )

        return
    end
    if varState == STATE_GUILD_WORLDCUP_START and CountA == 0 and CountB > 0 then
        x300615_GenResult( varMap, GuildIdB, GuildIdA)
        x300615_PerfectVictory( varMap, turnNumber, groupType, matchFlag, GetGuildName( GuildIdA) )

        return
    end

    
    if varState == STATE_GUILD_WORLDCUP_START and CountA == 0 and CountB == 0 then
        if random( 1, 2) == 1 then
            SetGuildQuestData( varMap, GuildIdA, GD_GUILD_INDEX_CONTEND_WIN_COUNT,  1, 1)
            SetGuildQuestData( varMap, GuildIdB, GD_GUILD_INDEX_CONTEND_LOSE_COUNT, 1, 1)
            UpdateGuildContendTurnsInfo( varMap, GuildIdA, 1, 1, groupType)
        else
            SetGuildQuestData( varMap, GuildIdA, GD_GUILD_INDEX_CONTEND_LOSE_COUNT, 1, 1)
            SetGuildQuestData( varMap, GuildIdB, GD_GUILD_INDEX_CONTEND_WIN_COUNT,  1, 1)
            UpdateGuildContendTurnsInfo( varMap, GuildIdB, 1, 1, groupType)
        end

        
        SetWorldCupState( varMap, STATE_GUILD_WORLDCUP_END)
        SetGuildQuestData( varMap, GuildIdA, GD_GUILD_INDEX_CONTEND_STATE, STATE_GUILD_WORLDCUP_END, 0)
        SetGuildQuestData( varMap, GuildIdB, GD_GUILD_INDEX_CONTEND_STATE, STATE_GUILD_WORLDCUP_END, 0)
        
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD, -1)
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD, -1)

        return
    end

    
    if varState == STATE_GUILD_WORLDCUP_START and scoreA >= x300615_var_TotalScore or scoreB >= x300615_var_TotalScore then
        x300615_ProcBattleEnd( varMap)
        
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD, -1)
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD, -1)
    end
end

function x300615_ProcMapPlayerEnter( varMap, varPlayer)
    local aCount = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_COUNT)
    local bCount = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_COUNT)
    local aGuild = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD)
    local bGuild = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD)
    local gid = GetGuildID( varMap, varPlayer)

    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_HIGH, 0)
    if gid == aGuild then
        if aCount < x300615_var_MaxCountInBattleScene then
            return
        end
    elseif gid == bGuild then
        if bCount < x300615_var_MaxCountInBattleScene then
            return
        end
    end
    
    SetPlayerRuntimeData( varMap, varPlayer, RD_COLLECT_HORSE_HIGH, 1)
end

function x300615_GenResult( varMap, winGuild, loseGuild)
    local groupType = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_GROUPTYPE)
    local turnNumber = GetWorldCupSceneData_Param( varMap, LD_GUILD_CONTEND_TURNNUMBER)
    local matchFlag = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_FLAG)

    SetGuildQuestData( varMap, winGuild, GD_GUILD_INDEX_CONTEND_WIN_COUNT,  1, 1)
    SetGuildQuestData( varMap, loseGuild, GD_GUILD_INDEX_CONTEND_LOSE_COUNT, 1, 1)
    SetGuildQuestData( varMap, winGuild, GD_GUILD_INDEX_CONTEND_STATE, STATE_GUILD_WORLDCUP_END, 0)
    SetGuildQuestData( varMap, loseGuild, GD_GUILD_INDEX_CONTEND_STATE, STATE_GUILD_WORLDCUP_END, 0)
    UpdateGuildContendTurnsInfo( varMap, winGuild, 0, 1, groupType)

    
    SetWorldCupState( varMap, STATE_GUILD_WORLDCUP_END)
    
    SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD, -1)
    SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD, -1)
end


function x300615_PerfectVictory( varMap, turnNumber, groupType, matchFlag, oppoGuildName)
    local varHumanCount = GetScenePlayerCount( varMap)
    local strOppoName = "对手"
    if oppoGuildName ~= "" then
        strOppoName = oppoGuildName
    end

    
    local varIndex = 1
    for varI, item in x300615_var_RewardTable do
        if turnNumber == item.turnNumber and groupType == item.groupType then
            varIndex = varI
            break
        end
    end

    local firstWin = 0
    
    for varI = 0, varHumanCount - 1 do
        local varObj = GetScenePlayerObjId( varMap, varI)
        local varName = GetName( varMap, varObj)
        local strInfo = "与你所在帮会对阵的帮会的成员都不在战场，你们直接获得胜利。"
        if groupType == 0 then
            if turnNumber == 0 then
                strInfo = "【帮会】世界杯C组1/8决赛你们帮会的对手#R"..strOppoName.."#cffcf00的成员都不在战场，你们直接获得胜利，顺利晋级C组8强，下轮将进行升级B组的争夺。"
            elseif turnNumber == 1 then
                strInfo = "【帮会】世界杯C组1/4决赛你们帮会的对手#R"..strOppoName.."#cffcf00的成员都不在战场，你们直接获得胜利，顺利晋级c组4强，并在下届升级到b组。"
            elseif turnNumber == 2 then
                strInfo = "【帮会】世界杯C组半决赛你们帮会的对手#R"..strOppoName.."#cffcf00的成员都不在战场，你们直接获得胜利，顺利晋级决赛，下轮争夺C组冠军。"
            elseif turnNumber == 3 then
                if matchFlag == 1 then
                    strInfo = "【帮会】世界杯C组三四名决赛你们帮会的对手#R"..strOppoName.."#cffcf00的成员都不在战场，你们直接获得胜利，成为C组季军。"
                else
                    strInfo = "【帮会】世界杯C组决赛你们帮会的对手#R"..strOppoName.."#cffcf00的成员都不在战场，你们直接获得胜利，成为C组冠军。"
                end
            end
        elseif groupType == 1 then
            if turnNumber == 0 then
                strInfo = "【帮会】世界杯B组1/4决赛你们帮会的对手#R"..strOppoName.."#cffcf00的成员都不在战场，你们直接获得胜利，顺利晋级B组4强。"
            elseif turnNumber == 1 then
                strInfo = "【帮会】世界杯B组半决赛你们帮会的对手#R"..strOppoName.."#cffcf00的成员都不在战场，你们直接获得胜利，顺利晋级决赛，两轮后争夺B组冠军。"
            elseif turnNumber == 2 then
                strInfo = "【帮会】世界杯B组三四名决赛你们帮会的对手#R"..strOppoName.."#cffcf00的成员都不在战场，你们直接获得胜利，成为B组季军。"
            elseif turnNumber == 3 then
                strInfo = "【帮会】世界杯B组决赛你们帮会的对手#R"..strOppoName.."#cffcf00的成员都不在战场，你们直接获得胜利，成为B组冠军。"
            end
        elseif groupType == 2 then
            if turnNumber == 0 then
                strInfo = "【帮会】世界杯A组1/4决赛你们帮会的对手#R"..strOppoName.."#cffcf00的成员都不在战场，你们直接获得胜利，顺利晋级4强。"
            elseif turnNumber == 1 then
                strInfo = "【帮会】世界杯A组半决赛你们帮会的对手#R"..strOppoName.."#cffcf00的成员都不在战场，你们直接获得胜利，顺利晋级决赛，两轮后争夺A组冠军。"
            elseif turnNumber == 2 then
                strInfo = "【帮会】世界杯A组三四名决赛你们帮会的对手#R"..strOppoName.."#cffcf00的成员都不在战场，你们直接获得胜利，成为A组季军。"
            elseif turnNumber == 3 then
                strInfo = "【帮会】世界杯A组决赛你们帮会的对手#R"..strOppoName.."#cffcf00的成员都不在战场，你们直接获得胜利，成为A组冠军。"
            end
        end
        LuaScenceM2Player( varMap, varObj, strInfo, varName, 2, 1)
        Msg2Player( varMap, varObj, format( "获得#R#{_MONEY%d}#cffcc00帮会金钱", x300615_var_RewardTable[ varIndex].rewards[ 1].gmoney), 8, 2)
        Msg2Player( varMap, varObj, format( "获得#R%d#cffcc00帮会使命", x300615_var_RewardTable[ varIndex].rewards[ 1].gshiming), 8, 2)
        Msg2Player( varMap, varObj, format( "获得#R%d点#cffcc00帮会经验", x300615_var_RewardTable[ varIndex].rewards[ 1].gxp), 8, 2)
        if firstWin == 0 then
            firstWin = 1
            AddGuildMoney( varMap, varObj, x300615_var_RewardTable[ varIndex].rewards[ 1].gmoney)
            AddGuildShiMing( varMap, varObj, x300615_var_RewardTable[ varIndex].rewards[ 1].gshiming)
            AddGuildExp( varMap, varObj, x300615_var_RewardTable[ varIndex].rewards[ 1].gxp)
        end
        
        local nCountryId = GetCurCountry( varMap, varObj)
        SetCurCamp( varMap, varObj, nCountryId)
        x300615_ProcPlayerAskLeave( varMap, varObj)
    end
end


function x300615_UpdateReward( varMap, varPlayer, groupType, turnNumber, result)
    local varIndex = 1
    for varI, item in x300615_var_RewardTable do
        if turnNumber == item.turnNumber and groupType == item.groupType then
            varIndex = varI
            break
        end
    end

    local varTip = ""
    local strgroup = ""
    local strresult = ""
    if groupType == 1 then
        strgroup = "B组"
    elseif groupType == 2 then
        strgroup = "A组"
    end
    if turnNumber == 0 then
        varTip = "四分之一决赛"
    elseif turnNumber == 1 then
        varTip = "半决赛"
    elseif turnNumber == 2 then
        varTip = "三四名决赛"
    elseif turnNumber == 3 then
        varTip = "决赛"
    end
    if result == 1 then
        strresult = "获胜"
    elseif result == 2 then
        strresult = "失利"
    end

    Msg2Player( varMap, varPlayer, format( "【帮会】世界杯%s%s，你所在帮会%s。", strgroup, varTip, strresult), 8, 2)
    local xp = x300615_var_RewardTable[ varIndex].rewards[ result].xpCoff * GetLevel( varMap, varPlayer)
    AddExp( varMap, varPlayer, xp)
    Msg2Player( varMap, varPlayer, format( "获得#R%d#cffcc00点经验。", xp), 8, 2)
    local bangGong = x300615_var_RewardTable[ varIndex].rewards[ result].bangGong
    AddGuildUserPoint( varMap, varPlayer, bangGong)
    Msg2Player( varMap, varPlayer, format( "获得#R%d#cffcc00点帮贡。", bangGong), 8, 2)
end


function x300615_ProcGpOpenItemBox( varMap, varPlayer, varTalknpc, GrowpointId, ItemIndex)
    
    if GetWorldCupState( varMap) ~= STATE_GUILD_WORLDCUP_START then
        Msg2Player( varMap, varPlayer, "比赛还没开始，不能进行此操作", 8, 3)
        return 1
    end

    if GrowpointId == x300615_GT_ArmyFlag then
        
    elseif GrowpointId == x300615_GT_Flag_A then
        if GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_CATCHFLAG_A) == GetGuildID( varMap, varPlayer) then
            Msg2Player( varMap, varPlayer, "已经被你所在的帮会占领", 8, 3)
            return 1
        end
    elseif GrowpointId == x300615_GT_Flag_B then
        if GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_CATCHFLAG_B) == GetGuildID( varMap, varPlayer) then
            Msg2Player( varMap, varPlayer, "已经被你所在的帮会占领", 8, 3)
            return 1
        end
    elseif GrowpointId == x300615_GT_Miracle then
        
		if GetBagSpace( varMap, varPlayer) <= 0 then
			Msg2Player( varMap, varPlayer, "物品栏已满，不能进行采集", 8, 3)
            return 1
		end
        
        if GetItemCountInBag( varMap, varPlayer, x300615_var_ItemId) > 0 then
            Msg2Player( varMap, varPlayer, "不能重复采集@item_"..x300615_var_ItemId, 8, 3)
            return 1
        end
    end

    return 0
end

function x300615_ProcAreaEntered( varMap, varPlayer, varArea, varQuest)
    
    
    if IsHaveSpecificImpact( varMap, varPlayer, 7801) == 1 then
        CancelSpecificImpact( varMap, varPlayer, 7801)
        local growPointid = GetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID)
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, 0)
        SetGrowPointPos( varMap, x300615_GT_ArmyFlag, 126, 124)
        SetGrowPointIntervalContainer( varMap, x300615_GT_ArmyFlag, 1000)
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_FLAGOCCUPY, -1)
        SetSceneMapDataFlag( varMap, 1, 7, "龙珠", 126, 124, -1)
    end
    if IsHaveSpecificImpact( varMap, varPlayer, 7802) == 1 then
        CancelSpecificImpact( varMap, varPlayer, 7802)
    end
    
end

function x300615_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest)
    
end


function x300615_ProcGpRecycle( varMap, varPlayer, varTalknpc, GrowpointId, ItemIndex)
    
    if GetWorldCupState( varMap) ~= STATE_GUILD_WORLDCUP_START then
        return 0
    end

    
    if GrowpointId == x300615_GT_ArmyFlag then
        
        ReCallHorse( varMap, varPlayer)
        SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 7801,   200)    
        SendSpecificImpactToUnit( varMap, varPlayer, varPlayer, varPlayer, 7802, 200)    
        
        SetGrowPointIntervalContainer( varMap, GrowpointId, -1)
        
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_FLAGOCCUPY, varPlayer)
        SetPlayerRuntimeData( varMap, varPlayer, RD_DANCERY_BODYID, GrowpointId)
    elseif GrowpointId == x300615_GT_Flag_A then
        
        local guildId = GetGuildID( varMap, varPlayer)
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_CATCHFLAG_A, guildId)
        
        SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_GOLD, GetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_GOLD) + 1)
        
        x300615_var_Occupy[ varMap] = 0
        LuaThisScenceM2Wrold( varMap, format( "帮会%s占领了占领苏鲁锭战旗", GetGuildName( guildId) ), 5, 1)
    elseif GrowpointId == x300615_GT_Flag_B then
        
        local guildId = GetGuildID( varMap, varPlayer)
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_CATCHFLAG_B, guildId)
        
        SetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_GOLD, GetPlayerRuntimeData( varMap, varPlayer, RD_GUILDCONTEND_KILL_GOLD) + 1)
        
        x300615_var_Occupy_B[ varMap] = 0
        LuaThisScenceM2Wrold( varMap, format( "帮会%s占领了占领苏鲁锭战旗", GetGuildName( guildId) ), 5, 1)
    elseif GrowpointId == x300615_GT_Miracle then
        
        
        
        
        
        
            
            
                
                    
                
                    
                
            
        
 		StartItemTask( varMap)
		ItemAppend( varMap, x300615_var_ItemId, 1)
		local varRet = StopItemTask( varMap, varPlayer)
		if varRet > 0 then
			DeliverItemListSendToPlayer( varMap, varPlayer)
		else
			Msg2Player( varMap, varPlayer, "物品栏已满，采集失败", 8, 3)
		end
    end

    return 1
end


function x300615_ProcInformOutofBF( varMap, varPlayer, turnNumber, groupType, matchFlag, oppoGuildId, result)
    local varName = GetName( varMap, varPlayer)
    local strInfo = nil
    if result == 1 then
        
        if groupType == 0 then
            if turnNumber == 0 then
                strInfo = "与你所在帮会对阵的帮会成员都不在战场，你们幸运的获得胜利，进入C组8强。"
            elseif turnNumber == 1 then
                if matchFlag == 1 then
                    strInfo = "与你所在帮会对阵的帮会成员都不在战场，你们幸运的获得胜利，在C组保级完成。"
                else
                    strInfo = "与你所在帮会对阵的帮会成员都不在战场，你们幸运的获得胜利，进入c组4强，并在下届升级到b组。"
                end
            elseif turnNumber == 2 then
                strInfo = "与你所在帮会对阵的帮会成员都不在战场，你们幸运的获得胜利，进入C组决赛。"
            elseif turnNumber == 3 then
                if matchFlag == 0 then
                    strInfo = "与你所在帮会对阵的帮会成员都不在战场，你们幸运的获得胜利，获得本届【帮会】世界杯C组冠军！"
                else
                    strInfo = "你所在帮会和对阵的帮会成员都不在战场，你们幸运的获得胜利，获得本届【帮会】世界杯C组季军！"
                end
            end
        elseif groupType == 1 then
            if turnNumber == 0 then
                strInfo = "与你所在帮会对阵的帮会成员都不在战场，你们幸运的获得胜利，进入B组4强。"
            elseif turnNumber == 1 then
                strInfo = "与你所在帮会对阵的帮会成员都不在战场，你们幸运的获得胜利，进入B组决赛。"
            elseif turnNumber == 2 then
                strInfo = "与你所在帮会对阵的帮会成员都不在战场，你们幸运的获得胜利，获得本届【帮会】世界杯B组季军！"
            elseif turnNumber == 3 then
                strInfo = "与你所在帮会对阵的帮会成员都不在战场，你们幸运的获得胜利，获得本届【帮会】世界杯B组冠军！"
            end
        elseif groupType == 2 then
            if turnNumber == 0 then
                strInfo = "与你所在帮会对阵的帮会成员都不在战场，你们幸运的获得胜利，进入A组4强。"
            elseif turnNumber == 1 then
                strInfo = "与你所在帮会对阵的帮会成员都不在战场，你们幸运的获得胜利，进入A组决赛。"
            elseif turnNumber == 2 then
                strInfo = "与你所在帮会对阵的帮会成员都不在战场，你们幸运的获得胜利，获得本届【帮会】世界杯A组季军！"
            elseif turnNumber == 3 then
                strInfo = "与你所在帮会对阵的帮会成员都不在战场，你们幸运的获得胜利，获得本届【帮会】世界杯A组冠军！"
            end
        end
    else
        
        if groupType == 0 then
            if turnNumber == 0 then
                strInfo = "你所在帮会的成员都不在战场，你们不幸被淘汰，没能进入C组8强。"
            elseif turnNumber == 1 then
                strInfo = "你所在帮会的成员都不在战场，你们不幸被淘汰，没能进入C组4强。"
            elseif turnNumber == 2 then
                strInfo = "你所在帮会的成员都不在战场，你们不幸失利，没能进入C组决赛。"
            elseif turnNumber == 3 then
                if matchFlag == 0 then
                    strInfo = "你所在帮会的成员都不在战场，你们不幸失利，屈居本届【帮会】世界杯C组亚军！"
                else
                    strInfo = "你所在帮会的成员都不在战场，你们不幸失利，获得本届【帮会】世界杯C组殿军！"
                end
            end
        elseif groupType == 1 then
            if turnNumber == 0 then
                strInfo = "你所在帮会的成员都不在战场，你们不幸被淘汰，没能进入B组4强。"
            elseif turnNumber == 1 then
                strInfo = "你所在帮会的成员都不在战场，你们不幸失利，没能进入B组决赛。"
            elseif turnNumber == 2 then
                strInfo = "你所在帮会的成员都不在战场，你们不幸失利，获得本届【帮会】世界杯B组殿军！"
            elseif turnNumber == 3 then
                strInfo = "你所在帮会的成员都不在战场，你们不幸失利，屈居本届【帮会】世界杯B组亚军！"
            end
        elseif groupType == 2 then
            if turnNumber == 0 then
                strInfo = "你所在帮会的成员都不在战场，你们不幸被淘汰，没能进入A组4强。"
            elseif turnNumber == 1 then
                strInfo = "你所在帮会的成员都不在战场，你们不幸失利，没能进入A组决赛。"
            elseif turnNumber == 2 then
                strInfo = "你所在帮会的成员都不在战场，你们不幸失利，获得本届【帮会】世界杯A组殿军！"
            elseif turnNumber == 3 then
                strInfo = "你所在帮会的成员都不在战场，你们不幸失利，屈居本届【帮会】世界杯A组亚军！"
            end
        end
    end

    if strInfo ~= nil then
        LuaScenceM2Player( varMap, varPlayer, strInfo, varName, 2, 1)
    end
end


function x300615_ProcDie( varMap, varPlayer, varKiller)
    if x300615_IsGuildContendScene( varMap) == 0 then
        return
    end

    
    local nGuildId = GetGuildID( varMap, varKiller)
    local ownerId = GetOwnerID( varMap, varKiller)
    if ownerId ~= -1 then
        
        nGuildId = GetGuildID( varMap, ownerId)
        SetPlayerRuntimeData( varMap, ownerId, RD_GUILDCONTEND_KILL_OTHER, GetPlayerRuntimeData( varMap, ownerId, RD_GUILDCONTEND_KILL_OTHER) + 1)
    else
        SetPlayerRuntimeData( varMap, varKiller, RD_GUILDCONTEND_KILL_OTHER, GetPlayerRuntimeData( varMap, varKiller, RD_GUILDCONTEND_KILL_OTHER) + 1)
    end

    local score = 0
    local strTitle = ""
    local strName = ""
    local bFind = 0
    for varI, item in x300615_var_HideTowerTable do
        if GetMonsterGUID( varMap, varPlayer) == item.guid then
            local varObj = FindMonsterByGUID( varMap, x300615_var_ShowTowerTable[ varI].guid)
            if IsObjValid( varMap, varObj) == 1 then
                DeleteMonster( varMap, varObj)
            end
            
            CreateMonster( varMap, 9738, item.varX, item.z, 3, 409, -1, item.guid + 100, 4)
            
            x300615_var_RuinList[ varMap][ getn( x300615_var_RuinList) + 1] = item.guid + 100
            score = item.score
            strTitle = x300615_var_ShowTowerTable[ varI].title
            strName = x300615_var_ShowTowerTable[ varI].varName
            bFind = 1
            break
        end
    end

    
    if ownerId ~= -1 then
        SetPlayerRuntimeData( varMap, ownerId, RD_GUILDCONTEND_SCORE, GetPlayerRuntimeData( varMap, ownerId, RD_GUILDCONTEND_SCORE) + score)
    else
        SetPlayerRuntimeData( varMap, varKiller, RD_GUILDCONTEND_SCORE, GetPlayerRuntimeData( varMap, varKiller, RD_GUILDCONTEND_SCORE) + score)
    end
    
    local nGuildA = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_GUILD)
    local nGuildB = GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_GUILD)
    if nGuildA == nGuildId then
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE, GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_A_SOCRE) + score)
    elseif nGuildB == nGuildId then
        SetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE, GetWorldCupSceneData_Param( varMap, LD_GUILD_WORLDCUP_B_SOCRE) + score)
    end
    if bFind == 1 then
        local strBroadcast = format( "帮会%s摧毁了%s的%s", GetGuildName( nGuildId), strTitle, strName)
        local varCount = GetScenePlayerCount( varMap)
        for varI = 0, varCount - 1 do
            local varObj = GetScenePlayerObjId( varMap, varI)
            if IsPlayerStateNormal( varMap, varObj) == 1 then
                LuaScenceM2Player( varMap, varObj, strBroadcast, GetName( varMap, varObj), 5, 1)
            end
        end
    end
end

