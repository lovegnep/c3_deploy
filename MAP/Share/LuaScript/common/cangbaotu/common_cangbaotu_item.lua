












x300331_var_FileId = 300331


x300331_var_QuestList   = {
                            { varQuest = 8050,  varScript = 300330 },        --ÉñÁú²Ø±¦Í¼
                            { varQuest = 8051,  varScript = 300336 },        --°ó¶¨µÄÉñÁú²Ø±¦Í¼
                            { varQuest = 6470,  varScript = 300518 },        --ÄÚÕþÍÚ¾ò 
                            { varQuest = 6471,  varScript = 300518 },        --ÄÚÕþÍÚ¾ò 
                            { varQuest = 6472,  varScript = 300518 },        --ÄÚÕþÍÚ¾ò 
                            { varQuest = 6473,  varScript = 300518 },        --ÄÚÕþÍÚ¾ò 
                            { varQuest = 6474,  varScript = 300518 },        --ÄÚÕþÍÚ¾ò 
                            { varQuest = 10259, varScript = 300520 },       --NewÄÚÕþÍÚ¾òÂ¥À¼ 
                            { varQuest = 10301, varScript = 300511 },       --NewÄÚÕþÍÚ¾òÌìÉ½
                            { varQuest = 10302, varScript = 300512 },       --NewÄÚÕþÍÚ¾òÀ¥ÂØ
                            { varQuest = 10303, varScript = 300513 },  			--NewÄÚÕþÍÚ¾ò¶Ø»Í
                            { varQuest = 8046,	varScript = 300337 },       --»Æ½ð²Ø±¦Í¼
                            { varQuest = 8047,	varScript = 300338 },       --°ó¶¨µÄ»Æ½ð²Ø±¦Í¼
                            { varQuest = 8048,	varScript = 300343 },       --»Æ½ð²Ø±¦Í¼£¨±¦Ê¯£©
                            { varQuest = 8049,	varScript = 300344 },       --°ó¶¨µÄ»Æ½ð²Ø±¦Í¼£¨±¦Ê¯£©
                            { varQuest = 8099,	varScript = 300345 },       --»Æ½ð²Ø±¦Í¼£¨Ï´Ê¯¼Á£©
                            { varQuest = 8100,	varScript = 300346 },       --°ó¶¨µÄ»Æ½ð²Ø±¦Í¼£¨Ï´Ê¯¼Á£©
														{ varQuest = 8101,	varScript = 310060 },       --»Æ½ð²Ø±¦Í¼£¨Íâ×°£©
                            { varQuest = 8102,	varScript = 310061 },       --°ó¶¨µÄ»Æ½ð²Ø±¦Í¼£¨Íâ×°£© 
														{ varQuest = 8103,	varScript = 310063 },       --»Æ½ð²Ø±¦Í¼£¨°Â×ê£©
                            { varQuest = 8104,	varScript = 310064 },       --°ó¶¨µÄ»Æ½ð²Ø±¦Í¼£¨°Â×ê£©                                                        
                            { varQuest = 11010,	varScript = 930163 },       --Õ½Éñ²Ø±¦Í¼µÄÃØÃÜ
}




x300331_var_Buf1 = 7210
x300331_var_Buf2 = -1 




function x300331_ProcEventEntry( varMap, varPlayer, varBagIdx )
end






function x300331_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; 
end






function x300331_ProcCancelImpacts( varMap, varPlayer )
	return 0; 
end






function x300331_ProcConditionCheck( varMap, varPlayer )
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	
	return 1; 
end







function x300331_ProcDeplete( varMap, varPlayer )
    
	
		
	
	return 1
end








function x300331_ProcActivateOnce( varMap, varPlayer)
    
    
    
    for varI, item in x300331_var_QuestList do
        if LuaCallNoclosure( item.varScript, "ProcDigbyShovel", varMap, varPlayer) > 0 then
            break
        end
    end
	return 1
end







function x300331_ProcActivateEachTick( varMap, varPlayer)
	return 1; 
end

function x300331_LogicDeplete( varMap, varPlayer)
    
    
    local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
    local curTimes = GetBagItemMultTimes( varMap, varPlayer, varBagIdx)
    if curTimes <= 1 then
        
        if DelItemByIndexInBag( varMap, varPlayer, varBagIdx, 1) ~= 1 then return 0 end
    else
        
        SetBagItemMultTimes( varMap, varPlayer, varBagIdx, curTimes - 1)
    end
end

