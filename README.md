# memory_leak_watchdog
<img src="./watch_dog.jpg" width="50%" aligncenter />

### 简介    
_Swift memory leak watchdog. Check memory leak while page exiting_.

在页面退出后，弹出Alert警告内存泄漏。告警信息包含:
- 泄漏的对象名
- 引用链

__Demo__

<img src="./leak_test.gif" width="300">

### 原理
1. 通过Mirror在运行时拿到对象的ivar
2. 利用weak指针的特性：
   - 不增加retainCount从而不影响对象正常析构
   - 对象析构后自动置nil
3. 在页面退出时使用weak指针标记ivar，在经验值X秒后观察其是否为nil，来判断ivar是否被泄漏
