--DECLARE_QUEST_INFO_START--

x930163_var_FileId 					= 	930163
x930163_var_QuestId 				= 	11010

x930163_var_QuestKind 				= 	1
x930163_var_LevelLess					= 	40

x930163_var_QuestName				= 	"战神藏宝图的秘密"
x930163_var_QuestTarget				= 	"  去#aB#h00CCFF{goto_%d,%d,%d}%s(%d,%d)#aE处使用铁铲挖掘宝藏"
x930163_var_QuestInfo				= 	"通过阅读这张战神藏宝图，您发现了宝藏的所在。去#aB#h00CCFF{goto_%d,%d,%d}%s(%d,%d)#aE处去挖掘宝藏吧。\n\t注意：当你使用不绑定的藏宝图且有#G江湖请柬#W状态时，能够获得不绑定的奖励道具，否则为绑定。"
x930163_var_ContinueInfo				= 	""
x930163_var_QuestCompleted			= 	"\t看来您已经得到@item_12030107,并初步了解战神藏宝图的秘密了吧？现在我给您一条线索，传说按照这条线索追查下去有可能得到传说中的宝藏！传说中的魂魄有可能栖息在地下粮仓，粮仓里深处的五个妖孽趁传说中魂魄虚弱的时候得到了它。打败那些妖孽就有可能得到@item_12030108。"
x930163_var_QuestHelp				=	"去杂货商人处买一个铁铲，然后去宝藏所在地使用"

x930163_var_strQuestAbandon         = "您放弃了任务：战神藏宝图的秘密"


x930163_var_ExtTarget					=	{ {type=20,n=1,target="去杂货商人处买一把铁铲，然后去宝藏所在地使用。"} }



x930163_var_ExpBonus					= 	0
x930163_var_BonusItem					=	{}

x930163_var_BonusMoney1               = 	0
x930163_var_BonusMoney2               =   0
x930163_var_BonusMoney3               =   0
x930163_var_BonusMoney4               =   0
x930163_var_BonusMoney5               =   0
x930163_var_BonusMoney6               =   0

x930163_var_BonusChoiceItem           =   {}


--DECLARE_QUEST_INFO_STOP--


x930163_MP_TARGET1					= 1
x930163_MP_TARGET2					= 2
x930163_MP_TARGET3					= 3
x930163_MP_TARGET4					= 4
x930163_MP_ISCOMPLETE				= 7

x930163_PREVIOUS_QUESTID			= -1
x930163_NEXT_QUESTID				= 7552
x930163_NEXT_QUESTSCRIPTID			= 300754
x930163_QUEST_HUANSHU				= 0

x930163_var_ItemBonus = {
    {varId = 12030108, varName = "复苏的天龙魂" 					, 	varNum = 1  ,	 probability = 5000 	},
    {varId = 11000552, varName = "完美星辰"            		, 	varNum = 1  ,  probability = 2000   },
    {varId = 12030048, varName = "百两金卡红包"            		, 	varNum = 1  ,  probability = 1000   },
    {varId = 12030047, varName = "金砖"            		, 	varNum = 5  ,  probability = 2000   },
    {varId = 11990114, varName = "次生钻石矿"          		, 	varNum = 1  ,  probability = 270    },
    {varId = 11990113, varName = "钻石原石"            		, 	varNum = 1  ,  probability = 200    },
    {varId = 11990115, varName = "原生钻石矿"          		, 	varNum = 1  ,  probability = 200    },
     {varId = 12274024, varName = "四品幻兽内丹"          		, 	varNum = 2  ,  probability = 200      },
     {varId = 12274025, varName = "五品幻兽内丹"          		, 	varNum = 3  ,  probability = 200      },
     {varId = 12050325, varName = "生命源龙降世符"          		, 	varNum = 1  ,  probability = 500      },
     {varId = 12220119, varName = "二代变异生命源龙降世符"          		, 	varNum = 1  ,  probability = 400      },
     {varId = 12220120, varName = "三代变异生命源龙降世符"          		, 	varNum = 1  ,  probability = 300      },
     {varId = 12220121, varName = "四代变异生命源龙降世符"          		, 	varNum = 1  ,  probability = 200      },
     {varId = 12220122, varName = "五代变异生命源龙降世符"          		, 	varNum = 1  ,  probability = 100      },
     {varId = 11000333, varName = "战神王牌兑换券"          		, 	varNum = 5  ,  probability = 80      },
     {varId = 11000334, varName = "战神令"          		, 	varNum = 5  ,  probability = 100      },
     {varId = 12274039, varName = "肝帝的证明大礼包"          		, 	varNum = 5  ,  probability = 40      },
     {varId = 12274095, varName = "坐骑图鉴大礼包"          		, 	varNum = 1  ,  probability = 10      },
     {varId = 12274080, varName = "神兵碎片大礼包"          		, 	varNum = 1  ,  probability = 200      },
     {varId = 11000380, varName = "稀世奇珍兑换卷"          		, 	varNum = 1  ,  probability = 100      },
}

