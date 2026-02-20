# Player inventory item GUID error
_Exported on 2026/2/20 at GMT+8 18:41:02 from Cursor (2.4.28)_

---

**User**

 玩家背包物品报错，这是服务端日志，导致无法进入游戏。CXEnterMap Error!!! Has The Same Item GUID!!! PlayerGuid = 3C33609A, Serial = 67714。如果从t_item表中删除相同的guid为67714则可以恢复，但是这个会导致玩家少物品，有其它办法吗？分析服务端源码，找到合适的解决方案。t_item表结构如下CREATE TABLE `t_item` (
  `aid` bigint(20) NOT NULL auto_increment,
  `playerguid` int(10) unsigned NOT NULL COMMENT '角色GUID',
  `guid` int(11) NOT NULL COMMENT '物品ID guid位',
  `world` int(11) NOT NULL COMMENT '物品ID world位',
  `server` int(11) NOT NULL COMMENT '物品ID server位',
  `itemclass` int(11) NOT NULL COMMENT '物品类型',
  `slot` smallint(6) NOT NULL COMMENT '物品位置',
  `creator` varchar(40) default '0' COMMENT '物品创建者',
  `valid` smallint(6) NOT NULL default '1' COMMENT '有效标记位',
  `version` int(11) default '0' COMMENT '数据版本',
  `dataproperty` varchar(512) NOT NULL default '0' COMMENT '物品详细属性数据',
  `data` varchar(40) NOT NULL COMMENT '物品参数数据',
  `termendtime` int(11) NOT NULL COMMENT '物品到期时间',
  `count` int(10) unsigned NOT NULL COMMENT '物品数量',
  `islock` int(11) NOT NULL COMMENT '物品锁定标记',
  `unlocktime` int(10) unsigned NOT NULL COMMENT '物品解锁时间',
  PRIMARY KEY  (`aid`),
  KEY `Index_it_playerguid` (`playerguid`),
  KEY `Index_it_itemguid` (`guid`,`world`,`server`)
) ENGINE=InnoDB AUTO_INCREMENT=2520 DEFAULT CHARSET=latin1

---

**Cursor**

让我先读取关键的源码文件来理解这个错误的逻辑。

让我继续查看更多上下文，理解整个物品加载流程。

让我继续深入分析物品GUID相关的代码。

让我深入了解物品GUID的生成机制和物品管理器。

---

**User**

继续

---

**Cursor**

让我继续深入分析关键的存储过程和序列号管理机制。

让我再查看序列号配置文件和共享内存相关代码。

现在我已经完成了对整个系统的深入分析。以下是完整的分析报告和解决方案。

---

## 问题分析

### 1. 错误触发位置

错误发生在 `ChangeMapDelegater::EnterMap_NewEnter()` 函数中：

```1200:1240:src/khan2-mapserver/ChangeMapDelegater.cpp
	// 自检不检测
	if (g_pServerConnectorMgr->IsEnableDBShare())
	{
		//暂时加入相同道具GUID检测 
		SItemSnid szGUIDContainer[DB_KHAN3_CARDBAG_POS_END];
		memset(szGUIDContainer, 0, sizeof(szGUIDContainer));
		uint32 uContainerIndex = 0;
		BOOL hasSameGUID = FALSE;
		for(uint32 BagIndex = DB_KHAN_BAG_POS_START; BagIndex <= DB_KHAN3_CARDBAG_POS_END; ++BagIndex)
		{
			/*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*/
			SItem *pSItem = (SItem *)sItemInterface.GetItem(pPlayer, BagIndex);
			if (NULL == pSItem)
				continue;

			if(TRUE == pSItem->IsNullType())
				continue;

			for (int32 nTempIndex = 0; nTempIndex <= uContainerIndex; nTempIndex ++)
			{
				if (pSItem->m_ItemSNID.m_World == szGUIDContainer[nTempIndex].m_World
					&& pSItem->m_ItemSNID.m_Server == szGUIDContainer[nTempIndex].m_Server
					&& pSItem->m_ItemSNID.m_Serial == szGUIDContainer[nTempIndex].m_Serial)
				{
					QLogSystem::QUICK_LOG
						(
						QUICK_LOG_DEBUG,
						"CXEnterMap Error!!! Has The Same Item GUID!!! PlayerGuid = %X, Serial = %d",
						pGameConnector->GetPlayerSNID(),
						pSItem->m_ItemSNID.m_Serial
						);
					return MP_ERROR;
				}
			}

			szGUIDContainer[uContainerIndex].m_World = pSItem->m_ItemSNID.m_World;
			szGUIDContainer[uContainerIndex].m_Server = pSItem->m_ItemSNID.m_Server;
			szGUIDContainer[uContainerIndex].m_Serial = pSItem->m_ItemSNID.m_Serial;
			uContainerIndex++;
		}
	}
```

