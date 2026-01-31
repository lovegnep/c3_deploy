--探索任务，召唤白熊

--MisDescBegin
x260020_var_ScriptId = 260020
x260020_var_MissionIdPre = {1844,1944,2044,2144}
x260020_var_MissionId = {1845,1945,2045,2145}
x260020_var_LevelLess	= 25
x260020_var_MissionIdNext = {1846,1946,2046,2146}
x260020_var_QuestKillEventInfo = {NeedItemId =13050003, NeedCount =5, ItemRand=75, DropNum=1, MonId=2414}--需求道具ID，需求数量，掉落物品几率，每次掉落数量
x260020_var_QuestAreaEnteredInfo ={AreId=38, varMap={51,151,251,351}}
x260020_var_Name	={}
x260020_var_ExtTarget={
												{type=20,n=1,target="生擒@npc_88004找到背后玄机"},
												{type=20,n=1,target="到@npc_88020一探究竟"}
											}
x260020_var_MissionName="【主线】完颜族徽"
x260020_var_NPCName={"@npc_500050","@npc_510050","@npc_520050","@npc_530050",}				--任务NPC
x260020_var_MissionRuse=""
x260020_var_MissionInfo="\t这可是蹊跷的很，萨满卦象的指示只有我们女真部少数人知晓，盗宝贼又是如何以这么快的速度占领黑石寨？难道我们女真内部有奸细！\n\t@myname，此事非同小可，一定要调查清楚。仔细盘查那些伪装的守墓人，他们是关键！"  --任务描述
x260020_var_MissionTarget=""		
x260020_var_MissionCompleted="\t这！这不是完颜家族的族徽么！你从哪里得来的？"					--完成任务npc说话的话
x260020_var_ContinueInfo="\t事情办妥了么？"
x260020_var_MissionHelp =	""
x260020_var_DemandItem ={}
x260020_var_ExpBonus = 576000	--经验
x260020_var_BonusMoney1 =0 	--银卡
x260020_var_BonusMoney2 =0   	--现银 
x260020_var_BonusMoney3 =0   	--金卡
x260020_var_BonusMoney4 =0   	--朝廷声望
x260020_var_BonusMoney5 =84  	--声望
x260020_var_BonusMoney6 =0	 	--荣誉
x260020_var_BonusItem	=	{}
x260020_var_BonusChoiceItem ={}
x260020_var_mengguwushi1 = -1
x260020_var_mengguwushi2 = -1
x260020_var_mengguwushi3 = -1
x260020_var_mengguwushi4 = -1
x260020_var_mengguwushi5 = -1
x260020_var_mengguwushi6 = -1
x260020_var_mengguwushi7 = -1
x260020_var_mengguwushi8 = -1
x260020_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x260020_var_SubmitGUID ={500050,510050,520050,530050}	--交任务NPC
--MisDescBegin

--电影拍摄进度
x260020_var_doing = 0
--本人演员登场
x260020_var_accid = -1
--隐身BUFF
x260020_var_Buff = 8711 --无限隐身
--未上场演员登场
x260020_var_outscence = {
	{seeflag=0,montype=2419,x=393.869446,y=41.653927,ai=5,templeai=1010,guid=-1,script=-1,camp=20,time=44000,face=60,name="玄冰恶熊",title="完颜洪烈的宠物"},
	{seeflag=1,montype=2420,x=403.596802,y=49.323555,ai=5,templeai=1,guid=-1,script=-1,camp=20,time=44000,face=230,name="女真勇士",title=""},
	{seeflag=1,montype=2420,x=400.503845,y=50.796600,ai=5,templeai=1,guid=-1,script=-1,camp=20,time=44000,face=190,name="女真勇士",title=""},
	{seeflag=1,montype=2420,x=402.082550,y=50.344414,ai=5,templeai=1,guid=-1,script=-1,camp=20,time=44000,face=210,name="女真勇士",title=""},
  {seeflag=1,montype=2420,x=404.052643,y=47.641132,ai=5,templeai=1,guid=-1,script=-1,camp=20,time=44000,face=250,name="女真勇士",title=""},
  {seeflag=1,montype=2420,x=404.404938,y=46.076717,ai=5,templeai=1,guid=-1,script=-1,camp=20,time=44000,face=270,name="女真勇士",title=""},
}
--在场演员名单 已经在场的NPC的GUID
x260020_var_inscence = {
}

