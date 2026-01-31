

--DECLARE_QUEST_INFO_START--

x300519_var_FileId = 300519

x300519_var_EscortQuestID           = 6450
x300519_var_EscortQuestID_End       = 6461

x300519_var_QuestName = "【个人】内政任务"

x300519_var_EscortTarget0  = "找到@npc_%s"

x300519_var_EscortTarget1  = "将%s安全护送到@npc_%d那里。"

x300519_var_QuestContinue   = "\t你还没将%s护送到@npc_%d处呢！"

--DECLARE_QUEST_INFO_STOP--


x300519_var_IsComplete        = 0 
x300519_var_SubQuest        = 1 
x300519_var_Phase             = 2 

x300519_ProceRoundCount	= 10
x300519_HighBonusCircleCount = 10		
x300519_LevelToCapital	= 300		

x300519_var_EscortTable     = 
{
                            { varQuest=6450, escortType = 10,	varTalkNpcGUID = 138505,	varName = "吉尔格",
                            	targetGuid = 138109,	targetname = "巴图",	varQuestName = "马匹",
                            	finish = "\t谢谢你，总算是送来了，我正要再派人去催呢。",
                            	getmiss = "\t见到你太好了，#y@myname#w，戍边校尉巴图需要一匹良种战马来让王城斥候能够为他及时提供咸海湾等地的战况，我这里的人手现在很紧张，只好请你帮我把这匹马安全护送到城南门外的戍边校尉@npc_138109那里去了，你愿意帮我这个忙么？",
                            	intro = "\t骑乘繁殖大师@npc_138505需要把战马送往各地，你去看看他那里有什么需要你帮忙的。"
                            }, 
                            { varQuest=6451, escortType = 11, varTalkNpcGUID = 138270, varName = "拉木尔", 
                            	targetGuid = 138263, targetname = "驿丞穆合", varQuestName = "粮车",
                            	finish = "\t又来了一辆粮车，非常感谢你！", 
                            	getmiss = "\t刚才@npc_138263又派人来催促这批粮食了，我这里的实在是脱不开身，你能帮我把这车粮食送到他那里去么？", 
                            	intro = "\t灵芝牧场的粮食是我国粮产的主要来源，你去农场主@npc_138270那里看看有什么需要你帮忙的。" 
                            }, 
                            { varQuest=6452, escortType = 12, varTalkNpcGUID = 138075, varName = "耶律峰",
                            	targetGuid = 138055, targetname = "哈森",   varQuestName = "村民",
                            	finish = "\t啊，这是谁家的孩子走丢了？好的，我会帮他找到父母的！", 
                            	getmiss = "\t你来的正好，#y@myname#w，我还正在为怎么把这个迷路的小家伙送回家而发愁呢，我的年纪大了，腿脚也不好，上下山都不方便，所以想麻烦你帮我把这个小孩送到王城戍边校尉@npc_138055那里去，我知道你一定不会拒绝。", 
                            	intro = "\t听说忽突忽家族族长@npc_138075遇到了一些麻烦，你去问问他有没有需要帮助的。" 
                            }, 
                            { varQuest=6453, escortType = 13, varTalkNpcGUID = 138182, varName = "金矿主哈尔巴拉", 
                            	targetGuid = 138721, targetname = "玄石驿站",   varQuestName = "矿车",
                            	finish = "\t感谢你能及时把这个送过来，我们正等着用呢。", 
                            	getmiss = "\t#y@myname#w，你来的正好，@npc_138721那里急需这些矿石，你也知道最近这一带都不太安全，我早听说过你不仅本领高强，而且侠义心肠，这车矿石对你来说应该不是什么麻烦吧？", 
                            	intro = "\t@npc_138182那里总是缺少人手，你能去那边帮忙吗？" 
                            }, 
                            { varQuest=6454, escortType = 14, varTalkNpcGUID = 138110, varName = "卓玛",
                            	targetGuid = 138114, targetname = "阿木尔", varQuestName = "海货",
                            	finish = "\t啊，谢谢你，看来我们今天的晚餐会很丰盛。", 
                            	getmiss = "\t我们这里的海产可是鼎鼎有名，慕名而来的人络绎不绝，上次水晶村村长@npc_138114订购了一些，不过我们最近人手紧张，能麻烦你帮我送去么？", 
                            	intro = "\t珍珠渔港那里海产丰富，你去@npc_138110那边看看有什么可以帮得上的。" 
                            }, 
                            { varQuest=6455, escortType = 15, varTalkNpcGUID = 138518, varName = "忽秃鲁",
                            	targetGuid = 138058, targetname = "满都拉图",   varQuestName = "朝廷圣物", 
                            	finish = "\t送来了么？唔，辛苦你了。", 
                            	getmiss = "\t这车中装的是朝廷的圣物，太子殿下物色了很久才决定请你担当起这个重要的职责，秘密地将它送到@npc_138058那里，千万不要走漏风声或者私自拆开查看，你知道，过度的好奇心有时候是很危险的。", 
                            	intro = "\t我接到一宗任务，但可惜抽不出身来，可否拜托你来替我做这件事呢？去找@npc_138518吧，他会告诉你更多的。" 
                            }, 
                            
                            { varQuest=6456, escortType = 10,	varTalkNpcGUID = 139069,	varName = "马全",
                            	targetGuid = 139406,	targetname = "努尔博达",	varQuestName = "马匹",
                            	finish = "\t马全送来的骏马？很好。",
                            	getmiss = "\t见到你太好了，#Y@myname#W，我帮赵王@npc_139406大人物色了一匹骏马，但是最近生意繁忙，一时脱不开身，你能帮我将这骏马送给他吗？",
                            	intro = "\t大都最有名的骑乘技能大师@npc_139069需要人帮忙，你不妨去他那里看看。"
                            }, 
                            { varQuest=6457, escortType = 11, varTalkNpcGUID = 140900, varName = "米粒", 
                            	targetGuid = 139807, targetname = "范遥", varQuestName = "粮车",
                            	finish = "\t这粮食来的很是时候，非常感谢你！", 
                            	getmiss = "\t刚才明教又派人来催促这批粮食了，我这里的实在是脱不开身，你能帮我把这车粮食送到@npcsp_明教总坛_139807吗？", 
                            	intro = "\t大都@npcsp_米记粮店_140900最近似乎接了一大笔订单，你不妨去他那里看看。" 
                            }, 
                            { varQuest=6458, escortType = 41, varTalkNpcGUID = 140902, varName = "虚无道长",
                            	targetGuid = 140400, targetname = "巫山真人",   varQuestName = "女香客",
                            	finish = "\t竟有如此命数之人？待贫道仔细算上一番。", 
                            	getmiss = "\t你来的正好，#y@myname#w，方才一位女香客前来问卦，可是我无法看透她的命数，你能把她带到我的师傅巫山真人那里去么？", 
                            	intro = "\t听说@npc_140902颇有神通，如今他正在天桥附近，你不妨去他那里看看。" 
                            }, 
                            { varQuest=6459, escortType = 13, varTalkNpcGUID = 140550, varName = "切尔不花", 
                            	targetGuid = 140200, targetname = "范文虎",   varQuestName = "矿车",
                            	finish = "\t感谢你能及时把这个送过来，我们正等着用呢。", 
                            	getmiss = "\t#Y@myname#W，你来的正好，这批精铜矿是给@npcsp_汉军营_140200打造神臂弩中机括所用，可是我公务缠身，只好麻烦你劳累一番了。", 
                            	intro = "\t最近@npc_140550将军征集了一批精铜，准备给汉军营送去，你去他那里看看有没有什么帮得上忙的。" 
                            }, 
                            { varQuest=6460, escortType = 14, varTalkNpcGUID = 140903, varName = "店小二",
                            	targetGuid = 140007, targetname = "张士诚", varQuestName = "海货",
                            	finish = "\t啊，谢谢你，帮主一定会对盐帮今晚的大宴很满意。", 
                            	getmiss = "\t我们这里的海产可是鼎鼎有名，慕名而来的人络绎不绝，盐帮江东舵主@npc_140007订购了一些，不过我们最近人手紧张，能麻烦你帮我送去么？", 
                            	intro = "\t大都最出名的@npcsp_海产店_140903最近运来了大批的海产，你去那边看看有什么可以帮得上的。" 
                            }, 
                            { varQuest=6461, escortType = 15, varTalkNpcGUID = 140554, varName = "李员外",
                            	targetGuid = 139300, targetname = "智障禅师",   varQuestName = "朝廷圣物", 
                            	finish = "\t送来了么？唔，辛苦你了。", 
                            	getmiss = "\t这车中装的是我敬献给高僧们的香油钱。还要有劳你送到大相国寺的@npc_139300那里，千万不要走漏了风声或者私自拆开查看，你知道，有些事情实在是不可明言。", 
                            	intro = "\t大都的富豪@npc_140554最近想请大相国寺的高僧们做一场法事。你去他那里看看吧。" 
                            }, 
}                                                                                                   


