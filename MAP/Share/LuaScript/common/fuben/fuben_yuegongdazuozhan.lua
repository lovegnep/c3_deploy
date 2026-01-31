











x700136_CSP_FUBENTYPE				= 	0
x700136_CSP_SCRIPTID				=	1
x700136_CSP_TICKCOUNT				= 	2
x700136_CSP_FROMSCENEID				= 	3
x700136_CSP_ISCLOSING				= 	4
x700136_CSP_LEAVECOUNTDOWN			= 	5
x700136_CSP_TEAMID					=	6
x700136_CSP_TICKTIME				=	7
x700136_CSP_HOLDTIME				=	8
x700136_CSP_FUBENLEVEL				=	9

x700136_CSP_AREA_ID					=	220
x700136_CSP_AREA_FLAG				=	221
x700136_B_CREATE_RANDOMBOSS			=	230
x700136_CSP_RANDOM_BOSS_ID			=	231
x700136_RANDOMBOSS_FLAG				=	232

x700136_CSP_BOSS_ID					=   233
x700136_CSP_PLAYERID				=	234
x700136_CSP_ZHANCHE					 = 238
x700136_CSP_XIANJINBOSS				=	239
x700136_CSP_HUMAN_COUNT				=	240
x700136_CSP_PLAYER_ENTER_START		=	241

x700136_CSP_BOSS_laoshu				=   242
x700136_CSP_BOSS_chaigou			=   243
x700136_CSP_BOSS_zhizhu				=   244
x700136_CSP_BOSS_yanjingshe			=   245
x700136_CSP_BOSS_jinchan			=   246

x700136_CSP_LAST_TICKOUNT			=	247
x700136_CSP_GUID_START				=   248
x700136_CSP_FUBEN_TYPE				=	254	
x700136_CSP_FUBEN_MODE				=   255

x700136_var_FileId 					= 700136
x700136_var_QuestId					= 6608


                  
x700136_var_Level_Limit  = 70
x700136_var_Rate_Limit  = 50

x700136_var_NPC = 
{                                                                                                                                                                                                                                                                                                         
    { type = 18080, guid = 122992, facedir = 20, name = "月宫钥匙老人", title = "" },
}
									
function x700136_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest, varScriptFileId)

    local objID = GetMonsterGUID(varMap, varTalknpc)  
	if ( objID == x700136_var_NPC[1].guid ) then     
		StartTalkTask(varMap)                                                                                                                                                                                                                                                                                                     
	    --TalkAppendString(varMap,"#Y【个人】月宫大作战#W")                                                                                                                                                                                                                                                                           
	    TalkAppendString(varMap,"\t欢迎来到月宫,我很乐意带你们游览月宫，不过眼下有点麻烦的事情。")    
	    TalkAppendString(varMap,"\t你们看到那边的天湖神兽了么，那东西生性狂躁，隔三岔五就来捣乱一番，很是让人头疼，能否绑我收拾了它？") 	
	    TalkAppendString(varMap,"\t如果你们已经收集到了足够的材料，我就可以开始制作魔法月饼了！魔法月饼是唯一可以消弱天虎神兽的东西！。") 
	    TalkAppendString(varMap,"\n现在已经收集到的月饼材料：") 	
	    TalkAppendString(varMap,"面粉："..mf.."/10") 	
	    TalkAppendString(varMap,"月饼馅："..ybx.."/10") 	
	    TalkAppendString(varMap,"蜂蜜："..fm.."/10") 	
	    TalkAppendString(varMap,"鸡蛋："..jd.."/10") 	
	    TalkAppendString(varMap,"月之精华："..yzjh.."/10") 	
	
		
	    TalkAppendButton(varMap, x700136_var_FileId, "离开副本", 3, 101) 
		if die ~= 1 then
            TalkAppendButton(varMap, x700136_var_FileId, "我们已经准备好了，叫醒天虎神兽吧", 3, 201)
            TalkAppendButton(varMap, x700136_var_FileId, "制作魔法月饼", 3, 301)
		end
		
	    StopTalkTask()                                                                                                                                                                                                                                                                                                            
      DeliverTalkMenu(varMap, varPlayer, varTalknpc)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
	end
	if ( objID == 122993 ) then 
		StartTalkTask(varMap)                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
	    TalkAppendString(varMap,"\t天虎看起来睡得很香，千万不要吵醒它了。")   
		 TalkAppendButton(varMap, x700136_var_FileId, "叫醒它！", 3, 2201) 
		 StopTalkTask()                                                                                                                                                                                                                                                                                                            
      DeliverTalkMenu(varMap, varPlayer, varTalknpc)  
	end

