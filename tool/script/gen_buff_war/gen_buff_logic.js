const fs = require('fs');
const iconv = require('iconv-lite');

let res = ``;
let resdesc = ""
let reslua = ""
let index = 1;
let buffID = 9160;
let needjifen = 100
let jf = 0;
for (let i = 0; i < 100; i++) {
    let text = "";
    if (index >= 1 && index <= 10) {
        text = `战神降临·第${index}重（战神初临）`
    } else if (index >= 11 && index <= 30) {
        text = `战神降临·第${index}重（战神觉醒）`
    } else if (index >= 31 && index <= 60) {
        text = `战神降临·第${index}重（战神降世）`
    } else if (index >= 61 && index <= 90) {
        text = `战神降临·第${index}重（战神化身）`
    } else if (index >= 91 && index <= 100) {
        text = `战神降临·第${index}重（战神真身）`
    }

    let v = (i+1)*5
    res += `${buffID}		命中修正值	${v}	闪避修正值	${v}	会心修正值	${v}	韧性修正值	${v}	暴击伤害修正值	${v}																								13		1	${buffID}	${buffID}	${buffID}	1	1	1	0	0	0	0	0	0	1	-1	0	0	0	-1	0	0\n`

    resdesc += `${buffID}	${buffID}	9	1	CJSH_wanfa_add_6_1			人物身体前置点			人物头部绑定点	1	0	0	0						${text}：命中+${v}闪避+${v}暴击+${v}韧性+${v}暴击伤害+${v}	1	${text}：命中+${v}闪避+${v}暴击+${v}韧性+${v}暴击伤害+${v}\n`
    jf += (i+1)*needjifen
    reslua += `{index=${index}, level=${jf},buffID=${buffID},buffDesc="${text}：命中+${v}闪避+${v}暴击+${v}韧性+${v}暴击伤害+${v}"},\n`

    index++
    buffID++
}
// console.log(res)

// 如果想保存结果到文件，请取消注释以下行：
fs.writeFileSync('gen_buff_logic.txt', res, 'utf8');
fs.writeFileSync('gen_buff_desc.txt', resdesc, 'utf8');
fs.writeFileSync('gen_buff_lua.txt', reslua, 'utf8');