--剧本
x260020_var_juben = {
	{outkey=1,juben = {[20]={},[21]={str="嗷~~~嗷~~~",},[32]={str="嗷~~~嗷~~~嗷~~~",patrolId=3,camp=22},}},
	{outkey=2,juben = {[2]={str="前面就是古墓口了"},[22]={str="啊！！！出现了"},[34]={str="杀！！",patrolId=4,camp=23},}},
	{outkey=3,juben = {[14]={str="咱哥几个好不容易到了这里，龙穴也要进去闯上一闯"},[30]={str="咱几个到这也算是撞上了，哥几个咱今天一起剥了这货的熊皮，也扬扬咱的威风"},[34]={str="杀！！",patrolId=4,camp=23}}},
	{outkey=4,juben = {[6]={str="被诅咒的洞穴就是这里么？"},[26]={str="传闻果然是真的，看这畜生面露凶光，必然不是善物啊。"},[34]={str="杀！！",patrolId=4,patrolId=4,camp=23},}},
	{outkey=5,juben = {[18]={str="等咱拿到了传说中的神兵利器，咱也再不用当这兵卒子了"},[34]={str="杀！",patrolId=4,camp=23},}},
	{outkey=6,juben = {[10]={str="传闻说洞穴之中有巨兽看护，不知道是真是假啊？"},[22]={str="啊！！！出现了"},[34]={str="杀！！",patrolId=4,camp=23},}},
}

--演员信息储存
actorname = {}
--演员对白储存
actortalk = {}
--**********************************
function x260020_actionready(varMap, varPlayer)
	for i=1,getn(x260020_var_juben) do
		if x260020_var_juben[i].outkey ~= nil then
			local montype = x260020_var_outscence[x260020_var_juben[i].outkey].montype
			local x = x260020_var_outscence[x260020_var_juben[i].outkey].x
			local y = x260020_var_outscence[x260020_var_juben[i].outkey].y
			local ai = x260020_var_outscence[x260020_var_juben[i].outkey].ai
			local templeai = x260020_var_outscence[x260020_var_juben[i].outkey].templeai
			local guid = x260020_var_outscence[x260020_var_juben[i].outkey].guid
			local script = x260020_var_outscence[x260020_var_juben[i].outkey].script
			local camp = x260020_var_outscence[x260020_var_juben[i].outkey].camp
			local time = x260020_var_outscence[x260020_var_juben[i].outkey].time
			local face = x260020_var_outscence[x260020_var_juben[i].outkey].face
			local name = x260020_var_outscence[x260020_var_juben[i].outkey].name
			local title = x260020_var_outscence[x260020_var_juben[i].outkey].title
			actorname[i] = CreateMonster(varMap, montype,x,y,ai,templeai,guid,script,camp,time,face,name,title)
			if x260020_var_outscence[x260020_var_juben[i].outkey].seeflag == 0 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, actorname[i], x260020_var_Buff, 0)
			end
		elseif x260020_var_juben[i].inkey ~= nil then
			actorname[i] = FindMonsterByGUID( varMap,x260020_var_inscence[x260020_var_juben[i].inkey])
		end
		for k,v in x260020_var_juben[i].juben do
			local temp = getn(actortalk)
			actortalk[temp+1] = {}
			actortalk[temp+1].time = k
			actortalk[temp+1].talk = v.str
			actortalk[temp+1].face = v.face
			actortalk[temp+1].id = actorname[i]
			actortalk[temp+1].patrolId = v.patrolId
			actortalk[temp+1].camp = v.camp
		end	
	end
end
 