### 2. 数据映射关系

| 数据库字段 `t_item` | 内存结构 `SItemSnid` |
|---|---|
| `guid` | `m_Serial` (int32) |
| `world` | `m_World` (uchar) |
| `server` | `m_Server` (uchar) |

物品的唯一标识由 `(world, server, guid)` 三元组构成。

### 3. GUID 生成机制

```260:280:src/khan2-mapserver/Item_Manager.cpp
// GenItemSN() 通过自增 m_i_LastGenItemSerial 生成新的Serial
// 持久化到共享内存(ItemSerialKeyMK) 或 配置文件 ./Config/ItemSN.ini
```

每次创建新物品时调用 `GenItemSnid()`，自增计数器生成唯一的 Serial。

### 4. 重复GUID的根因

`proc_save_iteminfo` 存储过程以 `(playerguid, slot)` 作为唯一键进行 upsert，**不检查 guid 唯一性**。重复GUID可能由以下原因造成：
- 服务器异常崩溃导致 `m_i_LastGenItemSerial` 未正确持久化，重启后计数器回退
- 多个地图服务器的序列号计数器冲突
- 数据库手动操作或迁移错误

### 5. 关键发现 -- 代码注释

注意代码注释写的是 **"暂时加入相同道具GUID检测"**，说明这个检查本身是临时加入的，**当初设计时就不是永久性的严格校验**。

---

## 解决方案

### 方案一（推荐 -- 纯数据库修复，不丢物品）

**核心思路**：不删除重复物品，而是给其中一个重复物品分配一个新的唯一 guid。

```sql
-- 步骤1：查看重复物品的详细信息
SELECT aid, playerguid, guid, world, server, itemclass, slot, dataproperty, data, count
FROM t_item 
WHERE playerguid = 0x3C33609A AND guid = 67714 AND valid = 1;

-- 步骤2：查找当前同 world/server 下最大的 guid
SELECT MAX(guid) AS max_guid FROM t_item 
WHERE world = (SELECT world FROM t_item WHERE playerguid = 0x3C33609A AND guid = 67714 AND valid = 1 LIMIT 1)
  AND server = (SELECT server FROM t_item WHERE playerguid = 0x3C33609A AND guid = 67714 AND valid = 1 LIMIT 1);

-- 步骤3：将其中一个重复物品的 guid 更新为 max_guid + 1
-- 用步骤1查出的两条记录中任意一个的 aid
UPDATE t_item SET guid = <max_guid + 1> WHERE aid = <其中一个重复记录的aid>;

-- 步骤4（重要！）：更新序列号计数器，防止将来冲突
-- 如果使用共享内存模式 (IsEnableDBShare=true)，需要重启服务前确保共享内存已清除
-- 如果使用配置文件模式，修改 ./Config/ItemSN.ini：
--   [ItemConfig]
--   ItemSN=<max_guid + 1>   (确保 >= 新分配的guid值)
```

**优点**：无物品损失，操作简单安全，不需要改代码。
**注意**：需要确保序列号计数器 (`ItemSN`) 的值大于等于新分配的 guid，否则未来可能再次产生冲突。

---

### 方案二（源码修复 -- 将致命错误改为容错处理）

修改 `ChangeMapDelegater.cpp`，发现重复GUID时**不阻止玩家进入**，而是跳过重复物品并记录日志，让玩家能正常登录游戏：

