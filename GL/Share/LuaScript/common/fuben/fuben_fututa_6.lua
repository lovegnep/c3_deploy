











x700013_CSP_FUBENTYPE				= 	0
x700013_CSP_SCRIPTID				=	1
x700013_CSP_TICKCOUNT				= 	2
x700013_CSP_FROMSCENEID				= 	3
x700013_CSP_ISCLOSING				= 	4
x700013_CSP_LEAVECOUNTDOWN			= 	5
x700013_CSP_TEAMID					=	6
x700013_CSP_BACKSCENEX       		=   7
x700013_CSP_BACKSCENEZ      		=   8
x700013_CSP_FUBENLEVEL			=	9


x700013_CSP_ARRAYID					=   21
x700013_CSP_COUNT					=	23
x700013_CSP_TOTALCOUNT				=	24	
x700013_CSP_TIME_COUNT				=	25
x700013_CSP_TIME_DOWN				=	26
x700013_CSP_TIME_BACKUP				=	27
x700013_CSP_TIME_BISHEN				=	28
x700013_CSP_COUNTDOWN				=	29
x700013_CSP_NPCID					=   30

x700013_CSP_MONSTER_COUNT			=	31
x700013_CSP_MONSTERCONVCOUNT		=	32
x700013_CSP_NKILLMONSTER			=	33
x700013_CSP_MONSTERCOUNT            =   34      
x700013_CSP_TOTALBIAN				=	35
x700013_CSP_TOTALDISAPEAR			=	36
x700013_CSP_BOSSLOGIC				=	37
x700013_CSP_BONUSLOGIC				=	38
x700013_CSP_BOSSID					=	39
x700013_CSP_GROUP					=	40
x700013_CSP_KILLCOUNT				=	41
x700013_CSP_START					=	51

x700013_CSP_B_BIANSHEN				=	238
x700013_CSP_XIANJINBOSS				=	239


x700013_CSP_GUID_START              =   248  
x700013_CSP_FUBEN_TYPE				=	254	
x700013_CSP_FUBEN_MODE				=   255 





x700013_var_FileId 					= 700013



x700013_var_NpcText					=	{
											"冰之灵，多疑之灵，让人失去信念！", 
											"巨之灵，慢之根，自大让人迷失！", 
											"地之灵，痴之源泉，蒙蔽人的慧心！", 
											"聚之灵，是嗔念之灵，一念地狱，一念天堂！", 
											"不要被你的欲望所困！", 
											"炎之灵，是贪欲之火！三大戒之首！", 
											"坚持住，不能倒下！", 
											"战胜最后的心魔，小心了！", 
										}

x700013_var_NeedKillMonster			=  65	

x700013_var_SubmitNPC                 =   { type =25033,guid= 150533,varX = 32, z=34, facedir = 0, title = "" }



x700013_var_Timer0                    = 1
x700013_var_Timer1                    = 2
x700013_var_Timer2                    = 3 
x700013_var_Timer3                    = 4
x700013_var_Timer4                    = 4
x700013_var_Timer5                    = 3 
x700013_var_Timer6                    = 4
x700013_var_Timer7                    = 0


x700013_var_Timer0_r                  = 4
x700013_var_Timer1_r                  = 4
x700013_var_Timer2_r                  = 12    
x700013_var_Timer3_r                  = 6
x700013_var_Timer4_r                  = 6
x700013_var_Timer5_r                  = 18    
x700013_var_Timer6_r                  = 6
x700013_var_Timer7_r                  = 12


x700013_var_CountDown					= 2



x700013_var_NPCType					= 	25033

x700013_var_NpcGUID                   =   {
                                            {guid = 150000, varName = "指灵禅师"},
                                        }

x700013_var_NpcCreate					=	{
											{	hash=1, type=x700013_var_NPCType,	varX=15,	z=15,	ai=3, aiscript=-1,facedir = 0, title = "",varObj = 150000,campid = -1 },
										}
	








