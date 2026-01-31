--【主线】被困船长

--MisDescBegin
x260018_var_ScriptId = 260018
x260018_var_MissionIdPre = {1806,1906,2006,2106}
x260018_var_MissionId = {1807,1907,2007,2107}
x260018_var_LevelLess	= 60
x260018_var_MissionIdNext = {1808,1908,2008,2108}
x260018_var_QuestAreaEnteredInfo ={AreId=39, varMap={51,151,251,351}}
x260018_var_Name	={}
x260018_var_ExtTarget={
												{type=20,n=1,target="打探公主境况"},
											}
x260018_var_MissionName="【主线】被困船长"
x260018_var_NPCName={"@npc_500015","@npc_510015","@npc_520015","@npc_530015",}				--任务NPC
x260018_var_MissionRusee={"@npc_500015","@npc_510015","@npc_520015","@npc_530015"}
x260018_var_MissionInfo="\t商队底细？他们坐我们船只来到囚龙岛做生意，我知道的也只有这么多。我只是一个打杂的，你还是去问问我们船长吧。"  --任务描述
x260018_var_MissionTarget=""		
x260018_var_MissionCompleted="\t勇士，你来得正好，快救救我吧。"					--完成任务npc说话的话
x260018_var_ContinueInfo="\事不宜迟，还不赶紧行事。"
x260018_var_MissionHelp =	{"\t找到@npc_500015","\t找到@npc_510015","\t找到@npc_520015","\t找到@npc_530015"}
x260018_var_DemandItem ={}
x260018_var_ExpBonus = 336000	--经验
x260018_var_BonusMoney1 =0 	--银卡
x260018_var_BonusMoney2 =0   	--现银 
x260018_var_BonusMoney3 =0   	--金卡
x260018_var_BonusMoney4 =0   	--朝廷声望
x260018_var_BonusMoney5 =80  	--声望
x260018_var_BonusMoney6 =0	 	--荣誉
x260018_var_BonusItem	=	{}
x260018_var_BonusChoiceItem ={}
x260018_var_mengguwushi1 = -1
x260018_var_mengguwushi2 = -1
x260018_var_mengguwushi3 = -1
x260018_var_mengguwushi4 = -1
x260018_var_mengguwushi5 = -1
x260018_var_mengguwushi6 = -1
x260018_var_mengguwushi7 = -1
x260018_var_mengguwushi8 = -1
x260018_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}
x260018_var_SubmitGUID ={500015,510015,520015,530015}	--交任务NPC
--MisDescBegin

--电影拍摄进度
x260018_var_doing = 0
--本人演员登场
x260018_var_accid = -1
--隐身BUFF
x260018_var_Buff = 8711 --无限隐身
--未上场演员登场
x260018_var_outscence = {
	{seeflag=0,montype=2318,x=150,y=380,ai=5,templeai=-1,guid=-1,script=-1,camp=22,time=40000,face=90,name="伪装的摩诃末",title=""},
	{seeflag=0,montype=1913,x=155,y=376,ai=5,templeai=-1,guid=-1,script=-1,camp=22,time=40000,face=90,name="族长的女儿",title="回鹘公主"},
	{seeflag=0,montype=131,x=154,y=380,ai=5,templeai=1013,guid=-1,script=-1,camp=22,time=40000,face=120,name="伪装的花剌子守卫",title=""},
	{seeflag=0,montype=135,x=150,y=376,ai=5,templeai=-1,guid=-1,script=-1,camp=22,time=40000,face=120,name="伪装的花剌子士兵",title=""},
}
--在场演员名单 已经在场的NPC的GUID
x260018_var_inscence = {
{500016,510016,520016,530016},		--伪装的摩诃末
{500007,510007,520007,530007},		--族长的女儿回鹘公主
{500094,510094,520094,530094},		--伪装的花剌子守卫
{500095,510095,520095,530095},		--伪装的花剌子士兵
--{500119,510119,520119,530119},		--赤火教徒丙
--{500120,510120,520120,530120},		--赤火教徒丁
}

