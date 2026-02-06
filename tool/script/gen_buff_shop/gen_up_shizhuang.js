const fs = require('fs');
const iconv = require('iconv-lite');

const filePath = './equipmodel.tab';

// 读取文件（以 buffer 形式再转码为 GB2312）
const buffer = fs.readFileSync(filePath);
const content = iconv.decode(buffer, 'gb2312');

// 按行拆分
const lines = content.split(/\r?\n/);

// 存放符合条件的马
const result = [];
let nameMap = {}
for (const line of lines) {
    if (!line.trim()) continue; // 跳过空行

    const cols = line.split('\t');
    if (cols.length < 5) continue; // 跳过无效行

    const id = parseInt(cols[0], 10);
    const name = cols[2].trim();

    if (isNaN(id) || !name) continue;

    if(!(id >= 10300000 && id <= 10306150)) {
        continue;
    }

    // 筛选逻辑
    result.push({ id, name });
}

// 按 id 升序排列
result.sort((a, b) => a.id - b.id);

// 输出结果
console.log(`筛选结果（共 ${result.length} 时装）:\n`);
let res = ``;
let index = 1;
let buffID = 21200;
for (const { id, name } of result) {
    let v = index+4
    res += `{index = ${index} ,targetID = ${id}, targetName = "${name}", buffID = ${buffID}, buffDesc = "${name}时装激活：命中+${v}闪避+${v}暴击+${v}韧性+${v}暴击伤害+${v}",hs=1},\n`
    index++;
    buffID++
}
console.log(res)

// 如果想保存结果到文件，请取消注释以下行：
fs.writeFileSync('gen_up_shizhuang.txt', res, 'utf8');
