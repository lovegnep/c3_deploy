











x700213_CSP_FUBENTYPE				= 	0
x700213_CSP_SCRIPTID				=	1
x700213_CSP_TICKCOUNT				= 	2
x700213_CSP_FROMSCENEID				= 	3
x700213_CSP_ISCLOSING				= 	4
x700213_CSP_LEAVECOUNTDOWN			= 	5
x700213_CSP_TEAMID					=	6
x700213_CSP_BACKSCENEX       		=   7
x700213_CSP_BACKSCENEZ      		=   8
x700213_CSP_FUBENLEVEL			=	9
x700213_CSP_KILLCOUNT				=	20

x700213_CSP_ARRAYID					=   21
x700213_CSP_COUNT					=	22
x700213_CSP_TOTALCOUNT				=	23	
x700213_CSP_TIME_COUNT				=	24
x700213_CSP_TIME_DOWN				=	25
x700213_CSP_TIME_BACKUP				=	26
x700213_CSP_TIME_BISHEN				=	27
x700213_CSP_COUNTDOWN				=	28
x700213_CSP_NPCID					=   29

x700213_CSP_MONSTER_COUNT			=	30
x700213_CSP_MONSTERCONVCOUNT		=	31
x700213_CSP_NKILLMONSTER			=	32
x700213_CSP_MONSTERCOUNT            =   33      
x700213_CSP_TOTALBIAN				=	34
x700213_CSP_TOTALDISAPEAR			=	35
x700213_CSP_BOSSLOGIC				=	36
x700213_CSP_BONUSLOGIC				=	37
x700213_CSP_BOSSID					=	38
x700213_CSP_GROUP					=	39

x700213_CSP_START					=	40




x700213_CSP_GUID_START              =   248





x700213_var_FileId 					= 700213




x700213_var_NpcText					=	{
											"冰之灵，多疑之灵，让人失去信念！", 
											"巨之灵，慢之根，自大让人迷失！", 
											"地之灵，痴之源泉，蒙蔽人的慧心！", 
											"聚之灵，是嗔念之灵，一念地狱，一念天堂！", 
											"不要被你的欲望所困！", 
											"炎之灵，是贪欲之火！三大戒之首！", 
											"坚持住，不能倒下！", 
											"战胜最后的心魔，小心了！", 
										}

x700213_var_NeedKillMonster			=  65	



x700213_var_SubmitNPC                 =   { type =25033,guid= 150548,varX = 32, z=34, facedir = 0, title = "" }



x700213_var_Timer0                    = 1
x700213_var_Timer1                    = 2
x700213_var_Timer2                    = 3 
x700213_var_Timer3                    = 4
x700213_var_Timer4                    = 4
x700213_var_Timer5                    = 3 
x700213_var_Timer6                    = 4
x700213_var_Timer7                    = 0


x700213_var_Timer0_r                  = 4
x700213_var_Timer1_r                  = 4
x700213_var_Timer2_r                  = 12    
x700213_var_Timer3_r                  = 6
x700213_var_Timer4_r                  = 6
x700213_var_Timer5_r                  = 18    
x700213_var_Timer6_r                  = 6
x700213_var_Timer7_r                  = 12


x700213_var_CountDown					= 2


x700213_var_BossCreate				=	{
                                            {levelmin =40, levelmax=100, varName ="虚空总boss",   type= 27781,   varX=31, z=31, r=0,  ai=18, aiscript=598, facedir = 0, title = "",bonus=0},  
                                            

										}