--剧本
x260018_var_juben = {
	{outkey=1,obj=-1,juben = {[2]={str="这里是王城边塞了！"},[5]={str="我们小心行事，务必盯紧公主！"},[18]={str="快抓住公主！"},[22]={camp=23},[34]={camp=22},[35]={str="后面可能有救援，给我打起精神来！"}}},
	{outkey=2,obj=-1,juben = {[10]={str="你们这些敌国贼人，陷欲望之海而不思返，必有恶报"},[16]={str="快回头看看，你们的主子有麻烦了！"},[18]={patrolId=7},[19]={str="勇士救我！"},[26]={str="你们这群贼子，他日父王必荡平你们的老巢"}}},
	{outkey=3,obj=-1,juben = {[8]={str="得令！"},[17]={face=300},[19]={face=300},[21]={patrolId=8},[22]={str="臭丫头，还敢跑！",camp=23},[24]={str="这下看你能跑到哪去！"},[27]={str="老实点！"},[35]={camp=22},[38]={str="是！"}}},
	{outkey=4,obj=-1,juben = {[8]={str="得令！"},[17]={face=300},[19]={face=300},[21]={patrolId=9},[22]={str="你给我站住！",camp=23},[25]={str="你到是再跑啊！"},[27]={str="别乱跑！"},[35]={camp=22},[38]={str="是！"}}},

--	{outkey=1,obj=-1,juben = {[30]={},[31]={str="你们这些居心叵测的邪恶教徒，不要这里妖言惑众！"},[35]={str="没有人会相信你们的！！"},[37]={patrolId=5}}},
}

--演员信息储存
actorname = {}
--演员对白储存
actortalk = {}
--**********************************
function x260018_actionready(varMap, varPlayer)
	for i=1,getn(x260018_var_juben) do
		if x260018_var_juben[i].outkey ~= nil then
			local montype = x260018_var_outscence[x260018_var_juben[i].outkey].montype
			local x = x260018_var_outscence[x260018_var_juben[i].outkey].x
			local y = x260018_var_outscence[x260018_var_juben[i].outkey].y
			local ai = x260018_var_outscence[x260018_var_juben[i].outkey].ai
			local templeai = x260018_var_outscence[x260018_var_juben[i].outkey].templeai
			local guid = x260018_var_outscence[x260018_var_juben[i].outkey].guid
			local script = x260018_var_outscence[x260018_var_juben[i].outkey].script
			local camp = x260018_var_outscence[x260018_var_juben[i].outkey].camp
			local time = x260018_var_outscence[x260018_var_juben[i].outkey].time
			local face = x260018_var_outscence[x260018_var_juben[i].outkey].face
			local name = x260018_var_outscence[x260018_var_juben[i].outkey].name
			local title = x260018_var_outscence[x260018_var_juben[i].outkey].title
			x260018_var_juben[i].obj = CreateMonster(varMap, montype,x,y,ai,templeai,guid,script,camp,time,face,name,title)
--			if x260018_var_outscence[x260018_var_juben[i].outkey].seeflag == 0 then
--				SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, x260018_var_juben[i].obj, x260018_var_Buff, 0)
--			end
	if x260018_var_juben[i].inkey ~= nil then
			x260018_var_juben[i].obj = FindMonsterByGUID( varMap,x260018_var_inscence[x260018_var_juben[i].inkey][ playerCountry + 1])
		end
--		for k,v in x260018_var_juben[i].juben do
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
end
 
function x260018_ProcEnumEvent(varMap, varPlayer, NPCId, MissionId)

