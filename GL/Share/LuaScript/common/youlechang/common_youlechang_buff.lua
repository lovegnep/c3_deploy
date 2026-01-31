
x310329_var_FileId = 310329
x310329_var_BuffId = 8400
x310329_var_Pos              = {varX = 127, z = 79}


function x310329_ProcIntervalOverEvent( varMap, varPlayer)
end


function x310329_ProcActiveEvent( varMap, varPlayer )
end


function x310329_ProcFadeOutEvent( varMap, varPlayer )
    if varMap == 39 or varMap == 40 then
        NewWorld( varMap, varPlayer, 36, x310329_var_Pos.varX, x310329_var_Pos.z, 310320)
    end

end




function x310329_ProcEventEntry( varMap, varPlayer, varBagIdx)
end