function x260020_ProcEnumEvent(varMap, varPlayer, NPCId, MissionId)
	

	if IsQuestHaveDone(varMap, varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
		return 
	end
	if IsQuestHaveDone(varMap, varPlayer, x260020_var_MissionIdPre[ GetCurCountry( varMap, varPlayer) + 1])> 0 then
		if IsHaveQuest(varMap,varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) <= 0 then
			local state = GetQuestStateNM(varMap,varPlayer,NPCId,x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])
			TalkAppendButtonNM( varMap, varPlayer, NPCId, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1], state, -1 )
			
		end
	end
	
	
end

function x260020_DispatchMissionInfo( varMap, varPlayer, NPCId )

		if x260020_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x260020_var_ExpBonus )
		end
		if x260020_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x260020_var_BonusMoney1 )
		end
		if x260020_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x260020_var_BonusMoney2 )
		end
		if x260020_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x260020_var_BonusMoney3 )
		end
		if x260020_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x260020_var_BonusMoney4 )
		end
		if x260020_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x260020_var_BonusMoney5 )
		end
		if x260020_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x260020_var_BonusMoney6 )
		end
		for i, item in x260020_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for i, item in x260020_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end
--**********************************

function x260020_ProcEventEntry(varMap, varPlayer, NPCId, MissionId,which)	--点击该任务后执行此脚本

	if IsQuestHaveDone(varMap, varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
		--return   --test
	end

	if IsHaveQuest(varMap,varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
			if x260020_CheckSubmit(varMap, varPlayer, NPCId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x260020_var_MissionName)
				TalkAppendString(varMap,x260020_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, NPCId, x260020_var_ScriptId, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x260020_var_MissionName)
				TalkAppendString(varMap,x260020_var_MissionCompleted)
				TalkAppendString(varMap," ")
				x260020_DispatchMissionInfo( varMap, varPlayer, NPCId )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, NPCId, x260020_var_ScriptId, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]);
			end
  elseif x260020_ProcAcceptCheck(varMap, varPlayer, NPCId) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x260020_var_MissionName)
			TalkAppendString(varMap,x260020_var_MissionInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for i, item in x260020_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x260020_var_MissionHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x260020_var_MissionHelp )
			end
			x260020_DispatchMissionInfo( varMap, varPlayer, NPCId )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, NPCId, x260020_var_ScriptId, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]);
  end
	
end
--**********************************

function x260020_ProcAcceptCheck(varMap, varPlayer, NPCId)
		if IsQuestHaveDone(varMap, varPlayer, x260020_var_MissionIdPre[ GetCurCountry( varMap, varPlayer) + 1])> 0 then
					return 1	--test
		end
		return 1

end
--**********************************
function x260020_IsCompleteMission( varMap, varPlayer)
	local misIndex = GetQuestIndexByID(varMap,varPlayer,x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])
		if GetQuestParam(varMap,varPlayer,misIndex,1) >= x260020_var_QuestKillEventInfo.NeedCount then 
			if GetQuestParam(varMap,varPlayer,misIndex,2) == 1 then 
					SetQuestByIndex(varMap,varPlayer,misIndex,0,1)
	    		SetQuestByIndex(varMap,varPlayer,misIndex,7,1)
					StartTalkTask(varMap)
					TalkAppendString(varMap,"任务已完成！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	    		
	    end
	  end
	  x260020_ProcQuestLogRefresh( varMap, varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) 
end
--**********************************
function x260020_CheckSubmit( varMap, varPlayer, NPCId)
	
		local misIndex = GetQuestIndexByID(varMap,varPlayer,x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])
		if GetQuestParam(varMap,varPlayer,misIndex,1) >= x260020_var_QuestKillEventInfo.NeedCount then 
			if GetQuestParam(varMap,varPlayer,misIndex,2) == 1 then 
					SetQuestByIndex(varMap,varPlayer,misIndex,0,1)
	    		SetQuestByIndex(varMap,varPlayer,misIndex,7,1)
			    return 1
	    end
	  end
	  return 0