--	QuestUnCom(varMap, varPlayer, x260018_var_MissionId[ playerCountry + 1])	

	--if IsQuestHaveDone(varMap, varPlayer, x260018_var_MissionId[ playerCountry + 1]) > 0 then
		--return  --test
	--end
	local playerCountry = GetCurCountry( varMap, varPlayer)
	if IsQuestHaveDone(varMap, varPlayer, x260018_var_MissionId[ playerCountry + 1]) > 0 then
		return 
	end	
	if IsQuestHaveDone(varMap, varPlayer, x260018_var_MissionIdPre[ playerCountry + 1])> 0 then
		if IsHaveQuest(varMap,varPlayer, x260018_var_MissionId[ playerCountry + 1]) <= 0 then
			local state = GetQuestStateNM(varMap,varPlayer,NPCId,x260018_var_MissionId[ playerCountry + 1])
			TalkAppendButtonNM( varMap, varPlayer, NPCId, x260018_var_MissionId[ playerCountry + 1], state, -1 )
			
		end
	end
	
	
end

function x260018_DispatchMissionInfo( varMap, varPlayer, NPCId )

		if x260018_var_ExpBonus> 0 then
			AddQuestExpBonus(varMap, x260018_var_ExpBonus )
		end
		if x260018_var_BonusMoney1 > 0 then
			AddQuestMoneyBonus1(varMap, x260018_var_BonusMoney1 )
		end
		if x260018_var_BonusMoney2 > 0 then
			AddQuestMoneyBonus2(varMap, x260018_var_BonusMoney2 )
		end
		if x260018_var_BonusMoney3 > 0 then
			AddQuestMoneyBonus3(varMap, x260018_var_BonusMoney3 )
		end
		if x260018_var_BonusMoney4 > 0 then
			AddQuestMoneyBonus4(varMap, x260018_var_BonusMoney4 )
		end
		if x260018_var_BonusMoney5 > 0 then
			AddQuestMoneyBonus5(varMap, x260018_var_BonusMoney5 )
		end
		if x260018_var_BonusMoney6 > 0 then
			AddQuestMoneyBonus6(varMap, x260018_var_BonusMoney6 )
		end
		for i, item in x260018_var_BonusItem do
		   	AddQuestItemBonus(varMap, item.item, item.n)
	  end
		for i, item in x260018_var_BonusChoiceItem do
	    	AddQuestRadioItemBonus(varMap, item.item, item.n)
	  end
end
--**********************************

function x260018_ProcEventEntry(varMap, varPlayer, NPCId, MissionId,which)	--点击该任务后执行此脚本
  
--	x260018_var_accid =varPlayer
	
	--if IsQuestHaveDone(varMap, varPlayer, x260018_var_MissionId[ playerCountry + 1]) > 0 then
		--return   --test
	--end
	local playerCountry = GetCurCountry( varMap, varPlayer)
	if IsHaveQuest(varMap,varPlayer, x260018_var_MissionId[ playerCountry + 1]) > 0 then
			if x260018_CheckSubmit(varMap, varPlayer, NPCId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x260018_var_MissionName)
				TalkAppendString(varMap,x260018_var_ContinueInfo)
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, NPCId, x260018_var_ScriptId, x260018_var_MissionId[ playerCountry + 1]);
			else
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y"..x260018_var_MissionName)
				TalkAppendString(varMap,x260018_var_MissionCompleted)
				TalkAppendString(varMap," ")
				x260018_DispatchMissionInfo( varMap, varPlayer, NPCId )
				StopTalkTask()
				DeliverTalkContinueNM(varMap, varPlayer, NPCId, x260018_var_ScriptId, x260018_var_MissionId[ playerCountry + 1]);
			end
  elseif x260018_ProcAcceptCheck(varMap, varPlayer, NPCId) > 0 then
		StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x260018_var_MissionName)
			TalkAppendString(varMap,x260018_var_MissionInfo)
			TalkAppendString( varMap,"#Y任务目标：")
			for i, item in x260018_var_ExtTarget do
					TalkAppendString( varMap,item.target)
			end 
			if x260018_var_MissionHelp ~= "" then
				TalkAppendString(varMap,"\n#G小提示:#W")
				TalkAppendString(varMap,x260018_var_MissionHelp[ playerCountry + 1] )
			end
			x260018_DispatchMissionInfo( varMap, varPlayer, NPCId )
		StopTalkTask()
			DeliverTalkInfoNM(varMap, varPlayer, NPCId, x260018_var_ScriptId, x260018_var_MissionId[ playerCountry + 1]);