function x700013_ProcEventEntry(varMap, varPlayer, varTalknpc)
	
end



function x700013_ShowTips(varMap, varPlayer, varStr)
	StartTalkTask(varMap);
		TalkAppendString(varMap,varStr);
	StopTalkTask();
	DeliverTalkTips(varMap, varPlayer);
end

function x700013_ShowTipsToAll(varMap, varStr)

	local humancount = GetFuben_PlayerCount(varMap);

	
	for varI = 0, humancount - 1 do
		local humanId = GetFuben_PlayerObjId(varMap, varI);
		
		StartTalkTask(varMap);
			TalkAppendString(varMap,varStr);
		StopTalkTask();
		DeliverTalkTips(varMap, humanId);
	end
end






function x700013_ProcFubenSceneCreated( varMap )
	
	SetFubenData_Param(varMap, x700013_CSP_XIANJINBOSS, -1 )
	SetFubenData_Param( varMap, x700013_CSP_B_BIANSHEN, 0);
	SetFubenData_Param(varMap, x700013_CSP_ARRAYID, -1);	

	x700013_CreateNPC( varMap);


end

function x700013_EnterTick(varMap, nowTickCount)
	if nowTickCount >= 2 then
		x700013_UpdateMonsterParam( varMap )
	end

	local nTotalCount = GetFubenData_Param( varMap, 24 )

	local TotalDisapear = GetFubenData_Param( varMap, 36 )

	local nArray = GetFubenData_Param( varMap, 21 )

	local nMonsterCount = GetFubenData_Param(varMap, x700013_CSP_MONSTER_COUNT,     31);
	local nDieCount = GetFubenData_Param(varMap, x700013_CSP_KILLCOUNT)

	
end



function x700013_CreateBoss(varMap)

	local fubenlevel = GetFubenData_Param(varMap, x700013_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700013_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700013_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700013_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700013_var_FileId,nIndexFrom,varI)
		if idScript == x700013_var_FileId and monsterFlag == 1 and levelmin <= fubenlevel and levelmax >= fubenlevel and nFubenType == varFlag3 then
		    local bossid = 0;
			if title~="" then
				bossid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700013_var_FileId, -1, 21, -1, facedir, "", title)
			else
				bossid = CreateMonster(varMap, type, varX, z, ai, aiscript, x700013_var_FileId, -1, 21, -1, facedir)
			end
			SetFubenData_Param( varMap, x700013_CSP_BOSSID, bossid )
			
		end
	end
end



function x700013_CreateNPC( varMap)
	for varI, item in x700013_var_NpcCreate do
		local varTalknpc, varTalkNpcGUID;
		
		if item.title~="" then
			varTalknpc, varTalkNpcGUID = CreateMonster( varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1, item.varObj, -1, -1, item.facedir,  "",item.title);
		else
			varTalknpc, varTalkNpcGUID = CreateMonster( varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1, item.varObj, -1, -1, item.facedir);
		end

		SetFubenData_Param( varMap, x700013_CSP_NPCID, varTalknpc);
	end
end