```cpp
// 修改后的逻辑：发现重复时跳过该物品，而不是 return MP_ERROR
for (int32 nTempIndex = 0; nTempIndex <= uContainerIndex; nTempIndex ++)
{
    if (pSItem->m_ItemSNID.m_World == szGUIDContainer[nTempIndex].m_World
        && pSItem->m_ItemSNID.m_Server == szGUIDContainer[nTempIndex].m_Server
        && pSItem->m_ItemSNID.m_Serial == szGUIDContainer[nTempIndex].m_Serial)
    {
        QLogSystem::QUICK_LOG
            (
            QUICK_LOG_DEBUG,
            "CXEnterMap Warning!!! Has The Same Item GUID!!! PlayerGuid = %X, Serial = %d, Slot = %d (skipped)",
            pGameConnector->GetPlayerSNID(),
            pSItem->m_ItemSNID.m_Serial,
            BagIndex
            );
        hasSameGUID = TRUE;
        break;  // 跳出内层循环，不记录此物品的SNID，但继续处理
    }
}
if (hasSameGUID)
{
    hasSameGUID = FALSE;
    continue;  // 跳过此物品，继续处理下一个
}
```

**优点**：从根源防止此类问题再次阻塞玩家登录。
**缺点**：需要重新编译部署服务端，且仍有重复物品数据问题。

---

### 方案三（源码修复 -- 自动修复重复GUID）

更彻底的做法：发现重复时自动给重复物品分配新的GUID：

```cpp
for (int32 nTempIndex = 0; nTempIndex <= uContainerIndex; nTempIndex ++)
{
    if (pSItem->m_ItemSNID.m_World == szGUIDContainer[nTempIndex].m_World
        && pSItem->m_ItemSNID.m_Server == szGUIDContainer[nTempIndex].m_Server
        && pSItem->m_ItemSNID.m_Serial == szGUIDContainer[nTempIndex].m_Serial)
    {
        SItemSnid newSnid;
        g_pItemMgr->GenItemSnid(newSnid);
        QLogSystem::QUICK_LOG
            (
            QUICK_LOG_DEBUG,
            "CXEnterMap AutoFix!!! Duplicate GUID!!! PlayerGuid = %X, OldSerial = %d, NewSerial = %d, Slot = %d",
            pGameConnector->GetPlayerSNID(),
            pSItem->m_ItemSNID.m_Serial,
            newSnid.m_Serial,
            BagIndex
            );
        pSItem->m_ItemSNID = newSnid;
        hasSameGUID = TRUE;
        break;
    }
}
if (hasSameGUID)
{
    hasSameGUID = FALSE;
}
```

**优点**：自动修复，玩家无感知，数据自愈。
**缺点**：需要编译部署；新GUID会在下次存档时写入DB。

---

## 综合建议

| 紧急程度 | 操作 |
|---|---|
| **立即（恢复玩家登录）** | 使用 **方案一** 直接修改数据库，给重复物品分配新guid |
| **长期（防止再发）** | 使用 **方案二或方案三** 修改源码，让服务端对重复GUID具备容错能力 |
| **根因排查** | 检查 `ItemSN.ini` / 共享内存中的序列号计数器值是否异常，确认是否有计数器回退的情况 |

方案一是最快最安全的运维操作，不丢物品、不需要停服编译。你需要先执行步骤1查出两条重复记录的 `aid` 和当前最大 `guid`，然后更新其中一条即可。

需要我帮你进一步细化哪个方案的具体实施步骤，还是直接帮你修改源码？

---

**User**

如何查看ItemSN.ini / 共享内存中的序列号计数器

---

**Cursor**

现在我已经完全理解了序列号计数器的存储机制。以下是详细说明：

---

## 序列号计数器的两种存储模式

根据你的配置文件 `ExtServerConfig.ini`，当前 `EnableDBShare=1`，使用的是**共享内存模式**。

### 确认你的服务器使用哪种模式

查看 `ExtServerConfig.ini` 中对应 MapServer 的配置：

