--新手成长包	12030475 
------------------------------------------------------------------------------------------
--一般物品的默认脚本
x432158_var_FileId     = 432158

x432158_MissionInfo 	 = "\n#Y物品价格："
x432158_ItemPrice  		 = 0
x432158_GetRightTime 	 = 7 * 24 * 3600 --有效期修改为一周
x432158_questMnu   		 = 0
x432158_item_random_list = {
	{ 10200020 , 10230020 , 10240020 , 10250020 , 10260020 , 10270020 },--新手蓝装
	{ 10246092 , 10286092 , 10296072 }--极品武器

};


x432158_item_array = {
	{ lv = 10 , clr_name = "#Y新手成长包（10级）" , item_list = "1把极品武器和小钱包。" },
	
	{ lv = 20 , clr_name = "#Y新手成长包（20级）" , item_list = "1件极品首饰，1件红虎披风，小钱包和10个世传水晶。" },
	
	{ lv = 30 , clr_name = "#Y新手成长包（30级）" , item_list = "10个初级龙眼石，1个垂耳兔降世符，小钱包，10个世传水晶和1个三番令。" },
	
	{ lv = 40 , clr_name = "#Y新手成长包（40级）" , item_list = "20个初级龙眼石，20瓶杰克丹尼，10个国传水晶，1个修行草和5个天王补心丹。" },
	
	{ lv = 50 , clr_name = "#Y新手成长包（50级）" , item_list = "10个中级龙眼石，30个国传水晶，20瓶杰克丹尼，5本还童书和3个藏宝令。" },
	
	{ lv = 60 , clr_name = "#Y新手成长包（60级）" , item_list = "20个中级龙眼石，小钱包，15瓶芝华士，5个龟鹿二仙胶和1个猎枭降世符。" },
	
	{ lv = 65 , clr_name = "#Y新手成长包（65级）" , item_list = "15个高级龙眼石，小钱包，10个神传水晶，5个紫檀木炭和1个次生钻石矿。" },
	
	{ lv = 70 , clr_name = "#Y新手成长包（70级）" , item_list = "30个高级龙眼石，小钱包，15个神传水晶，1个高级洗石剂和1个圣徒级洗石剂。" }
};



