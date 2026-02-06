const fs = require('fs');
const iconv = require('iconv-lite');

const filePath = './item_mix.tab';

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

    const id = parseInt(cols[2], 10);
    const name = cols[1].trim();
    const jineng = cols[4].trim();
    let level = parseInt(cols[5].trim()) * 10;
    if (jineng =="30") {
        level = 75;
    }

    if (isNaN(id) || !name) continue;


    // 筛选逻辑
    result.push({ id, name,level });
}

// 按 id 升序排列
result.sort((a, b) => a.id - b.id);

// 输出结果
console.log(`筛选结果（共 ${result.length} 时装）:\n`);
let res = ``;
let index = 1;
let buffID = 21200;
//金币商店1页有36个
let targetLevel = 180
for (const { id, name,level } of result) {
    if (level > targetLevel) continue;
    res += `{varItem=	${id}	,probability=	500	, price=	1	,varName="${name}", deplete = 1,},\n`
    index++;
}
console.log(res)

// 如果想保存结果到文件，请取消注释以下行：
// fs.writeFileSync('filtered_horse.txt', result.map(r => `${r.id}\t${r.name}`).join('\n'), 'utf8');