x700213_var_MonsterCreate            =    {

                                            
                                            {levelmin =40, levelmax=100, varName ="小怪11",   type= 27773,   varX=12, z=16, r=1,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 0,group=0,time=18,bonus=0},
                                           
                                            {levelmin =40, levelmax=100, varName ="小怪12",   type= 27775,   varX=12, z=16, r=1,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 0,group=1,time=18,bonus=0},
                                           
                                            
                                            {levelmin =40, levelmax=100, varName ="小怪13",   type= 27777,   varX=12, z=16, r=1,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 0,group=2,time=18,bonus=0},
                                           
                                            
                                            {levelmin =40, levelmax=100, varName ="小怪21",   type= 27773,   varX=12, z=31, r=3,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 1,group=0,time=17,bonus=0},
                                           
                                                                                                         
                                            {levelmin =40, levelmax=100, varName ="小怪22",   type= 27775,   varX=12, z=31, r=3,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 1,group=1,time=17,bonus=0},
                                           
                                                                                                         
                                            {levelmin =40, levelmax=100, varName ="小怪23",   type= 27777,   varX=12, z=31, r=3,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 1,group=2,time=17,bonus=0},
                                            

                                            {levelmin =40, levelmax=100, varName ="虚空boss1",   type= 27779,   varX=12, z=52, r=0,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 2,group=0,time=16,bonus=0},
                                            

                                            {levelmin =40, levelmax=100, varName ="小怪31",   type= 27773,   varX=28, z=49, r=2,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 3,group=0,time=15,bonus=0},
                                           
                                                                                                                                                                                                     
                                            {levelmin =40, levelmax=100, varName ="小怪32",   type= 27775,   varX=28, z=49, r=2,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 3,group=1,time=15,bonus=0},
                                           
                                                                                                                                                                                                   
                                            {levelmin =40, levelmax=100, varName ="小怪33",   type= 27777,   varX=28, z=49, r=2,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 3,group=2,time=15,bonus=0},
                                            
                                                                                                                                                                                                  
                                            {levelmin =40, levelmax=100, varName ="小怪41",   type= 27773,   varX=40, z=17, r=4,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 7,group=0,time=14,bonus=0},
                                            
                                                                                                                                                                                                  
                                            {levelmin =40, levelmax=100, varName ="小怪42",   type= 27775,   varX=40, z=17, r=4,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 7,group=1,time=14,bonus=0},
                                           
                                            {levelmin =40, levelmax=100, varName ="小怪43",   type= 27777,   varX=40, z=17, r=4,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 7,group=2,time=14,bonus=0},
                                            
                                                                                                                                                                                                   
                                            {levelmin =40, levelmax=100, varName ="小怪51",   type= 27773,   varX=50, z=14, r=4,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 6,group=0,time=13,bonus=0},
                                            
                                                                                                                                                                                                     
                                            {levelmin =40, levelmax=100, varName ="小怪52",   type= 27775,   varX=50, z=14, r=4,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 6,group=1,time=13,bonus=0},
                                            
                                                                                                                                                                                                    
                                            {levelmin =40, levelmax=100, varName ="小怪53",   type= 27777,   varX=50, z=14, r=4,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 6,group=2,time=13,bonus=0},
                                            
                                            {levelmin =40, levelmax=100, varName ="虚空boss2",   type= 27780,   varX=50, z=33, r=0,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 5,group=0,time=12,bonus=0},
                                            
                                            {levelmin =40, levelmax=100, varName ="小怪61",   type= 27773,   varX=50, z=50, r=2,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 4,group=0,time=11,bonus=0},
                                                                                                                                                                                     
                                            {levelmin =40, levelmax=100, varName ="小怪62",   type= 27775,   varX=50, z=50, r=2,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 4,group=1,time=11,bonus=0},
                                                                                                                                                                                                                 
                                            {levelmin =40, levelmax=100, varName ="小怪63",   type= 27777,   varX=50, z=50, r=2,  ai=7, aiscript=-1, facedir = 0, title = "",varFlag = 4,group=2,time=11,bonus=0},
                                           

											
                                            {levelmin =40, levelmax=100, varName ="小怪2变身",   type= 27774,   varX=31, z=17, r=2,  ai=7, aiscript=-1, facedir = 0, title = "", varFlag=9,group=0,time=-1,bonus=0},
                                          

                                            
                                            {levelmin =40, levelmax=100, varName ="小怪1变身",   type= 27774,   varX=17, z=17, r=6,  ai=9, aiscript=-1, facedir = 0, title = "",varFlag = 10,group=0,time=-1,bonus=0},
                                                  
                                            {levelmin =40, levelmax=100, varName ="小怪1变身",   type= 27774,   varX=17, z=31, r=6,  ai=9, aiscript=-1, facedir = 0, title = "",varFlag = 11,group=0,time=-1,bonus=0},
                                              
                                            {levelmin =40, levelmax=100, varName ="小怪1变身",   type= 27774,   varX=17, z=45, r=6,  ai=9, aiscript=-1, facedir = 0, title = "",varFlag = 12,group=0,time=-1,bonus=0},
                                                     
                                            {levelmin =40, levelmax=100, varName ="小怪1变身",   type= 27774,   varX=31, z=45, r=6,  ai=9, aiscript=-1, facedir = 0, title = "",varFlag = 13,group=0,time=-1,bonus=0},
                                           
                                            {levelmin =40, levelmax=100, varName ="小怪1变身",   type= 27774,   varX=31, z=31, r=6,  ai=9, aiscript=-1, facedir = 0, title = "",varFlag = 17,group=0,time=-1,bonus=0},
                                                   
                                            {levelmin =40, levelmax=100, varName ="小怪1变身",   type= 27774,   varX=31, z=17, r=6,  ai=9, aiscript=-1, facedir = 0, title = "",varFlag = 16,group=0,time=-1,bonus=0},
                                             
                                            {levelmin =40, levelmax=100, varName ="小怪1变身",   type= 27774,   varX=46, z=17, r=6,  ai=9, aiscript=-1, facedir = 0, title = "",varFlag = 15,group=0,time=-1,bonus=0},
                                                 
                                            {levelmin =40, levelmax=100, varName ="小怪1变身",   type= 27774,   varX=46, z=31, r=6,  ai=9, aiscript=-1, facedir = 0, title = "",varFlag = 14,group=0,time=-1,bonus=0},
                                           
                                        }