x930163_var_Bosstable = {
    {mon_ID = 18089, ai = 1, aiscript = 975,	title = "大猫神兽（牛逼世界boss）"      },
    {mon_ID = 3201, ai = 1, aiscript = 975,	title = "大河之王"      },
    {mon_ID = 9780, ai = 1, aiscript = 975,	title = "黑水之王"			},
    {mon_ID = 3204, ai = 1, aiscript = 970,	title = "波西米亚之王"  },
    {mon_ID = 9781, ai = 1, aiscript = 975,	title = "贺兰山之王"		},
    {mon_ID = 3209, ai = 1, aiscript = 970,	title = "雪山之王"	 		},
    {mon_ID = 3210, ai = 1, aiscript = 975,	title = "戈壁之王"	 		},
    {mon_ID = 3208, ai = 1, aiscript = 975,	title = "平原之王"	 		},
    {mon_ID = 3217, ai = 1, aiscript = 972,	title = "高加索之王"		},
    {mon_ID = 3200, ai = 1, aiscript = 975,	title = "沙漠之王"	 		},
    {mon_ID = 3211, ai = 1, aiscript = 976,	title = "西域之王"	 		},
    {mon_ID = 3212, ai = 1, aiscript = 971,	title = "死海之王"  		},
    {mon_ID = 3214, ai = 1, aiscript = 977,	title = "巴格达之王"	  },
    {mon_ID = 3213, ai = 1, aiscript = 973,	title = "恒河之王"      },
    {mon_ID = 9782, ai = 1, aiscript = 975,	title = "叶密立之王"	  },
    {mon_ID = 3207, ai = 1, aiscript = 973,	title = "鲜血之王"			},
    {mon_ID = 3206, ai = 1, aiscript = 974,	title = "幕府之王"	 		},
    {mon_ID = 9783, ai = 1, aiscript = 976,	title = "漠北之王"	 		},
    {mon_ID = 9784, ai = 1, aiscript = 976,	title = "撒马尔罕之王"  },
    {mon_ID = 3215, ai = 1, aiscript = 970,	title = "顿河之王"  		},
    {mon_ID = 3216, ai = 1, aiscript = 971,	title = "伏尔加之王"  	},
    {mon_ID = 3202, ai = 1, aiscript = 975,	title = "波兰之王"  		},
    {mon_ID = 9785, ai = 1, aiscript = 972,	title = "条顿之王"  		},
    {mon_ID = 9786, ai = 1, aiscript = 976,	title = "哈布斯堡之王"  },
    {mon_ID = 9787, ai = 1, aiscript = 975,	title = "大马士革之王"  },
    {mon_ID = 9788, ai = 1, aiscript = 974,	title = "圣域之王"  		},
    {mon_ID = 3203, ai = 1, aiscript = 971,	title = "匈牙利之王"	 	},
    {mon_ID = 3205, ai = 1, aiscript = 974,	title = "埃及之王"			},
}

x930163_var_notifytable = {
    12274025,12220122,11000333,11000334,12274039,12274095
}

x930163_var_QuestTargetTable0        = {
    { varMap = 545, mapName = "大乱斗·场景", posX = 130 , posZ = 103   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 173 , posZ = 102   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 240 , posZ = 120   	},
    --{ varMap = 545, mapName = "大乱斗·场景", posX = 215 , posZ = 56   	},
    --{ varMap = 545, mapName = "大乱斗·场景", posX = 114 , posZ = 33   	},
    --{ varMap = 545, mapName = "大乱斗·场景", posX = 46 , posZ = 50   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 33 , posZ = 107   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 34 , posZ = 172   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 81 , posZ = 106   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 131 , posZ = 144   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 71 , posZ = 221   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 132 , posZ = 203   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 191 , posZ = 144   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 204 , posZ = 176   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 215 , posZ = 210   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 99 , posZ = 165   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 107 , posZ = 180   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 66 , posZ = 145   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 128 , posZ = 196   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 89 , posZ = 151   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 189 , posZ = 168   	},
    { varMap = 545, mapName = "大乱斗·场景", posX = 136 , posZ = 174   	},

}