end
--**********************************
function x260020_ProcQuestAccept( varMap, varPlayer, NPCId, MissionId )
		if IsQuestHaveDone(varMap, varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
				--return --test
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		--检查前置任务
		local FrontMissiontId1, FrontMissiontId2, FrontMissiontId3 = GetFrontQuestIdNM( varMap, varPlayer,x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]  )
		if FrontMissiontId1 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId1 ) == 0 then
				return 0
			end
		end
		if FrontMissiontId2 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId2 ) == 0 then
				return 0
			end
		end
		if FrontMissiontId3 ~= -1 then
			if IsQuestHaveDoneNM( varMap, varPlayer, FrontMissiontId3 ) == 0 then
				return 0
			end
		end
		if x260020_ProcAcceptCheck(varMap, varPlayer, NPCId) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1], x260020_var_ScriptId, 1, 1, 1, 1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x260020_Msg2toplayer( varMap, varPlayer,0)
						local misIndex = GetQuestIndexByID(varMap,varPlayer,x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])                                                  
    				local ItemCnt = GetItemCountInBag( varMap, varPlayer, x260020_var_QuestKillEventInfo.NeedItemId)
    				SetQuestByIndex(varMap,varPlayer,misIndex,0,0)
    				SetQuestByIndex(varMap,varPlayer,misIndex,1,ItemCnt)	--记录收集物品个数
    				SetQuestByIndex(varMap,varPlayer,misIndex,2,0)	--记录进入区域子任务完成情况
    				SetQuestByIndex(varMap,varPlayer,misIndex,7,0)	--任务位初始化
    					  			
						if x260020_CheckSubmit(varMap, varPlayer, NPCId) > 0 then
							local misIndex = GetQuestIndexByID(varMap,varPlayer,x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])                                                  
	    				SetQuestByIndex(varMap,varPlayer,misIndex,0,1)
	    				SetQuestByIndex(varMap,varPlayer,misIndex,7,1)
	    			end
	    			
		  		end
	 	end                                                                    
	     
end
--**********************************

function x260020_ProcQuestAbandon(varMap, varPlayer, MissionId)
		if IsHaveQuest(varMap,varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) <= 0 then
				return 
		end
		
		DelQuest(varMap, varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])
		local ItemCnt = GetItemCountInBag( varMap, varPlayer, x260020_var_QuestKillEventInfo.NeedItemId)
		if ( ItemCnt > 0 ) then
			DelItem( varMap, varPlayer, x260020_var_QuestKillEventInfo.NeedItemId, ItemCnt )
		end
	 
			
end
--**********************************
function x260020_CheckPlayerBagFull( varMap ,varPlayer,selectRadioId )
	local result = 1
	local j = 0
	local bAdd = 0 --是否已经在固定物品奖励添加检测中已经检查出包裹已满
	StartItemTask(varMap)
	for j, item in x260020_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x260020_var_BonusChoiceItem do
        if item.item == selectRadioId then
            ItemAppend( varMap, item.item, item.n )
            break
        end
  end
  local ret = StopItemTask(varMap,varPlayer)
    if ret <= 0 then
        if result == 1 then
            result = 0
        end
    end
	return result
end
--**********************************
function x260020_ProcQuestSubmit(varMap, varPlayer, NPCId, selectRadioId, MissionId)

	if IsHaveQuest(varMap,varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x260020_CheckSubmit( varMap, varPlayer, NPCId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x260020_CheckPlayerBagFull( varMap ,varPlayer,selectRadioId ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
				
			local ItemCnt = GetItemCountInBag( varMap, varPlayer, x260020_var_QuestKillEventInfo.NeedItemId)
		  if ( ItemCnt > 0 ) then
			  DelItem( varMap, varPlayer, x260020_var_QuestKillEventInfo.NeedItemId, ItemCnt )
		  end
				x260020_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])
				x260020_GetBonus( varMap, varPlayer,NPCId)
				StartItemTask(varMap)
				for i, item in x260020_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for i, item in x260020_var_BonusChoiceItem do
						if item.item == selectRadioId then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)

    		--ItemAppendListToPlayer(varMap,varPlayer)
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, NPCId, x260020_var_MissionIdNext[ GetCurCountry( varMap, varPlayer) + 1] )	
end

