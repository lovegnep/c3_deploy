const fs = require('fs');


let res = ``;
let index = 1;
let buffID = 6780;
let count = 91
for (let i = 0; i < count; i++) {
    let tmpBuffID = buffID + i;
    let v = (i+1)*13
    res += `${tmpBuffID}	体质	力量修正修值	${v}	耐力修正值	${v}	智力修正值	${v}	敏捷修正值	${v}																										15	STD_IMPACT_003	1	${tmpBuffID}	${tmpBuffID}	${tmpBuffID}	1	1	1	0	0	0	0	0	0	1	-1	0	0	0	-1	0	0					1\n`
}
console.log(res)

// 如果想保存结果到文件，请取消注释以下行：
fs.writeFileSync('gen_up_buff_logic.txt', res, 'utf8');