x700213_var_NPCType					= 	25033

x700213_var_NpcGUID                   =   {
                                            {guid = 150000, varName = "指灵禅师"},
                                        }

x700213_var_NpcCreate					=	{
											{	hash=1, type=x700213_var_NPCType,	varX=15,	z=15,	ai=3, aiscript=-1,facedir = 0, title = "",varObj = 150000,campid = -1 },
										}
	









function x700213_ProcEventEntry(varMap, varPlayer, varTalknpc)
end







function x700213_ProcFubenSceneCreated( varMap )
	
	SetFubenData_Param(varMap, x700213_CSP_ARRAYID, -1);	

	x700213_CreateNPC( varMap);
		
end








function x700213_EnterTick(varMap, nowTickCount)

	if nowTickCount >= 6 then
	    x700213_UpdateMonsterParam( varMap )
	end
end





function x700213_CreateBoss(varMap)

	local copyscenelevel = GetFubenData_Param(varMap, x700213_CSP_FUBENLEVEL ) ;

	for varI, item in x700213_var_BossCreate do

        if item.levelmin <= copyscenelevel and item.levelmax >= copyscenelevel then
		    local bossid = 0;
			if item.title~="" then
				bossid = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, x700213_var_FileId, -1, 21, -1, item.facedir, "", item.title)
			else
				bossid = CreateMonster(varMap, item.type, item.varX, item.z, item.ai, item.aiscript, x700213_var_FileId, -1, 21, -1, item.facedir)
			end
			SetFubenData_Param( varMap, x700213_CSP_BOSSID, bossid )
		end
	end
end

function x700213_CreateNPC( varMap)
	for varI, item in x700213_var_NpcCreate do
		local varTalknpc, varTalkNpcGUID;
		
		if item.title~="" then
			varTalknpc, varTalkNpcGUID = CreateMonster( varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1, item.varObj, -1, -1, item.facedir,  "",item.title);
		else
			varTalknpc, varTalkNpcGUID = CreateMonster( varMap, item.type, item.varX, item.z, item.ai, item.aiscript, -1, item.varObj, -1, -1, item.facedir);
		end

		SetFubenData_Param( varMap, x700213_CSP_NPCID, varTalknpc);
	end