end
									
function x700136_ProcEventEntry(varMap, varPlayer, varTalknpc, varScriptFileId, nFlag)

	local bossID = GetFubenData_Param(varMap, x700136_CSP_BOSS_ID  )
	if varTalknpc ~= bossID then
		if nFlag == 101 then
			 StartTalkTask(varMap)                                                                                                                                                                                                                                                                                                     
		    TalkAppendString(varMap,"#Y【个人】月宫大作战#W")                                                                                                                                                                                                                                                                           
			TalkAppendString(varMap,"\n\t你确定要离开月宫吗？")  
			TalkAppendButton(varMap, x700136_var_FileId, "确定", 3, 1101) 			
		    StopTalkTask()                                                                                                                                                                                                                                                                                                            
      		DeliverTalkMenu(varMap, varPlayer, varTalknpc)
		elseif nFlag == 1101 then
			   local varguo=GetCurCountry(varMap, varPlayer)
			   	if varguo == 0 then
				NewWorld( varMap, varPlayer, 87, 299 + random( 0, 2 ), 417 + random( 0, 2 ), 700136)
				elseif varguo == 1 then
			    NewWorld( varMap, varPlayer, 187, 299 + random( 0, 2 ), 417 + random( 0, 2 ), 700136)
				elseif varguo == 2 then
			    NewWorld( varMap, varPlayer, 287, 299 + random( 0, 2 ), 417 + random( 0, 2 ), 700136)
				elseif varguo == 3 then
			    NewWorld( varMap, varPlayer, 387, 299 + random( 0, 2 ), 417 + random( 0, 2 ), 700136)
				end
	    elseif nFlag == 201 or nFlag == 2201 then
            if IsHaveSpecificImpact( varMap, varPlayer, 7588) == 1 then
                Msg2Player(varMap, varPlayer, "请先制作出魔法月饼", 8, 3)
                Msg2Player(varMap, varPlayer, "请先制作出魔法月饼", 8, 2)
                return
            end
            if damaostate == 1 then
                damaostate = 0
                x700136_DeleteMonster(varMap, damao)
                damao2 = CreateMonster(varMap, 18081, 34, 40, 0, 638, x700136_var_FileId, -1, 21,-1, 270,  "天虎","发怒的神兽")
                x700136_ShowTipsToAll(varMap, "天虎被惊醒了！它非常愤怒")
                NpcTalk(varMap, damao2,"是谁吵醒我睡觉？我要吃掉你们这些到处乱窜的小东西！",-1)

            else
                x700136_ShowTipsToAll(varMap, "大猫好像没有在睡觉")
                return
            end


		elseif nFlag == 301 then
		
            if GetItemCount(varMap,varPlayer,12031190)>0 and yuebing == 1 then
                Msg2Player(varMap, varPlayer, "你已经制作出了魔法月饼", 8, 3)
                return
            end
            if mf >= 10 and ybx >= 10 and fm >= 10 and jd >= 10 and yzjh >= 10 and yuebing == 0 then

                local item = StopItemTask(varMap,varPlayer)
                if item > 0 then
                    yuebing = 1
                    StartItemTask(varMap)
                    ItemAppendBind( varMap,12031190,1)
                    StopItemTask(varMap,varPlayer)
                    DeliverItemListSendToPlayer(varMap,varPlayer)
                    Msg2Player(varMap, varPlayer, "你获得了一个魔法月饼", 8, 3)
                else
                    StartTalkTask(varMap)
                    TalkAppendString(varMap,"背包已满，无法得到物品！您需要至少有1个背包空间！")
                    StopTalkTask(varMap)
                    DeliverTalkTips(varMap,varPlayer)
                    return
                end
            else
                StartTalkTask(varMap)
                TalkAppendString(varMap,"材料不足，抓紧收集材料吧！")
                StopTalkTask(varMap)
                DeliverTalkTips(varMap,varPlayer)

            end
        end

    end
end



function x700136_ProcFubenSceneCreated( varMap )
	 
	for varI = 20,239 do
		SetFubenData_Param(varMap, varI,-1)

	end
	mf=0
	ybx=0
	fm=0
	jd=0
	yzjh=0
	yuebing = 0
	jishi = 0
	jishi2 = 5
	die = 0
	endt = 0
	damao2=0
	 x700136_CreateNPC(varMap) 
	x700136_ShowTipsToAll(varMap, "天虎将在7分钟后醒来。")
	--x700136_CreateBoss(varMap)
	--x700136_ProcPlayerEnter(varMap, varPlayer)
end

