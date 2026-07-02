# webPPT

基于 Python `http.server` 的轻量级 PPT 展示服务，通过浏览器访问本地部署的 HTML 演示文稿。

## 服务管理命令

```bash
# 启动服务（后台运行，端口 55435）
bash webppt-ctl.sh start

# 停止服务
bash webppt-ctl.sh stop

# 重启服务
bash webppt-ctl.sh restart

# 查看运行状态（含已部署的 PPT 列表）
bash webppt-ctl.sh status
```

启动后通过 `http://<host>:55435/<ppt-name>/` 访问对应 PPT。

### 控制信息

- 服务端口：`55435`
- 日志文件：`/tmp/webppt-server.log`
- PID 文件：`/tmp/webppt-server.pid`

---

## 已有 PPT

### iCare 医防融合协同平台系统汇报

- **路径**：`/iCare/`
- **页数**：25 页
- **主题**：iCare 医防融合协同平台技术方案汇报

面向基层医疗机构的慢病管理平台，核心内容包括：

| 章节 | 内容 |
|------|------|
| 一、慢病系统概述 | 系统定位、技术栈（ThinkPHP 8.1 + Vue 3.3 + Electron + MySQL/PostgreSQL）及框架说明 |
| 二、全周期数据排列与存储 | 多源数据接入、Kafka 管道、三表式数据库设计（患者主索引 / 随访队列 / 终点事件队列） |
| 三、RPA 与多源 HIS 系统连接 | Playwright + Chromium 自动化对接封闭系统，含 ExtJS 适配、验证码识别、可靠性设计 |
| 四、慢病处方 | 基于真实诊疗数据的个性化处方生成，区别于通用 AI |
| 五、预测算法 | 事件-特征变化驱动分桶法 + 离散时间生存模型，覆盖就诊激活、转诊、并发症等五类预测 |
| 六、应用场景 | 医保费用预测、门诊峰谷预测、医疗资源调配与智能门诊随访 |

**技术亮点**：Kafka 数据管道 → MySQL/PostgreSQL 双库协同 → RPA 自动化补足封闭系统数据互通 → 离散时间生存模型实现动态风险预测。