end






function x700213_SetMonsterParam( varMap, arrayId)
	local patrolId = arrayId - 1
    if arrayId == 0 then
        SetFubenData_Param(varMap, x700213_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700213_CSP_COUNT,             1                   );
	    SetFubenData_Param(varMap, x700213_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700213_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700213_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700213_CSP_TIME_DOWN,         x700213_var_Timer0    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BACKUP,       x700213_var_Timer0    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BISHEN,       x700213_var_Timer0_r  );
		SetFubenData_Param(varMap, x700213_CSP_COUNTDOWN,         x700213_var_CountDown );

		SetFubenData_Param(varMap, x700213_CSP_MONSTER_COUNT,     3                   );
    elseif arrayId == 1 then
        SetFubenData_Param(varMap, x700213_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700213_CSP_COUNT,             2                   );
	    SetFubenData_Param(varMap, x700213_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700213_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700213_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700213_CSP_TIME_DOWN,         x700213_var_Timer1    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BACKUP,       x700213_var_Timer1    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BISHEN,       x700213_var_Timer1_r  );
        SetFubenData_Param(varMap, x700213_CSP_COUNTDOWN,         x700213_var_CountDown );
		SetFubenData_Param(varMap, x700213_CSP_MONSTER_COUNT,     6                   );
		
		local varId = GetFubenData_Param( varMap, x700213_CSP_NPCID);
		NpcTalk( varMap, varId, x700213_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, patrolId);
	elseif arrayId == 2 then
        SetFubenData_Param(varMap, x700213_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700213_CSP_COUNT,             1                   );
	    SetFubenData_Param(varMap, x700213_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700213_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700213_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700213_CSP_TIME_DOWN,         x700213_var_Timer2    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BACKUP,       x700213_var_Timer2    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BISHEN,       x700213_var_Timer2_r  );
        SetFubenData_Param(varMap, x700213_CSP_COUNTDOWN,         x700213_var_CountDown );
		SetFubenData_Param(varMap, x700213_CSP_MONSTER_COUNT,     1                   );
		
		local varId = GetFubenData_Param( varMap, x700213_CSP_NPCID);
		NpcTalk( varMap, varId, x700213_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, patrolId);
	elseif arrayId == 3 then
        SetFubenData_Param(varMap, x700213_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700213_CSP_COUNT,             4                   );
	    SetFubenData_Param(varMap, x700213_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700213_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700213_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700213_CSP_TIME_DOWN,         x700213_var_Timer3    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BACKUP,       x700213_var_Timer3    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BISHEN,       x700213_var_Timer3_r  );
        SetFubenData_Param(varMap, x700213_CSP_COUNTDOWN,         x700213_var_CountDown );
		SetFubenData_Param(varMap, x700213_CSP_MONSTER_COUNT,     12                  );
		
		local varId = GetFubenData_Param( varMap, x700213_CSP_NPCID);
		NpcTalk( varMap, varId, x700213_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, patrolId);
    elseif arrayId == 4 then
        SetFubenData_Param(varMap, x700213_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700213_CSP_COUNT,             6                   );
	    SetFubenData_Param(varMap, x700213_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700213_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700213_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700213_CSP_TIME_DOWN,         x700213_var_Timer4    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BACKUP,       x700213_var_Timer4    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BISHEN,       x700213_var_Timer4_r  );
        SetFubenData_Param(varMap, x700213_CSP_COUNTDOWN,         x700213_var_CountDown );
		SetFubenData_Param(varMap, x700213_CSP_MONSTER_COUNT,     18                  );
		
		local varId = GetFubenData_Param( varMap, x700213_CSP_NPCID);
		NpcTalk( varMap, varId, x700213_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, patrolId);
    elseif arrayId == 5 then
        SetFubenData_Param(varMap, x700213_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700213_CSP_COUNT,             1                   );
	    SetFubenData_Param(varMap, x700213_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700213_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700213_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700213_CSP_TIME_DOWN,         x700213_var_Timer5    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BACKUP,       x700213_var_Timer5    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BISHEN,       x700213_var_Timer5_r  );
        SetFubenData_Param(varMap, x700213_CSP_COUNTDOWN,         x700213_var_CountDown );
		SetFubenData_Param(varMap, x700213_CSP_MONSTER_COUNT,     1                   );
		
		local varId = GetFubenData_Param( varMap, x700213_CSP_NPCID);
		NpcTalk( varMap, varId, x700213_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, patrolId);
    elseif arrayId == 6 then
        SetFubenData_Param(varMap, x700213_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700213_CSP_COUNT,             8                   );
	    SetFubenData_Param(varMap, x700213_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700213_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700213_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700213_CSP_TIME_DOWN,         x700213_var_Timer6    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BACKUP,       x700213_var_Timer6    );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BISHEN,       x700213_var_Timer6_r  );
        SetFubenData_Param(varMap, x700213_CSP_COUNTDOWN,         x700213_var_CountDown );
		SetFubenData_Param(varMap, x700213_CSP_MONSTER_COUNT,     24                  );
		
		local varId = GetFubenData_Param( varMap, x700213_CSP_NPCID);
		NpcTalk( varMap, varId, x700213_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, patrolId);

	elseif arrayId == 8 then
        SetFubenData_Param(varMap, x700213_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700213_CSP_COUNT,             1                   );
	    SetFubenData_Param(varMap, x700213_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700213_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700213_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700213_CSP_TIME_DOWN,         0                   );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BACKUP,       0                   );
        SetFubenData_Param(varMap, x700213_CSP_TIME_BISHEN,       0                   );
        SetFubenData_Param(varMap, x700213_CSP_COUNTDOWN,         x700213_var_CountDown );
		SetFubenData_Param(varMap, x700213_CSP_MONSTER_COUNT,     1                   );
		
		local varId = GetFubenData_Param( varMap, x700213_CSP_NPCID);
		NpcTalk( varMap, varId, x700213_var_NpcText[ arrayId], -1);
		
		SetPatrolId( varMap, varId, 7);
	elseif arrayId == 9 then
        SetFubenData_Param(varMap, x700213_CSP_ARRAYID,           arrayId             );
        SetFubenData_Param(varMap, x700213_CSP_COUNT,             2                   );
	    SetFubenData_Param(varMap, x700213_CSP_TOTALCOUNT,        0                   );
	    SetFubenData_Param(varMap, x700213_CSP_TIME_COUNT,        0                   );
		SetFubenData_Param(varMap, x700213_CSP_GROUP,        		0                   );
        SetFubenData_Param(varMap, x700213_CSP_TIME_DOWN,         x700213_var_Timer7	);
        SetFubenData_Param(varMap, x700213_CSP_TIME_BACKUP,       x700213_var_Timer7	);
        SetFubenData_Param(varMap, x700213_CSP_TIME_BISHEN,       x700213_var_Timer7_r	);
        SetFubenData_Param(varMap, x700213_CSP_COUNTDOWN,         0					);
		SetFubenData_Param(varMap, x700213_CSP_MONSTER_COUNT,     2                   );
	end