function x700136_ProcPlayerEnter(varMap, varPlayer)
	 SetFubenData_Param(varMap, x700136_CSP_PLAYERID, varPlayer)

end

function x700136_CreateBoss(varMap)


	local fubenlevel = GetFubenData_Param(varMap, x700136_CSP_FUBENLEVEL ) ;

	local nFubenType = GetFubenData_Param(varMap, x700136_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700136_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700136_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700136_var_FileId,nIndexFrom,varI)
		if idScript == x700136_var_FileId and monsterFlag == 0  and nFubenType == varFlag3 then
		     laoshu = CreateMonster( varMap, type, varX, z, ai, aiscript, x700136_var_FileId, -1, 21, 5*1000, facedir, "")
			SetFubenData_Param(varMap, x700136_CSP_BOSS_laoshu, laoshu )			
			SetPatrolId(varMap, laoshu, patrolid)
        end
		if idScript == x700136_var_FileId and monsterFlag == 1  and nFubenType == varFlag3 then
		     chaigou = CreateMonster( varMap, type, varX, z, ai, aiscript, x700136_var_FileId, -1, 21, 5*1000, facedir, "")
			SetFubenData_Param(varMap, x700136_CSP_BOSS_chaigou, chaigou )			
			SetPatrolId(varMap, chaigou, patrolid)
        end
		if idScript == x700136_var_FileId and monsterFlag == 2  and nFubenType == varFlag3 then
		     zhizhu = CreateMonster( varMap, type, varX, z, ai, aiscript, x700136_var_FileId, -1, 21, 5*1000, facedir, "")
			SetFubenData_Param(varMap, x700136_CSP_BOSS_zhizhu, zhizhu )			
			SetPatrolId(varMap, zhizhu, patrolid)
        end
		if idScript == x700136_var_FileId and monsterFlag == 3  and nFubenType == varFlag3 then
		     yanjingshe = CreateMonster( varMap, type, varX, z, ai, aiscript, x700136_var_FileId, -1, 21, 5*1000, facedir, "")
			SetFubenData_Param(varMap, x700136_CSP_BOSS_yanjingshe, yanjingshe )			
			SetPatrolId(varMap, yanjingshe, patrolid)
        end
		if idScript == x700136_var_FileId and monsterFlag == 4  and nFubenType == varFlag3 then
		     jinchan = CreateMonster( varMap, type, varX, z, ai, aiscript, x700136_var_FileId, -1, 21, 5*1000, facedir, "")
			SetFubenData_Param(varMap, x700136_CSP_BOSS_jinchan, jinchan )			
			SetPatrolId(varMap, jinchan, patrolid)
        end
		x = 0
	end
	-- x700136_EnterTick(varMap)
	-- n = n + 1
end

function x700136_ProcDie(varMap, varPlayer, varKiller)	
	local bossid = damao2
	local laoshu = GetFubenData_Param(varMap, x700136_CSP_BOSS_laoshu)
	local chaigou = GetFubenData_Param(varMap, x700136_CSP_BOSS_chaigou)
	local zhizhu = GetFubenData_Param(varMap, x700136_CSP_BOSS_zhizhu)
	local yanjingshe = GetFubenData_Param(varMap, x700136_CSP_BOSS_yanjingshe)
	local jinchan = GetFubenData_Param(varMap, x700136_CSP_BOSS_jinchan)
	if laoshu == varPlayer then
	mf = mf + 1
	x700136_ShowTipsToAll(varMap, "收集到了一份面粉")
	x700136_ShowTipsToAll(varMap, "当前已有面粉"..mf.."/10")
			if mf == 10 then
				NpcTalk(varMap, ret,"面粉已经收集齐了！加油！天虎就快醒来了！集齐所有材料就可以制作出魔法月饼！",-1) 
			end
	elseif chaigou == varPlayer then
	ybx = ybx + 1
	x700136_ShowTipsToAll(varMap, "收集到了一份月饼馅")
	x700136_ShowTipsToAll(varMap, "当前已有月饼馅"..ybx.."/10")
			if ybx == 10 then
				NpcTalk(varMap, ret,"月饼馅已经收集齐了！加油！天虎就快醒来了！集齐所有材料就可以制作出魔法月饼！",-1) 
			end
	elseif zhizhu == varPlayer then
	fm = fm + 1
	x700136_ShowTipsToAll(varMap, "收集到了一份蜂蜜")
	x700136_ShowTipsToAll(varMap, "当前已有蜂蜜"..fm.."/10")
			if fm == 10 then
				NpcTalk(varMap, ret,"蜂蜜已经收集齐了！加油！天虎就快醒来了！集齐所有材料就可以制作出魔法月饼！",-1) 
			end
	elseif yanjingshe == varPlayer then
	jd = jd + 1
	x700136_ShowTipsToAll(varMap, "收集到了一份鸡蛋")
	x700136_ShowTipsToAll(varMap, "当前已有鸡蛋"..jd.."/10")
			if jd == 10 then
				NpcTalk(varMap, ret,"鸡蛋已经收集齐了！加油！天虎就快醒来了！集齐所有材料就可以制作出魔法月饼！",-1) 
			end
	elseif jinchan == varPlayer then
	yzjh = yzjh + 1
	x700136_ShowTipsToAll(varMap, "收集到了一份月之精华")
	x700136_ShowTipsToAll(varMap, "当前已有月之精华"..yzjh.."/10")
			if yzjh == 10 then
				NpcTalk(varMap, ret,"月之精华已经收集齐了！加油！天虎就快醒来了！集齐所有材料就可以制作出魔法月饼！",-1) 
			end
	end
	if bossid == varPlayer then
		--SetFubenData_Param(varMap, x700136_CSP_BOSS_ID, -1)
		--x700136_ProcFubenEnd( varMap)
		x700136_ShowTipsToAll(varMap, "天虎被击败，月宫再次恢复平静。")
		die = 1
		x700136_ProcFubenEnd( varMap)

	end
 