function x300519_ProcCanCompleteQuest( varMap, varPlayer, varTalknpc, varQuest)
    StartTalkTask( varMap)
        TalkAppendString( varMap, "#Y"..x300519_var_QuestName)
        
        TalkAppendString( varMap, "\t交给你的事都办完了？" )
    StopTalkTask()

	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300519_var_FileId, varQuest)
end


function x300519_ShowQuestContinueInfo( varMap, varPlayer, varTalknpc, varQuest)

    local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
    local varId = GetQuestParam( varMap, varPlayer, varQuestIdx, x300519_var_SubQuest)
    if (varId == nil or varId < 1 or varId > getn(x300519_var_EscortTable)) then
		return
    end
    
    local varTalkNpcGUID = x300519_var_EscortTable[varId].varTalkNpcGUID
    
    local destGuid = x300519_var_EscortTable[varId].targetGuid
    
    local targetGuid = GetMonsterGUID( varMap, varTalknpc)
    local phase = GetQuestParam( varMap, varPlayer, varQuestIdx, x300519_var_Phase)
	local submitguid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )

    if varTalkNpcGUID == targetGuid then
	
	
	if (phase ~= 0) then
		return
	end
	
	StartTalkTask( varMap)
		
		TalkAppendString( varMap, "#Y"..x300519_var_QuestName)
		
		TalkAppendString( varMap, "#Y任务描述：" )
		TalkAppendString( varMap, x300519_var_EscortTable[varId].getmiss)
		TalkAppendString( varMap, " " )
		
		TalkAppendString( varMap, "#Y任务目标：" )
		TalkAppendString( varMap, format( x300519_var_EscortTarget1, x300519_var_EscortTable[varId].varQuestName, x300519_var_EscortTable[varId].targetGuid) )

		local curlevel = GetLevel(varMap, varPlayer)
		local varExp = x300519_GetExpAward ( varMap, varPlayer, curlevel );
		local money,shengw = x300519_GetMoneyAward ( varMap, varPlayer, curlevel );

		if(varExp > 0) then
			AddQuestExpBonus(varMap, varExp)
		end
		if(money > 0) then
			AddQuestMoneyBonus2(varMap, money)
		end

		if(shengw > 0) then
			AddQuestMoneyBonus5(varMap, shengw)
		end

	StopTalkTask()
	DeliverTalkContinueNM( varMap, varPlayer, varTalknpc, x300519_var_FileId, varQuest )

    elseif targetGuid == destGuid then 
	
        
	if (phase ~= 1) then
		return
	end
	
	if GetBusId(varMap, varPlayer) <= 0 or IsValidMyselfBus(varMap, varPlayer, varQuest) == 0 then	
		QuestNotComplateInfoNM( varMap, varPlayer, varTalknpc, varQuest)
	else
	        StartTalkTask( varMap)
			TalkAppendString( varMap, "#Y"..x300519_var_QuestName)
			TalkAppendString( varMap, x300519_var_EscortTable[varId].finish)
		StopTalkTask()
		DeliverTalkContinueNM( varMap, varPlayer, varTalknpc, x300519_var_FileId, varQuest)
	end
    elseif targetGuid == submitguid then
        StartTalkTask( varMap)
            
            TalkAppendString( varMap, "#Y"..x300519_var_QuestName)

		if (phase == 1) then
			TalkAppendString(varMap, format(x300519_var_QuestContinue, x300519_var_EscortTable[varId].varQuestName, x300519_var_EscortTable[varId].targetGuid))
		elseif (phase == 0) then
	            TalkAppendString( varMap, "\t交给你的事办完了？" )		
		end
        StopTalkTask()
        DeliverTalkMenu( varMap, varPlayer, varTalknpc)
    end
