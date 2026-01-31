
x305003_var_FileId = 305003
x305003_var_QuestName = "【十八魔君说明】" 
x305003_var_ContinueInfo="\t你可知道十八魔君？他们很有可能出现在如下地点：\n#y\n大河之王 扎木合\n#g泰山（192，77）\n#y黑水之王 籍辣思义\n#g中兴府（128，45）\n#y波西米亚之王 瓦茨拉夫一世\n#g中兴府（128，204）\n#y贺兰山之王 高逸\n#g中兴府（128，128）\n#y雪山之王 蒲和万奴\n#g太行山（142，48）\n#y戈壁之王 胡沙虎\n#g凤翔府（47，179）\n#y平原之王 完颜洪烈\n#g蔡州城（65，141）\n#y高加索之王 八赤蛮\n#g秦岭（161，40）\n#y沙漠之王 太阳汗\n#g阿尔金山（188，206）\n#y西域之王 屈出律\n#g碎叶城（49，103）\n#y死海之王 摩诃魔\n#g红沙漠（103，190）\n#y埃及之王 忽都思苏丹\n#g西奈半岛（176，138）\n#y巴格达之王 哈里发穆斯塔欣\n#g巴格达（87，155）"
x305003_var_ContinueInfo2 = "#Y恒河之王 扎兰丁王子\n#G波斯高原（92，191）\n#Y匈牙利之王 贝拉四世\n#G匈牙利（230，126）\n#Y顿河之王 弗拉基米尔大公\n#G莫斯科（77，181）\n#Y伏尔加之王 基辅大公\n#G基辅公国（217，118）\n#Y波兰之王 亨利二世\n#G波兰王国（130，225）\n#Y撒马尔罕之王 亦纳勒术\n#G撒马尔罕（83，225）\n#Y条顿之王 绯烈特一世\n#G神圣罗马（66，222）\n#Y哈布斯堡之王 鲁道夫一世\n#G拜占庭（122，191）\n#Y大马士革之王 拜巴尔\n#G大马士革（217，182）\n#Y圣域之王 英诺森四世\n#G耶路撒冷（43，36）\n#Y叶密立之王 耶律直鲁古\n#G楼兰边塞（203，363）\n#Y鲜血之王 德古拉公爵\n#G天山边塞（203，363）\n#Y幕府之王 北条时宗\n#G昆仑边塞（203，363）\n#Y漠北之王 桑昆\n#G敦煌边塞（203，363）\n#W\n每周六，击败80级以下的十八魔君后，海都大王将会出现在中兴府（128，128）。"
function x305003_ProcEnumEvent(varMap, varPlayer, varTalknpc, varQuest)
	TalkAppendButton(varMap, x305003_var_FileId, x305003_var_QuestName, 13, 1)
end

function x305003_ProcEventEntry(varMap, varPlayer, varTalknpc,varScript,extid)	
	StartTalkTask(varMap)
		TalkAppendString(varMap,"#Y"..x305003_var_QuestName)
		TalkAppendString(varMap,x305003_var_ContinueInfo)
		TalkAppendString(varMap,x305003_var_ContinueInfo2)
	StopTalkTask()
	DeliverTalkMenu(varMap, varPlayer, varTalknpc)
end