function x700013_SetMonsterParam( varMap, arrayId)
	local patrolId = arrayId - 1
    if arrayId == 0 then
        SetFubenData_Param(varMap, x700013_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700013_CSP_COUNT,             1                   );
	    SetFubenData_Param(varMap, x700013_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700013_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700013_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700013_CSP_TIME_DOWN,         x700013_var_Timer0    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BACKUP,       x700013_var_Timer0    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BISHEN,       x700013_var_Timer0_r  );
		SetFubenData_Param(varMap, x700013_CSP_COUNTDOWN,         x700013_var_CountDown );

		SetFubenData_Param(varMap, x700013_CSP_MONSTER_COUNT,     3                   );
    elseif arrayId == 1 then
        SetFubenData_Param(varMap, x700013_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700013_CSP_COUNT,             2                   );
	    SetFubenData_Param(varMap, x700013_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700013_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700013_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700013_CSP_TIME_DOWN,         x700013_var_Timer1    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BACKUP,       x700013_var_Timer1    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BISHEN,       x700013_var_Timer1_r  );
        SetFubenData_Param(varMap, x700013_CSP_COUNTDOWN,         x700013_var_CountDown );
		SetFubenData_Param(varMap, x700013_CSP_MONSTER_COUNT,     6                   );
		
		local varId = GetFubenData_Param( varMap, x700013_CSP_NPCID);
		NpcTalk( varMap, varId, x700013_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, patrolId);
	elseif arrayId == 2 then
        SetFubenData_Param(varMap, x700013_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700013_CSP_COUNT,             1                   );
	    SetFubenData_Param(varMap, x700013_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700013_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700013_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700013_CSP_TIME_DOWN,         x700013_var_Timer2    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BACKUP,       x700013_var_Timer2    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BISHEN,       x700013_var_Timer2_r  );
        SetFubenData_Param(varMap, x700013_CSP_COUNTDOWN,         x700013_var_CountDown );
		SetFubenData_Param(varMap, x700013_CSP_MONSTER_COUNT,     1                   );
		
		local varId = GetFubenData_Param( varMap, x700013_CSP_NPCID);
		NpcTalk( varMap, varId, x700013_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, patrolId);
	elseif arrayId == 3 then
        SetFubenData_Param(varMap, x700013_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700013_CSP_COUNT,             4                   );
	    SetFubenData_Param(varMap, x700013_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700013_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700013_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700013_CSP_TIME_DOWN,         x700013_var_Timer3    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BACKUP,       x700013_var_Timer3    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BISHEN,       x700013_var_Timer3_r  );
        SetFubenData_Param(varMap, x700013_CSP_COUNTDOWN,         x700013_var_CountDown );
		SetFubenData_Param(varMap, x700013_CSP_MONSTER_COUNT,     12                  );
		
		local varId = GetFubenData_Param( varMap, x700013_CSP_NPCID);
		NpcTalk( varMap, varId, x700013_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, patrolId);
    elseif arrayId == 4 then
        SetFubenData_Param(varMap, x700013_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700013_CSP_COUNT,             6                   );
	    SetFubenData_Param(varMap, x700013_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700013_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700013_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700013_CSP_TIME_DOWN,         x700013_var_Timer4    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BACKUP,       x700013_var_Timer4    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BISHEN,       x700013_var_Timer4_r  );
        SetFubenData_Param(varMap, x700013_CSP_COUNTDOWN,         x700013_var_CountDown );
		SetFubenData_Param(varMap, x700013_CSP_MONSTER_COUNT,     18                  );
		
		local varId = GetFubenData_Param( varMap, x700013_CSP_NPCID);
		NpcTalk( varMap, varId, x700013_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, patrolId);
    elseif arrayId == 5 then
        SetFubenData_Param(varMap, x700013_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700013_CSP_COUNT,             1                   );
	    SetFubenData_Param(varMap, x700013_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700013_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700013_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700013_CSP_TIME_DOWN,         x700013_var_Timer5    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BACKUP,       x700013_var_Timer5    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BISHEN,       x700013_var_Timer5_r  );
        SetFubenData_Param(varMap, x700013_CSP_COUNTDOWN,         x700013_var_CountDown );
		SetFubenData_Param(varMap, x700013_CSP_MONSTER_COUNT,     1                   );
		
		local varId = GetFubenData_Param( varMap, x700013_CSP_NPCID);
		NpcTalk( varMap, varId, x700013_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, patrolId);
    elseif arrayId == 6 then
        SetFubenData_Param(varMap, x700013_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700013_CSP_COUNT,             8                   );
	    SetFubenData_Param(varMap, x700013_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700013_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700013_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700013_CSP_TIME_DOWN,         x700013_var_Timer6    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BACKUP,       x700013_var_Timer6    );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BISHEN,       x700013_var_Timer6_r  );
        SetFubenData_Param(varMap, x700013_CSP_COUNTDOWN,         x700013_var_CountDown );
		SetFubenData_Param(varMap, x700013_CSP_MONSTER_COUNT,     24                  );
		
		local varId = GetFubenData_Param( varMap, x700013_CSP_NPCID);
		NpcTalk( varMap, varId, x700013_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, patrolId);

	elseif arrayId == 8 then
        SetFubenData_Param(varMap, x700013_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700013_CSP_COUNT,             1                   );
	    SetFubenData_Param(varMap, x700013_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700013_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700013_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700013_CSP_TIME_DOWN,         0                   );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BACKUP,       0                   );
        SetFubenData_Param(varMap, x700013_CSP_TIME_BISHEN,       0                   );
        SetFubenData_Param(varMap, x700013_CSP_COUNTDOWN,         x700013_var_CountDown );
		SetFubenData_Param(varMap, x700013_CSP_MONSTER_COUNT,     1                   );
		
		local varId = GetFubenData_Param( varMap, x700013_CSP_NPCID);
		NpcTalk( varMap, varId, x700013_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, 7);
	elseif arrayId == 9 then
        SetFubenData_Param(varMap, x700013_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700013_CSP_COUNT,             6                   );
	    SetFubenData_Param(varMap, x700013_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700013_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700013_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700013_CSP_TIME_DOWN,         x700013_var_Timer7	);
        SetFubenData_Param(varMap, x700013_CSP_TIME_BACKUP,       x700013_var_Timer7	);
        SetFubenData_Param(varMap, x700013_CSP_TIME_BISHEN,       x700013_var_Timer7_r	);
        SetFubenData_Param(varMap, x700013_CSP_COUNTDOWN,         0					);
		SetFubenData_Param(varMap, x700013_CSP_MONSTER_COUNT,     6                   );
	end