end


function x300519_ProcIntoBusEvent( varMap, varPlayer, varTalknpc)
    
	local IsOwner = IsTheBusOwner( varMap, varPlayer, varTalknpc)
	if IsOwner == 1 then
		
		AddBusMember( varMap, varPlayer, varTalknpc)
	end
end

function x300519_ProcIntoBusAfter( varMap, varPlayer, varBusID)
    
end

function x300519_ProcLeaveBusEvent( varMap, varPlayer, BusId)
    
end

function x300519_ProcDie( varMap, BusId, idKiller)
	local varPlayer = GetBusMemberObjId(varMap,BusId,0)	
	if (varPlayer == -1) then
		return
	end
	local varQuest = x300519_GetRandQuestId(varMap, varPlayer);
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300519_var_IsComplete, 0)
	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300519_var_Phase, 0)
	
	x300519_ProcQuestLogRefresh( varMap, varPlayer, varQuest, varQuestIdx)
	Msg2Player(varMap, varPlayer, "护送目标已经死亡，请重新接取任务", 8, 3)
end


function x300519_ProcQuestSubmit( varMap, varPlayer, varTalknpc, varButtonClick, varQuest, farScriptId, constMD_Rand, retQuestId)
    return 1
end


function x300519_ShowQuestInfo( varMap, varPlayer, varTalknpc, varQuest)
    
	local varRand = 1
	
	for varI, oneitem in x300519_var_EscortTable do
		if oneitem.varQuest == varQuest then
			varRand = varI
			break;
		end
	end
	
	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300519_var_SubQuest, varRand)
    
    StartTalkTask( varMap)
        
        TalkAppendString( varMap, "#Y"..x300519_var_QuestName)
 
        
        TalkAppendString( varMap, "#Y任务描述：" )
        TalkAppendString( varMap, x300519_var_EscortTable[varRand].intro)
        TalkAppendString( varMap, " " )
        
        TalkAppendString( varMap, "#Y任务目标：" )
        TalkAppendString( varMap, format( x300519_var_EscortTarget0, x300519_var_EscortTable[varRand].varTalkNpcGUID) )

    StopTalkTask()
    DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x300519_var_FileId, varQuest, 1)