end





function x700213_AddMonsterParam( varMap )

    local arrayId = GetFubenData_Param(varMap, x700213_CSP_ARRAYID);					    
    local varCount  = GetFubenData_Param(varMap, x700213_CSP_COUNT);                        
    local nHaveCount = GetFubenData_Param(varMap, x700213_CSP_TOTALCOUNT);	
	local createCountdown = GetFubenData_Param(varMap, x700213_CSP_COUNTDOWN);
	local group = GetFubenData_Param(varMap, x700213_CSP_GROUP)
	if createCountdown > 0 then
		local countTime = createCountdown * 5
		local varStr = countTime.."秒后出现新的敌人！"
		ShowTips( varMap, varStr);
		SetFubenData_Param( varMap, x700213_CSP_COUNTDOWN, createCountdown - 1);
		return
	end

    
    local nTimeDown = GetFubenData_Param(varMap, x700213_CSP_TIME_DOWN ) - 1
    
    if nTimeDown > 0 and nHaveCount > 0 then
        SetFubenData_Param(varMap, x700213_CSP_TIME_DOWN, nTimeDown )
        return
    else
        local nTimeBack = GetFubenData_Param(varMap, x700213_CSP_TIME_BACKUP )
        SetFubenData_Param(varMap, x700213_CSP_TIME_DOWN, nTimeBack )
    end

    local nNeedCreate = GetFubenData_Param(varMap, x700213_CSP_MONSTER_COUNT)


    
    if nHaveCount < nNeedCreate then

        for varI = 0,varCount-1 do

            local nTotalCount = GetFubenData_Param( varMap, x700213_CSP_TOTALCOUNT )

            local pos = x700213_CSP_START + nTotalCount*3

            local varObj,varShengWang = x700213_CreateMonster( varMap,arrayId, group )
            if varObj ~= -1 then
                local nBianShen = GetFubenData_Param(varMap, x700213_CSP_TIME_BISHEN )

                SetFubenData_Param(varMap, pos + 1, varObj ) 
                SetFubenData_Param(varMap, pos + 2, 0     ) 
                SetFubenData_Param(varMap, pos + 3, nBianShen    ) 

                SetFubenData_Param(varMap, x700213_CSP_TOTALCOUNT, nTotalCount + 1 );
            end
        end
    end
	
	SetFubenData_Param(varMap, x700213_CSP_GROUP, group+1)


    
    
    