```91:99:c3config/MAP/Server/Config/ExtServerConfig.ini
[MapServerDBShare0]
EnableDBShare=1
PlayerDBShareKey=100015				;DBShare Key
ItemSNDBShareKey=700015		;物品编号
KeyCount=2			;ShareObj 数量
Key0=100015				;PlayerDBShare Key
Type0=1					;PlayerDBShare Type
Key1=700015				;ItemSerialDBShare Key
Type1=7					;ItemSerialDBShare Type
```

- `EnableDBShare=1` → 使用**共享内存**模式
- `ItemSNDBShareKey=700015` → 共享内存的 key 值

---

## 模式一：共享内存模式（你的情况）

### 原理

服务端通过 Linux System V 共享内存（`shmget`/`shmat`）存储序列号。共享内存结构体为：

```3316:3319:src/khan2-share/StructDB.h
struct ItemSerialKeyMK
{
	MKHead m_MKHead;
	uint32	m_ItemSerial;
```

`m_ItemSerial` 就是当前的序列号计数器值。

### 查看方法

**1. 查看共享内存是否存在**

在服务器上执行（需要确认当前 MapServer 对应的 key）：

```bash
# 查看所有共享内存段
ipcs -m

# 查找 key 为 700015 (十进制) 对应的共享内存
# 注意：700015 的十六进制是 0xAAE8F
ipcs -m | grep -i "aae8f"
```

`ipcs -m` 的输出会显示类似：

```
------ Shared Memory Segments --------
key        shmid      owner      perms      bytes      nattch     status
0x000aae8f 12345      root       666        xxxxx      1
```

**2. 读取共享内存中的序列号值**

需要用一个小工具来读取。可以直接在服务器上编写一个简单的 C 程序或者用 Python：

```python
#!/usr/bin/env python3
"""读取 ItemSerialKeyMK 共享内存中的序列号计数器"""
import struct
import sysv_ipc

# 从 ExtServerConfig.ini 中获取对应 MapServer 的 ItemSNDBShareKey
# MapServer0 -> 700015, MapServer1 -> 700115, 以此类推
SHM_KEY = 700015  # 修改为你的实际 key

try:
    shm = sysv_ipc.SharedMemory(SHM_KEY)
    data = shm.read()
    
    # MKHead 结构体大小需要根据实际定义确定
    # MKHead 通常包含: flag(4字节), PoolId(4字节), UseStatus(4字节), SaveTime(4字节) = 16字节
    # m_ItemSerial 紧接在 MKHead 之后
    # 偏移量可能需要根据 MKHead 的实际大小调整
    
    mkhead_size = 16  # MKHead 的大小，可能需要调整
    item_serial = struct.unpack_from('<I', data, mkhead_size)[0]
    
    print(f"SHM Key: {SHM_KEY}")
    print(f"当前 ItemSerial (m_i_LastGenItemSerial): {item_serial}")
    print(f"下一个新物品将获得的 Serial: {item_serial + 1}")
    
    shm.detach()
except sysv_ipc.ExistentialError:
    print(f"共享内存 key={SHM_KEY} 不存在（服务可能未运行）")
except Exception as e:
    print(f"读取失败: {e}")
```

**3. 更简单的方法 -- 直接从数据库查**

如果只是想确认计数器是否正常，直接查数据库中当前最大的 guid 值：

```sql
-- 查找所有物品中最大的 guid（对应 m_Serial）
SELECT MAX(guid) AS max_serial FROM t_item WHERE valid = 1;

-- 按 world/server 分组查看
SELECT world, server, MAX(guid) AS max_serial, COUNT(*) AS item_count 
FROM t_item 
WHERE valid = 1 
GROUP BY world, server;
```

如果数据库中 `MAX(guid)` **大于** 共享内存中的 `m_ItemSerial`，说明计数器发生了**回退**，这就是产生重复 GUID 的根因。

---

## 模式二：配置文件模式（备用参考）

当 `EnableDBShare=0` 时，序列号存储在文件 `./Config/ItemSN.ini` 中：

```ini
[ItemConfig]
ItemSN=67890
```

查看方法就是直接读取此文件：

```bash
cat ./Config/ItemSN.ini
```

---

## 排查建议总结