x930163_var_MonsterTable              = {
    { varLevel = 20, bossId = 3050, strName = "巨角羊"    },
    { varLevel = 25, bossId = 3051, strName = "白头鸠"    },
    { varLevel = 30, bossId = 3052, strName = "铁骨僵尸"  },
    { varLevel = 35, bossId = 3053, strName = "毒爪蛛"    },
    { varLevel = 40, bossId = 3054, strName = "狡尾狐"    },
    { varLevel = 45, bossId = 3055, strName = "闪尾蝎"    },
    { varLevel = 50, bossId = 3056, strName = "怒角牛"    },
    { varLevel = 55, bossId = 3057, strName = "粉羽雉"    },
    { varLevel = 60, bossId = 3058, strName = "长牙雪怪"  },
    { varLevel = 65, bossId = 3062, strName = "黑影豹"    },
    { varLevel = 70, bossId = 3063, strName = "铁鬃熊"    },
    { varLevel = 75, bossId = 3064, strName = "金尾狮"    },
}

x930163_var_MonsterLive               = {
    { live = 0, varMap = 50,  mapName = "楼兰王城"   },
    { live = 0, varMap = 51,  mapName = "楼兰边塞"   },
    { live = 0, varMap = 150, mapName = "天山王城"   },
    { live = 0, varMap = 151, mapName = "天山边塞"   },
    { live = 0, varMap = 250, mapName = "昆仑王城"   },
    { live = 0, varMap = 251, mapName = "昆仑边塞"   },
    { live = 0, varMap = 350, mapName = "敦煌王城"   },
    { live = 0, varMap = 351, mapName = "敦煌边塞"   },
    { live = 0, varMap = 5,   mapName = "领地·凤翔府" },
    { live = 0, varMap = 8,   mapName = "领地·阿尔金山" },
    { live = 0, varMap = 11,  mapName = "领地·撒马尔罕" },
    { live = 0, varMap = 17,  mapName = "领地·莫斯科"   },
    { live = 0, varMap = 20,  mapName = "领地·匈牙利"   },
    { live = 0, varMap = 23,  mapName = "领地·大马士革" },
}


x930163_var_CallerId      = 0
x930163_var_CountryID     = 0
x930163_var_CallerName    = ""

x930163_var_DigRange      = 2

x930163_var_MoneyBuff     = 7046

x930163_var_GemBuff       = 7047

x930163_var_MedicineBuff  = 7048

x930163_var_MonsterBuff   = 7049




function x930163_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

end




function x930163_ProcEventEntry(varMap, varPlayer, varTalknpc, varQuest,varExtIdx)

    local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x930163_var_QuestId);
    if(varHaveQuest > 0) then
        local varDone = x930163_CheckSubmit(varMap, varPlayer, varTalknpc);
        if(varDone > 0) then
            if varExtIdx ~= -1 then
                x930163_DispatchCompletedInfo( varMap, varPlayer, varTalknpc )
            end
        else
            if varExtIdx ~= -1 then
                x930163_DispatchContinueInfo( varMap, varPlayer, varTalknpc )
            end
        end
    else
        x930163_DeliverTalkInfo( varMap, varPlayer, varTalknpc )
    end
end




function x930163_ProcAcceptCheck( varMap, varPlayer, varTalknpc)
    local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x930163_var_QuestId);
    if( varHaveQuest > 0) then
        return 0;
    else
        return 1;
    end
end




function x930163_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest)
    return 0
end




function x930163_ProcQuestAbandon(varMap, varPlayer, varQuest)
    local varHaveQuest	= IsHaveQuestNM(varMap, varPlayer, x930163_var_QuestId);
    if(varHaveQuest > 0) then
        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930163_var_QuestId);
        DelQuest(varMap, varPlayer, x930163_var_QuestId)

        StartTalkTask( varMap)
        TalkAppendString( varMap, x930163_var_strQuestAbandon)
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, x930163_var_strQuestAbandon, 8, 2)
    end
end




function x930163_CheckSubmit(varMap, varPlayer, varTalknpc)

    local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930163_var_QuestId);
    return GetQuestParam(varMap, varPlayer, varQuestIdx, x930163_MP_ISCOMPLETE);

end