end

function x300519_CheckIfCanSubmit( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx)
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then
		return 0
	end

	local phase = GetQuestParam( varMap, varPlayer, varQuestIdx, x300519_var_Phase)
	if phase == 2 then
		return 1
	else
		return 0
	end
end


function x300519_ProcQuestSubmitOrContinue( varMap, varPlayer, varTalknpc, varQuest)

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
	local phase = GetQuestParam( varMap, varPlayer, varQuestIdx, x300519_var_Phase)

	if phase == 0 then
		if IsBusMember(varMap, varPlayer) == 1 then
			local varTip = "你已处于护送状态，无法领取新的护送任务！"
			Msg2Player(varMap, varPlayer, varTip, 8, 3)				
			Msg2Player(varMap, varPlayer, varTip, 8, 2)
			return 0
		end

		local PosX,PosZ = GetWorldPos( varMap, varPlayer)
		
		local varId = GetQuestParam( varMap, varPlayer, varQuestIdx, x300519_var_SubQuest)
		if (varId == nil or varId < 1 or varId > getn(x300519_var_EscortTable)) then
			return 0
		end
		local varObj = CreateBus( varMap, x300519_var_EscortTable[varId].escortType, PosX, PosZ, 3, 3, 300519, varPlayer, 1210,varQuest,varTalknpc)
		return 0

	elseif phase == 1 then
		
		
		local busGuid = GetBusId(varMap, varPlayer)
		if (busGuid < 0) or (IsObjValid (varMap,busGuid) ~= 1) then						
			return	0			
		end
		if (varQuest ~= GetBusQuestID(varMap, busGuid)) then	
			return	0			
		end
		DeleteBus( varMap, busGuid, 1)
		
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300519_var_Phase, 2)
		
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300519_var_IsComplete, 1)
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, 7, 1)
		Msg2Player(varMap, varPlayer, "任务已经完成，快点回去汇报吧！", 8, 3)
		QuestCom( varMap, varPlayer, varQuest)
		
		x300519_ProcQuestLogRefresh( varMap, varPlayer, varQuest, varQuestIdx)
		return 0
	elseif phase == 2 then
		return 1
	else
		return 0
	end