end

	
end
--**********************************

function x260018_ProcAcceptCheck(varMap, varPlayer, NPCId)
	local playerCountry = GetCurCountry( varMap, varPlayer)
	if IsQuestHaveDone(varMap, varPlayer, x260018_var_MissionIdPre[ playerCountry + 1])> 0 then
				return 1	--test
	end
	return 1

end
--**********************************
function x260018_IsCompleteMission( varMap, varPlayer)
	local playerCountry = GetCurCountry( varMap, varPlayer)
	local misIndex = GetQuestIndexByID(varMap,varPlayer,x260018_var_MissionId[ playerCountry + 1])
			if GetQuestParam(varMap,varPlayer,misIndex,1) == 1 then 
					SetQuestByIndex(varMap,varPlayer,misIndex,0,1)
	    		SetQuestByIndex(varMap,varPlayer,misIndex,7,1)
					StartTalkTask(varMap)
					TalkAppendString(varMap,"已打探清公主境况！")
					StopTalkTask(varMap)
					DeliverTalkTips(varMap,varPlayer)	    		
	    end
	  x260018_ProcQuestLogRefresh( varMap, varPlayer, x260018_var_MissionId[ playerCountry + 1]) 
end
--**********************************
function x260018_CheckSubmit( varMap, varPlayer, NPCId)
	local playerCountry = GetCurCountry( varMap, varPlayer)
	local misIndex = GetQuestIndexByID(varMap,varPlayer,x260018_var_MissionId[ playerCountry + 1])
		if GetQuestParam(varMap,varPlayer,misIndex,1) == 1 then 
				SetQuestByIndex(varMap,varPlayer,misIndex,0,1)
			SetQuestByIndex(varMap,varPlayer,misIndex,7,1)
			return 1
	end
  return 0
end
--**********************************
function x260018_ProcQuestAccept( varMap, varPlayer, NPCId, MissionId )
	local playerCountry = GetCurCountry( varMap, varPlayer)
		if IsQuestHaveDone(varMap, varPlayer, x260018_var_MissionId[ playerCountry + 1]) > 0 then
				
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
		local FrontMissiontId1, FrontMissiontId2, FrontMissiontId3 = GetFrontQuestIdNM( varMap, varPlayer,x260018_var_MissionId[ playerCountry + 1]  )
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
		
		if x260018_ProcAcceptCheck(varMap, varPlayer, NPCId) > 0 then
					
					local retmiss = AddQuest( varMap, varPlayer, x260018_var_MissionId[ playerCountry + 1], x260018_var_ScriptId, 0, 1, 0, 1)
					if retmiss ==0 then
						Msg2Player(varMap, varPlayer, "接受任务失败！", 0, 3)
						return 0
					else
						x260018_var_accid =varPlayer
		  			x260018_Msg2toplayer( varMap, varPlayer,0)
						local misIndex = GetQuestIndexByID(varMap,varPlayer,x260018_var_MissionId[ playerCountry + 1])                                                  
    				SetQuestByIndex(varMap,varPlayer,misIndex,0,0)
    				SetQuestByIndex(varMap,varPlayer,misIndex,1,0)	--记录进入区域子任务完成情况
    				SetQuestByIndex(varMap,varPlayer,misIndex,7,0)	--任务位初始化
    					  			
						if x260018_CheckSubmit(varMap, varPlayer, NPCId) > 0 then
							local misIndex = GetQuestIndexByID(varMap,varPlayer,x260018_var_MissionId[ playerCountry + 1])                                                  
	    				SetQuestByIndex(varMap,varPlayer,misIndex,0,1)
	    				SetQuestByIndex(varMap,varPlayer,misIndex,7,1)
	    			end
	    			
		  		end
	 	end    
	 	                                                                
	  
	  	  
				--local str ="找到@npc_88022打探公主境况(1/1)"
				Msg2Player(varMap, varPlayer,"你躲进了一个箩筐里！", 8, 3)
			--	Msg2Player(varMap, varPlayer, str, 8, 3)
	    	--演出开始
			 SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, 8865, 0);
			 	if x260018_var_doing == 0 then
	    		x260018_var_PROTECTINFO.StartTime = GetCurrentTime()
					x260018_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 260018, "OnScneneTimer", 1)
					if x260018_var_PROTECTINFO.ScneneTimerIndex >=0 then
							x260018_var_doing = 1
							x260018_g_accid = varPlayer
							x260018_actionready(varMap, varPlayer)          		
	        end
			 	end	   
