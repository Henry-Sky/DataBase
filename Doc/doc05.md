## 第五章: 范式

**关系模式:** 一个五元组
R(U, D, DOM, F)
- R: 关系名
- U: 属性
- D: 域
- DOM: 属性向域的映象集合
- F: 属性间的数据依赖关系集合

**候选码:**  
若关系模式R有多个候选码，则选定其中的一个做为主码（Primary key）

**依赖**
- 完全依赖: C可以通过AB得到,并且C不可以仅通过A得到,也不可以仅通过B得到,那么就说C完全依赖AB
- 部份依赖: C可以通过AB得到,并且C也可以仅通过A得到,仅通过B得到,那么就说C部分依赖AB
- 传递依赖: B可以通过A得到,C可以通过B得到,那么就称C传递依赖A

**范式:**[参考](https://blog.csdn.net/A_art_xiang/article/details/113880638)
- 第一范式(1NF): 原子性, 每个属性都必须不可再分
- 第二范式(2NF): 唯一性, 非主键字段的值必须完全依赖主键(不能部分依赖)
- 第三范式(3NF): 独立性, 非主键值不依赖于另一个非主键值(消除传递依赖)
- BC范式(BCNF): 主键规范,主属性中不存在某些属性部分依赖另外一些属性
- 多值依赖与第四范式(4NF)

**事务:**
- 定义: 是一系列数据库操作的执行单元，被视为一个不可分割的工作单位
- 特性(ACID特性):
    1. 原子性：事物是数据库的逻辑工作单位, 事物中包括得诸操作要么都做, 要么都不做
    2. 一致性：事务执行的结果必须是使数据库从一个一致性状态变到另一个一致性状态
    3. 隔离性：一个事物内部的操作及使用的数据对其它并发事物是隔离的, 并发执行的各个事物之间不能互相烦扰
    4. 持续性：它对数据库中数据的改变就应该是永久性的, 接下来的其它操作或故障不应该对其执行结果有任何影响