end

function x300519_ProcCreateBusOK(varMap,varPlayer,busId,varTalknpc,varQuest)	

		local camp = GetCurCamp(varMap, varPlayer)
		SetBusCurCamp(varMap, busId, camp)
		SetBusTimerTick(varMap , busId, 1000)
		SetBusWaitTime(varMap , busId, 300)
		SetBusQuestID(varMap, busId, varQuest)
		
		local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)
		
		SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300519_var_Phase, 1)		
		
		x300519_ProcQuestLogRefresh( varMap, varPlayer, varQuest, varQuestIdx)	
end


function x300519_AfterAccept( varMap, varPlayer, varTalknpc, varQuest, varQuestIdx)
	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300519_var_Phase, 0)
	
	x300519_ProcQuestLogRefresh( varMap, varPlayer, varQuest, varQuestIdx)
end

function x300519_ProcQuestAttach( varMap, varPlayer, varTalknpc, varTalkNpcGUID, varQuestIdx, varQuest)

	varQuest = x300519_GetRandQuestId(varMap, varPlayer)
	if IsHaveQuestNM( varMap, varPlayer, varQuest) == 0 then
		return 0
	end

	local varQuestIdx = GetQuestIndexByID(varMap, varPlayer, varQuest);

	local submitguid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx )
	
	if submitguid ~= -1 and submitguid == varTalkNpcGUID then	
		local varState = GetQuestStateNM(varMap, varPlayer, varTalkNpcGUID, varQuest);
		TalkAppendButtonNM(varMap, varPlayer, varTalkNpcGUID, varQuest, varState, -1);
		return 1
	end

	local varId = GetQuestParam( varMap, varPlayer, varQuestIdx, x300519_var_SubQuest)
	if (varId == nil or varId < 1 or varId > getn(x300519_var_EscortTable) ) then
		return 0
	end
	
	local srcNpc = x300519_var_EscortTable[varId].varTalkNpcGUID
	local dstNpc = x300519_var_EscortTable[varId].targetGuid
	if varTalkNpcGUID == srcNpc then 
		local phase = GetQuestParam( varMap, varPlayer, varQuestIdx, x300519_var_Phase)
		if phase == 0 then
			TalkAppendButton( varMap, varQuest, x300519_var_QuestName, 13)
		end
	elseif varTalkNpcGUID == dstNpc then 
		local phase = GetQuestParam( varMap, varPlayer, varQuestIdx, x300519_var_Phase)
		if phase == 1 then
			TalkAppendButton( varMap, varQuest, x300519_var_QuestName, 13)
		end
	end
    return 1
end

