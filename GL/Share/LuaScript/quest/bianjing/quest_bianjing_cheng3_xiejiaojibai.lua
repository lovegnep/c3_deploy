--【主线】刺探赤火教

--MisDescBegin
x260019_var_ScriptId = 260019
x260019_var_MissionIdPre = {1823,1923,2023,2123}
x260019_var_MissionId = {1824,1924,2024,2124}
x260019_var_LevelLess	= 20
x260019_var_MissionIdNext = {1825,1925,2025,2125}
x260019_var_QuestAreaEnteredInfo ={AreId=35, varMap={51,151,251,351}}
x260019_var_Name	={}
x260019_var_ExtTarget={
												{type=20,n=1,target="到@npc_88017查看赤火教的底细"},
											}
x260019_var_MissionName="【主线】刺探赤火教"
x260019_var_NPCName={"@npc_500036","@npc_510036","@npc_520036","@npc_530036",}				--任务NPC
x260019_var_MissionRuse=""
x260019_var_MissionInfo="\t我已派人调查过，突来此地的赤火教犹为可疑。\n\t@myname，这件事还是交给你去办，一定要调查出赤火教教主身份。"  --任务描述
x260019_var_MissionTarget=""		
x260019_var_MissionCompleted="\t不知勇士找我有何事？"					--完成任务npc说话的话
x260019_var_ContinueInfo="\t事情办妥了么？"
x260019_var_MissionHelp =	""
x260019_var_DemandItem ={}
x260019_var_ExpBonus = 316800	--经验
x260019_var_BonusMoney1 =0 	--银卡
x260019_var_BonusMoney2 =0   	--现银 
x260019_var_BonusMoney3 =0   	--金卡
x260019_var_BonusMoney4 =0   	--朝廷声望
x260019_var_BonusMoney5 =82  	--声望
x260019_var_BonusMoney6 =0	 	--荣誉
x260019_var_BonusItem	=	{}
x260019_var_BonusChoiceItem ={}
x260019_var_mengguwushi1 = -1
x260019_var_mengguwushi2 = -1
x260019_var_mengguwushi3 = -1
x260019_var_mengguwushi4 = -1
x260019_var_mengguwushi5 = -1
x260019_var_mengguwushi6 = -1
x260019_var_mengguwushi7 = -1
x260019_var_mengguwushi8 = -1
x260019_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x260019_var_SubmitGUID ={500036,510036,520036,530036}	--交任务NPC
--MisDescBegin

--电影拍摄进度
x260019_var_doing = 0
--本人演员登场
x260019_var_accid = -1
--隐身BUFF
x260019_var_Buff = 8711 --无限隐身
--未上场演员登场
x260019_var_outscence = {
	{seeflag=0,montype=2634,x=249,y=289,ai=5,templeai=-1,guid=-1,script=-1,camp=20,time=45000,face=260,name="疯癫的老人",title=""},
}
--在场演员名单 已经在场的NPC的GUID
x260019_var_inscence = {
{500036,510036,520036,530036},		--赤火邪教教主
{500037,510037,520037,530037},		--赤火教大祭司
{500093,510093,520093,530093},		--赤火教徒甲
{500118,510118,520118,530118},		--赤火教徒乙
{500119,510119,520119,530119},		--赤火教徒丙
{500120,510120,520120,530120},		--赤火教徒丁
}

--剧本
x260019_var_juben = {
	{inkey=1,obj=-1,juben = {[1]={str="快到这边来，祭典马上开始！"},[20]={str="入我圣教！"},[26]={str="长生不老！"},[36]={str="哪里来的疯老头，给我拿下！"}}},
	{inkey=2,obj=-1,juben = {[5]={str="苦世人沉溺于无尽炼狱而不知醒"},[9]={str="陷浮尘之欲望之海而不思返"},[13]={str="我赤火圣教，旨在燃残躯而救万人于苦海"},[17]={str="凡入我圣教者，赤炎圣火皆能洗却俗世秽垢而达长生不老，时机成熟更能羽化升仙。"}}},
	{inkey=3,obj=-1,juben = {[22]={str="入我圣教！"},[28]={str="长生不老！"}}},
	{inkey=4,obj=-1,juben = {[22]={str="入我圣教！"},[28]={str="长生不老！"}}},
	{inkey=5,obj=-1,juben = {[22]={str="入我圣教！"},[28]={str="长生不老！"}}},
	{inkey=6,obj=-1,juben = {[22]={str="入我圣教！"},[28]={str="长生不老！"}}},
	{outkey=1,obj=-1,juben = {[30]={},[31]={str="你们这些居心叵测的邪恶教徒，不要这里妖言惑众！"},[35]={str="没有人会相信你们的！！"},[37]={patrolId=5}}},
}