end


function x700213_BosnusMonsterLogic( varMap )
	
	local TotalBian = GetFubenData_Param( varMap, x700213_CSP_TOTALBIAN )
	local TotalDisapear = GetFubenData_Param( varMap, x700213_CSP_TOTALDISAPEAR )
	
	if TotalBian+TotalDisapear == 0 then
		local varStr = "虚空南部发生了扭曲！"
		ShowTips( varMap, varStr)
		x700213_SetMonsterParam(varMap,9)
		SetFubenData_Param(varMap,x700213_CSP_BONUSLOGIC,0)
	end	
end


function x700213_FinalBossLogic( varMap)
	
	local createCountdown = GetFubenData_Param(varMap, x700213_CSP_COUNTDOWN);
	
	if createCountdown > 0 then
		local countTime = createCountdown * 5
		local varStr = countTime.."秒后，将是最严峻的考验！"
		ShowTips( varMap, varStr);
		SetFubenData_Param( varMap, x700213_CSP_COUNTDOWN, createCountdown - 1);
		return
	end
	
	createCountdown = GetFubenData_Param(varMap, x700213_CSP_COUNTDOWN);
	if createCountdown == 0 then
		SetFubenData_Param( varMap, x700213_CSP_COUNTDOWN, -1);
		
		local varId = GetFubenData_Param( varMap, x700213_CSP_NPCID);
		DeleteMonster( varMap, varId);
		
		x700213_CreateBoss( varMap);
		
		SetFubenData_Param(varMap,x700213_CSP_BOSSLOGIC,0)
		SetFubenData_Param(varMap,x700213_CSP_BONUSLOGIC,1)
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