function x300519_ProcQuestLogRefresh( varMap, varPlayer, varQuest, varQuestIdx)

    
    
    if varQuest== nil or varQuest < 0 then
        return 0
    end
    
    if IsHaveQuestNM(varMap,varPlayer,varQuest) <= 0 then
        return 0
    end
        
    local varQuestIdx = GetQuestIndexByID(varMap,varPlayer,varQuest)
    local varId = GetQuestParam( varMap, varPlayer, varQuestIdx, x300519_var_SubQuest)
    if (varId == nil or varId < 1 or varId > getn(x300519_var_EscortTable)) then
		return 0
    end
    local phase = GetQuestParam( varMap, varPlayer, varQuestIdx, x300519_var_Phase)

	local strName;
	strName = x300519_var_QuestName;
	local varCircle = x300519_GetMD(varMap, varPlayer, MD_GUOJIARENWU_CIRCLE)
	if (varCircle >= x300519_ProceRoundCount) then
		varCircle = 1
	else
		varCircle = varCircle + 1
	end
	strName = strName.."("..varCircle;
	strName = strName.."/"..x300519_ProceRoundCount;
	strName = strName..")";

	local reply_npcid = GetQuestSubmitNPCGUIDNM( varMap, varPlayer, varQuestIdx );
	local strReplyNPC = "@npc_"..reply_npcid
	StartTalkTask(varMap)
	    if phase == 0 then 
		
		AddQuestLogCustomText( varMap,
					"",                             
					strName,          
					format( "  "..x300519_var_EscortTarget0, x300519_var_EscortTable[varId].varTalkNpcGUID),
					strReplyNPC,             
					format( x300519_var_EscortTarget0, x300519_var_EscortTable[varId].varTalkNpcGUID),
					x300519_var_EscortTable[varId].intro,
					"" )
	    elseif phase == 1 then
		AddQuestLogCustomText( varMap,
					"",                             
					strName,          
					format( "  "..x300519_var_EscortTarget1, x300519_var_EscortTable[varId].varQuestName, x300519_var_EscortTable[varId].targetGuid),
					strReplyNPC,             
					format( x300519_var_EscortTarget1, x300519_var_EscortTable[varId].varQuestName, x300519_var_EscortTable[varId].targetGuid),
					x300519_var_EscortTable[varId].getmiss,
					"注意途中不要离护送目标太远" )
	    elseif phase == 2 then
		AddQuestLogCustomText( varMap,
					"",                             
					strName,          
					"  任务完成，回复"..strReplyNPC,
					strReplyNPC,             
					"任务完成，回复"..strReplyNPC,
					x300519_var_EscortTable[varId].finish,
					"" )
	    end
		
		local phase = GetQuestParam( varMap, varPlayer, varQuestIdx, x300519_var_Phase)
		if (phase ~= 0) then
			
			local curlevel = GetLevel(varMap, varPlayer)
			local varExp = x300519_GetExpAward ( varMap, varPlayer, curlevel );
			local money,shengw = x300519_GetMoneyAward ( varMap, varPlayer, curlevel );
			if(varExp > 0) then
				AddQuestExpBonus(varMap, varExp)
			end
			if(money > 0) then
				AddQuestMoneyBonus2(varMap, money)
			end
			if(shengw > 0) then
				AddQuestMoneyBonus5(varMap, shengw)
			end
		end

	StopTalkTask()
	DeliverTalkRefreshQuest( varMap, varPlayer, varQuest);
end


function x300519_ProcQuestAbandon(varMap, varPlayer, varQuest)
	varQuest = x300519_GetRandQuestId(varMap, varPlayer)

	local busGuid = GetBusId(varMap, varPlayer)
	if (busGuid > 0) and (IsObjValid (varMap,busGuid) == 1)then
		if (varQuest == GetBusQuestID(varMap, busGuid)) then	
			DeleteBus( varMap, busGuid, 1)
		end
	end

	LuaCallNoclosure( 300501, "ProcQuestAbandon", varMap, varPlayer, varQuest)
end

function x300519_GetRandQuestId(varMap, varPlayer)
	return x300519_GetMD(varMap, varPlayer, MD_GUOJIARENWU_RANDMISSIONID)
end

function x300519_ProcBusStopWhenOwnerFarAway(varMap, varPlayer)

	local varText = "你离护送目标太远，护送目标停止"

	StartTalkTask(varMap)
		TalkAppendString(varMap, varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)

	Msg2Player(varMap,varPlayer,varText,8,2)
end

function x300519_SetMD(varMap, varPlayer, MDNAME, value)
	SetPlayerGameData(varMap, varPlayer, MDNAME[1], MDNAME[2], MDNAME[3], value);
end

function x300519_GetMD(varMap, varPlayer, MDNAME)

	return GetPlayerGameData(varMap, varPlayer, MDNAME[1], MDNAME[2], MDNAME[3])
end