--演员信息储存
actorname = {}
--演员对白储存
actortalk = {}
--**********************************
function x260019_actionready(varMap, varPlayer)
	for i=1,getn(x260019_var_juben) do
		if x260019_var_juben[i].outkey ~= nil then
			local montype = x260019_var_outscence[x260019_var_juben[i].outkey].montype
			local x = x260019_var_outscence[x260019_var_juben[i].outkey].x
			local y = x260019_var_outscence[x260019_var_juben[i].outkey].y
			local ai = x260019_var_outscence[x260019_var_juben[i].outkey].ai
			local templeai = x260019_var_outscence[x260019_var_juben[i].outkey].templeai
			local guid = x260019_var_outscence[x260019_var_juben[i].outkey].guid
			local script = x260019_var_outscence[x260019_var_juben[i].outkey].script
			local camp = x260019_var_outscence[x260019_var_juben[i].outkey].camp
			local time = x260019_var_outscence[x260019_var_juben[i].outkey].time
			local face = x260019_var_outscence[x260019_var_juben[i].outkey].face
			local name = x260019_var_outscence[x260019_var_juben[i].outkey].name
			local title = x260019_var_outscence[x260019_var_juben[i].outkey].title
			x260019_var_juben[i].obj = CreateMonster(varMap, montype,x,y,ai,templeai,guid,script,camp,time,face,name,title)
			if x260019_var_outscence[x260019_var_juben[i].outkey].seeflag == 0 then
				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, x260019_var_juben[i].obj, x260019_var_Buff, 0)
			end
		elseif x260019_var_juben[i].inkey ~= nil then
			x260019_var_juben[i].obj = FindMonsterByGUID( varMap,x260019_var_inscence[x260019_var_juben[i].inkey][ GetCurCountry( varMap, varPlayer) + 1])
		end
--		for k,v in x260019_var_juben[i].juben do
--			local temp = getn(actortalk)
--			actortalk[temp+1] = {}
--			actortalk[temp+1].time = k
--			actortalk[temp+1].talk = v.str
--			actortalk[temp+1].face = v.face
--			actortalk[temp+1].id = actorname[i]
--			actortalk[temp+1].patrolId = v.patrolId
--			actortalk[temp+1].camp = v.camp
--		end	
	end
end
 
function x260019_ProcEnumEvent(varMap, varPlayer, NPCId, MissionId)
	

	if IsQuestHaveDone(varMap, varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
		return  --test
	end
	if IsQuestHaveDone(varMap, varPlayer, x260019_var_MissionIdPre[ GetCurCountry( varMap, varPlayer) + 1])> 0 then
		if IsHaveQuest(varMap,varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) <= 0 then
			local state = GetQuestStateNM(varMap,varPlayer,NPCId,x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])
			TalkAppendButtonNM( varMap, varPlayer, NPCId, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1], state, -1 )
			
		end
	end
	
	
end

function x260019_DispatchMissionInfo( varMap, varPlayer, NPCId )

		if x260019_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x260019_var_ExpBonus )
		end
		if x260019_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x260019_var_BonusMoney1 )
		end
		if x260019_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x260019_var_BonusMoney2 )
		end
		if x260019_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x260019_var_BonusMoney3 )
		end
		if x260019_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x260019_var_BonusMoney4 )
		end
		if x260019_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x260019_var_BonusMoney5 )
		end
		if x260019_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x260019_var_BonusMoney6 )
		end
		for i, item in x260019_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for i, item in x260019_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end
--**********************************