end





function x700013_AddMonsterParam( varMap )

    local arrayId = GetFubenData_Param(varMap, x700013_CSP_ARRAYID);					    
    local varCount  = GetFubenData_Param(varMap, x700013_CSP_COUNT);                        
    local nHaveCount = GetFubenData_Param(varMap, x700013_CSP_TOTALCOUNT);	
	local createCountdown = GetFubenData_Param(varMap, x700013_CSP_COUNTDOWN);
	local group = GetFubenData_Param(varMap, x700013_CSP_GROUP)
	if createCountdown > 0 then
		local countTime = createCountdown * 5
		local varStr = countTime.."秒后出现新的敌人！"
		ShowTips( varMap, varStr);
		SetFubenData_Param( varMap, x700013_CSP_COUNTDOWN, createCountdown - 1);
		return
	end

    
    local nTimeDown = GetFubenData_Param(varMap, x700013_CSP_TIME_DOWN ) - 1
    
    if nTimeDown > 0 and nHaveCount > 0 then
        SetFubenData_Param(varMap, x700013_CSP_TIME_DOWN, nTimeDown )
        return
    else
        local nTimeBack = GetFubenData_Param(varMap, x700013_CSP_TIME_BACKUP )
        SetFubenData_Param(varMap, x700013_CSP_TIME_DOWN, nTimeBack )
    end

    local nNeedCreate = GetFubenData_Param(varMap, x700013_CSP_MONSTER_COUNT)


    
    if nHaveCount < nNeedCreate then

        for varI = 0,varCount-1 do

            local nTotalCount = GetFubenData_Param( varMap, x700013_CSP_TOTALCOUNT )

            local pos = x700013_CSP_START + nTotalCount*3

            local varObj,varShengWang = x700013_CreateMonster( varMap,arrayId, group )
            if varObj ~= -1 then
                local nBianShen = GetFubenData_Param(varMap, x700013_CSP_TIME_BISHEN )

                SetFubenData_Param(varMap, pos + 1, varObj ) 
                SetFubenData_Param(varMap, pos + 2, 0     ) 
                SetFubenData_Param(varMap, pos + 3, nBianShen    ) 

                SetFubenData_Param(varMap, x700013_CSP_TOTALCOUNT, nTotalCount + 1 );
            end
        end
    end
	
	SetFubenData_Param(varMap, x700013_CSP_GROUP, group+1)


    
    
    