x432158_item_list = {

	{
		lv = 10 , array = 
		{
			{ metier = 0 , list = { { varId = 10010020 , varNum = 1 } , { varId = 12030319  , varNum = 1 } }, price = 111111111, pricetype = 1} , 
			{ metier = 1 , list = { { varId = 10020020 , varNum = 1 } , { varId = 12030319  , varNum = 1 } }, price = 111, pricetype = 1} , 
			{ metier = 2 , list = { { varId = 10030020 , varNum = 1 } , { varId = 12030319  , varNum = 1 } }, price = 11111, pricetype = 2} , 
			{ metier = 3 , list = { { varId = 10040020 , varNum = 1 } , { varId = 12030319  , varNum = 1 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 4 , list = { { varId = 10050020 , varNum = 1 } , { varId = 12030319  , varNum = 1 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 5 , list = { { varId = 10060020 , varNum = 1 } , { varId = 12030319  , varNum = 1 } }, price = 111111111, pricetype = 1 } , 
		  { metier = 6 , list = { { varId = 10350002 , varNum = 1 } , { varId = 12030319  , varNum = 1 } }, price = 111111111, pricetype = 1}  , 
			{ metier = 7 , list = { { varId = 10360002 , varNum = 1 } , { varId = 12030319  , varNum = 1 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 8 , list = { { varId = 10370002 , varNum = 1 } , { varId = 12030319  , varNum = 1 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 9 , list = { { varId = 10380002 , varNum = 1 } , { varId = 12030319  , varNum = 1 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 10 , list = {{ varId = 10390002 , varNum = 1 } , { varId = 12030319  , varNum = 1 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 11 , list = {{ varId = 10400002 , varNum = 1 } , { varId = 12030319  , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
		}
	} ,

	{
		lv = 20 , array = 
		{
			{ metier = 0 , list = { { varId = 10246092 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 12030320 , varNum = 1 }, { varId = 10222001 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 1 , list = { { varId = 10246092 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 12030320 , varNum = 1 }, { varId = 10222001 , varNum = 1 } }, price = 234, pricetype = 0 } ,
			{ metier = 2 , list = { { varId = 10246092 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 12030320 , varNum = 1 }, { varId = 10222001 , varNum = 1 } }, price = 234, pricetype = 2 } ,
			{ metier = 3 , list = { { varId = 10246092 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 12030320 , varNum = 1 }, { varId = 10222001 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 4 , list = { { varId = 10246092 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 12030320 , varNum = 1 }, { varId = 10222001 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 5 , list = { { varId = 10246092 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 12030320 , varNum = 1 }, { varId = 10222001 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
		  { metier = 6 , list = { { varId = 10246092 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 12030320 , varNum = 1 }, { varId = 10222001 , varNum = 1 } }, price = 11111111, pricetype = 1}  ,
			{ metier = 7 , list = { { varId = 10246092 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 12030320 , varNum = 1 }, { varId = 10222001 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 8 , list = { { varId = 10246092 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 12030320 , varNum = 1 }, { varId = 10222001 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 9 , list = { { varId = 10246092 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 12030320 , varNum = 1 }, { varId = 10222001 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 10 , list = { { varId = 10246092 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 12030320 , varNum = 1 }, { varId = 10222001 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 11 , list = { { varId = 10246092 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 12030320 , varNum = 1 }, { varId = 10222001 , varNum = 1 } }, price = 111111111 }
		}
	} ,
	

	{
		lv = 30 , array = 
		{
			{ metier = 0 , list = { { varId = 11050001 , varNum = 10 } , { varId = 12030321 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 11990011 , varNum = 1 }, { varId = 12050257 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 1 , list = { { varId = 11050001 , varNum = 10 } , { varId = 12030321 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 11990011 , varNum = 1 }, { varId = 12050257 , varNum = 1 } }, price = 111113, pricetype = 1 } ,
			{ metier = 2 , list = {  { varId = 12050257 , varNum = 1 } }, price = 11111, pricetype = 2 } ,
			{ metier = 3 , list = { { varId = 11050001 , varNum = 10 } , { varId = 12030321 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 11990011 , varNum = 1 }, { varId = 12050257 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 4 , list = { { varId = 11050001 , varNum = 10 } , { varId = 12030321 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 11990011 , varNum = 1 }, { varId = 12050257 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 5 , list = { { varId = 11050001 , varNum = 10 } , { varId = 12030321 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 11990011 , varNum = 1 }, { varId = 12050257 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
		  { metier = 6 , list = { { varId = 11050001 , varNum = 10 } , { varId = 12030321 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 11990011 , varNum = 1 }, { varId = 12050257 , varNum = 1 } }, price = 111111111, pricetype = 1} ,
			{ metier = 7 , list = { { varId = 11050001 , varNum = 10 } , { varId = 12030321 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 11990011 , varNum = 1 }, { varId = 12050257 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 8 , list = { { varId = 11050001 , varNum = 10 } , { varId = 12030321 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 11990011 , varNum = 1 }, { varId = 12050257 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 9 , list = { { varId = 11050001 , varNum = 10 } , { varId = 12030321 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 11990011 , varNum = 1 }, { varId = 12050257 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 10 , list = { { varId = 11050001 , varNum = 10 } , { varId = 12030321 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 11990011 , varNum = 1 }, { varId = 12050257 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 11 , list = { { varId = 11050001 , varNum = 10 } , { varId = 12030321 , varNum = 1 } , { varId = 11000200 , varNum = 10 } , { varId = 11990011 , varNum = 1 }, { varId = 12050257 , varNum = 1 } }, price = 111111111, pricetype = 1 }
		}
	} ,
	
	
	{
		lv = 40 , array = 
		{
			{ metier = 0 , list = { { varId = 12030011 , varNum = 20 } , { varId = 12010201 , varNum = 5 } , { varId = 11050001 , varNum = 20 } , { varId = 12041101 , varNum = 1 } , { varId = 11000201 , varNum = 10 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 1 , list = { { varId = 12030011 , varNum = 20 } , { varId = 12010201 , varNum = 5 } , { varId = 11050001 , varNum = 20 } , { varId = 12041101 , varNum = 1 } , { varId = 11000201 , varNum = 10 } }, price = 222, pricetype = 1 } , 
			{ metier = 2 , list = { { varId = 12030011 , varNum = 20 } , { varId = 12010201 , varNum = 5 } , { varId = 11050001 , varNum = 20 } , { varId = 12041101 , varNum = 1 } , { varId = 11000201 , varNum = 10 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 3 , list = { { varId = 12030011 , varNum = 20 } , { varId = 12010201 , varNum = 5 } , { varId = 11050001 , varNum = 20 } , { varId = 12041101 , varNum = 1 } , { varId = 11000201 , varNum = 10 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 4 , list = { { varId = 12030011 , varNum = 20 } , { varId = 12010201 , varNum = 5 } , { varId = 11050001 , varNum = 20 } , { varId = 12041101 , varNum = 1 } , { varId = 11000201 , varNum = 10 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 5 , list = { { varId = 12030011 , varNum = 20 } , { varId = 12010201 , varNum = 5 } , { varId = 11050001 , varNum = 20 } , { varId = 12041101 , varNum = 1 } , { varId = 11000201 , varNum = 10 } }, price = 111111111, pricetype = 1 } ,
		  { metier = 6 , list = { { varId = 12030011 , varNum = 20 } , { varId = 12010201 , varNum = 5 } , { varId = 11050001 , varNum = 20 } , { varId = 12041101 , varNum = 1 } , { varId = 11000201 , varNum = 10 } }, price = 11111111, pricetype = 1 } , 
			{ metier = 7 , list = { { varId = 12030011 , varNum = 20 } , { varId = 12010201 , varNum = 5 } , { varId = 11050001 , varNum = 20 } , { varId = 12041101 , varNum = 1 } , { varId = 11000201 , varNum = 10 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 8 , list = { { varId = 12030011 , varNum = 20 } , { varId = 12010201 , varNum = 5 } , { varId = 11050001 , varNum = 20 } , { varId = 12041101 , varNum = 1 } , { varId = 11000201 , varNum = 10 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 9 , list = { { varId = 12030011 , varNum = 20 } , { varId = 12010201 , varNum = 5 } , { varId = 11050001 , varNum = 20 } , { varId = 12041101 , varNum = 1 } , { varId = 11000201 , varNum = 10 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 10 , list = { { varId = 12030011 , varNum = 20 } , { varId = 12010201 , varNum = 5 } , { varId = 11050001 , varNum = 20 } , { varId = 12041101 , varNum = 1 } , { varId = 11000201 , varNum = 10 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 11 , list = { { varId = 12030011 , varNum = 20 } , { varId = 12010201 , varNum = 5 } , { varId = 11050001 , varNum = 20 } , { varId = 12041101 , varNum = 1 } , { varId = 11000201 , varNum = 10 } }, price = 111111111, pricetype = 1 }
		}
	} ,
	
	
	{
		lv = 50 , array = 
		{
			{ metier = 0 , list = { { varId = 11050002 , varNum = 10 }, { varId = 11000201 , varNum = 30 } , { varId = 12030011 , varNum = 20 } , { varId = 11990015 , varNum = 3 } , { varId = 12054300 , varNum = 5 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 1 , list = { { varId = 11050002 , varNum = 10 }, { varId = 11000201 , varNum = 30 } , { varId = 12030011 , varNum = 20 } , { varId = 11990015 , varNum = 3 } , { varId = 12054300 , varNum = 5 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 2 , list = { { varId = 11050002 , varNum = 10 }, { varId = 11000201 , varNum = 30 } , { varId = 12030011 , varNum = 20 } , { varId = 11990015 , varNum = 3 } , { varId = 12054300 , varNum = 5 } }, price = 111111111, pricetype = 2 } , 
			{ metier = 3 , list = { { varId = 11050002 , varNum = 10 }, { varId = 11000201 , varNum = 30 } , { varId = 12030011 , varNum = 20 } , { varId = 11990015 , varNum = 3 } , { varId = 12054300 , varNum = 5 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 4 , list = { { varId = 11050002 , varNum = 10 }, { varId = 11000201 , varNum = 30 } , { varId = 12030011 , varNum = 20 } , { varId = 11990015 , varNum = 3 } , { varId = 12054300 , varNum = 5 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 5 , list = { { varId = 11050002 , varNum = 10 }, { varId = 11000201 , varNum = 30 } , { varId = 12030011 , varNum = 20 } , { varId = 11990015 , varNum = 3 } , { varId = 12054300 , varNum = 5 } }, price = 111111111, pricetype = 1 } ,
		  { metier = 6 , list = { { varId = 11050002 , varNum = 10 }, { varId = 11000201 , varNum = 30 } , { varId = 12030011 , varNum = 20 } , { varId = 11990015 , varNum = 3 } , { varId = 12054300 , varNum = 5 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 7 , list = { { varId = 11050002 , varNum = 10 }, { varId = 11000201 , varNum = 30 } , { varId = 12030011 , varNum = 20 } , { varId = 11990015 , varNum = 3 } , { varId = 12054300 , varNum = 5 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 8 , list = { { varId = 11050002 , varNum = 10 }, { varId = 11000201 , varNum = 30 } , { varId = 12030011 , varNum = 20 } , { varId = 11990015 , varNum = 3 } , { varId = 12054300 , varNum = 5 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 9 , list = { { varId = 11050002 , varNum = 10 }, { varId = 11000201 , varNum = 30 } , { varId = 12030011 , varNum = 20 } , { varId = 11990015 , varNum = 3 } , { varId = 12054300 , varNum = 5 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 10 , list = { { varId = 11050002 , varNum = 10 }, { varId = 11000201 , varNum = 30 } , { varId = 12030011 , varNum = 20 } , { varId = 11990015 , varNum = 3 } , { varId = 12054300 , varNum = 5 } }, price = 111111111, pricetype = 1 } , 
			{ metier = 11 , list = { { varId = 11050002 , varNum = 10 }, { varId = 11000201 , varNum = 30 } , { varId = 12030011 , varNum = 20 } , { varId = 11990015 , varNum = 3 } , { varId = 12054300 , varNum = 5 } }, price = 111111111, pricetype = 1 }
		}
	} ,
	
	
	{
		lv = 60 , array = 
		{
			{ metier = 0 , list = { { varId = 12030322 , varNum = 1 } , { varId = 12030013 , varNum = 15 } , { varId = 11050002 , varNum = 20 } , { varId = 12010301 , varNum = 5 } , { varId = 12050227 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 1 , list = { { varId = 12030322 , varNum = 1 } , { varId = 12030013 , varNum = 15 } , { varId = 11050002 , varNum = 20 } , { varId = 12010301 , varNum = 5 } , { varId = 12050227 , varNum = 1 } }, price = 123, pricetype = 2 } ,
			{ metier = 2 , list = { { varId = 12030322 , varNum = 1 } , { varId = 12030013 , varNum = 15 } , { varId = 11050002 , varNum = 20 } , { varId = 12010301 , varNum = 5 } , { varId = 12050227 , varNum = 1 } }, price = 234, pricetype = 2 } ,
			{ metier = 3 , list = { { varId = 12030322 , varNum = 1 } , { varId = 12030013 , varNum = 15 } , { varId = 11050002 , varNum = 20 } , { varId = 12010301 , varNum = 5 } , { varId = 12050227 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 4 , list = { { varId = 12030322 , varNum = 1 } , { varId = 12030013 , varNum = 15 } , { varId = 11050002 , varNum = 20 } , { varId = 12010301 , varNum = 5 } , { varId = 12050227 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 5 , list = { { varId = 12030322 , varNum = 1 } , { varId = 12030013 , varNum = 15 } , { varId = 11050002 , varNum = 20 } , { varId = 12010301 , varNum = 5 } , { varId = 12050227 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
		  { metier = 6 , list = { { varId = 12030322 , varNum = 1 } , { varId = 12030013 , varNum = 15 } , { varId = 11050002 , varNum = 20 } , { varId = 12010301 , varNum = 5 } , { varId = 12050227 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 7 , list = { { varId = 12030322 , varNum = 1 } , { varId = 12030013 , varNum = 15 } , { varId = 11050002 , varNum = 20 } , { varId = 12010301 , varNum = 5 } , { varId = 12050227 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 8 , list = { { varId = 12030322 , varNum = 1 } , { varId = 12030013 , varNum = 15 } , { varId = 11050002 , varNum = 20 } , { varId = 12010301 , varNum = 5 } , { varId = 12050227 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 9 , list = { { varId = 12030322 , varNum = 1 } , { varId = 12030013 , varNum = 15 } , { varId = 11050002 , varNum = 20 } , { varId = 12010301 , varNum = 5 } , { varId = 12050227 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 10 , list = { { varId = 12030322 , varNum = 1 } , { varId = 12030013 , varNum = 15 } , { varId = 11050002 , varNum = 20 } , { varId = 12010301 , varNum = 5 } , { varId = 12050227 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 11 , list = { { varId = 12030322 , varNum = 1 } , { varId = 12030013 , varNum = 15 } , { varId = 11050002 , varNum = 20 } , { varId = 12010301 , varNum = 5 } , { varId = 12050227 , varNum = 1 } }, price = 111111111, pricetype = 1 }
		}
	} ,
	
	
	{
		lv = 65 , array = 
		{
			{ metier = 0 , list = { { varId = 12030323 , varNum = 1 } ,{ varId = 11050003 , varNum = 15 } , { varId = 11000501 , varNum = 5 } , { varId = 11000202 , varNum = 10 } , { varId = 11990114 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 1 , list = { { varId = 12030323 , varNum = 1 } ,{ varId = 11050003 , varNum = 15 } , { varId = 11000501 , varNum = 5 } , { varId = 11000202 , varNum = 10 } , { varId = 11990114 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 2 , list = { { varId = 12030323 , varNum = 1 } ,{ varId = 11050003 , varNum = 15 } , { varId = 11000501 , varNum = 5 } , { varId = 11000202 , varNum = 10 } , { varId = 11990114 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 3 , list = { { varId = 12030323 , varNum = 1 } ,{ varId = 11050003 , varNum = 15 } , { varId = 11000501 , varNum = 5 } , { varId = 11000202 , varNum = 10 } , { varId = 11990114 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 4 , list = { { varId = 12030323 , varNum = 1 } ,{ varId = 11050003 , varNum = 15 } , { varId = 11000501 , varNum = 5 } , { varId = 11000202 , varNum = 10 } , { varId = 11990114 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 5 , list = { { varId = 12030323 , varNum = 1 } ,{ varId = 11050003 , varNum = 15 } , { varId = 11000501 , varNum = 5 } , { varId = 11000202 , varNum = 10 } , { varId = 11990114 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
		  { metier = 6 , list = { { varId = 12030323 , varNum = 1 } ,{ varId = 11050003 , varNum = 15 } , { varId = 11000501 , varNum = 5 } , { varId = 11000202 , varNum = 10 } , { varId = 11990114 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 7 , list = { { varId = 12030323 , varNum = 1 } ,{ varId = 11050003 , varNum = 15 } , { varId = 11000501 , varNum = 5 } , { varId = 11000202 , varNum = 10 } , { varId = 11990114 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 8 , list = { { varId = 12030323 , varNum = 1 } ,{ varId = 11050003 , varNum = 15 } , { varId = 11000501 , varNum = 5 } , { varId = 11000202 , varNum = 10 } , { varId = 11990114 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 9 , list = { { varId = 12030323 , varNum = 1 } ,{ varId = 11050003 , varNum = 15 } , { varId = 11000501 , varNum = 5 } , { varId = 11000202 , varNum = 10 } , { varId = 11990114 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 10 , list = { { varId = 12030323 , varNum = 1 } ,{ varId = 11050003 , varNum = 15 } , { varId = 11000501 , varNum = 5 } , { varId = 11000202 , varNum = 10 } , { varId = 11990114 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 11 , list = { { varId = 12030323 , varNum = 1 } ,{ varId = 11050003 , varNum = 15 } , { varId = 11000501 , varNum = 5 } , { varId = 11000202 , varNum = 10 } , { varId = 11990114 , varNum = 1 } }, price = 111111111, pricetype = 1 }
		}
	} ,
	
	
	{
		lv = 70 , array = 
		{
			{ metier = 0 , list = { { varId = 11050003 , varNum = 30 } , { varId = 12030323 , varNum = 1 } , { varId = 11000202 , varNum = 15 } , { varId = 11000902 , varNum = 1 } , { varId = 11000903 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 1 , list = { { varId = 11050003 , varNum = 30 } , { varId = 12030323 , varNum = 1 } , { varId = 11000202 , varNum = 15 } , { varId = 11000902 , varNum = 1 } , { varId = 11000903 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 2 , list = { { varId = 12030323 , varNum = 1 } , { varId = 11000202 , varNum = 15 } , { varId = 11000902 , varNum = 1 } , { varId = 11000903 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 3 , list = { { varId = 11050003 , varNum = 30 } , { varId = 12030323 , varNum = 1 } , { varId = 11000202 , varNum = 15 } , { varId = 11000902 , varNum = 1 } , { varId = 11000903 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 4 , list = { { varId = 11050003 , varNum = 30 } , { varId = 12030323 , varNum = 1 } , { varId = 11000202 , varNum = 15 } , { varId = 11000902 , varNum = 1 } , { varId = 11000903 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 5 , list = { { varId = 11050003 , varNum = 30 } , { varId = 12030323 , varNum = 1 } , { varId = 11000202 , varNum = 15 } , { varId = 11000902 , varNum = 1 } , { varId = 11000903 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
		  { metier = 6 , list = { { varId = 11050003 , varNum = 30 } , { varId = 12030323 , varNum = 1 } , { varId = 11000202 , varNum = 15 } , { varId = 11000902 , varNum = 1 } , { varId = 11000903 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 7 , list = { { varId = 11050003 , varNum = 30 } , { varId = 12030323 , varNum = 1 } , { varId = 11000202 , varNum = 15 } , { varId = 11000902 , varNum = 1 } , { varId = 11000903 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 8 , list = { { varId = 11050003 , varNum = 30 } , { varId = 12030323 , varNum = 1 } , { varId = 11000202 , varNum = 15 } , { varId = 11000902 , varNum = 1 } , { varId = 11000903 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 9 , list = { { varId = 11050003 , varNum = 30 } , { varId = 12030323 , varNum = 1 } , { varId = 11000202 , varNum = 15 } , { varId = 11000902 , varNum = 1 } , { varId = 11000903 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 10 , list = { { varId = 11050003 , varNum = 30 } , { varId = 12030323 , varNum = 1 } , { varId = 11000202 , varNum = 15 } , { varId = 11000902 , varNum = 1 } , { varId = 11000903 , varNum = 1 } }, price = 111111111, pricetype = 1 } ,
			{ metier = 11 , list = { { varId = 11050003 , varNum = 30 } , { varId = 12030323 , varNum = 1 } , { varId = 11000202 , varNum = 15 } , { varId = 11000902 , varNum = 1 } , { varId = 11000903 , varNum = 1 } }, price = 111111111, pricetype = 1 }
		}
	}
};


x432158_random_size = 10;
x432158_array_size = 8;
x432158_random_item_id = 10200020;
x432158_title_enabled_color = "";
x432158_title_disabled_color = "#cb4b4b4";


--**********************************
--事件交互入口
--**********************************
function x432158_ProcEventEntry( varMap, varPlayer, varBagIdx )
-- 不需要这个接口，但要保留空函数
end

--**********************************
--这个物品的使用过程是否类似于技能：
--系统会在执行开始时检测这个函数的返回值，如果返回失败则忽略后面的类似技能的执行。
--返回1：技能类似的物品，可以继续类似技能的执行；返回0：忽略后面的操作。
--**********************************
function x432158_ProcIsSpellLikeScript( varMap, varPlayer)
	return 1; --这个脚本需要动作支持
end

--**********************************
--直接取消效果：
--系统会直接调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：已经取消对应效果，不再执行后续操作；返回0：没有检测到相关效果，继续执行。
--**********************************
function x432158_ProcCancelImpacts( varMap, varPlayer )
	return 0; --不需要这个接口，但要保留空函数,并且始终返回0。
end

--**********************************
--条件检测入口：
--系统会在技能检测的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：条件检测通过，可以继续执行；返回0：条件检测失败，中断后续执行。
--**********************************
function x432158_ProcConditionCheck( varMap, varPlayer )
	
	--校验使用的物品
	
	if(1~=VerifyUsedItem(varMap, varPlayer)) then
		return 0
	end
	return 1; --不需要任何条件，并且始终返回1。
end

--**********************************
--消耗检测及处理入口：
--系统会在技能消耗的时间点调用这个接口，并根据这个函数的返回值确定以后的流程是否执行。
--返回1：消耗处理通过，可以继续执行；返回0：消耗检测失败，中断后续执行。
--注意：这不光负责消耗的检测也负责消耗的执行。
--**********************************
function x432158_ProcDeplete( varMap, varPlayer )
	
	
	--if(DepletingUsedItem(varMap, varPlayer)) == 1 then
	--	return 1;
	--end
	--return 0;
	
	return 1;
end




--**********************************
--只会执行一次入口：
--聚气和瞬发技能会在消耗完成后调用这个接口（聚气结束并且各种条件都满足的时候），而引导
--技能也会在消耗完成后调用这个接口（技能的一开始，消耗成功执行之后）。
--返回1：处理成功；返回0：处理失败。
--注：这里是技能生效一次的入口
--**********************************
function x432158_ProcActivateOnce( varMap, varPlayer, varImpact )
	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
	local firsttime = GetItemParam(varMap, varPlayer, varBagIdx, 0, 2)
	local LastTime = x432158_GetRightTime - (GetCurrentTime() - firsttime)
	SetPlayerRuntimeData(varMap, varPlayer, RD_COMMON_NPCID, 0)
	GetPlayerRuntimeData(varMap, varPlayer, RD_COMMON_NPCID)
	--x432158_payMoneyNum(varMap, varPlayer)
	--PushEvent
	--SetItemParam(varMap, varPlayer, varBagIdx, 1, 2, GetCurrentTime())
	--Msg2Player( varMap, varPlayer,"tttt"..GetPlayerRuntimeData(varMap, varPlayer, RD_COMMON_NPCID), 8, 2 )
			--LuaCallNoclosure( 432158, "ProcDoEnum", varMap, varPlayer, varPlayer, 0)
	if 	firsttime == 0 then
		SetItemParam(varMap, varPlayer, varBagIdx, 0, 2, GetCurrentTime())
		SetItemParam(varMap, varPlayer, varBagIdx, 8, 1, 0)
		LuaCallNoclosure( 432158, "ProcDoEnum", varMap, varPlayer, varPlayer, 0)
	else 

		if LastTime <= 0 then
			Msg2Player( varMap, varPlayer,"该物品已过期！", 8, 3 )
			return
		else
			local daytime	= floor(LastTime / (24 * 3600))
			local htime		= floor((LastTime - daytime * 24 * 3600) / 3600)
			Msg2Player( varMap, varPlayer,format("该物品还有%u天%u小时过期", daytime, htime), 8, 3 )
			LuaCallNoclosure( 432158, "ProcDoEnum", varMap, varPlayer, varPlayer, 0)
		end
	end
end



function x432158_GetAddTime(varMap, varPlayer)
	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		
end



function x432158_get_random_key( varLevel )
	if ( varLevel == 10 ) then
		return 1
	end
	
	if ( varLevel == 20 ) then
		return 2;
	end
	
	return nil
end


function x432158_ProcDoEnum( varMap, varPlayer, varTalknpc, varQuest)
	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
	local tb_id = GetItemParam(varMap, varPlayer, varBagIdx, 8, 1)

	--Msg2Player( varMap, varPlayer,tb_id, 8, 3 )
	if ( tb_id == nil ) then
		return
	end
	
	local lv = GetLevel( varMap , varPlayer );
	
	StartTalkTask(varMap);
	TalkAppendString( varMap , "\t《成吉思汗3 恶狼传说》专门为新手准备的礼物，当您达到相应的等级，即可获得成长礼包中的礼物。\n\t玩家在打开礼包时，需要注意自己的背包空间，已使用的礼包为灰色，未使用的礼包为白色。" );
	
	for varI,s in x432158_item_array do
	
		local clr = nil;
		if ( varI <= tb_id ) then
			clr = x432158_title_disabled_color;
		else
			clr = x432158_title_enabled_color;
		end
		
		TalkAppendButton( varMap , 10267 , clr.."新手成长包("..tostring( s.lv ).."级)...." , 3 , varI );
	end
	
	StopTalkTask( varMap)
	DeliverTalkMenu( varMap, varPlayer, varPlayer)
end


function x432158_ProcEventEntry(varMap,varPlayer,varTalknpc,varScript,extid)
	
	StartTalkTask( varMap)
	local clr_name = x432158_item_array[ extid ].clr_name;
	local item_list = x432158_item_array[ extid ].item_list;
	local cur_metier = GetZhiye( varMap , varPlayer );

	TalkAppendString( varMap , "\t您目前选择的是"..clr_name.."#W，点击确定您将获得"..item_list );
	
	--添加图标
	local pmoney = GetMoney(varMap, varPlayer,1)
	local list = x432158_item_list[ extid ].array;
	local lv = x432158_item_list[ extid ].lv;
		
	for a, b in list do
		if b.metier == cur_metier then	
			x432158_ItemPrice = b.price
			local ding 	= floor(x432158_ItemPrice / 1000000)
			local liang = floor((x432158_ItemPrice - ding * 1000000) / 1000)
			local wen	= floor(x432158_ItemPrice - ding * 1000000 - liang * 1000)
			TalkAppendString( varMap ,x432158_MissionInfo)
			TalkAppendString( varMap , format("#R需要扣除金子:%d锭%d两%d文",ding, liang, wen))
		end
	end
	for varI , s in list do
	--职业匹配
		if s.metier == cur_metier then
			for j , u in s.list do
				AddQuestItemBonus( varMap, u.varId, u.varNum)
			end
			--Msg2Player( varMap, varPlayer, s.metier, 8, 3 )
		end
	end

	--x432158_CheckCanAccept(varMap, varPlayer, npcId)
	SetPlayerRuntimeData( varMap, varPlayer, RD_ROOKIE_BOX, extid)


	StopTalkTask();
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, 432158, 10267)
	--DeliverTalkMenu( varMap, varPlayer, varTalknpc,varScript,extid)
end


function x432158_ProcQuestAccept( varMap, varPlayer, varTalknpc, varQuest )
	local gmoney1 = GetMoney(varMap, varPlayer,3)  --金卡
	local gmoney = GetMoney(varMap, varPlayer,2)	--现金	
	local price = x432158_ItemPrice
	if GetPlayerRuntimeData(varMap, varPlayer, RD_COMMON_NPCID) == 0 then	
		local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
		local extid = GetPlayerRuntimeData( varMap, varPlayer, RD_ROOKIE_BOX);
		local tb_id = GetItemParam(varMap, varPlayer, varBagIdx, 8, 1)
		if ( tb_id == nil ) then
			return
		end
		
		if ( extid == nil ) or 
		   ( extid > x432158_array_size ) then
		   return
		end
		if 	gmoney1 < price and gmoney < price then
			x432158_output_msg( varMap,varPlayer,"金卡或现金不足！" )
			StartTalkTask(varMap)
			TalkAppendString(varMap,"\n\t您的现金或金卡余额不足，请到官网进行充值！")
			StopTalkTask(varMap)
			DeliverTalkMenu( varMap, varPlayer, varPlayer)		
			return
		end
	
		if ( tb_id >= extid ) then
			Msg2Player( varMap, varPlayer, "您已经领取过该级别礼品", 8, 3 )
			return
		end
		
		if ( tb_id + 1 < extid ) then
			local key_lv = x432158_item_list[ tonumber(tb_id) + 1 ].lv;
			Msg2Player( varMap, varPlayer, "您需要先领取"..tostring( key_lv ).."级的礼包", 8, 3 );
			return
		end
		SetPlayerRuntimeData(varMap, varPlayer, RD_COMMON_NPCID, 1)
		x432158_validate( varMap, varPlayer, varTalknpc,varScript,ext)
		--local lv = x432158_item_list[ extid ].lv;
		--local cur_lv =GetLevel( varMap , varPlayer );
	else
		x432158_payMoneyNum(varMap,varPlayer,varTalknpc,varScript,extid)			
	end
	
	--判断级别
--	if cur_lv < lv then
--		Msg2Player( varMap, varPlayer, "您还没有达到该级别", 8, 3 )
--		return
--	end
	--x432158_payMoneyNum(varMap, varPlayer, varTalknpc, varQuest)
	
	--x432158_output_msg( varMap, varPlayer , "ttrrrttt" )

end



function x432158_payMoneyNum(varMap,varPlayer,varTalknpc,varScript,extid)
	local extid = GetPlayerRuntimeData( varMap, varPlayer, RD_ROOKIE_BOX)
	local list = x432158_item_list[ extid ].array
	local gmoney1 = GetMoney(varMap, varPlayer,3)  --金卡
	local gmoney = GetMoney(varMap, varPlayer,2)	--现金
	local cur_metier = GetZhiye( varMap , varPlayer )
	--local ntype = x432158_payMoneyTpye(varMap, varPlayer)
	local price = x432158_ItemPrice

	if	gmoney1 >= price and gmoney < price then
		CostMoney(varMap, varPlayer, 3, price)
		x432158_StartItemTask(varMap,varPlayer,varTalknpc,varScript,extid)
		x432158_output_msg( varMap,varPlayer,"您购买了礼包中的物品！" )
	elseif	gmoney1 < price and gmoney >= price then
		CostMoney(varMap, varPlayer, 2, price)
		x432158_StartItemTask(varMap,varPlayer,varTalknpc,varScript,extid)
		x432158_output_msg( varMap,varPlayer,"您购买了礼包中的物品！" )		
	end	
	if gmoney1 >= price and gmoney >= price then
		if GetGoldMode(varMap, varPlayer) == 0 then
			CostMoney(varMap, varPlayer, 3, price)
			x432158_StartItemTask(varMap,varPlayer,varTalknpc,varScript,extid)
			x432158_output_msg( varMap,varPlayer,"您购买了礼包中的物品！" )			
		elseif GetGoldMode(varMap, varPlayer) == 1 then
			CostMoney(varMap, varPlayer, 2, price)
			x432158_StartItemTask(varMap,varPlayer,varTalknpc,varScript,extid)
			x432158_output_msg( varMap,varPlayer,"您购买了礼包中的物品！" )		
		end
	end
end

function x432158_StartItemTask(varMap,varPlayer,varTalknpc,varScript,extid)
	local extid = GetPlayerRuntimeData( varMap, varPlayer, RD_ROOKIE_BOX)
	local varBagIdx = GetBagIndexOfUsedItem( varMap, varPlayer)
	local tb_id = GetItemParam(varMap, varPlayer, varBagIdx, 8, 1)	
	local cur_metier = GetZhiye( varMap , varPlayer )
	StartItemTask(varMap)	
	local list = x432158_item_list[ extid ].array;
	local get_num = 0;	
	local a = 0
	for varI , s in list do
		--职业匹配
		if s.metier == cur_metier then		
			for j , u in s.list do				
				ItemAppendBind( varMap , u.varId , u.varNum );
				get_num = get_num + 1;		
			end			
		end
	end
	
	
	local varRet = StopItemTask(varMap,varPlayer);
	if get_num == 0 then
		x432158_output_msg( varMap,varPlayer,"获取道具失败！" );
	end
	
	if ( varRet > 0 ) then
	
		if(DepletingUsedItem(varMap, varPlayer)) == 1 then
			DeliverItemListSendToPlayer(varMap,varPlayer);
			SetItemParam(varMap, varPlayer, varBagIdx, 8, 1,extid)
		else
			x432158_output_msg( varMap,varPlayer,"使用物品异常" );
		end
	else
		x432158_output_msg( varMap,varPlayer,"背包已满，无法得到物品！您需要至少有"..tostring( get_num ).."个背包空间！" );
	end	

end



function x432158_output_msg( varMap, varPlayer, varMsg)
	StartTalkTask(varMap)
	TalkAppendString(varMap,varMsg)
	StopTalkTask(varMap)
	DeliverTalkTips(varMap,varPlayer)
end
function x432158_validate( varMap, varPlayer, varTalknpc,varScript,ext)
	local extid = GetPlayerRuntimeData( varMap, varPlayer, RD_ROOKIE_BOX)
	local pmoney = GetMoney(varMap, varPlayer,1)
	local list = x432158_item_list[ extid ].array
	local clr_name = x432158_item_array[ extid ].clr_name;
	local item_list = x432158_item_array[ extid ].item_list;
	local cur_metier = GetZhiye( varMap , varPlayer )
	StartTalkTask(varMap)
	local ding 	= floor(x432158_ItemPrice / 1000000)
	local liang = floor((x432158_ItemPrice - ding * 1000000) / 1000)
	local wen	= floor(x432158_ItemPrice - ding * 1000000 - liang * 1000)
	TalkAppendString(varMap,"\t您是否确定花费"..format("#R:%d锭%d两%d文金子", ding, liang, wen) .."来购买该物品？")
	StopTalkTask(varMap)
	DeliverTalkInfoNM( varMap, varPlayer, varTalknpc, 432158, 10267)
end

--x310401_CheckCanAccept





--**********************************
--引导心跳处理入口：
--引导技能会在每次心跳结束时调用这个接口。
--返回：1继续下次心跳；0：中断引导。
--注：这里是技能生效一次的入口
--**********************************
function x432158_ProcActivateEachTick( varMap, varPlayer)
	return 1; --不是引导性脚本, 只保留空函数.
end