function x260019_ProcEventEntry(varMap, varPlayer, NPCId, MissionId,which)	--点击该任务后执行此脚本

	if IsQuestHaveDone(varMap, varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
		return   --test
	end

	if IsHaveQuest(varMap,varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
			if x260019_CheckSubmit(varMap, varPlayer, NPCId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x260019_var_MissionName)
				TalkAppendString(varMap,x260019_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, NPCId, x260019_var_ScriptId, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x260019_var_MissionName)
				TalkAppendString(varMap,x260019_var_MissionCompleted)
				TalkAppendString(varMap," ")
				x260019_DispatchMissionInfo( varMap, varPlayer, NPCId )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, NPCId, x260019_var_ScriptId, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]);
			end
  elseif x260019_ProcAcceptCheck(varMap, varPlayer, NPCId) > 0 then
			StartTalkTask(varMap)
	  	TalkAppendString(varMap,"#Y"..x260019_var_MissionName)
			TalkAppendString(varMap,x260019_var_MissionInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for i, item in x260019_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x260019_var_MissionHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x260019_var_MissionHelp )
			end
			x260019_DispatchMissionInfo( varMap, varPlayer, NPCId )
	  	StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, NPCId, x260019_var_ScriptId, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]);
  end
	
end
--**********************************

function x260019_ProcAcceptCheck(varMap, varPlayer, NPCId)
		if IsQuestHaveDone(varMap, varPlayer, x260019_var_MissionIdPre[ GetCurCountry( varMap, varPlayer) + 1])> 0 then
					return 1	--test
		end
		return 1

end
--**********************************
function x260019_IsCompleteMission( varMap, varPlayer)
	local misIndex = GetQuestIndexByID(varMap,varPlayer,x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])
			if GetQuestParam(varMap,varPlayer,misIndex,1) == 1 then 
					SetQuestByIndex(varMap,varPlayer,misIndex,0,1)
	    		SetQuestByIndex(varMap,varPlayer,misIndex,7,1)
					StartTalkTask(varMap)
					TalkAppendString(varMap,"任务已完成！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	    		
	    end
	  x260019_ProcQuestLogRefresh( varMap, varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) 
end
--**********************************
function x260019_CheckSubmit( varMap, varPlayer, NPCId)
	
		local misIndex = GetQuestIndexByID(varMap,varPlayer,x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])
			if GetQuestParam(varMap,varPlayer,misIndex,1) == 1 then 
					SetQuestByIndex(varMap,varPlayer,misIndex,0,1)
	    		SetQuestByIndex(varMap,varPlayer,misIndex,7,1)
			    return 1
	    end
	  return 0
end
--**********************************
function x260019_ProcQuestAccept( varMap, varPlayer, NPCId, MissionId )
		if IsQuestHaveDone(varMap, varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
				return --test
		end
		if IsQuestFullNM(varMap,varPlayer)==1 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"可接任务数量已满")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 
		end
		--检查前置任务
		local FrontMissiontId1, FrontMissiontId2, FrontMissiontId3 = GetFrontQuestIdNM( varMap, varPlayer,x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]  )
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
		if x260019_ProcAcceptCheck(varMap, varPlayer, NPCId) > 0 then
					local retmiss = AddQuest( varMap, varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1], x260019_var_ScriptId, 0, 1, 0, 1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
		  			x260019_Msg2toplayer( varMap, varPlayer,0)
						local misIndex = GetQuestIndexByID(varMap,varPlayer,x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])                                                  
    				SetQuestByIndex(varMap,varPlayer,misIndex,0,0)
    				SetQuestByIndex(varMap,varPlayer,misIndex,1,0)	--记录进入区域子任务完成情况
    				SetQuestByIndex(varMap,varPlayer,misIndex,7,0)	--任务位初始化
    					  			
						if x260019_CheckSubmit(varMap, varPlayer, NPCId) > 0 then
							local misIndex = GetQuestIndexByID(varMap,varPlayer,x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])                                                  
	    				SetQuestByIndex(varMap,varPlayer,misIndex,0,1)
	    				SetQuestByIndex(varMap,varPlayer,misIndex,7,1)
	    			end
	    			
		  		end
	 	end                                                                    
	     
end
--**********************************

function x260019_ProcQuestAbandon(varMap, varPlayer, MissionId)
		if IsHaveQuest(varMap,varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) <= 0 then
				return 
		end
		
		DelQuest(varMap, varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])
	 
			