function x260020_GetBonus( varMap, varPlayer,NpcID)
	  if x260020_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x260020_var_ExpBonus);
  	end
		if x260020_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x260020_var_BonusMoney1 )
	  end
		if x260020_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x260020_var_BonusMoney2 )
	  end
		if x260020_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x260020_var_BonusMoney3 )
		end
		if x260020_var_BonusMoney4 > 0 then
		local nRongYu = GetRongYu( varMap, varPlayer )
			nRongYu = nRongYu + x260020_var_BonusMoney4
			SetRongYu( varMap, varPlayer, nRongYu )
		end
		if x260020_var_BonusMoney5 > 0 then
			local nShengWang = GetShengWang( varMap, varPlayer )
			nShengWang = nShengWang + x260020_var_BonusMoney5
			SetShengWang( varMap, varPlayer, nShengWang )
		end
		if x260020_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x260020_var_BonusMoney6)
		end
end

function x260020_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x260020_var_MissionName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x260020_var_MissionName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x260020_var_MissionName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x260020_var_MissionName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x260020_var_MissionName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x260020_var_MissionName.."！", 0, 3)
				if x260020_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x260020_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x260020_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x260020_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x260020_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x260020_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x260020_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x260020_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x260020_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x260020_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x260020_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x260020_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x260020_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x260020_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x260020_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
	if varObjData ~= x260020_var_QuestKillEventInfo.MonId then 
		return 
	end
	local KilledNum = GetMonsterOwnerCount( varMap, varObj ) 
	for varI = 0, KilledNum-1 do
		local humanObjId = GetMonsterOwnerID( varMap, varObj, varI ) 
          if humanObjId ~= -1 then
              if IsHaveQuestNM( varMap, humanObjId, varQuest ) > 0 then	
                  local varItemCount = x260020_var_QuestKillEventInfo.NeedCount 
                  local varItem      = x260020_var_QuestKillEventInfo.NeedItemId 
                  local ItemRand     = x260020_var_QuestKillEventInfo.ItemRand 
                  local ItemDropNum  = x260020_var_QuestKillEventInfo.DropNum 
                  if varItemCount > 0 then
                      local ItemNumOnPlayer = GetItemCount( varMap, humanObjId, varItem )
                      if ItemNumOnPlayer < varItemCount then
                          local droprand = random(100)
                          if droprand <= ItemRand then
                              local dropnum = random(ItemDropNum)
                              if dropnum == 0 then
                                  dropnum = 1
                              end
                              if dropnum > varItem - ItemNumOnPlayer then
                                  dropnum = varItem - ItemNumOnPlayer
                              end
                              StartItemTask(varMap)
                              ItemAppend( varMap, varItem, dropnum )
                              local varRet = StopItemTask(varMap,humanObjId)
                              if varRet > 0 then
                                  DeliverItemListSendToPlayer(varMap,humanObjId)
                              else
                                  StartTalkTask(varMap)
                                  TalkAppendString(varMap,"#cffcf00物品栏已满，无法得到任务物品！")
                                  StopTalkTask(varMap)
                                  DeliverTalkTips(varMap,humanObjId)
                              end
                          end
                      end
                  end
              end
          end
	end
	
end