end
--**********************************

function x260018_ProcQuestAbandon(varMap, varPlayer, MissionId)
		local playerCountry = GetCurCountry( varMap, varPlayer)
		if IsHaveQuest(varMap,varPlayer, x260018_var_MissionId[ playerCountry + 1]) <= 0 then
				return 
		end
		
	if	DelQuest(varMap, varPlayer, x260018_var_MissionId[ playerCountry + 1])>0 then
		CancelSpecificImpact(varMap, varPlayer, 8865)
		end
	 
			
end
--**********************************
function x260018_CheckPlayerBagFull( varMap ,varPlayer,selectRadioId )
	local result = 1
	local j = 0
	local bAdd = 0 --是否已经在固定物品奖励添加检测中已经检查出包裹已满
	StartItemTask(varMap)
	for j, item in x260018_var_BonusItem do
		ItemAppend( varMap, item.item, item.n )
	end
	for j, item in x260018_var_BonusChoiceItem do
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
function x260018_ProcQuestSubmit(varMap, varPlayer, NPCId, selectRadioId, MissionId)
	local playerCountry = GetCurCountry( varMap, varPlayer)
	if IsHaveQuest(varMap,varPlayer, x260018_var_MissionId[ playerCountry + 1]) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有这个任务！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x260018_CheckSubmit( varMap, varPlayer, NPCId) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"您没有达到完成条件！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif x260018_CheckPlayerBagFull( varMap ,varPlayer,selectRadioId ) <= 0 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"包裹已满！")
				StopTalkTask(varMap)
				DeliverTalkTips(varMap,varPlayer)
				return 0
	elseif DelQuest(varMap, varPlayer, x260018_var_MissionId[ playerCountry + 1]) > 0 then
				
				x260018_Msg2toplayer( varMap, varPlayer,2)
				QuestCom(varMap, varPlayer, x260018_var_MissionId[ playerCountry + 1])
				x260018_GetBonus( varMap, varPlayer,NPCId)
				StartItemTask(varMap)
				for i, item in x260018_var_BonusItem do
 						ItemAppend( varMap, item.item, item.n )
				end
				for i, item in x260018_var_BonusChoiceItem do
						if item.item == selectRadioId then
	    			    ItemAppend( varMap, item.item, item.n )
						end
    		end
    		StopItemTask(varMap,varPlayer)

    		--ItemAppendListToPlayer(varMap,varPlayer)
   end
   LuaCallNoclosure( QUEST_SCRIPT, "ProcEventEntry", varMap, varPlayer, NPCId, x260018_var_MissionIdNext[ playerCountry + 1] )	
end