end


function x700013_BosnusMonsterLogic( varMap )
	
	local TotalBian = GetFubenData_Param( varMap, x700013_CSP_TOTALBIAN )
	local TotalDisapear = GetFubenData_Param( varMap, x700013_CSP_TOTALDISAPEAR )
	
	if TotalBian+TotalDisapear == 0 then
		local varStr = "尽快消灭心魔，虚空南部即将发生扭曲！"
		ShowTips( varMap, varStr)
		x700013_SetMonsterParam(varMap,9)
		SetFubenData_Param(varMap,x700013_CSP_BONUSLOGIC,0)
	end	
end


function x700013_FinalBossLogic( varMap)
	
	local createCountdown = GetFubenData_Param(varMap, x700013_CSP_COUNTDOWN);
	
	if createCountdown > 0 then
		local countTime = createCountdown * 5
		local varStr = countTime.."秒后，将是最严峻的考验！"
		ShowTips( varMap, varStr);
		SetFubenData_Param( varMap, x700013_CSP_COUNTDOWN, createCountdown - 1);
		return
	end
	
	createCountdown = GetFubenData_Param(varMap, x700013_CSP_COUNTDOWN);
	if createCountdown == 0 then
		SetFubenData_Param( varMap, x700013_CSP_COUNTDOWN, -1);
		
		local varId = GetFubenData_Param( varMap, x700013_CSP_NPCID);
		DeleteMonster( varMap, varId);
		
		x700013_CreateBoss( varMap);

		SetFubenData_Param( varMap, x700013_CSP_B_BIANSHEN, 1);
		
		SetFubenData_Param(varMap,x700013_CSP_BOSSLOGIC,0)
		SetFubenData_Param(varMap,x700013_CSP_BONUSLOGIC,1)
	end
end

function ShowTips( varMap,varMsg )

    if varMsg == nil then
        return
    end

    local humancount = GetFuben_PlayerCount(varMap);
    for varI = 0, humancount - 1 do

        local humanId = GetFuben_PlayerObjId(varMap, varI);	

        StartTalkTask(varMap);
            TalkAppendString(varMap, varMsg);
        StopTalkTask();
        DeliverTalkTips(varMap, humanId);

    end
end