end

function x700136_CreateNPC( varMap )
 
	  for i, npc in x700136_var_NPC do
		     ret = CreateMonster(varMap, npc.type, 40, 25, 3, -1, -1, npc.guid, 20, -1, npc.facedir, npc.name, npc.title, -1)
		   damao = CreateMonster(varMap, 18087, 39, 46, 3, -1, -1, 122993, 20,-1, 270,  "酣睡的天虎神兽")
			damaostate = 1
		    if ret == -1 then
		        WriteLog(1, "x700136_CreateNPC  ERR ==============")  
		    end
    end
end

function x700136_ProcFubenEnd( varMap)

					x700136_DeleteMonster(varMap, ret)
					endt = 1
			  for i, npc in x700136_var_NPC do
		ret1 = CreateMonster(varMap, npc.type, 36, 38, 3, -1, -1, npc.guid, 20, -1, npc.facedir, npc.name, npc.title, -1)
				    if ret1 == -1 then
		        WriteLog(1, "x700136_CreateNPC  ERR ==============")  
		    end
		ret2 = CreateMonster(varMap, 18088, 36, 38, 3, -1, -1, 122993, 20,-1, 270,  "    ")
		local horse = random(0,100)
		if horse <= 80 then
							local humancount = GetFuben_PlayerCount(varMap);
					local monattr = random(0,5)
					for varI = 0, humancount - 1 do					
					local humanId = GetFuben_PlayerObjId(varMap, varI);
					local name = GetName(varMap, humanId)
					CreateMonster(varMap, 18090+monattr, 38+random(2,5),38-random(2,5), 31, -1, -1, x700136_var_FileId, 21, 25*60*1000, random(0,20), "", "", -1)
					if monattr == 0 then
		 			varMsg = format( name.."在月宫发现了#O咆哮战狼!" )
					LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
					LuaAllScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
					LuaAllScenceM2Wrold(varMap,varMsg, CHAT_LEFTDOWN, 1) 
					else
					varMsg = format( name.."在月宫发现了#O神秘驯兽师!" )
					LuaAllScenceM2Wrold( varMap, varMsg, 5, 1)
					LuaAllScenceM2Wrold(varMap, varMsg, CHAT_PLANE_SCROLL, 1)
					LuaAllScenceM2Wrold(varMap,varMsg, CHAT_LEFTDOWN, 1) 
					end
					end

		end
    end
end