function x300519_ProcWaitTimeOut(varMap,BusId)
	local varPlayer = GetBusMemberObjId(varMap,BusId,0)	
	if (varPlayer == -1) then
		
		if (IsObjValid (varMap,BusId) == 1) then
		    DeleteBus(varMap, BusId,1)
		end
		return
	end

	local varQuest = x300519_GetRandQuestId(varMap, varPlayer)
	if (varQuest ~= GetBusQuestID(varMap, BusId)) then	
		return
	end

	DeleteBus(varMap, BusId,1)
	x300519_RollbackBusQuest (varMap, varPlayer, varQuest)

end

function x300519_RollbackBusQuest(varMap, varPlayer, varQuest)

	local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, varQuest)

	
	if (1 ~= GetQuestParam( varMap, varPlayer, varQuestIdx, x300519_var_Phase)) then
		return
	end

	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300519_var_IsComplete, 0)
	
	SetQuestByIndex( varMap, varPlayer, varQuestIdx, x300519_var_Phase, 0)
	
	x300519_ProcQuestLogRefresh( varMap, varPlayer, varQuest)

	local varText = "由于你离开护送目标时间过久，你的护送目标消失了，请重新接取任务"
	StartTalkTask(varMap)
		TalkAppendString(varMap, varText);
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)

	Msg2Player(varMap,varPlayer,varText,8,2)

end
function x300519_ClearBusQuest(varMap, varPlayer)
	local varQuest = x300519_GetRandQuestId(varMap, varPlayer)
	if varQuest >= x300519_var_EscortQuestID and varQuest <= x300519_var_EscortQuestID_End then	
		x300519_RollbackBusQuest (varMap, varPlayer, varQuest)
	end
end

function x300519_ProcEventEntry( varMap, varPlayer, varTalknpc, varQuest)
	return 1
end


function x300519_CheckDayChanged(varMap, varPlayer)

	local varLastday = x300519_GetMD(varMap, varPlayer, MD_GUOJIARENWU_LASTDAY)
	local varToday = GetDayOfYear()
	if varLastday ~= varToday then	
		x300519_SetMD(varMap, varPlayer, MD_GUOJIARENWU_LASTDAY, varToday)	
		x300519_SetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH, 0)
	end
end


function x300519_GetExpAward(varMap, varPlayer, startlevel)

	x300519_CheckDayChanged(varMap, varPlayer)
	local varCircle = x300519_GetMD(varMap, varPlayer, MD_GUOJIARENWU_CIRCLE)
	local highcircle = x300519_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)
	
	varCircle = varCircle + 1
	if (varCircle > x300519_ProceRoundCount) then
		varCircle = 1
	end

	highcircle = highcircle + 1

	local exp_rate
	if GetLevel(varMap, varPlayer) >= 60 then
		exp_rate = 3650
	else
		exp_rate = 2800
	end

	local BonusExp = startlevel * exp_rate * (varCircle * 2 - 1) / 200
	if (highcircle <= x300519_HighBonusCircleCount) then
		BonusExp = BonusExp * 5
	end
    
    BonusExp = BonusExp * 2
	return BonusExp;

end


function x300519_GetMoneyAward(varMap, varPlayer, startlevel)

	x300519_CheckDayChanged(varMap, varPlayer)
	local varCircle = x300519_GetMD(varMap, varPlayer, MD_GUOJIARENWU_CIRCLE)
	local highcircle = x300519_GetMD(varMap, varPlayer, MD_GUOJIARENWU_HIGH)

	varCircle = varCircle + 1
	if (varCircle > x300519_ProceRoundCount) then
		varCircle = 1
	end

	highcircle = highcircle + 1

	local BonusMoney = startlevel
	local shengw = 5
	if (highcircle <= x300519_HighBonusCircleCount) then
		BonusMoney = BonusMoney * 5
		shengw = 25
	end
	return BonusMoney, shengw;
end


function x300519_CheckSubmitNPC( varMap,idQuest,varTalkNpcGUID )

	for varI,item in x300519_var_EscortTable do
		if item.varQuest == idQuest then
			if item.varTalkNpcGUID == varTalkNpcGUID or item.targetGuid == varTalkNpcGUID then
				return 1
			else
				return 0
			end
		end
	end
	
	return 0
end