function x260018_GetBonus( varMap, varPlayer,NpcID)
	  if x260018_var_ExpBonus > 0 then
			AddExp(varMap, varPlayer, x260018_var_ExpBonus);
  	end
		if x260018_var_BonusMoney1 > 0 then
	    AddMoney( varMap, varPlayer, 1, x260018_var_BonusMoney1 )
	  end
		if x260018_var_BonusMoney2 > 0 then
	    AddMoney( varMap, varPlayer, 0, x260018_var_BonusMoney2 )
	  end
		if x260018_var_BonusMoney3 > 0 then
	    AddMoney( varMap, varPlayer, 3, x260018_var_BonusMoney3 )
		end
		if x260018_var_BonusMoney4 > 0 then
		local nRongYu = GetRongYu( varMap, varPlayer )
			nRongYu = nRongYu + x260018_var_BonusMoney4
			SetRongYu( varMap, varPlayer, nRongYu )
		end
		if x260018_var_BonusMoney5 > 0 then
			local nShengWang = GetShengWang( varMap, varPlayer )
			nShengWang = nShengWang + x260018_var_BonusMoney5
			SetShengWang( varMap, varPlayer, nShengWang )
		end
		if x260018_var_BonusMoney6 > 0 then
			AddHonor(varMap,varPlayer,x260018_var_BonusMoney6)
		end
end

function x260018_Msg2toplayer( varMap, varPlayer,type)
		if type == 0 then
				Msg2Player(varMap, varPlayer, "您接受了任务"..x260018_var_MissionName.."！", 0, 2)
		  	Msg2Player(varMap, varPlayer, "您接受了任务"..x260018_var_MissionName.."！", 0, 3)
		elseif type == 1 then
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x260018_var_MissionName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您放弃了任务"..x260018_var_MissionName.."！", 0, 3)
		elseif type == 2 then
				Msg2Player(varMap, varPlayer, "您完成了任务"..x260018_var_MissionName.."！", 0, 2)
				Msg2Player(varMap, varPlayer, "您完成了任务"..x260018_var_MissionName.."！", 0, 3)
				if x260018_var_ExpBonus > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R经验"..x260018_var_ExpBonus.."#Y的奖励", 0, 2)
  			end
				if x260018_var_BonusMoney1 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R银卡"..x260018_var_BonusMoney1.."文#Y的奖励", 0, 2)
	  		end
				if x260018_var_BonusMoney2 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R现银"..x260018_var_BonusMoney2.."文#Y的奖励", 0, 2)
	  		end
				if x260018_var_BonusMoney3 > 0 then
	  		  Msg2Player(varMap, varPlayer, "#Y获得#R金卡"..x260018_var_BonusMoney3.."文#Y的奖励", 0, 2)
				end
				if x260018_var_BonusMoney4 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R朝廷声望值"..x260018_var_BonusMoney4.."#Y的奖励", 0, 2)
				end
				if x260018_var_BonusMoney5 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R声望"..x260018_var_BonusMoney5.."#Y的奖励", 0, 2)
				end
				if x260018_var_BonusMoney6 > 0 then
					Msg2Player(varMap, varPlayer, "#Y获得#R荣誉"..x260018_var_BonusMoney6.."#Y的奖励", 0, 2)
				end
		end
end

function x260018_ProcQuestObjectKilled(varMap, varPlayer, varObjData, varObj, varQuest)
end


function x260018_ProcAreaEntered(varMap, varPlayer, zoneId, MissionId )
	local playerCountry = GetCurCountry( varMap, varPlayer)
	 if IsHaveQuestNM(varMap,varPlayer,x260018_var_MissionId[ playerCountry + 1]) <= 0 then
	    return	--没有任务
	end   
	local misIndex = GetQuestIndexByID(varMap,varPlayer,x260018_var_MissionId[ playerCountry + 1])  
	if GetQuestParam(varMap,varPlayer,misIndex,1) == 1 then 
		return	--区域子任务已经完成
	end
  
	if varMap == x260018_var_QuestAreaEnteredInfo.varMap[playerCountry + 1] then
		if zoneId == x260018_var_QuestAreaEnteredInfo.AreId then