end
--**********************************
function x260019_CheckPlayerBagFull( varMap ,varPlayer,selectRadioId )
	local result = 1
	local j = 0
	local bAdd = 0 --是否已经在固定物品奖励添加检测中已经检查出包裹已满
	StartItemTask(varMap)
	for j, item in x260019_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
  end
  for j, item in x260019_var_BonusChoiceItem do
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
function x260019_ProcQuestSubmit(varMap, varPlayer, NPCId, selectRadioId, MissionId)

	if IsHaveQuest(varMap,varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x260019_CheckSubmit( varMap, varPlayer, NPCId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x260019_CheckPlayerBagFull( varMap ,varPlayer,selectRadioId ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
				
				x260019_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])
				x260019_GetBonus( varMap, varPlayer,NPCId)
				StartItemTask(varMap)
				for i, item in x260019_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for i, item in x260019_var_BonusChoiceItem do
						if item.item == selectRadioId then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)

    		--ItemAppendListToPlayer(varMap,varPlayer)
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, NPCId, x260019_var_MissionIdNext[ GetCurCountry( varMap, varPlayer) + 1] )	
end

function x260019_GetBonus( varMap, varPlayer,NpcID)
	  if x260019_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x260019_var_ExpBonus);
  	end
		if x260019_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x260019_var_BonusMoney1 )
	  end
		if x260019_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x260019_var_BonusMoney2 )
	  end
		if x260019_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x260019_var_BonusMoney3 )
		end
		if x260019_var_BonusMoney4 > 0 then
		local nRongYu = GetRongYu( varMap, varPlayer )
			nRongYu = nRongYu + x260019_var_BonusMoney4
			SetRongYu( varMap, varPlayer, nRongYu )
		end
		if x260019_var_BonusMoney5 > 0 then
			local nShengWang = GetShengWang( varMap, varPlayer )
			nShengWang = nShengWang + x260019_var_BonusMoney5
			SetShengWang( varMap, varPlayer, nShengWang )
		end
		if x260019_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x260019_var_BonusMoney6)
		end
end

function x260019_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x260019_var_MissionName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x260019_var_MissionName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x260019_var_MissionName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x260019_var_MissionName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x260019_var_MissionName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x260019_var_MissionName.."！", 0, 3)
				if x260019_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x260019_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x260019_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x260019_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x260019_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x260019_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x260019_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x260019_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x260019_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x260019_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x260019_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x260019_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x260019_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x260019_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x260019_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x260019_ProcAreaEntered(varMap, varPlayer, zoneId, MissionId )

  if IsHaveQuestNM(varMap,varPlayer,x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) <= 0 then
      return	--没有任务
  end   
  local misIndex = GetQuestIndexByID(varMap,varPlayer,x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])  
  if GetQuestParam(varMap,varPlayer,misIndex,1) == 1 then 
  		return	--区域子任务已经完成
  end
  
	if varMap == x260019_var_QuestAreaEnteredInfo.varMap[GetCurCountry( varMap, varPlayer) + 1] then
		if zoneId == x260019_var_QuestAreaEnteredInfo.AreId then
	    	SetQuestByIndex(varMap,varPlayer,misIndex,1,1)
	    	x260019_IsCompleteMission( varMap, varPlayer)
				--local str ="到@npc_88017查看赤火教的底细(1/1)"
				Msg2Player(varMap, varPlayer,"你来到了赤火教祭台废墟！", 8, 3)
			--	Msg2Player(varMap, varPlayer, str, 8, 3)
	    	--演出开始
			 	if x260019_var_doing == 0 then
	    		x260019_var_PROTECTINFO.StartTime = GetCurrentTime()
					x260019_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 260019, "OnScneneTimer", 1)
					if x260019_var_PROTECTINFO.ScneneTimerIndex >=0 then
							x260019_var_doing = 1
							x260019_g_accid = selfId
							x260019_actionready(varMap, varPlayer)          		
	        end
			 	end	    	
		end
	end
end

function x260019_ProcTiming(varMap, varPlayer, ScriptId, MissionId)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcTiming",varMap, varPlayer, ScriptId, MissionId )
		
end

function x260019_ProcAreaLeaved(varMap, varPlayer, ScriptId, MissionId)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, ScriptId, MissionId)
end

function x260019_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
end

function x260019_ProcQuestItemChanged(varMap, varPlayer, varItemData, MissionId)
end


function x260019_ProcQuestAttach( varMap, varPlayer, npcId, npcGuid, misIndex, MissionId )
	if IsHaveQuest(varMap,varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]) > 0 then
		if npcGuid == x260019_var_SubmitGUID[GetCurCountry( varMap, varPlayer) + 1] then	
			if x260019_CheckSubmit( varMap, varPlayer, npcId) == 1 then
				local state = GetQuestStateNM(varMap,varPlayer,npcId,x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1])
				TalkAppendButtonNM( varMap, varPlayer, npcId, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1], state, -1 )
			end
		end
	end