function x700213_UpdateMonsterParam( varMap )

    
    if GetFubenData_Param(varMap,x700213_CSP_BOSSLOGIC)==1 then
		x700213_FinalBossLogic( varMap);
        return
    end

	if GetFubenData_Param(varMap,x700213_CSP_BONUSLOGIC)==1 then
		x700213_BosnusMonsterLogic(varMap)
		return
	end

    local arrayId = GetFubenData_Param(varMap, x700213_CSP_ARRAYID);					    
    local nTotalCount = GetFubenData_Param( varMap, x700213_CSP_TOTALCOUNT )             
    local nNeedCreate = GetFubenData_Param(varMap, x700213_CSP_MONSTER_COUNT)
	local nKill = 0
	
    for varI =0, nTotalCount - 1 do

        local pos = x700213_CSP_START  + varI * 3

		
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

					local varX,z = GetMonsterPosition( varMap,OldObjId)
					
					local NewObjId = x700213_CreateMonster(varMap,arrayId + 10,0,varX,z )

					SetFubenData_Param( varMap,pos + 1,  NewObjId )
					SetFubenData_Param( varMap,pos + 2,  1 )   
					SetFubenData_Param( varMap,pos + 3, -1 )   
					
					local TotalBian = GetFubenData_Param( varMap, x700213_CSP_TOTALBIAN ) + 1
					SetFubenData_Param( varMap, x700213_CSP_TOTALBIAN, TotalBian )	
				end

            else
                local OldObjId = GetFubenData_Param( varMap,pos + 1)
                DeleteMonster( varMap,OldObjId)

                SetFubenData_Param( varMap,pos + 3, -1 )   

				local TotalDisapear = GetFubenData_Param( varMap, x700213_CSP_TOTALDISAPEAR ) + 1
				SetFubenData_Param( varMap, x700213_CSP_TOTALDISAPEAR, TotalDisapear )	
            end

            local nTimeCount = GetFubenData_Param(varMap, x700213_CSP_TIME_COUNT)  + 1
            SetFubenData_Param(varMap, x700213_CSP_TIME_COUNT, nTimeCount)

            local nRefCount = GetFubenData_Param( varMap,x700213_CSP_MONSTERCONVCOUNT ) + 1
            SetFubenData_Param( varMap,x700213_CSP_MONSTERCONVCOUNT,nRefCount )		

            
            

            
        
			
		elseif varState == 2 then
			
			nKill = nKill + 1
			local isConvert = GetFubenData_Param( varMap, pos + 3);
			if isConvert ~= -1 then
	            SetFubenData_Param( varMap, pos + 3, -1 )   

	            local nTimeCount = GetFubenData_Param(varMap, x700213_CSP_TIME_COUNT)  + 1
	            SetFubenData_Param(varMap, x700213_CSP_TIME_COUNT, nTimeCount)

	            local nRefCount = GetFubenData_Param( varMap,x700213_CSP_MONSTERCONVCOUNT ) + 1
	            SetFubenData_Param( varMap,x700213_CSP_MONSTERCONVCOUNT,nRefCount )

	            
	            
			end
        end
    end

    x700213_AddMonsterParam( varMap )

    local nTimeCount = GetFubenData_Param(varMap, x700213_CSP_TIME_COUNT)		
    if nTimeCount>=nNeedCreate or nKill>=nNeedCreate then
        x700213_SetMonsterParam( varMap,arrayId + 1 )
    end
end




function x700213_RefreshMonsterParam( varMap, varObj )

    local arrayId = GetFubenData_Param(varMap, x700213_CSP_ARRAYID);					    
    local nTotalCount = GetFubenData_Param( varMap, x700213_CSP_TOTALCOUNT )              

    for varI =0, nTotalCount - 1 do

        local pos = x700213_CSP_START  + varI * 3
        local objId_bak = GetFubenData_Param( varMap,pos + 1 )

        
        if objId_bak == varObj  then

            SetFubenData_Param( varMap,pos + 2,  2 )   
            return
        end
    end
end