--	    	SetQuestByIndex(varMap,varPlayer,misIndex,1,1)
--	    	x260018_IsCompleteMission( varMap, varPlayer)
--				--local str ="找到@npc_88022打探公主境况(1/1)"
--				Msg2Player(varMap, varPlayer,"你见到公主就在其中！", 8, 3)
--			--	Msg2Player(varMap, varPlayer, str, 8, 3)
--	    	--演出开始
--			 	if x260018_var_doing == 0 then
--	    		x260018_var_PROTECTINFO.StartTime = GetCurrentTime()
--					x260018_var_PROTECTINFO.ScneneTimerIndex = SetTimer(varMap, varPlayer, 260018, "OnScneneTimer", 1)
--					if x260018_var_PROTECTINFO.ScneneTimerIndex >=0 then
--							x260018_var_doing = 1
--							x260018_g_accid = selfId
--							x260018_actionready(varMap, varPlayer)          		
--	        end
--			 	end	    	
		end
	end
end

function x260018_ProcTiming(varMap, varPlayer, ScriptId, MissionId)
	 LuaCallNoclosure( QUEST_SCRIPT, "ProcTiming",varMap, varPlayer, ScriptId, MissionId )
		
end

function x260018_ProcAreaLeaved(varMap, varPlayer, ScriptId, MissionId)
	LuaCallNoclosure( QUEST_SCRIPT, "ProcAreaLeaved",varMap, varPlayer, ScriptId, MissionId)
end

function x260018_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )
end

function x260018_ProcQuestItemChanged(varMap, varPlayer, varItemData, MissionId)
end


function x260018_ProcQuestAttach( varMap, varPlayer, npcId, npcGuid, misIndex, MissionId )
	local playerCountry = GetCurCountry( varMap, varPlayer)
	if IsHaveQuest(varMap,varPlayer, x260018_var_MissionId[ playerCountry + 1]) > 0 then
		if npcGuid == x260018_var_SubmitGUID[playerCountry + 1] then	
			if x260018_CheckSubmit( varMap, varPlayer, npcId) == 1 then
				local state = GetQuestStateNM(varMap,varPlayer,npcId,x260018_var_MissionId[ playerCountry + 1])
				TalkAppendButtonNM( varMap, varPlayer, npcId, x260018_var_MissionId[ playerCountry + 1], state, -1 )
			end
		end
	end
end

function x260018_MissionComplate( varMap, varPlayer, targetId, selectId, MissionId )
	return LuaCallNoclosure( QUEST_SCRIPT, "MissionComplate", varMap, varPlayer, targetId, selectId, MissionId  )
end

function x260018_PositionUseItem( varMap, varPlayer, BagIndex, impactId )
	return  LuaCallNoclosure( QUEST_SCRIPT, "PositionUseItem",varMap, varPlayer, BagIndex, impactId)
end

function x260018_OnOpenItemBox( varMap, varPlayer, targetId, gpType, needItemID )
	return LuaCallNoclosure( QUEST_SCRIPT, "OnOpenItemBox",varMap, varPlayer, targetId, gpType, needItemID)
end

function x260018_OnRecycle( varMap, varPlayer, targetId, gpType, needItemID )
	return LuaCallNoclosure( QUEST_SCRIPT, "OnRecycle",varMap, varPlayer, targetId, gpType, needItemID)
end

function x260018_OnProcOver( varMap, varPlayer, targetId )
	LuaCallNoclosure( QUEST_SCRIPT, "OnProcOver",varMap, varPlayer, targetId)
end

function x260018_OpenCheck( varMap, varPlayer, targetId )
	LuaCallNoclosure( QUEST_SCRIPT, "OpenCheck", varMap, varPlayer, targetId )
end