function x260020_ProcAreaEntered(varMap, varPlayer, zoneId, MissionId )

  if IsHaveQuestNM(varMap,varPlayer,x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) <= 0 then
      return	--没有任务
  end   
  local misIndex = GetQuestIndexByID(varMap,varPlayer,x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])  
  if GetQuestParam(varMap,varPlayer,misIndex,2) == 1 then 
  		return	--区域子任务已经完成
  end
  
	if varMap == x260020_var_QuestAreaEnteredInfo.varMap[GetCurCountry( varMap, varPlayer) + 1] then
		if zoneId == x260020_var_QuestAreaEnteredInfo.AreId then
	    	SetQuestByIndex(varMap,varPlayer,misIndex,2,1)
	    	x260020_IsCompleteMission( varMap, varPlayer)
				local str ="到@npc_88020一探究竟(1/1)"
				Msg2Player(varMap, varPlayer, str, 8, 3)
				Msg2Player(varMap, varPlayer,"你来到了传说中的古墓门口！", 8, 3)
	    	Msg2Player(varMap, varPlayer, "你似乎听到了野兽的嘶吼声从墓口传出来，几个女真勇士向墓口探去……", 8, 3)
	    	--演出开始
			 	if x260020_var_doing == 0 then
	    		x260020_var_PROTECTINFO.StartTime = GetCurrentTime()
					x260020_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 260020, "OnScneneTimer", 1)
					if x260020_var_PROTECTINFO.ScneneTimerIndex >=0 then
							x260020_var_doing = 1
							x260020_g_accid = selfId
							x260020_actionready(varMap, varPlayer)          		
	        end
			 	end	    	
		end
	end
end

function x260020_ProcTiming(varMap, varPlayer, ScriptId, MissionId)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcTiming",varMap, varPlayer, ScriptId, MissionId )
		
end

function x260020_ProcAreaLeaved(varMap, varPlayer, ScriptId, MissionId)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, ScriptId, MissionId)
end

function x260020_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
end

function x260020_ProcQuestItemChanged(varMap, varPlayer, varItemData, MissionId)
  if IsHaveQuestNM(varMap,varPlayer,x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) <= 0 then
      return	--没有任务
  end   
  local NeedNum = x260020_var_QuestKillEventInfo.NeedCount 
  local varItem      = x260020_var_QuestKillEventInfo.NeedItemId   
  local varQuestIdx = GetQuestIndexByID( varMap, varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1] ) 
  if varItemData ~= varItem then
  		return	--不是任务道具
  end
  if NeedNum > 0 then
		local Num = GetItemCount( varMap, varPlayer, varItemData )
		if Num <= NeedNum then 
        if GetQuestParam(varMap,varPlayer,varQuestIdx,0) == 0 then 
            StartTalkTask(varMap)
            local varText = format("#cffcf00您获得了物品#G#{_ITEM%d}#cffcf00(%d/%d)", varItemData, Num, NeedNum )
            if varText == nil then
                varText = "";
            end
            TalkAppendString( varMap, varText )
            StopTalkTask( varMap )
            DeliverTalkTips( varMap, varPlayer )
        end
				SetQuestByIndex( varMap, varPlayer, varQuestIdx, 1, Num ) 
				x260020_IsCompleteMission( varMap, varPlayer)
		end      
	end
end


function x260020_ProcQuestAttach( varMap, varPlayer, npcId, npcGuid, misIndex, MissionId )
	if IsHaveQuest(varMap,varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
		if npcGuid == x260020_var_SubmitGUID[GetCurCountry( varMap, varPlayer) + 1] then	
			if x260020_CheckSubmit( varMap, varPlayer, npcId) == 1 then
				local state = GetQuestStateNM(varMap,varPlayer,npcId,x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])
				TalkAppendButtonNM( varMap, varPlayer, npcId, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1], state, -1 )
			end
		end
	end
end

function x260020_MissionComplate( varMap, varPlayer, targetId, selectId, MissionId )
	return LuaCallNoclosure( QUEST_SCRIPT, "MissionComplate", varMap, varPlayer, targetId, selectId, MissionId  )
end

function x260020_PositionUseItem( varMap, varPlayer, BagIndex, impactId )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, BagIndex, impactId)
end

function x260020_OnOpenItemBox( varMap, varPlayer, targetId, gpType, needItemID )
	return LuaCallNoclosure( QUEST_SCRIPT, "OnOpenItemBox",varMap, varPlayer, targetId, gpType, needItemID)
end

function x260020_OnRecycle( varMap, varPlayer, targetId, gpType, needItemID )
	return LuaCallNoclosure( QUEST_SCRIPT, "OnRecycle",varMap, varPlayer, targetId, gpType, needItemID)
end

