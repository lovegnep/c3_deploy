
x310855_var_FileId	= 310855

x310855_var_BuffTable ={8319,8320,8321}
x310855_var_MopTable ={
												"今年的篝火节真热闹啊！",
												"再添些木柴进去！",
												"篝火烧的这么旺，今年我们一定能有个好收成！",
												}



function x310855_ProcIntervalOverEvent( varMap, varPlayer, targetId )
print("走到了！")
	local flag1 =random(1,100)
	local flag2 =random(1,100)
	if flag1 <= 10 then
		NpcTalk(varMap, varPlayer, x310855_var_BuffTable[random(getn(x310855_var_MopTable))], -1)
	end
	if flag1 <= 10 then
		SendSpecificImpactToUnit(varMap, varPlayer, varPlayer, varPlayer, x310855_var_BuffTable[random(getn(x310855_var_BuffTable))], 0)
	end
	
end


function x310855_ProcActiveEvent( varMap, varPlayer, targetId )
end


function x310855_ProcFadeOutEvent( varMap, varPlayer )
end

function x310855_ProcEventEntry()
end
