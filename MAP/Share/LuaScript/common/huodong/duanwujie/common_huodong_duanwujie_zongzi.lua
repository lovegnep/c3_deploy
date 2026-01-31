--DECLARE_QUEST_INFO_START--

x302522_var_FileId = 302522   
-----概率最大值*
x302522_var_randMax =10
--获得金竹叶粽概率*
x302522_var_randGet =1
--普通竹叶粽ID*
x302522_var_ItemId =12110213
--金竹叶粽ID*
x302522_var_ItemIdG =12110214
--粽叶ID*
x302522_var_ItemId_ye = 12110211
--糯米ID*
x302522_var_ItemIdG_nuomi = 12110212

x302522_var_ExcItemInfo =
{
	{Name ="1个竹叶粽", Num = 1},
	{Name ="5个竹叶粽", Num = 5},
	{Name ="10个竹叶粽", Num = 10},
}



function x302522_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,seleteId)	
	local year, month, day = GetYearMonthDay(); 
	local day1 = GetDayOfYear()	
	if year ==2012 then
		if day1 > 169 and day1 < 213 then

			if seleteId == 199 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y".."端午节竹叶粽说明")
				TalkAppendString(varMap,"\t端午节快乐！\n\t在这个暖暖初夏，让我们一起包竹叶粽、赛龙舟欢度节日吧！\n\t收集#R粽叶#W和#R糯米#W可以制作竹叶粽，使用竹叶粽可以获得#R烈焱碎片#W、#R黄金麻将#W、#R豪华将星卡包#W、#R雄黄酒#W等珍贵道具。")
				--普通竹叶粽
				AddQuestItemBonus(varMap, x302522_var_ItemId,1)
				StopTalkTask()
				DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, x302522_var_FileId, -1)
				return
			end	
		
			local luweiye = GetItemCount(varMap, varPlayer, x302522_var_ItemId_ye)
			local nuomi = GetItemCount(varMap, varPlayer, x302522_var_ItemIdG_nuomi)


			if seleteId == 10 then
				StartTalkTask(varMap)
				TalkAppendString(varMap,"#Y".."【端午节】制作竹叶粽")	
				TalkAppendString(varMap,format("\t制作竹叶粽需要1个#G箬竹叶#W和1个#G糯米团#W。\n\t您当前的箬竹叶数量为：#R%d#W\n\t您当前的糯米团数量为：#R%d#W\n\t请选择您要制作的竹叶粽数量：",luweiye,nuomi))	
				TalkAppendButton( varMap, x302522_var_FileId, "制作1个竹叶粽", 1, 1 )		
				TalkAppendButton( varMap, x302522_var_FileId, "制作5个竹叶粽", 1, 2 )		
				TalkAppendButton( varMap, x302522_var_FileId, "制作10个竹叶粽", 1, 3 )
				StopTalkTask()
				DeliverTalkMenu(varMap, varPlayer, varTalknpc)
				return
			elseif seleteId < 5 then 
				x302522_Accept( varMap, varPlayer, varTalknpc,seleteId )	
			end
		end
	end
end


function x302522_ProcEnumEvent( varMap, varPlayer, varTalknpc, varQuest )

	local year, month, day = GetYearMonthDay(); 
		local day1 = GetDayOfYear()		
		if year ==2012 then
			if day1 > 169 and day1 < 213 then
				TalkAppendButton(varMap,x302522_var_FileId,"【端午节】制作竹叶粽",3,10);
				--TalkAppendButton(varMap,x302522_var_FileId,"端午节竹叶粽说明",13,199);
			end
		end
end

function x302522_ProcAccept( varMap, varPlayer )
end

function x302522_Accept( varMap, varPlayer, varTalknpc ,seleteId )
		local luweiye = GetItemCount(varMap, varPlayer, x302522_var_ItemId_ye)
		local nuomi = GetItemCount(varMap, varPlayer, x302522_var_ItemIdG_nuomi)
		if luweiye < x302522_var_ExcItemInfo[seleteId].Num or nuomi < x302522_var_ExcItemInfo[seleteId].Num then
			Msg2Player(varMap, varPlayer, "所需箬竹叶或糯米团数量不足！", 0, 3)
			return
		end	
		if GetBagSpace(varMap, varPlayer) < 2 then
			Msg2Player(varMap, varPlayer, "背包空间少于2个，请整理后再试", 0, 2)
			Msg2Player(varMap, varPlayer, "背包空间少于2个，请整理后再试", 0, 3)
			return
		end
		local varNum1 = 0
		local varNum2 = 0
		for i =1,x302522_var_ExcItemInfo[seleteId].Num,1 do
			local rand = random(1,x302522_var_randMax)
			if rand <= x302522_var_randGet then
				varNum1 = varNum1 + 1
			else
				varNum2 = varNum2 + 1
			end
		end
		StartItemTask( varMap)
		
		if varNum1 > 0 then
			ItemAppendBind( varMap, x302522_var_ItemIdG, varNum1)
		end
		if varNum2 > 0 then
			ItemAppendBind( varMap, x302522_var_ItemId, varNum2)		
		end
		if StopItemTask( varMap, varPlayer) == 0 then
	    	Msg2Player( varMap, varPlayer, "背包已满，无法获得奖励", 8, 3)
	    	return
	  else	    		
	  		if(DelItem(varMap, varPlayer,x302522_var_ItemId_ye ,x302522_var_ExcItemInfo[seleteId].Num)) == 1 and (DelItem(varMap, varPlayer,x302522_var_ItemIdG_nuomi ,x302522_var_ExcItemInfo[seleteId].Num)) == 1 then	
					if varNum1 ~= 0 then
						Msg2Player( varMap, varPlayer,format( "恭喜您获得#G%d#cffcc00个竹叶粽，#G%d#cffcc00个闪金竹叶粽", varNum2,varNum1),8,3)
					else
						Msg2Player( varMap, varPlayer,format( "恭喜您获得#G%d#cffcc00个竹叶粽", varNum2),8,3)
					end	
					DeliverItemListSendToPlayer( varMap, varPlayer)
				end
		end
		x302522_ProcEventEntry( varMap, varPlayer, varTalknpc ,varScript,10)	

end
		
function x302522_ProcAcceptCheck( varMap, varPlayer, varTalknpc )
	return 1

end





function x302522_ProcQuestAbandon( varMap, varPlayer, varQuest )

end




function x302522_ProcContinue( varMap, varPlayer, varTalknpc )

end




function x302522_CheckSubmit( varMap, varPlayer )

end




function x302522_ProcQuestSubmit( varMap, varPlayer, varTalknpc,varRadioSelected, varQuest )

end




function x302522_ProcQuestObjectKilled( varMap, varPlayer, varObjData, varObj, varQuest )

end




function x302522_ProcAreaEntered( varMap, varPlayer, varArea, varQuest )
end




function x302522_ProcQuestItemChanged( varMap, varPlayer, varItemData, varQuest )
end