function x700013_UpdateMonsterParam( varMap )

    
    if GetFubenData_Param(varMap,x700013_CSP_BOSSLOGIC)==1 then
		x700013_FinalBossLogic( varMap);
        return
    end

	if GetFubenData_Param(varMap,x700013_CSP_BONUSLOGIC)==1 then
		x700013_BosnusMonsterLogic(varMap)
		return
	end

    local arrayId = GetFubenData_Param(varMap, x700013_CSP_ARRAYID);					    
    local nTotalCount = GetFubenData_Param( varMap, x700013_CSP_TOTALCOUNT )             
    local nNeedCreate = GetFubenData_Param(varMap, x700013_CSP_MONSTER_COUNT)
	local nKill = 0
	
    for varI =0, nTotalCount - 1 do

        local pos = x700013_CSP_START  + varI * 3

		
        local varObj = GetFubenData_Param( varMap,pos + 1 )
		
        local varState = GetFubenData_Param( varMap,pos + 2 )
		
        local tme   = GetFubenData_Param( varMap,pos + 3 )

        if tme > 0 then
            tme = tme - 1
        end
        SetFubenData_Param( varMap,pos + 3, tme )

		
		if tme==6 and varState==0 then
			if arrayId==2 or arrayId==5 then
				ShowTips(varMap,"30秒后敌人将逃离虚空，你也会一无所获！")
			end
		end		
		
		
		if tme==4 and varState==0 then
			if arrayId==2 or arrayId==5 then
				ShowTips(varMap,"20秒后敌人将逃离虚空，你也会一无所获！")
			end
		end
		
		
		if tme==2 and varState==0 then
			if arrayId==2 or arrayId==5 then
				ShowTips(varMap,"10秒后敌人将逃离虚空，你也会一无所获！")
			end			
		end		
		
        
        if tme == 0 and varState == 0  then
			
            if arrayId ~= 2 and arrayId ~= 5 and arrayId~=9 then
				
                local OldObjId = GetFubenData_Param( varMap,pos + 1)

				if OldObjId>0 then
				
					DeleteMonster( varMap,OldObjId)  

					SetFubenData_Param( varMap, x700013_CSP_B_BIANSHEN, 1);

					local varX,z = GetMonsterPosition( varMap,OldObjId)
					
					local NewObjId = x700013_CreateMonster(varMap,arrayId + 10,0,varX,z )

					SetFubenData_Param( varMap,pos + 1,  NewObjId )
					SetFubenData_Param( varMap,pos + 2,  1 )   
					SetFubenData_Param( varMap,pos + 3, -1 )   
					
					local TotalBian = GetFubenData_Param( varMap, x700013_CSP_TOTALBIAN ) + 1
					SetFubenData_Param( varMap, x700013_CSP_TOTALBIAN, TotalBian )	
				end

            else  
                local OldObjId = GetFubenData_Param( varMap,pos + 1)
                DeleteMonster( varMap,OldObjId)  

				SetFubenData_Param( varMap, x700013_CSP_B_BIANSHEN, 1);

                SetFubenData_Param( varMap,pos + 3, -1 )   

				local TotalDisapear = GetFubenData_Param( varMap, x700013_CSP_TOTALDISAPEAR ) + 1
				SetFubenData_Param( varMap, x700013_CSP_TOTALDISAPEAR, TotalDisapear )	
            end

            local nTimeCount = GetFubenData_Param(varMap, x700013_CSP_TIME_COUNT)  + 1
            SetFubenData_Param(varMap, x700013_CSP_TIME_COUNT, nTimeCount)

            local nRefCount = GetFubenData_Param( varMap,x700013_CSP_MONSTERCONVCOUNT ) + 1
            SetFubenData_Param( varMap,x700013_CSP_MONSTERCONVCOUNT,nRefCount )		

            
            

            
        
			
		elseif varState == 2 then
			
			nKill = nKill + 1
			local isConvert = GetFubenData_Param( varMap, pos + 3);
			if isConvert ~= -1 then
	            SetFubenData_Param( varMap, pos + 3, -1 )   

	            local nTimeCount = GetFubenData_Param(varMap, x700013_CSP_TIME_COUNT)  + 1
	            SetFubenData_Param(varMap, x700013_CSP_TIME_COUNT, nTimeCount)

	            local nRefCount = GetFubenData_Param( varMap,x700013_CSP_MONSTERCONVCOUNT ) + 1
	            SetFubenData_Param( varMap,x700013_CSP_MONSTERCONVCOUNT,nRefCount )

	            
	            
			end
        end
    end

    x700013_AddMonsterParam( varMap )

    local nTimeCount = GetFubenData_Param(varMap, x700013_CSP_TIME_COUNT)		
    if nTimeCount>=nNeedCreate or nKill>=nNeedCreate then
        x700013_SetMonsterParam( varMap,arrayId + 1 )
    end
end




function x700013_RefreshMonsterParam( varMap, varObj )

    local arrayId = GetFubenData_Param(varMap, x700013_CSP_ARRAYID);					    
    local nTotalCount = GetFubenData_Param( varMap, x700013_CSP_TOTALCOUNT )              

    for varI =0, nTotalCount - 1 do

        local pos = x700013_CSP_START  + varI * 3
        local objId_bak = GetFubenData_Param( varMap,pos + 1 )

        
        if objId_bak == varObj  then

            SetFubenData_Param( varMap,pos + 2,  2 )   
            return
        end
    end
end




