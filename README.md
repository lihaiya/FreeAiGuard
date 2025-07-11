# FreeAIGuard-开源智能运维哨兵-智能运维系统-高危操作盯防
FreeAIGuard 是一个开源的智能运维盯防系统，专注于高危操作预警与异常行为监控，为运维团队提供自动化智能防护解决方案。实时高危操作预警、智能异常检测、多维度日志分析、自动化响应机制、可视化告警中心、服务器高危命令执行监控、数据库敏感操作预警、异常登录行为检测、批量操作风险控制、运维操作合规性审计；智能预警引擎，基于历史运维数据训练风险预测模型，实时评分操作风险等级，动态调整预警阈值；日志聚合分析，支持多种日志格式和协议，上下文关联分析，操作链追溯；自动化响应，高危操作自动阻断，可疑会话自动隔离，智能生成处置建议；运维可视化：实时风险态势面板，历史事件时间线，多维统计分析报表!!!

**🚀 专注运维操作风险防控 | AI驱动的实时盯防系统 | 跨平台日志审计利器**  
**👉 项目地址**：`https://github.com/lihaiya/freeaiguard`  
**📖 在线文档**：`编写ing`  

---

## 🔥 核心痛点  
当运维遇到这些问题时，FreeAIGuard 是你的终极防线：  
- **误操作导致业务中断**：`rm -rf`、`drop table` 等危险命令无拦截  
- **变更窗口外违规操作**：非计划时间修改生产环境配置  
- **日志分散难追溯**：Linux、MySQL、网络设备日志格式不统一  
- **事后排查效率低**：故障发生后需人工翻查海量日志  

---

## 🛡️ 产品定位  
FreeAIGuard 是一款 **开源智能运维审计系统**，通过 AI 实时分析操作日志，实现：  
✅ **高危操作秒级阻断** - 基于 NLP 识别 `rm`、`kill` 等 2000+ 危险模式  
✅ **全栈日志统一采集** - 支持 Linux/Windows/MySQL/Oracle/Cisco/Huawei 等 30+ 设备类型  
✅ **智能告警网络** - 邮件/微信/钉钉/Webhook 多通道实时通知  
✅ **零成本对接现有系统** - 无侵入式 Agent，兼容 Syslog/ELK/Prometheus  

---

## 🎯 功能全景  
| 模块                | 能力说明                                                                 |
|---------------------|--------------------------------------------------------------------------|
| **日志采集**        | 支持 Agent/Syslog/API 三种方式，自动解析 SSH、SQL、CLI 等操作日志       |
| **AI风险引擎**      | 内置 LSTM+规则引擎双模式识别，误报率 < 0.1%                              |
| **多租户审计**      | 操作记录关联具体用户，支持命令回放和操作时间轴追溯                       |
| **灵活告警**        | 分级告警策略（提醒/阻断/工单），支持自定义正则规则                       |
| **开放API**         | 提供 RESTful API 与 Kubernetes/ServiceNow/Zabbix 等平台集成              |

---

## 🚀 快速开始  
### 1. 极速部署（Docker 版）  
### 2. 配置监控规则（示例 YAML）  
### 3. 查看实时风险看板  
---

## 🌟 为什么选择 FreeAIGuard？  
| 对比维度       | 传统方案                | FreeAIGuard                          |
|---------------|-------------------------|--------------------------------------|
| **部署成本**  | 需采购商业软件          | 开源免费，支持私有化部署             |
| **分析能力**  | 基于固定规则            | AI+规则双引擎，自适应新威胁          |
| **扩展性**    | 封闭系统                | 插件化架构，支持自定义解析器         |
| **响应速度**  | 分钟级延迟              | 秒级实时阻断                         |

---

## 📚 典型应用场景  
### 场景1：防止数据库误删  
```sql
-- 当检测到无备份的删除操作时自动拦截并通知DBA
DELETE FROM production_table WHERE id=123;
```
📌 **效果**：触发规则 → 阻断连接 → 发送工单 → 记录审计日志  

### 场景2：非变更窗口操作管控  
⏰ 设置维护时间窗口：`Mon-Fri 20:00-23:00`  
🛑 非窗口期执行 `iptables -F` 将自动触发安全告警  

### 场景3：多厂商网络设备统一审计  

---
## 🔥 当前已商用的模块：
- **IT HelpDesk**：集成 LLM大模型呼叫中心系统，对接内部知识库，服务公司内部员工，如解答常见问题：电脑如何加域，电脑上不了网了，怎么申请邮箱等；
- **IT 运维助手**：IM运维助手机器人，将最佳实践、常见问题的知识库内容给大模型呼叫中心系统，形成运维专用助手，从而在修改如交换机配置时，能快速看到最佳实践，并与大模型聊天，获得命令的参考；
- **应用巡检**：Zabbix等监控软件，毕竟只能检测到机器的网络、存储等基础信息以及部分应用的状况，而对上层应用来说，只能通过页面点击，确认产品是否有bug，因此，页面点击、确认业务运行状态，是很有必要的。我们采用流程自动化技术，解决该问题，目前已得到运营商客户的生产环境使用，效果显著，已实现30分钟关键业务的自动化巡检，一旦出现关键问题，调用IT Helpdesk进行IP电话系统的拨打，拨打对应IT技术人员。 

 **目前仍在实现“高危指令预警”、“故障自愈”、“故障修复辅助”的路上！** 

## 🛠️ 技术栈：golang python vue JavaScript Java Mysql PG
<!-- 
- **日志采集**：Filebeat/Logstash 插件  
- **AI分析**：PyTorch + Transformers（预训练运维语料库）  
- **存储**：Elasticsearch + PostgreSQL（审计日志）  
- **告警**：Celery + Redis 异步队列  
- **前端**：Vue3 + ECharts
  -->

---

## 🤝 参与贡献  
![image](https://github.com/user-attachments/assets/09977fad-3a9d-42ca-984c-d61f8386b043)

---

## 📜 开源协议:GPL3.0
---

## 📞 联系我们  
📧 微信：freeaiclub
💬 电话：+86-15700176897  

**⭐ 如果这个项目对你有帮助，请给我们一个 Star！！**  

---

### 附录  
- [Benchmark 报告]((docs/编写ing)  
- [与商业软件对比表]((docs/编写ing)  

---
