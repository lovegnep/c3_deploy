


--DECLARE_QUEST_INFO_START--
x310140_var_FileId              = 310140
x310140_var_Time					= { min = 1600,max = 1659 }	
x310140_var_minsterGuid			= 129740					
x310140_var_PreTime				=  0
x310140_var_AreaTipsInterval		=  2						
x310140_var_AreaTips				= "#R警报！敌国正在攻击我国边境拓道#aB{goto_%d,%d,%d}(%d,%d)#aE的边关守备，请火速救援！"
--DECLARE_QUEST_INFO_STOP--

function x310140_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
	
	local hour,minute,sec =GetHourMinSec(); 
	local now = hour *100 + minute
	if now < x310140_var_Time.min or now > x310140_var_Time.max then
		return
	end
	
	local nCurMin = GetMinOfYear()  
	local nInterval = nCurMin - x310140_var_PreTime
	if nInterval < x310140_var_AreaTipsInterval then
		return	
	end
	
	local varCountry = -1
	local varX =0
	local z= 0
	if varMap == 51 then
		varCountry = 0
		varX = 384
		z = 276
	elseif varMap == 151 then
		varCountry = 1
		varX = 384
		z = 276
	elseif varMap == 251 then
		varCountry = 2
		varX = 384
		z = 276
	elseif varMap == 351 then
		varCountry = 3
		varX = 384
		z = 276
	else
		return
	end
	
	if varCountry == GetCurCountry(varMap,varPlayer) then
		return
	end	
		--如果是镖车.退出
	if GetObjType(varMap, varPlayer) == 9 then
		return
	end	
	
	if LuaCallNoclosure(310150,"IsMonsterValid_x51",varMap,1 ) == 1 then
		x310140_var_PreTime = nCurMin
		local varMsg = format( x310140_var_AreaTips,varMap,varX,z,varX,z)
		local msg3 ="#R边境拓道附近国家军力受到敌国袭击！"
		LuaAllScenceM2Country( varMap,varMsg,varCountry, 2,1)
		LuaAllScenceM2Country( varMap,msg3,varCountry, 5,1)
	end
end

function x310140_ProcMapTimerTick( varMap, now )

end


function x310140_ProcAreaLeaved( varMap, varPlayer, varScript, varQuest )

end