function x930163_GetBonus( varMap, varPlayer,varTalknpc, varButtonClick )


    if x930163_var_BonusMoney1 > 0 then
        AddMoney( varMap, varPlayer, 1, x930163_var_BonusMoney1 )
        Msg2Player(varMap,varPlayer,format("获得银卡#{_MONEY%d}的奖励。", x930163_var_BonusMoney1),4,2)
    end


    if x930163_var_BonusMoney2 > 0 then
        AddMoney( varMap, varPlayer, 0, x930163_var_BonusMoney2 )
        Msg2Player(varMap,varPlayer,format("获得银币#{_MONEY%d}的奖励。", x930163_var_BonusMoney2),4,2)
    end


    if x930163_var_BonusMoney3 > 0 then
        AddMoney( varMap, varPlayer, 3, x930163_var_BonusMoney3 )
        Msg2Player(varMap,varPlayer,format("获得金卡#{_MONEY%d}的奖励。", x930163_var_BonusMoney3),4,2)
    end


    if x930163_var_BonusMoney4 > 0 then
        local varRongYu = GetRongYu( varMap, varPlayer )
        varRongYu = varRongYu + x930163_var_BonusMoney4
        SetRongYu( varMap, varPlayer, varRongYu )
        Msg2Player(varMap,varPlayer,format("获得江湖声望%d的奖励。", x930163_var_BonusMoney4),4,2)
    end


    if x930163_var_BonusMoney5 > 0 then
        local varShengWang = GetShengWang( varMap, varPlayer )
        varShengWang = varShengWang + x930163_var_BonusMoney5
        SetShengWang( varMap, varPlayer, varShengWang )
        Msg2Player(varMap,varPlayer,format("获得朝廷声望%d的奖励。", x930163_var_BonusMoney5),4,2)
    end


    if x930163_var_BonusMoney6 > 0 then
        AddHonor(varMap,varPlayer,x930163_var_BonusMoney6)
        Msg2Player(varMap,varPlayer,format("获得荣誉值%d的奖励。", x930163_var_BonusMoney6),4,2)
    end


    for varI, item in x930163_var_BonusItem do
        StartItemTask(varMap)
        ItemAppend( varMap, item.item, item.n )
        local varRet = StopItemTask(varMap,varPlayer)
        if varRet > 0 then
            DeliverItemListSendToPlayer(varMap,varPlayer)
        else
            StartTalkTask(varMap)
            TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
            StopTalkTask(varMap)
            DeliverTalkTips(varMap,varPlayer)
        end
    end


    for varI, item in x930163_var_BonusChoiceItem do
        if item.item == varButtonClick then
            StartItemTask(varMap)
            ItemAppend( varMap, item.item, item.n )
            local varRet = StopItemTask(varMap,varPlayer)
            if varRet > 0 then
                DeliverItemListSendToPlayer(varMap,varPlayer)
            else
                StartTalkTask(varMap)
                TalkAppendString(varMap,"物品栏已满，无法得到任务物品！")
                StopTalkTask(varMap)
                DeliverTalkTips(varMap,varPlayer)
            end


            return
        end
    end

end




function x930163_ProcQuestSubmit(varMap, varPlayer, varTalknpc, varRadioSelected, varQuest)


    local varHaveQuest = IsHaveQuestNM(varMap, varPlayer, x930163_var_QuestId);
    if varHaveQuest > 0 then

        local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930163_var_QuestId)
        local completed = GetQuestParam(varMap, varPlayer, varQuestIdx, x930163_MP_ISCOMPLETE)

        if completed == 1 then
            local result = x930163_CheckPlayerBagFull(varMap,varPlayer)
            if result == 1 then
                x930163_GetBonus( varMap,varPlayer,varTalknpc,varRadioSelected )
                DelQuest(varMap, varPlayer, x930163_var_QuestId)

                local varScript = -1;
                local varQuest = -1;
                local randnum = random(1, 5);
                if(randnum == 1) then
                    varScript = 300761;
                    varQuest = 7553;
                elseif(randnum == 2) then
                    varScript = 300762;
                    varQuest = 7554;
                elseif(randnum == 3) then
                    varScript = 930163;
                    varQuest = 8047;
                elseif(randnum == 4) then
                    varScript = 300764;
                    varQuest = 7582;
                elseif(randnum == 5) then
                    varScript = 300765;
                    varQuest = 7583;
                end
                LuaCallNoclosure( varScript, "ProcForceAddQuest", varMap, varPlayer, varTalknpc, varQuest );

            else
                StartTalkTask( varMap )
                TalkAppendString( varMap,"包裹已满！")
                StopTalkTask()
                DeliverTalkTips(varMap, varPlayer);
            end

        else
            StartTalkTask( varMap )
            TalkAppendString( varMap,"任务没有完成！")
            StopTalkTask()
            DeliverTalkTips(varMap, varPlayer);
        end
    else

        StartTalkTask( varMap )
        TalkAppendString( varMap,"任务不存在，获取任务信息失败！")
        StopTalkTask()
        DeliverTalkTips(varMap, varPlayer);

        return
    end

end




function x930163_CheckPlayerBagFull( varMap ,varPlayer )


    local result = 1

    local j = 0

    local bAdd = 0


    StartItemTask(varMap)
    for j, item in x930163_var_BonusItem do
        ItemAppend( varMap, item.item, item.n )
    end

    local varRet = StopItemTask(varMap,varPlayer)
    if varRet <= 0 then
        result = 0
        bAdd = 1
    end


    if bAdd == 0 then

        for j, item in x930163_var_BonusChoiceItem do
            StartItemTask(varMap)
            ItemAppend( varMap, item.item, item.n )
            local varRet = StopItemTask(varMap,varPlayer)
            if varRet <= 0 then
                if result == 1 then
                    result = 0
                end
            end
        end
    end

    return result
