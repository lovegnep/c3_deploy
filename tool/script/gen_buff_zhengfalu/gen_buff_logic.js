const fs = require('fs');
const iconv = require('iconv-lite');

let res = ``;
let resdesc = ""
let reslua = ""
let index = 1;
let buffID = 9300;
let needjifen = 100
let jf = 0;
for (let i = 0; i < 100; i++) {
    let text = "";
    if (index >= 1 && index <= 10) {
        text = `万族征伐录 Lv.${index} (草原试猎)`
    } else if (index >= 11 && index <= 20) {
        text = `万族征伐录 Lv.${index} (铁骑初征)`
    } else if (index >= 21 && index <= 50) {
        text = `万族征伐录 Lv.${index} (血战百族)`
    } else if (index >= 51 && index <= 60) {
        text = `万族征伐录 Lv.${index} (万族克星)`
    } else if (index >= 61 && index <= 70) {
        text = `万族征伐录 Lv.${index} (天命征服者)`
    } else if (index >= 71 && index <= 99) {
        text = `万族征伐录 Lv.${index} (万族噩梦)`
    } else if (index >= 100 && index <= 100) {
        text = `万族征伐录 Lv.${index} (大汗之威 满级)`
    }

    let v = (i+1)*50
    res += `${buffID}	体质	力量修正修值	${v}	耐力修正值	${v}	智力修正值	${v}	敏捷修正值	${v}																										15	STD_IMPACT_003	1	${buffID}	${buffID}	${buffID}	1	1	1	0	0	0	0	0	0	1	-1	0	0	0	-1	0	0				-1\n`

    resdesc += `${buffID}	${buffID}	9	1	CJSH_wanfa_add_6_16			人物身体前置点			人物身体受击点	1	0	0	1						${text}：全属性+${v}	1	${text}：全属性+${v}\n`
    jf += (i+1)*needjifen
    reslua += `{index=${index}, level=${jf},buffID=${buffID},buffDesc="${text}：全属性+${v}"},\n`

    index++
    buffID++
}
// console.log(res)

// 如果想保存结果到文件，请取消注释以下行：
fs.writeFileSync('gen_buff_logic.txt', res, 'utf8');
fs.writeFileSync('gen_buff_desc.txt', resdesc, 'utf8');
fs.writeFileSync('gen_buff_lua.txt', reslua, 'utf8');