function x260020_OnProcOver( varMap, varPlayer, targetId )
	LuaCallNoclosure( QUEST_SCRIPT, "OnProcOver",varMap, varPlayer, targetId)
end

function x260020_OpenCheck( varMap, varPlayer, targetId )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, targetId )
end

function x260020_OnScneneTimer(varMap)
	if x260020_var_doing== 0 then 
		return 
	end
	--WriteLog(1,"---------x260020_OnScneneTimer TickTime--->"..GetCurrentTime() - x260020_var_PROTECTINFO.StartTime)
	for i = 1,getn(actortalk) do
		if GetCurrentTime() - x260020_var_PROTECTINFO.StartTime == actortalk[i].time then
			--WriteLog(1,"i=="..i)
			if IsObjValid (varMap,actortalk[i].id)==1 then
				if IsHaveSpecificImpact(varMap, actortalk[i].id, x260020_var_Buff) == 1 then
					--DispelSpecificImpact(varMap, actortalk[i].id, x260020_var_Buff, 1)
					CancelSpecificImpact(varMap, actortalk[i].id, x260020_var_Buff)
				end
				x260020_var_doing = x260020_var_doing +1
				if actortalk[i].talk ~= nil then
					NpcTalk( varMap,actortalk[i].id, actortalk[i].talk, -1)
				end
				if 	actortalk[i].face ~= nil then
					SetMonsterDir(varMap,actortalk[i].id,actortalk[i].face)
				end	
				if 	actortalk[i].patrolId ~= nil then
					SetPatrolId(varMap,actortalk[i].id,actortalk[i].patrolId )
				end	
				if 	actortalk[i].camp ~= nil then
					--WriteLog(1,"--change camp----")
					SetMonsterCamp(varMap,actortalk[i].id,actortalk[i].camp )
				end									
			end
		end
	end
	--WriteLog(1,"x260020_var_doing=="..x260020_var_doing)
	if x260020_var_doing >= getn(actortalk) or ((GetCurrentTime() - x260020_var_PROTECTINFO.StartTime)> 50)then
		x260020_CloseTimer(varMap, x260020_var_PROTECTINFO.ScneneTimerIndex)
	end 
	  
 end



--x260020_CloseTimer( 51, 0 )
--**********************************
--关闭计时器
--**********************************
function x260020_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x260020_var_doing =0
	x260020_var_accid = -1
	x260020_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}   --初试时间置为零
	--演员信息清空
	actorname = {}
	actortalk = {}
end


function x260020_ProcQuestLogRefresh( varMap, varPlayer, MissionId)
	local misIndex = GetQuestIndexByID(varMap, varPlayer, x260020_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]);
	local ItemCnt = GetItemCountInBag( varMap, varPlayer, x260020_var_QuestKillEventInfo.NeedItemId)	--收集物品数量
	local AreaDone = GetQuestParam( varMap, varPlayer, misIndex, 2)		--是否进入过区域
	local Target1 =format("生擒@npc_88004找到背后玄机(%d/%d)",ItemCnt,x260020_var_QuestKillEventInfo.NeedCount)
	local Target2 =format("到@npc_88020一探究竟(%d/1)",AreaDone)
	if ItemCnt >=	x260020_var_QuestKillEventInfo.NeedCount then
		Target1 = "#G"..Target1.."#W"
	end
	if AreaDone >=	1 then
		Target2 = "#G"..Target2.."#W"
	end
	local QuestTarget = Target1.."\n"..Target2
	StartTalkTask(varMap)
	AddQuestLogCustomText( varMap,
								"",								-- 标题
								x260020_var_MissionName,			-- 任务名字
							  QuestTarget,      -- 任务目标
								x260020_var_NPCName[ GetCurCountry( varMap, varPlayer) + 1],				--任务NPC
								x260020_var_MissionRuse,			--任务攻略
								x260020_var_MissionInfo,			--任务描述
								x260020_var_MissionHelp				--任务小提示
								)
	 StopTalkTask(varMap)
	 DeliverTalkRefreshQuest(varMap, varPlayer, MissionId);
end