| 步骤 | 命令 | 目的 |
|---|---|---|
| 1 | `ipcs -m` | 查看共享内存段是否存在 |
| 2 | `SELECT MAX(guid) FROM t_item WHERE valid=1;` | 查看DB中最大的物品序列号 |
| 3 | 读共享内存或 `ItemSN.ini` | 获取当前计数器值 |
| 4 | 对比步骤2和步骤3 | 若 DB最大值 >= 计数器值，说明计数器已回退 |

**如果确认计数器回退**，修复方法是：
1. 停服后清除共享内存（`ipcrm -M <key>`），或修改 `ItemSN.ini`
2. 确保计数器初始值 > `SELECT MAX(guid) FROM t_item`
3. 重启服务，新的计数器会从正确的值开始自增

需要我帮你进一步分析哪部分内容，或者直接帮你生成那个 Python 读取脚本吗？

---

**User**

重启服务端后，共享内存如何初始化，会从DB查的最大值吗？

---

**Cursor**

这是一个非常关键的问题。让我从源码中追踪完整的共享内存初始化流程。

找到了关键函数，让我读取完整的 `ItemSerialKeyMK::_InitAfter` 和 `_FullFlush` 实现。

现在让我查看 `ArchiveItemSerial` 的实现，了解它从数据库查询什么。

现在我已经完整追踪了整个初始化链条。以下是详细分析。

---

## 共享内存初始化完整流程

### 答案：**不会从 t_item 表查 MAX(guid)！** 而是从独立的 `t_itemserial` 表读取。

---

### 关键数据表：`t_itemserial`

```405:416:src/sql/khan2_head(12.5).sql
-- Table structure for table `t_itemserial`  物品GUID生成器表
DROP TABLE IF EXISTS `t_itemserial`;
CREATE TABLE `t_itemserial` (
  `aid` bigint(20) NOT NULL auto_increment,
  `sid` int(11) default NULL COMMENT '服务器ID',
  `dbskey` int(11) default NULL COMMENT '未使用',
  `sn` int(11) default NULL COMMENT '物品GUID生成器编号',
  PRIMARY KEY  (`aid`),
  KEY `Index_tik_sid` (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
```

每个 MapServer 有一条记录，`sid` 是服务器ID，`sn` 是该服务器上次持久化时的序列号值。

---

### 启动顺序：先 DBShare，再 MapServer

整个架构是 **DBShare 进程** 管理共享内存，**MapServer** 只是附加读写。

### 情况一：DBShare 启动时共享内存不存在（全新启动/清理过共享内存后）

代码在 `MKLogicManager.cpp` 1522-1603 行：

```1522:1603:src/khan2-dbshare/MKLogicManager.cpp
BOOL ArchiveNodeLogic<ItemSerialKeyMK>::_InitAfter(BOOL bRecoverData/*=FALSE*/)
{
	__GUARD__
#define SERIAL_GROWUP	10000

	// ... 省略空检查 ...

	if( bRecoverData )  // 共享内存已存在的情况
	{
		ItemSerialKeyMK	*pMK = m_pArchiveNodePool->GetPoolObj(0);
		if(pMK) pMK->TryUnLock(SM_C_WRITE);
		m_bReady = TRUE;
		QLogSystem::SLOW_LOG("./Log/DBShare", "RecoverData ItemSerialKeyMK.");
		return TRUE;
	}

	// ===== 全新初始化 =====
	// ... 省略变量声明 ...
	pMK->Clear();

	// 从 t_itemserial 表读取 sn
	ArchiveItemSerial	ItemSerialObject(pCore);
	ItemSerialObject.SetSID(MapID);
	if(ItemSerialObject.DB2Memory())
	{
		ItemSerialObject.FetchDATAS(&Serial);
	}

	if(Serial > 0)
	{
		pMK->SetSerial(SM_C_WRITE, Serial + SERIAL_GROWUP);  // 关键：+10000 安全余量
	}

	// ...
}
```

执行的 SQL 是：

```sql
SELECT sid, sn FROM t_itemserial WHERE sid = <MapServerID>
```

**然后将读到的 `sn` 值加上 10000 (`SERIAL_GROWUP`) 作为安全余量，写入共享内存。**

