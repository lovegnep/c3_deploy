

x800133_var_FileId 									= 800133

x800133_var_QuestName								="战车装备打孔"

-- 材料消耗配置
x800133_var_UseItemInfo =
{	
	-- 填写UseItem时，一定要注意装备类型的顺序(车身, 装甲, 底盘, 发动机, 履带, 火炮, 雷达, 预警, 中控)
	-- 孔数 使用道具ID 使用道具数量  金钱  成功率
	{HoleNum=1, UseItem={12270024, 12270004, 12270005, 12270006, 12270007, 12270000, 12270003, 12270002, 12270001}, UseCount=1, UseMoney=40, Rate=100},
	{HoleNum=2, UseItem={12270024, 12270012, 12270013, 12270014, 12270015, 12270008, 12270011, 12270010, 12270009}, UseCount=1, UseMoney=70, Rate=100},
	{HoleNum=3, UseItem={12270024, 12270020, 12270021, 12270022, 12270023, 12270016, 12270019, 12270018, 12270017}, UseCount=1, UseMoney=110, Rate=100},
	{HoleNum=4, UseItem={12270024, 12270024, 12270024, 12270024, 12270024, 12270024, 12270024, 12270024, 12270024}, UseCount=1, UseMoney=140, Rate=100},
	{HoleNum=5, UseItem={12270024, 12270024, 12270024, 12270024, 12270024, 12270024, 12270024, 12270024, 12270024}, UseCount=1, UseMoney=170, Rate=100},
	{HoleNum=6, UseItem={12270024, 12270024, 12270024, 12270024, 12270024, 12270024, 12270024, 12270024, 12270024}, UseCount=1, UseMoney=210, Rate=100},
	{HoleNum=7, UseItem={12270024, 12270024, 12270024, 12270024, 12270024, 12270024, 12270024, 12270024, 12270024}, UseCount=1, UseMoney=240, Rate=100}
}

-- 最大孔数
x800133_var_MaxHoleNum = 7

-- 返回值常量定义
x800133_var_Success = 0
x800133_var_RateFail = 1			-- 几率失败
x800133_var_MaterialNotEnough = 2	-- 材料不足
x800133_var_MoneyNotEnough = 3		-- 金钱不足
x800133_var_HoleFull = 4			-- 满孔


function x800133_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
 	TalkAppendButton(varMap, x800133_var_FileId, x800133_var_QuestName, 3)
end


function x800133_ProcEventEntry(varMap, varPlayer, varTalknpc, idScript, idExt)	
	return 0
end

function x800133_ProcItemWanfa( varMap, varPlayer, varWanfaType )

	local wanfaDataTable = GetItemWanfaData( varMap )
	local dataCount = getn( wanfaDataTable )
	
	if dataCount ~= 1 then
		WriteLog( 1, format("x800133_ProcItemWanfa param count invalid! varMap=%d,PlayerGUID=%X,paramCount=%d",varMap,GetGUID(varMap,varPlayer),dataCount))
		return
	end
	
	------------------------------------------
	local bagPos = wanfaDataTable[1]-- 目标道具Pos
	------------------------------------------
	
	-- 检查物品是否合法
	if IsItemValid( varMap, varPlayer, bagPos ) == 0 then
		WriteLog( 1, format("x800133_ProcItemWanfa item invalid! varMap=%d,PlayerGUID=%X, bagPos=%d",varMap,GetGUID(varMap,varPlayer),bagPos));			
		return
	end
		
	-- 检查物品是否是战车装备
	local itemClass = GetItemProperty( varMap, varPlayer, bagPos, "ItemClass" );
	if itemClass ~= ICLASS_CHARIOT_EQUIP then
		return
	end
	-- 装备类型
	local varEquipType = GetChariotEquipType( varMap, varPlayer, bagPos )
	if varEquipType == -1 then
		return
	end
	
	-- 是否满孔
	local varHole = GetPlayerChariotEquipCurrHole( varMap, varPlayer, bagPos )
	if varHole >= x800133_var_MaxHoleNum then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800133_var_HoleFull )
		return
	end
	
	-- 金钱是否充足
	if IsEnoughMoney( varMap, varPlayer, x800133_var_UseItemInfo[varHole+1].UseMoney ) == 0 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800133_var_MoneyNotEnough )
		return
	end
	
	-- 取得使用的材料
	local varGem = x800133_var_UseItemInfo[varHole+1].UseItem[varEquipType+1]
	-- 材料数量是否充足
	if GetItemCount(varMap, varPlayer, varGem) < x800133_var_UseItemInfo[varHole+1].UseCount then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800133_var_MaterialNotEnough )
		return
	end
	
	-- 消耗道具
	if DelItem( varMap, varPlayer, varGem, x800133_var_UseItemInfo[varHole+1].UseCount) == 0 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800133_var_MaterialNotEnough )
		return
	end
	
	-- 消耗金钱
	local varRet, varType = SpendMoney( varMap, varPlayer, x800133_var_UseItemInfo[varHole+1].UseMoney )
	if varRet == -1 then
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800133_var_MoneyNotEnough )
		return
	end
	
	local nRate = random(1, 10000)
	
	if nRate <= x800133_var_UseItemInfo[varHole+1].Rate*100 then
	
		if AddChariotEquipHole( varMap, varPlayer, bagPos ) == -1 then
			NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800133_var_RateFail )
			WriteLog(1, format("x800133_ProcItemWanfa AddChariotEquipHole failed(1)! varMap=%d,PlayerGUID=%X",varMap,GetGUID(varMap,varPlayer) ))
			return
		end
	
		NotifyItemInfo( varMap, varPlayer, bagPos )
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800133_var_Success )
		--日志
		WriteEquipLog( varMap, varPlayer, bagPos, eEquipAct_ChariotEquipAddHole )
		
	else
		-- 打孔失败(几率)
		
		NotifyItemWanfa( varMap, varPlayer, varWanfaType, x800133_var_RateFail )
		--日志
		WriteEquipLog( varMap, varPlayer, bagPos, eEquipAct_ChariotEquipAddHole )
		
	end
		
end