function x260018_OnScneneTimer(varMap)
	
	if x260018_var_doing== 0 then 
		return 
	end
	--WriteLog(1,"---------x260018_OnScneneTimer TickTime--->"..GetCurrentTime() - x260018_var_PROTECTINFO.StartTime)
	for i ,j in x260018_var_juben do
		
		     
		for k,v in j.juben do
           ---完成任务
	
		     --附近有此任务的玩家同时完成任务
		     
		     
		      if  GetCurrentTime() - x260018_var_PROTECTINFO.StartTime ==43 then
		     
						     
				 local varX,z = GetWorldPos(varMap,x260018_var_accid)
				 local Num =  GetNearPlayerCount(varMap, x260018_var_accid,varX,z,10)  
					 for varI = 0, Num-1 do
						local humanObjId = GetNearPlayerMember(varMap, x260018_var_accid,varI);
							local playerCountry = GetCurCountry( varMap, humanObjId)
						 	local misIndex = GetQuestIndexByID(varMap,humanObjId,x260018_var_MissionId[playerCountry + 1])  
					 if IsHaveQuest(varMap,humanObjId, x260018_var_MissionId[ playerCountry + 1]) > 0 then
					 SetQuestByIndex(varMap,humanObjId,misIndex,1,1)
					 CancelSpecificImpact(varMap, humanObjId, 8865)
							 	x260018_IsCompleteMission( varMap, humanObjId)	
						 	end
					  end
					
					end
	
		
			if GetCurrentTime() - x260018_var_PROTECTINFO.StartTime == k then
				--WriteLog(1,"i=="..i)
				if IsObjValid (varMap,j.obj)==1 then
					if IsHaveSpecificImpact(varMap, j.obj, x260018_var_Buff) == 1 then
						--DispelSpecificImpact(varMap, j.obj, x260018_var_Buff, 1)
						CancelSpecificImpact(varMap, j.obj, x260018_var_Buff)
					end
					x260018_var_doing = x260018_var_doing +1
					if v.str ~= nil then
						NpcTalk( varMap,j.obj, v.str, -1)
					end
					if 	v.face ~= nil then
						SetMonsterDir(varMap,j.obj,v.face)
					end	
					
					if 	v.camp ~= nil then
						SetMonsterCamp(varMap,j.obj,v.camp )
					end		

          if v.patrolId ~= nil then

					SetPatrolId(varMap,j.obj,v.patrolId )
          end
	       
					
				end
			end
		end
	end
	--WriteLog(1,"x260018_var_doing=="..x260018_var_doing)
	if  ((GetCurrentTime() - x260018_var_PROTECTINFO.StartTime)> 50)then
		x260018_CloseTimer(varMap, x260018_var_PROTECTINFO.ScneneTimerIndex)
	end 
	  
 end



--x260018_CloseTimer( 51, 0 )
--**********************************
--关闭计时器
--**********************************
function x260018_CloseTimer( varMap, TimerIndex )
	StopTimer(varMap, TimerIndex)
	x260018_var_doing =0
	x260018_var_accid = -1
	x260018_var_PROTECTINFO={ScneneTimerIndex = -1,  StartTime = 0}   --初试时间置为零
	--演员信息清空
	actorname = {}
	actortalk = {}
end


function x260018_ProcQuestLogRefresh( varMap, varPlayer, MissionId)
	local playerCountry = GetCurCountry( varMap, varPlayer)
	local misIndex = GetQuestIndexByID(varMap, varPlayer, x260018_var_MissionId[ playerCountry + 1]);
	local AreaDone = GetQuestParam( varMap, varPlayer, misIndex, 1)		--是否进入过区域
	local Target =format("  打探公主境况(%d/1)",AreaDone)
	if AreaDone >=	1 then
		Target = "#G"..Target.."#W"
	end
	StartTalkTask(varMap)
	AddQuestLogCustomText( varMap,
								"",								-- 标题
								x260018_var_MissionName,			-- 任务名字
							  Target,      -- 任务目标
								x260018_var_NPCName[ playerCountry + 1],				--任务NPC
								x260018_var_MissionRusee[ playerCountry + 1],			--任务攻略
								x260018_var_MissionInfo,			--任务描述
								x260018_var_MissionHelp[ playerCountry + 1]				--任务小提示
								)
	 StopTalkTask(varMap)
	 DeliverTalkRefreshQuest(varMap, varPlayer, MissionId);
end