end




function x930163_DeliverTalkInfo( varMap, varPlayer, varTalknpc )

    StartTalkTask(varMap)


    TalkAppendString(varMap,"#Y"..x930163_var_QuestName)
    TalkAppendString(varMap,x930163_var_QuestInfo)
    TalkAppendString(varMap," ")


    TalkAppendString( varMap,"#Y任务目标：")
    TalkAppendString( varMap,x930163_var_QuestTarget)
    TalkAppendString( varMap," ")


    if x930163_var_QuestHelp ~= "" then

        TalkAppendString(varMap,"#Y任务提示：")
        TalkAppendString(varMap,x930163_var_QuestHelp )
        TalkAppendString(varMap," ")
    end




    if x930163_var_ExpBonus> 0 then
        AddQuestExpBonus(varMap, x930163_var_ExpBonus )
    end


    if x930163_var_BonusMoney1 > 0 then
        AddQuestMoneyBonus1(varMap, x930163_var_BonusMoney1 )
    end


    if x930163_var_BonusMoney2 > 0 then
        AddQuestMoneyBonus2(varMap, x930163_var_BonusMoney2 )
    end

    if x930163_var_BonusMoney3 > 0 then
        AddQuestMoneyBonus3(varMap, x930163_var_BonusMoney3 )
    end


    if x930163_var_BonusMoney4 > 0 then
        AddQuestMoneyBonus4(varMap, x930163_var_BonusMoney4 )
    end


    if x930163_var_BonusMoney5 > 0 then
        AddQuestMoneyBonus5(varMap, x930163_var_BonusMoney5 )
    end


    if x930163_var_BonusMoney6 > 0 then
        AddQuestMoneyBonus6(varMap, x930163_var_BonusMoney6 )
    end



    for varI, item in x930163_var_BonusItem do
        AddQuestItemBonus(varMap, item.item, item.n)
    end


    for varI, item in x930163_var_BonusChoiceItem do
        AddQuestRadioItemBonus(varMap, item.item, item.n)
    end


    StopTalkTask()
    DeliverTalkInfoNM(varMap, varPlayer, varTalknpc, x930163_var_FileId, x930163_var_QuestId);
end