function x700013_CreateMonster(varMap,varIndex,group,nx,nz)

    local fubenlevel = GetFubenData_Param(varMap, x700013_CSP_FUBENLEVEL )
	local nFubenType = GetFubenData_Param(varMap, x700013_CSP_FUBEN_TYPE)
	local nIndexFrom = GetFubenDataPosByScriptID(x700013_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700013_var_FileId )
	
	for varI = 0,nDataCount-1 do

		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,x1,z1,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700013_var_FileId,nIndexFrom,varI)
		if idScript == x700013_var_FileId and monsterFlag == 2 and levelmin <= fubenlevel and levelmax >= fubenlevel and varFlag1==group and nFubenType == varFlag3 then

        
            if varFlag == varIndex then

 

                    local rx = random(-r,r)
                    local varX = x1 + rx
                    local rz = random(-r,r)
                    local z = z1 + rz

                    if nx ~= nil and nz ~= nil then
                        varX = nx
                        z = nz
                    end
                    local varObj = 0
					
					if title~="" then
						varObj = CreateMonster(varMap, type, varX, z, ai, aiscript, x700013_var_FileId, -1, 21, -1, facedir, "", title)
					else
						varObj = CreateMonster(varMap, type, varX, z, ai, aiscript, x700013_var_FileId, -1, 21, -1, facedir)
					
					end


                    if varFlag < 10 then
                        local varMonsterCount = GetFubenData_Param( varMap,x700013_CSP_MONSTERCOUNT) + 1
                        SetFubenData_Param( varMap,x700013_CSP_MONSTERCOUNT,varMonsterCount)
                    end
                    return varObj,varFlag3


            end
        end
	end

    return -1,0

end

function x700013_GetBonus(nDataID)


	local nIndexFrom = GetFubenDataPosByScriptID(x700013_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700013_var_FileId )
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700013_var_FileId,nIndexFrom,varI)
		if idScript == x700013_var_FileId and monsterFlag == 2 then
			if type==nDataID then
				return varFlag3
			end
		end
	end
	
	
	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700013_var_FileId,nIndexFrom,varI)
		if idScript == x700013_var_FileId and monsterFlag == 1 then
			if type==nDataID then
				return varFlag3
			end
		end
	end
	
	return 0
end

function x700013_ProcDie(varMap, varPlayer, varKiller)

	local xianjinboss = GetFubenData_Param(varMap, x700013_CSP_XIANJINBOSS)
	if xianjinboss == varPlayer then
		local humancount = GetFuben_PlayerCount(varMap);

	
		for varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI);
			if GetLevel(varMap, humanId) >= 80 then
				local refixInhExp = AddInherenceExp(varMap, humanId, 600)
				local varStr = format("你获得了%d点天赋值", refixInhExp)
				StartTalkTask(varMap);
					TalkAppendString(varMap,varStr);
				StopTalkTask();
				DeliverTalkTips(varMap, humanId)
			end
		end
	end
	
	
	local nDieCount = GetFubenData_Param(varMap, x700013_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700013_CSP_KILLCOUNT, nDieCount+1);
	SetFubenData_Param(varMap, x700013_CSP_NKILLMONSTER, nDieCount+1);
	local bossid = GetFubenData_Param(varMap, x700013_CSP_BOSSID)
	local arrayId = GetFubenData_Param(varMap, x700013_CSP_ARRAYID);
	local varShengWang = 0
	
	nDieCount = nDieCount+1;
	
	local nTotalCount = GetFubenData_Param( varMap, x700013_CSP_TOTALCOUNT )
	for varI =0, nTotalCount - 1 do
		local pos = x700013_CSP_START  + varI * 3
		local varObj = GetFubenData_Param( varMap,pos + 1 )
		if varObj==varPlayer then
			SetFubenData_Param( varMap,pos + 2,  2 )   
		end
	end

	
	local TotalDisapear = GetFubenData_Param( varMap, x700013_CSP_TOTALDISAPEAR )
	if x700013_var_NeedKillMonster == nDieCount+TotalDisapear then
		x700013_SetMonsterParam( varMap, 8)
		SetFubenData_Param(varMap,x700013_CSP_BOSSLOGIC,1)
	end
	
	
	if bossid==varPlayer then
		x700013_ProcAllMonsterDead( varMap) 

		

























			
			
			
			
	end

	local nFubenType = GetFubenData_Param(varMap, x700013_CSP_FUBEN_TYPE)
	if nFubenType == 0 then
		local nDataID = GetMonsterDataID(varMap,varPlayer)
		varShengWang = x700013_GetBonus(nDataID)
	
		local humancount = GetFuben_PlayerCount(varMap);
		for	varI = 0, humancount - 1 do
			local humanId = GetFuben_PlayerObjId(varMap, varI);
			
			
			
			
			
			
			
			if varShengWang>0 then
				local nOldValue = GetShengWang( varMap, humanId )
				SetShengWang( varMap, humanId, nOldValue+varShengWang )
				Msg2Player(varMap,humanId,"获得声望"..varShengWang,8,2)
			end		
		end
	end