function x700213_CreateMonster(varMap,varIndex,group,nx,nz)

    local copyscenelevel = GetFubenData_Param(varMap, x700213_CSP_FUBENLEVEL ) ;

	for varI, item in x700213_var_MonsterCreate do

        if item.levelmin <= copyscenelevel and item.levelmax >= copyscenelevel and item.group==group then

            if item.varFlag == varIndex then

 

                    local rx = random(-item.r,item.r)
                    local varX = item.varX + rx
                    local rz = random(-item.r,item.r)
                    local z = item.z + rz

                    if nx ~= nil and nz ~= nil then
                        varX = nx
                        z = nz
                    end
                    local varObj = 0
					
					if item.title~="" then
						varObj = CreateMonster(varMap, item.type, varX, z, item.ai, item.aiscript, x700213_var_FileId, -1, 21, -1, item.facedir, "", item.title)
					else
						varObj = CreateMonster(varMap, item.type, varX, z, item.ai, item.aiscript, x700213_var_FileId, -1, 21, -1, item.facedir)
					
					end

                    if item.varFlag < 10 then
                        local varMonsterCount = GetFubenData_Param( varMap,x700213_CSP_MONSTERCOUNT) + 1
                        SetFubenData_Param( varMap,x700213_CSP_MONSTERCOUNT,varMonsterCount)
                    end
                    return varObj,item.bonus


            end
        end
	end

    return -1,0

end

function x700213_GetBonus(nDataID)

	for varI,item in x700213_var_MonsterCreate do
		if item.type==nDataID then
			return item.bonus
		end
	end
	
	for varI,item in x700213_var_BossCreate do
		if item.type==nDataID then
			return item.bonus
		end
	end
	
	return 0
end

function x700213_ProcDie(varMap, varPlayer, varKiller)
	local nDieCount = GetFubenData_Param(varMap, x700213_CSP_KILLCOUNT)
	SetFubenData_Param(varMap, x700213_CSP_KILLCOUNT, nDieCount+1);
	SetFubenData_Param(varMap, x700213_CSP_NKILLMONSTER, nDieCount+1);
	local bossid = GetFubenData_Param(varMap, x700213_CSP_BOSSID)
	local arrayId = GetFubenData_Param(varMap, x700213_CSP_ARRAYID);
	local varShengWang = 0
	
	nDieCount = nDieCount+1;
	
	local nTotalCount = GetFubenData_Param( varMap, x700213_CSP_TOTALCOUNT )
	for varI =0, nTotalCount - 1 do
		local pos = x700213_CSP_START  + varI * 3
		local varObj = GetFubenData_Param( varMap,pos + 1 )
		if varObj==varPlayer then
			SetFubenData_Param( varMap,pos + 2,  2 )   
		end
	end

	
	local TotalDisapear = GetFubenData_Param( varMap, x700213_CSP_TOTALDISAPEAR )
	if x700213_var_NeedKillMonster == nDieCount+TotalDisapear then
		x700213_SetMonsterParam( varMap, 8)
		SetFubenData_Param(varMap,x700213_CSP_BOSSLOGIC,1)
	end
	
	
	if bossid==varPlayer then
		x700213_ProcAllMonsterDead( varMap) 

		

























			
			
			
			
	end

	local nDataID = GetMonsterDataID(varMap,varPlayer)
	varShengWang = x700213_GetBonus(nDataID)

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

function x700213_ProcQuestObjectKilled(varMap, varPlayer, varObjData ,varObj, varQuest )
	
end

function x700213_ProcAllMonsterDead( varMap)
	x700213_CreateSubmitNpc( varMap)
end

function x700213_CreateSubmitNpc( varMap)

	 if x700213_var_SubmitNPC.title~="" then
		CreateMonster(varMap, x700213_var_SubmitNPC.type, x700213_var_SubmitNPC.varX, x700213_var_SubmitNPC.z, 3, 0, -1, x700213_var_SubmitNPC.guid, -1, -1, x700213_var_SubmitNPC.facedir, "",x700213_var_SubmitNPC.title )
	 else
		CreateMonster(varMap, x700213_var_SubmitNPC.type, x700213_var_SubmitNPC.varX, x700213_var_SubmitNPC.z, 3, 0, -1, x700213_var_SubmitNPC.guid, -1, -1, x700213_var_SubmitNPC.facedir)
	 end
end







function x700213_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x700213_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )
end