function x930163_ProcDigbyShovel( varMap, varPlayer)

    if GetBagSpace(varMap, varPlayer) < 2 then
        Msg2Player(varMap, varPlayer,"需要至少两格空余背包位置才能挖掘！",8,2)
        Msg2Player(varMap, varPlayer,"需要至少两格空余背包位置才能挖掘！",8,3)
        return 0
    end

    if IsHaveQuestNM( varMap, varPlayer, x930163_var_QuestId) == 0 then
        return 0
    else
        local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x930163_var_QuestId)
        local ts = GetQuestParam( varMap, varPlayer, varQuestIdx, x930163_MP_TARGET4)
        if ts ~= varMap then
            StartTalkTask( varMap)
            TalkAppendString( varMap, "战神藏宝图任务挖掘场景不对，您白忙活一场" )
            StopTalkTask( varMap)
            DeliverTalkTips( varMap, varPlayer)
            Msg2Player( varMap, varPlayer, "战神藏宝图任务挖掘场景不对，您白忙活一场", 8, 2)
            return 0
        end
        local varX = GetQuestParam( varMap, varPlayer, varQuestIdx, x930163_MP_TARGET2)
        local z = GetQuestParam( varMap, varPlayer, varQuestIdx, x930163_MP_TARGET3)
        local curX, curZ = GetWorldPos( varMap, varPlayer)
        curX = abs( varX - curX)
        curZ = abs( z - curZ)
        if curX > x930163_var_DigRange or curZ > x930163_var_DigRange then
            StartTalkTask( varMap)
            TalkAppendString( varMap, "战神藏宝图任务挖掘座标不对，您白忙活一场" )
            StopTalkTask( varMap)
            DeliverTalkTips( varMap, varPlayer)
            Msg2Player( varMap, varPlayer, "战神藏宝图任务挖掘座标不对，您白忙活一场", 8, 2)
            return 0
        end
        local varprobability = random (1, 100000)
        if varprobability < 91571 then
            local pvar1 = random (1, 1000)
            if pvar1 <= 10 then
                local varX, z = GetWorldPos( varMap, varPlayer)
                local pvar2 = random (18121, 18124)
                local varObj = CreateMonster( varMap, pvar2, varX, z, 1, 754, -1, -1, 21, 60*60*1000, 0, "", "随机boss")
                local varName = GetName( varMap, varPlayer)
                local sceneName = GetSceneInfo(varMap,"NAME")
                local msg1 = "#e010101#cFF7903玩家#G"..varName.."#e010101#cFF7903在使用秘钻黄金藏宝图寻宝的过程惊动了沉睡的大猫"..item[i].title.."，现在妖兽在"..sceneName.."#e010101#cFF7903附近游荡，请大家快快前往消灭。"
                LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
                LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
            end
            local level = GetLevel(varMap, varPlayer)
            local varmin = 1
            local varmax = 1
            local buff 	=	9011
            local buff1 =	9013
            local buff2 =	9012
            local item = nil
            -- 先求总概率
            local totalProb = 0
            for i, iter in x930163_var_ItemBonus do
                totalProb = totalProb + iter.probability
            end
            varprobability = random (1, totalProb)
            for i, iter in x930163_var_ItemBonus do
                varmax = varmax + iter.probability
                if varprobability >= varmin and varprobability < varmax then
                    item = iter
                    break
                end
            end
            if item ~= nil then
                StartItemTask( varMap)
                if IsHaveSpecificImpact( varMap, varPlayer, buff) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff1) == 1 or IsHaveSpecificImpact( varMap, varPlayer, buff2) == 1 then
                    ItemAppend( varMap, item.varId, item.varNum)
                else
                    ItemAppend( varMap, item.varId, item.varNum)
                end
                local result = StopItemTask( varMap, varPlayer)
                if result == 0 then
                    StartTalkTask( varMap)
                    TalkAppendString( varMap, "背包已满，无法放入挖到的物品！" )
                    StopTalkTask( varMap)
                    DeliverTalkTips( varMap, varPlayer)
                    DelQuest( varMap, varPlayer, x930163_var_QuestId)
                    return 1
                end
                StartTalkTask( varMap)
                local strTemp = format( "在战神藏宝图的指引下，您得到了#R%d个#{_ITEM%d}#cffcf00，恭喜恭喜。", item.varNum,item.varId)
                TalkAppendString( varMap, strTemp )
                DeliverItemListSendToPlayer( varMap, varPlayer)
                StopTalkTask( varMap)
                DeliverTalkTips( varMap, varPlayer)
                Msg2Player( varMap, varPlayer, strTemp, 8, 3)
                Msg2Player( varMap, varPlayer, strTemp, 8, 2)
                for i,j in x930163_var_notifytable do
                    if item.varId == j then
                        local varName = GetName( varMap, varPlayer)
                        local msg1 = format("#cffcf00恭喜恭喜！玩家"..varName.."使用战神藏宝图寻宝时获得了#R%d个#{_ITEM%d}#cffcf00#cffcf00，真是好运气啊！",item.varNum,item.varId)
                        LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
                        LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
                    end
                end

            end
        elseif varprobability >= 91571 and varprobability <= 91900 then
            i = random( 1, getn( x930163_var_Bosstable) )
            local item = x930163_var_Bosstable
            local varX, z = GetWorldPos( varMap, varPlayer)
            local varObj = CreateMonster( varMap, item[i].mon_ID, varX, z, item[i].ai, item[i].aiscript, -1, -1, 21, 60*60*1000, 0, "", item[i].title)
            local varName = GetName( varMap, varPlayer)
            local sceneName = GetSceneInfo(varMap,"NAME")
            local msg1 = "#e010101#cFF7903玩家#G"..varName.."#e010101#cFF7903在使用战神藏宝图寻宝的过程惊动了沉睡的十八魔君"..item[i].title.."，现在妖兽在"..sceneName.."#e010101#cFF7903附近游荡，请大家快快前往消灭。"
            LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
            LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
        elseif varprobability >= 91901 and varprobability <= 92000 then
            local varX, z = GetWorldPos( varMap, varPlayer)
            local varName = GetName( varMap, varPlayer)
            local sceneName = GetSceneInfo(varMap,"NAME")
            local varObj = CreateMonster(  varMap, 18400, varX, z, 1, 961, -1, -1, 21, 60*60*1000, 0, "", "魔君幻像")
            local msg1 = "#e010101#cFF7903玩家#G"..varName.."#e010101#cFF7903在使用战神藏宝图寻宝的过程惊动了恐怖的暗·海都大王，现在恐怖的暗·海都大王在"..sceneName.."#e010101#cFF7903附近游荡，请大家快快前往消灭。"
            LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
            LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
        elseif varprobability >= 92001 and varprobability <= 97000 then
            local varName = GetName( varMap, varPlayer)
            local money =200*1000
            AddMoney( varMap, varPlayer,1, money )
            local varStr = format( "获得#R银卡#{_MONEY%d}#o的奖励", money)
            local msg1 = "#cffcf00恭喜恭喜！玩家"..varName.."使用战神藏宝图寻宝时获得了#R200两银卡#cffcf00，真是好运气啊！"
            Msg2Player( varMap, varPlayer, varStr, 8, 2)
            Msg2Player( varMap, varPlayer, varStr, 8, 3)
        elseif varprobability >= 97001 and varprobability <= 99000 then
            local varName = GetName( varMap, varPlayer)
            local money =500*1000
            AddMoney( varMap, varPlayer,1, money )
            local varStr = format( "获得#R银卡#{_MONEY%d}#o的奖励", money)
            local msg1	 = "#cffcf00恭喜恭喜！玩家"..varName.."使用战神藏宝图寻宝时获得了#R500两银卡#cffcf00，真是好运气啊！"
            Msg2Player( varMap, varPlayer, varStr, 8, 2)
            Msg2Player( varMap, varPlayer, varStr, 8, 3)
        elseif varprobability >= 99001 and varprobability <= 100000 then
            local varName = GetName( varMap, varPlayer)
            local money =1000*1000
            AddMoney( varMap, varPlayer,1, money )
            local varStr = format( "获得#R银卡#{_MONEY%d}#o的奖励", money)
            local msg1	 = "#cffcf00恭喜恭喜！玩家"..varName.."使用战神藏宝图寻宝时获得了#R1锭银卡#cffcf00，真是好运气啊！"
            Msg2Player( varMap, varPlayer, varStr, 8, 2)
            Msg2Player( varMap, varPlayer, varStr, 8, 3)
            LuaAllScenceM2Wrold(varMap, msg1, CHAT_PLANE_SCROLL, 1)
            LuaAllScenceM2Wrold(varMap, msg1, CHAT_LEFTDOWN, 1)
        end
        -- 删除任务
        DelQuest( varMap, varPlayer, x930163_var_QuestId)
        -- 提示任务完成
        Msg2Player( varMap, varPlayer, "您完成了："..x930163_var_QuestName, 8, 2)
        Msg2Player( varMap, varPlayer, "您完成了："..x930163_var_QuestName, 8, 3)
        -- 写日志
        GamePlayScriptLog( varMap, varPlayer, 2454)
        -- 消耗铁铲可用次数
        LuaCallNoclosure( 300331, "LogicDeplete", varMap, varPlayer)

    end

    return 1