end

function x700013_ProcQuestObjectKilled(varMap, varPlayer, varObjData ,varObj, varQuest )
	
end

function x700013_ProcAllMonsterDead( varMap)
	x700013_CreateSubmitNpc( varMap)
end

function x700013_CreateSubmitNpc( varMap)

	 if x700013_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700013_var_SubmitNPC.type, x700013_var_SubmitNPC.varX, x700013_var_SubmitNPC.z, 3, 0, -1, x700013_var_SubmitNPC.guid, -1, -1, x700013_var_SubmitNPC.facedir, "",x700013_var_SubmitNPC.title )
	 else
		CreateMonster(varMap, x700013_var_SubmitNPC.type, x700013_var_SubmitNPC.varX, x700013_var_SubmitNPC.z, 3, 0, -1, x700013_var_SubmitNPC.guid, -1, -1, x700013_var_SubmitNPC.facedir)
	 end

	 
	 x700013_CreateXianJinBoss(varMap)
	 

	 LuaCallNoclosure( 701113, "ProcSceneBossDie", varMap, 1)

	 local bBianShen = GetFubenData_Param( varMap, x700013_CSP_B_BIANSHEN);

	 if bBianShen<=0 then
		LuaCallNoclosure( 701114, "ProcSceneBossDie", varMap, 1)
	 end
end





function x700013_CreateXianJinBoss(varMap)
	local nFubenType = GetFubenData_Param(varMap, x700013_CSP_FUBEN_TYPE)
	if nFubenType ~= 0 then
		return
	end
	
	local nFubenMode = GetFubenData_Param(varMap, x700013_CSP_FUBEN_MODE)

	if nFubenMode == 0 then
	  return
	end

	local fubenlevel = GetFubenData_Param(varMap, x700013_CSP_FUBENLEVEL ) ;
	
	local nIndexFrom = GetFubenDataPosByScriptID(x700013_var_FileId)
	local nDataCount = GetFubenDataCountByScriptID( x700013_var_FileId )

	for varI = 0,nDataCount-1 do
		
		local idScript,monsterFlag,indexFlag,levelmin,levelmax,varName,title,type,guid,varX,z,r,ai,aiscript,varFlag,varFlag1,varFlag2,varFlag3,varCount,facedir,patrolid,camp = GetFubenDataByScriptID_Pos_Index(x700013_var_FileId,nIndexFrom,varI)
		if idScript == x700013_var_FileId and monsterFlag == 0 and levelmin <= fubenlevel and levelmax >= fubenlevel then

			local varRet = 0;
			if title~="" then
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700013_var_FileId, -1, 21,-1,facedir,"",title)
			else
				varRet = CreateMonster(varMap, type, varX, z, ai, aiscript, x700013_var_FileId, -1, 21,-1,facedir)
			end
			SetFubenData_Param(varMap, x700013_CSP_XIANJINBOSS, varRet )
		end
	end

	x700013_ShowTipsToAll(varMap, "翻番宝箱出现！")
end


