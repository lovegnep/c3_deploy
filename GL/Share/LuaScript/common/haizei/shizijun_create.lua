

x300560_var_QuestName="定点创建海贼"



x300560_var_FileId = 300560


x300560_var_SceneMonsterPosCount = 40
x300560_var_SceneMonsterCount = 30

x300560_var_SceneMonsterType = 3060
x300560_var_KillScriptId = 300561

x300560_var_ScenePos =    {
		{varX=	92.75	,	z=	122.75	},
		{varX=	98.5	,	z=	124.25	},
		{varX=	104.75	,	z=	125.25	},
		{varX=	109.25	,	z=	130	},
		{varX=	111.5	,	z=	137	},
		{varX=	111.5	,	z=	143.75	},
		{varX=	125.75	,	z=	94.5	},
		{varX=	123.5	,	z=	100.25	},
		{varX=	124.5	,	z=	106.5	},
		{varX=	130	,	z=	113.75	},
		{varX=	137.25	,	z=	114	},
		{varX=	144.75	,	z=	115.25	},
		{varX=	111	,	z=	117.75	},
		{varX=	115	,	z=	113.75	},
		{varX=	116.5	,	z=	123.5	},
		{varX=	122.5	,	z=	119.25	},
		{varX=	132	,	z=	147.5	},
		{varX=	139.75	,	z=	144.75	},
		{varX=	146	,	z=	140	},
		{varX=	140.75	,	z=	83	},
		{varX=	147	,	z=	85.75	},
		{varX=	151	,	z=	91.75	},
		{varX=	104.25	,	z=	96.5	},
		{varX=	106.25	,	z=	103	},
		{varX=	103.5	,	z=	108.75	},
		{varX=	79	,	z=	136	},
		{varX=	83.5	,	z=	142.75	},
		{varX=	90	,	z=	145.5	},
		{varX=	101	,	z=	156.75	},
		{varX=	111.75	,	z=	153.5	}

}


function x300560_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4,Param5 )

    if varMap == 19 then

		LuaCallNoclosure(x300560_var_KillScriptId, "clearKillNum",  varMap, -1, -1);
	
        for varI=1,x300560_var_SceneMonsterCount do


            
            

            
            local pos = x300560_var_ScenePos[varI]
            local monsterObj, monsterGuid = CreateMonster(varMap,x300560_var_SceneMonsterType, pos.varX,pos.z, 1,-1, x300560_var_KillScriptId,-1,21,1800*1000);
	    			HZ_MONSTER_OBJ[varI] = monsterObj
        end

   end

end



function x300560_ProcMapTimerTick( varMap, varAct, varTime )
end