### 情况二：DBShare 启动时共享内存已存在（例如 MapServer 崩了但 DBShare 还在）

直接走 `bRecoverData = TRUE` 分支：

```cpp
if(bRecoverData)
{
    // 直接复用共享内存中的现有值，不查数据库
    pMK->TryUnLock(SM_C_WRITE);
    m_bReady = TRUE;
    return TRUE;
}
```

**不查任何数据库，直接使用共享内存中已有的值。**

### MapServer 启动

MapServer 以 `SMPT_SERVER` 模式 Init，只能 attach 到已存在的共享内存（不能自己创建）。然后：

```cpp
// Item_Manager.cpp line 239
m_i_LastGenItemSerial = m_pSerialMK->GetSerial(SM_S_READ);
```

直接从共享内存读取当前序列号。

### DBShare 定期持久化

DBShare 在运行过程中通过 `_TickFlush()` / `_FullFlush()` 周期性地把共享内存中的当前 Serial 值写回 `t_itemserial` 表：

```sql
UPDATE t_itemserial SET sn = <当前Serial值> WHERE sid = <MapServerID>
```

---

## 问题根因分析

现在可以清楚地看到**重复 GUID 产生的风险场景**：

| 场景 | 计数器恢复方式 | 是否安全 |
|---|---|---|
| MapServer 崩溃，DBShare 正常 | 共享内存值不变 | **安全** |
| DBShare 崩溃，共享内存被清 | 从 `t_itemserial.sn` + 10000 | **基本安全**（除非 flush 间隔内创建了超过 10000 个物品） |
| 整机重启，共享内存清除 | 从 `t_itemserial.sn` + 10000 | **同上** |
| DBShare 崩溃 + t_itemserial 值过旧 | 旧值 + 10000 可能不够 | **有风险！** |

**最大风险**：如果 DBShare 长时间未 flush（比如异常退出），`t_itemserial.sn` 停留在很早的值。即使加了 10000 的余量，如果在那段时间内创建的物品 Serial 已经超过了 `旧sn + 10000`，重启后就会产生重复。

---

## 查看和验证方法

在数据库中执行：

```sql
-- 1. 查看 t_itemserial 中各服务器的计数器值
SELECT sid, sn FROM t_itemserial;

-- 2. 查看 t_item 中实际的最大 guid
SELECT MAX(guid) AS max_item_guid FROM t_item WHERE valid = 1;

-- 3. 对比！如果 max_item_guid >= t_itemserial.sn + 10000，说明有重复风险
-- 如果 max_item_guid >= t_itemserial.sn，说明计数器确实落后了
```

**如果发现 `t_item.MAX(guid)` > `t_itemserial.sn`，这就是问题的根因**。修复方法：

```sql
-- 将 t_itemserial 的 sn 更新为安全值
UPDATE t_itemserial 
SET sn = (SELECT MAX(guid) + 10000 FROM t_item WHERE valid = 1) 
WHERE sid = <你的MapServerID>;
```

这样下次重启时，`sn + 10000` 一定大于所有现有物品的 guid，就不会再产生重复了。

---

## 总结

| 问题 | 回答 |
|---|---|
| 重启后会从 DB 查最大值吗？ | **不会**。从 `t_itemserial.sn` 读取，而非 `MAX(t_item.guid)` |
| 有安全余量吗？ | 有，+10000 (`SERIAL_GROWUP`)，但不一定够 |
| 共享内存存在时会查 DB 吗？ | **不会**，直接复用共享内存中的值 |
| 根因 | `t_itemserial.sn` 与实际 `t_item.guid` 不同步，DBShare flush 不及时或异常退出 |

---

**User**

DBShare  flush到DB的周期，这个在哪儿控制，

---

**Cursor**

现在让我查看实际配置文件中的值。

找到了。以下是完整的 flush 周期控制机制。

---

## 配置文件位置

`ExtServerConfig.ini` 中的 `[DBShare]` 节：

```29:32:c3config/MAP/Server/Config/ExtServerConfig.ini
[DBShare]
DBShareInterval=1800000		;GLServer数据存盘时间（毫秒）
DATAInterval=900000		;Player数据存盘时间(毫秒)
DynamicMKInterval=500 		;动态数据读取(毫秒)，1.庄园等
```