function x700136_EnterTick(varMap, varPlayer, nowTickCount)
	if jishi == 0 then
		NpcTalk(varMap, ret,"终于有人来了！欢迎来到月宫！",-1)
	end
	if damao2 > 0 then
		if IsHaveSpecificImpact( varMap, varPlayer, 7588) ~= 1  then
			if IsHaveSpecificImpact( varMap, damao2, 32071) == 1 then
				x700136_ShowTipsToAll(varMap, "天虎闻到了月饼的味道，稍微平静了下来。")
				DispelSpecificImpact( varMap, damao2, 32071 )
			end
		end
		if IsHaveSpecificImpact( varMap, varPlayer, 7588) == 1  then
			if IsHaveSpecificImpact( varMap, damao2, 32071) ~= 1 then
				x700136_ShowTipsToAll(varMap, "因为没有魔法月饼，天虎变得更愤怒了。")
				SendSpecificImpactToUnit( varMap, damao2, damao2, damao2, 32071, 0);
			end
		end
	end

	if endt == 1 then
			NpcTalk(varMap, ret1,"哈哈哈，天虎终于受到教训啦，以后它就会老老实实的了，多谢你们！来我这里，我可以送你们出去",-1)
			endt = endt + 1
	end
	if die == 0 then
	jishi = jishi + 1
	end
	if jishi2 - jishi == 2 then
		    local talk={
	    	"好吃的月饼mua.zzzZZZ...",
	    	"zzzZZZ...",
	    	"...zzZZ...呼噜呼噜...",
			"大猫要吃月饼！miamia...zzzZZZ...",
	    }
	    local rantalk = random(getn(talk))
	NpcTalk(varMap, damao,talk[rantalk],-1)
		
			jishi2 = jishi2 + 2
	
		if jishi == 24 then
		x700136_ShowTipsToAll(varMap, "天虎将在5分钟后醒来。")
	end
	if jishi == 48 then
		x700136_ShowTipsToAll(varMap, "天虎将在3分钟后醒来。")
	end
	if jishi == 60 then
		x700136_ShowTipsToAll(varMap, "天虎将在2分钟后醒来。")
	end
	if jishi == 72 then
		x700136_ShowTipsToAll(varMap, "天虎将在1分钟后醒来。")
	end
	if jishi == 84 and damaostate == 1 then
					damaostate = 0
					x700136_DeleteMonster(varMap, damao)
					damao2 = CreateMonster(varMap, 18081, 34, 40, 0, 638, x700136_var_FileId, -1, 21,-1, 270,  "天虎","发怒的神兽")
					x700136_ShowTipsToAll(varMap, "天虎被惊醒了！它非常愤怒")
					NpcTalk(varMap, damao2,"是谁吵醒我睡觉？我要吃掉你们这些到处乱窜的小东西！",-1) 
	end
	local laoshu = GetFubenData_Param(varMap, x700136_CSP_BOSS_laoshu)
	local chaigou = GetFubenData_Param(varMap, x700136_CSP_BOSS_chaigou)
	local zhizhu = GetFubenData_Param(varMap, x700136_CSP_BOSS_zhizhu)
	local yanjingshe = GetFubenData_Param(varMap, x700136_CSP_BOSS_yanjingshe)
	local jinchan = GetFubenData_Param(varMap, x700136_CSP_BOSS_jinchan)

	--if laoshu == -1 and chaigou == -1 and zhizhu == -1 and yanjingshe ==-1 and jinchan == -1 then
	x700136_CreateBoss( varMap )
	--end
	if mf >= 10 and ybx >= 10 and fm >= 10 and jd >= 10 and yzjh >= 10 and yuebing == 0 then
		NpcTalk(varMap, ret,"所有材料都已经收集齐了，我会把魔法月饼做好，快来我这里领魔法月饼！",-1) 
	else
			local talk1={
	    	"加油！天虎随时都可能醒来！",
	    	"那些可恶的害虫！快消灭他们，他们偷了不少月饼材料！",
	    	"必须在天虎醒来之前做好魔法月饼！",
	    }
	    local rantalk1 = random(getn(talk1))
		NpcTalk(varMap, ret,talk1[rantalk1],-1)
		

	end
	end

end

function x700136_DeleteMonster(varMap,varPlayer)
	if IsObjValid(varMap,varPlayer) == 1 and GetHp(varMap,varPlayer ) > 0 then
		DeleteMonster(varMap,varPlayer)
	end
end

function x700136_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end


-- function x700136_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	-- SetFubenData_Param(varMap, x700136_CSP_AREA_ID, varArea)
	-- if varArea == 0 then  
		
		-- local BossId = GetFubenData_Param(varMap, x700136_CSP_BOSS_ID)
		
		-- if BossId ~= -1 then
			-- return 
		-- end
		-- SetFubenData_Param(varMap, x700136_CSP_AREA_FLAG,1)
		-- LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700136_var_QuestId, x700136_var_FileId)
		
	-- else
	 	-- LuaCallNoclosure(700105,"PopupFubenMenu", varMap, varPlayer, varArea, x700136_var_QuestId, x700136_var_FileId)
	-- end
-- end	



-- function x700136_ProcAreaLeaved( varMap, varPlayer, varArea, varQuest )
	-- EnterAreaEventListHideNM(varMap, varPlayer)
	-- SetFubenData_Param(varMap, x700136_CSP_AREA_ID, -1)
-- end

function x700136_ProcMapTimerTick( varMap, varPlayer, varScript, varQuest )

end