end






function x930163_CallBoss( varMap, varPlayer)
    local monsters = {}
    local varCount = 1


    local maxLevel = 100
    if varMap == 50 or varMap == 150 or varMap == 250 or varMap == 350 then

        maxLevel = 40
    elseif varMap == 51 or varMap == 151 or varMap == 251 or varMap == 351 then

        maxLevel = 60
    elseif sceneId == 5 or sceneId == 8 or sceneId == 11 or sceneId == 17 or sceneId == 20 or sceneId == 23 then
        maxLevel = 80
    end

    for varI, item in x930163_var_MonsterTable do
        if item.varLevel <= maxLevel then
            monsters[ varCount] = item
            varCount = varCount + 1
        end
    end


    local varI = random( 1, getn( monsters) )

    for varI, item in x930163_var_MonsterLive do
        if item.varMap == varMap and item.live == 1 then
            return 0
        end
    end


    local varX, z = GetWorldPos( varMap, varPlayer)
    local mapName = ""
    CreateMonster( varMap, monsters[ varI].bossId, varX + random( 1, 3), z + random( 1, 3), 1, -1, x930163_var_FileId, -1, 21, 30*60*1000)

    for varI, item in x930163_var_MonsterLive do
        if item.varMap == varMap then
            x930163_var_MonsterLive[ varI].live = 1
            mapName = item.mapName
        end
    end

    Msg2Player( varMap, varPlayer, "你一阵挖掘，却看见一道黑光从地下冒出，出现在了你的身边。", 8, 2)
    Msg2Player( varMap, varPlayer, "你一阵挖掘，却看见一道黑光从地下冒出，出现在了你的身边。", 8, 3)

    local varName = GetName( varMap, varPlayer)
    local broadcast = "#e010101#cFF7903玩家#G"..varName.."#e010101#cFF7903在使用藏宝图寻宝的过程中不小心把妖兽给放了出来，现在妖兽在#S"..mapName.."#e010101#cFF7903附近游荡，请大家快快前往消灭。"
    LuaAllScenceM2Country( varMap, broadcast, GetCurCountry( varMap, varPlayer), 0, 1)
    LuaAllScenceM2Country( varMap, broadcast, GetCurCountry( varMap, varPlayer), 4, 1)

    return 1
end




function x930163_ProcDie( varMap, varPlayer, varKiller)








    for varI, item in x930163_var_MonsterLive do
        if item.varMap == varMap then
            x930163_var_MonsterLive[ varI].live = 0
        end
    end

    x930163_var_CountryID = 0
    x930163_var_CallerId = 0
    x930163_var_CallerName = ""

end




function x930163_DispatchContinueInfo( varMap, varPlayer, varTalknpc )
end