end

function x260019_MissionComplate( varMap, varPlayer, targetId, selectId, MissionId )
	return LuaCallNoclosure( QUEST_SCRIPT, "MissionComplate", varMap, varPlayer, targetId, selectId, MissionId  )
end

function x260019_PositionUseItem( varMap, varPlayer, BagIndex, impactId )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, BagIndex, impactId)
end

function x260019_OnOpenItemBox( varMap, varPlayer, targetId, gpType, needItemID )
	return LuaCallNoclosure( QUEST_SCRIPT, "OnOpenItemBox",varMap, varPlayer, targetId, gpType, needItemID)
end

function x260019_OnRecycle( varMap, varPlayer, targetId, gpType, needItemID )
	return LuaCallNoclosure( QUEST_SCRIPT, "OnRecycle",varMap, varPlayer, targetId, gpType, needItemID)
end

function x260019_OnProcOver( varMap, varPlayer, targetId )
	LuaCallNoclosure( QUEST_SCRIPT, "OnProcOver",varMap, varPlayer, targetId)
end

function x260019_OpenCheck( varMap, varPlayer, targetId )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, targetId )
end

function x260019_OnScneneTimer(varMap)
	if x260019_var_doing== 0 then 
		return 
	end
	--WriteLog(1,"---------x260019_OnScneneTimer TickTime--->"..GetCurrentTime() - x260019_var_PROTECTINFO.StartTime)
	for i ,j in x260019_var_juben do
		for k,v in j.juben do
			if GetCurrentTime() - x260019_var_PROTECTINFO.StartTime == k then
				--WriteLog(1,"i=="..i)
				if IsObjValid (varMap,j.obj)==1 then
					if IsHaveSpecificImpact(varMap, j.obj, x260019_var_Buff) == 1 then
						--DispelSpecificImpact(varMap, j.obj, x260019_var_Buff, 1)
						CancelSpecificImpact(varMap, j.obj, x260019_var_Buff)
					end
					x260019_var_doing = x260019_var_doing +1
					if v.str ~= nil then
						NpcTalk( varMap,j.obj, v.str, -1)
					end
					if 	v.face ~= nil then
						SetMonsterDir(varMap,j.obj,v.face)
					end	
					if 	v.patrolId ~= nil then
						SetPatrolId(varMap,j.obj,v.patrolId )
					end	
					if 	v.camp ~= nil then
						SetMonsterCamp(varMap,j.obj,v.camp )
					end		
				end
			end
		end
	end
	--WriteLog(1,"x260019_var_doing=="..x260019_var_doing)
	if  ((GetCurrentTime() - x260019_var_PROTECTINFO.StartTime)> 40)then
		x260019_CloseTimer(varMap, x260019_var_PROTECTINFO.ScneneTimerIndex)
	end 
	  
 end



--x260019_CloseTimer( 51, 0 )
--**********************************
--关闭计时器
--**********************************
function x260019_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x260019_var_doing =0
	x260019_var_accid = -1
	x260019_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}   --初试时间置为零
	--演员信息清空
	actorname = {}
	actortalk = {}
end


function x260019_ProcQuestLogRefresh( varMap, varPlayer, MissionId)
	local misIndex = GetQuestIndexByID(varMap, varPlayer, x260019_var_MissionId[ GetCurCountry( varMap, varPlayer) + 1]);
	local AreaDone = GetQuestParam( varMap, varPlayer, misIndex, 1)		--是否进入过区域
	local Target =format("  到@npc_88017查看赤火教的底细(%d/1)",AreaDone)
	if AreaDone >=	1 then
		Target = "#G"..Target.."#W"
	end
	StartTalkTask(varMap)
	AddQuestLogCustomText( varMap,
								"",								-- 标题
								x260019_var_MissionName,			-- 任务名字
							  Target,      -- 任务目标
								x260019_var_NPCName[ GetCurCountry( varMap, varPlayer) + 1],				--任务NPC
								x260019_var_MissionRuse,			--任务攻略
								x260019_var_MissionInfo,			--任务描述
								x260019_var_MissionHelp				--任务小提示
								)
	 StopTalkTask(varMap)
	 DeliverTalkRefreshQuest(varMap, varPlayer, MissionId);
end