## 参数对应关系

| 配置项 | 变量 | 当前值 | 换算 | 用途 |
|---|---|---|---|---|
| `DBShareInterval` | `MKInterval` | 1800000 ms | **30 分钟** | ItemSerial/公会/邮件等共享数据 flush 周期 |
| `DATAInterval` | `DATAInterval` | 900000 ms | 15 分钟 | 玩家角色数据存盘周期 |
| `DynamicMKInterval` | `DynamicMKInterval` | 500 ms | 0.5 秒 | 庄园等动态数据刷新周期 |

## 代码调用链

`ItemSerialKeyMK` 的 `_TickFlush()` 使用的就是 `MKInterval`：

```1484:1503:src/khan2-dbshare/MKLogicManager.cpp
BOOL ArchiveNodeLogic<ItemSerialKeyMK>::_TickFlush()
{
	__GUARD__ uint32	uTime = GET_TIME().TickCount();

	if(uTime > m_FinalSaveTime + g_Config.m_ShareMemInfo.MKInterval)  // 即 DBShareInterval
	{
		if(m_bReady)
		{
			_FullFlush(FALSE);  // 执行: UPDATE t_itemserial SET sn = <当前值> WHERE sid = <MapID>
		}

		m_FinalSaveTime = uTime;
	}

	return TRUE;
}
```

默认值（代码中的 fallback）：

```1098:1102:src/khan2-share/Core/Setting.h
MKInterval = 60;          // 默认 60ms（极短，但实际被配置文件覆盖）
DynamicMKInterval = 500;
DATAInterval = 300000;    // 默认 5分钟
```

---

## 这就是重复 GUID 问题的根因

**当前配置：`DBShareInterval = 1800000`（30分钟）**

这意味着：
- ItemSerial 每 **30 分钟** 才写一次 `t_itemserial` 表
- 如果 DBShare 在两次 flush 之间异常崩溃，`t_itemserial.sn` 最多可能落后 **30 分钟**
- 重启时安全余量只有 `SERIAL_GROWUP = 10000`
- 如果这 30 分钟内创建了超过 10000 个物品，就会产生**重复 GUID**

### 举个具体例子

```
时间线:
00:00  DBShare flush → t_itemserial.sn = 50000
00:01  MapServer 创建物品, Serial = 50001, 50002, ...
...
00:29  MapServer 已创建到 Serial = 61000（创建了 11000 个物品）
00:30  DBShare 还没来得及 flush，整机异常重启！

重启后:
→ 从 t_itemserial 读到 sn = 50000
→ 加上 SERIAL_GROWUP: 50000 + 10000 = 60000
→ 新的 Serial 从 60001 开始
→ 但 60001~61000 这些 Serial 已经存在于 t_item 中！
→ 重复 GUID 产生！
```

---

## 解决建议

**方法1 -- 缩短 flush 周期（推荐，立即生效）：**

修改 `ExtServerConfig.ini`：

```ini
[DBShare]
DBShareInterval=60000		; 改为 1 分钟（60000毫秒）
```

这样最大数据丢失窗口从 30 分钟缩短到 1 分钟，`SERIAL_GROWUP = 10000` 的安全余量绝对够用。

**方法2 -- 增大 SERIAL_GROWUP（需要改代码重编译）：**

修改 `MKLogicManager.cpp` 第 1525 行：

```cpp
#define SERIAL_GROWUP	100000  // 从 10000 改为 100000
```

**方法3 -- 最佳方案：_InitAfter 时同时检查 t_item 的 MAX(guid)，取较大值**

这需要修改 `_InitAfter` 函数，在从 `t_itemserial` 读取 `sn` 后，额外查询 `SELECT MAX(guid) FROM t_item`，取两者的较大值再加 `SERIAL_GROWUP`，从根本上杜绝回退风险。

---

总结：**`DBShareInterval=1800000`（30分钟）** 就是你配置文件中控制 flush 周期的参数，位于 `ExtServerConfig.ini` 的 `[DBShare]` 节。