function x930163_DispatchCompletedInfo( varMap, varPlayer, varTalknpc )
end




function x930163_ProcQuestObjectKilled(varMap, varPlayer, varObjData ,varObj, varQuest )
end




function x930163_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end




function x930163_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest )
end




function x930163_ProcQuestLogRefresh( varMap, varPlayer, varQuest)
    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x930163_var_QuestId)
    local mapID = GetQuestParam( varMap, varPlayer, varQuestIdx, x930163_MP_TARGET1)
    local varTalknpc = GetQuestParam( varMap, varPlayer, varQuestIdx, x930163_MP_TARGET4)
    local varX = GetQuestParam( varMap, varPlayer, varQuestIdx, x930163_MP_TARGET2)
    local z = GetQuestParam( varMap, varPlayer, varQuestIdx, x930163_MP_TARGET3)
    local strMapName = ""

    if mapID == 0 then
        strMapName = "王国"
    elseif mapID == 1 then
        strMapName = "边塞"
    elseif mapID == 5 then
        strMapName = "领地·凤翔府"
    elseif mapID == 8 then
        strMapName = "领地·阿尔金山"
    elseif mapID == 11 then
        strMapName = "领地·撒马尔罕"
    elseif mapID == 17 then
        strMapName = "领地·莫斯科"
    elseif mapID == 20 then
        strMapName = "领地·匈牙利"
    elseif mapID == 23 then
        strMapName = "领地·大马士革"
    end



    StartTalkTask(varMap)
    AddQuestLogCustomText( varMap,
            "",
            x930163_var_QuestName,
            format( x930163_var_QuestTarget, varTalknpc, varX, z,strMapName,varX,z),
            "无",
            x930163_var_QuestHelp,
            format( x930163_var_QuestInfo, varTalknpc, varX, z,strMapName,varX,z),
            "" )

    StopTalkTask()
    DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end




function x930163_ProcForceAddQuest( varMap, varPlayer, varTalknpc, varQuest)
    if( varQuest ~= x930163_var_QuestId) then
        return 0;
    end


    if(x930163_ProcAcceptCheck( varMap, varPlayer, -1 ) ~= 1) then
        return 0;
    end
    local varRet = AddQuest( varMap, varPlayer, x930163_var_QuestId, x930163_var_FileId, 0, 0, 0, 0)
    if(varRet == 0) then
        StartTalkTask(varMap)
        TalkAppendString(varMap,"任务已满，任务接受失败！")
        StopTalkTask(varMap)
        DeliverTalkTips(varMap,varPlayer)
        return 0
    else
        StartTalkTask( varMap)
        TalkAppendString( varMap, "您获得了任务：战神藏宝图的秘密" )
        StopTalkTask( varMap)
        DeliverTalkTips( varMap, varPlayer)
        Msg2Player( varMap, varPlayer, "您获得了任务：战神藏宝图的秘密", 8, 2)
    end

    local guo = GetCurCountry(varMap,varPlayer)
    local size = getn( x930163_var_QuestTargetTable0)
    local varI = random( 1, size)

    local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, x930163_var_QuestId)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x930163_MP_TARGET1, x930163_var_QuestTargetTable0[ varI].varMap)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x930163_MP_TARGET2, x930163_var_QuestTargetTable0[ varI].posX)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x930163_MP_TARGET3, x930163_var_QuestTargetTable0[ varI].posZ)
    local mapid = x930163_var_QuestTargetTable0[ varI].varMap

    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x930163_MP_TARGET4, mapid)
    SetQuestByIndex( varMap, varPlayer, varQuestIdx, x930163_MP_ISCOMPLETE, 0)

    GamePlayScriptLog( varMap, varPlayer, 2453)
    return 1

end




function x930163_ProcCreaterGetBonus(varMap,guid,questdata)

    local nCastGuid = NumberCastIntToUInt(guid)


    local varPlayer = -1
    local varHumanCount = GetScenePlayerCount( varMap )
    for varI = 0,varHumanCount-1 do
        local varObj = GetScenePlayerObjId( varMap,varI)
        if varObj >= 0 then
            local objGUID = GetPlayerGUID(varMap, varObj )
            if objGUID == nCastGuid then
                varPlayer = varObj
                break
            end
        end
    end

    if varPlayer == -1 then
        return
    end


    local xp = GetLevel( varMap, varPlayer) * 500
    AddExp( varMap, varPlayer, xp)

    local strMsg = format("您放出的怪已经被消灭，因此您获得%d点经验", xp)

    local varName = GetName(varMap,varPlayer)
    LuaScenceM2Player(varMap,varPlayer,strMsg,varName,2,1)
    LuaScenceM2Player(varMap,varPlayer,strMsg,varName,3,1)

end
