

x300550_var_QuestName="定点创建海贼"



x300550_var_FileId = 300550


x300550_var_SceneMonsterPosCount = 40
x300550_var_SceneMonsterCount = 30

x300550_var_SceneMonsterType = 3060
x300550_var_KillScriptId = 300551

x300550_var_ScenePos =    {
		{varX=	73.950119	,	z=	289.453552	},
		{varX=	79.042709	,	z=	295.240601	},
		{varX=	82.283447	,	z=	299.407257	},
		{varX=	83.440857	,	z=	303.342468	},
		{varX=	85.987152	,	z=	310.05542	},
		{varX=	87.607521	,	z=	317.694305	},
		{varX=	88.996414	,	z=	322.55542	},
		{varX=	92.005669	,	z=	306.351715	},
		{varX=	93.394562	,	z=	311.444305	},
		{varX=	96.6353	,	z=	315.842468	},
		{varX=	76.033447	,	z=	301.953552	},
		{varX=	78.57975	,	z=	307.740601	},
		{varX=	80.431595	,	z=	313.064667	},
		{varX=	81.126045	,	z=	317.925781	},
		{varX=	81.820488	,	z=	322.092468	},
		{varX=	80.431595	,	z=	327.185059	},
		{varX=	78.116783	,	z=	332.046143	},
		{varX=	71.403824	,	z=	329.036896	},
		{varX=	73.950119	,	z=	325.101685	},
		{varX=	71.866783	,	z=	319.314697	},
		{varX=	74.876045	,	z=	314.222076	},
		{varX=	74.644562	,	z=	307.740601	},
		{varX=	69.089005	,	z=	301.722076	},
		{varX=	91.079742	,	z=	301.027649	},
		{varX=	96.6353	,	z=	307.277649	},
		{varX=	100.570488	,	z=	312.601715	},
		{varX=	103.579742	,	z=	316.768372	},
		{varX=	104.274193	,	z=	323.249878	},
		{varX=	98.950119	,	z=	327.185059	},
		{varX=	92.005669	,	z=	326.953552	}

}


function x300550_ProcTimerDoingStart( varMap, varAct, varParam1, varParam2, varParam3, varParam4,Param5 )

    if varMap == 50 or varMap == 150 or varMap == 250 or varMap == 350 then

		LuaCallNoclosure(x300550_var_KillScriptId, "clearKillNum",  varMap, -1, -1);
	
        for varI=1,x300550_var_SceneMonsterCount do


            
            

            
            local pos = x300550_var_ScenePos[varI]
            local monsterObj, monsterGuid = CreateMonster(varMap,x300550_var_SceneMonsterType, pos.varX,pos.z, 1,-1, x300550_var_KillScriptId,-1,21,1800*1000);
	    			HZ_MONSTER_OBJ[varI] = monsterObj
        end

   end

end



function x300550_ProcMapTimerTick( varMap, varAct, varTime )
end
