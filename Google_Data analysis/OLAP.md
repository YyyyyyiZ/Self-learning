# Online Analytical Processing

## 语法形式

==function over ([partition by 字段名] [order by 字段名])==

over必选：用于指定函数执行的窗口范围，若后面括号中什么都不写，窗口函数将基于所有行进行计算；如果不为空，则支持以下2种语法设置窗口

partition by可选：指定分组字段，窗口函数在不同的分组上分别执行

order by可选：指定排序字段，窗口函数将根据记录排序后的顺序进行编号







## 非聚合函数作为窗口函数

### 序号函数

* rank()
* dense_rank()
* row_number()

```sql
SELECT *, 
rank() over (PARTITION BY scourse ORDER BY sresult DESC) AS ranking,
dense_rank() over (PARTITION BY scourse ORDER BY sresult DESC) AS des_rank,
row_number() over (PARTITION BY scourse ORDER BY sresult DESC) AS row_num
FROM score 
-- rank:存在并列排名，且占用原来名次
-- dense_rank:存在并列排名，不占用原来名次
-- row_number:不存在并列排名
```

<img src="https://img-blog.csdnimg.cn/img_convert/95dffb4206c768b200d02a938cca161e.jpeg" alt="img" style="zoom:50%;" />

### 分布函数

* cume_dist()
	* 计算某个值在一组有序的数据中累计分布百分比
	* 返回值=当前计算值所在位置/总行数，如果存在重复值，计算的时候，取重复值的最后一行的位置

* percent_rank()
	* 计算某个值在一组有序的数据中累计分布百分比
	* 返回值=(rank-1)/(rows-1) 如果存在重复值，计算的时候，取重复值的最后一行的位置

### 前后函数

* lag(expr, offset, defval=null) 查询同一字段的前N行数据
	* expr: 要取的列
	* offset: 取偏移后的第几行数据
	* defval: 无偏移值的取值，默认为NULL
* lead(expr, offset, defval=null) 查询同一字段的后N行数据
	* expr: 要取的列
	* offset: 取偏移后的第几行数据
	* defval: 无偏移值的取值，默认为NULL

```sql
select *, lag(成绩, 2) over (order by 成绩) lags,
lead(成绩, 2) over (order by 成绩) leads
from class
```

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230727141911315.png" alt="image-20230727141911315" style="zoom:50%;" />



### 头尾函数

* first_value(expr): 获取分区，结果集中的第一行
	* expr: 要选取的字段

* last_value(expr): 获取分区，结果集中的最后一行
	* expr: 要选取的字段

```sql
select *, 
first_value(成绩) over(partition by 班级) first,
last_value(成绩) over(partition by 班级) last
from class
```

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230727142234069.png" alt="image-20230727142234069" style="zoom:50%;" />

###  其他函数

* nth_value(expr, n)
	* expr： 窗口函数选取的字段
	* n： 分区或结果集的第n行
* ntile(n)
	* 将排序分区中的行划分为特定数量的组，在每个组分配一个从1开始的桶号，桶号最大为n，且桶号表示行所属的组
	* n： 桶号， 表示行所在的组

```sql
select *,
nth_value(成绩, 1) over(partition by 班级) nth,
ntile(4) over(partition by 班级) nti
from class
```

<img src="C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230727142501697.png" alt="image-20230727142501697" style="zoom:50%;" />

## 聚合函数作为窗口函数

sum, max, count, min, avg等聚合函数用作窗口函数时，可以获得累加值，累计区间内最大值，最小值，平均值，累计行数

```sql
select *, sum(成绩) over (order by 学号) c_sum,
avg(成绩) over (order by 学号) c_avg,
count(成绩) over (order by 学号) c_count,
max(成绩) over (order by 学号) c_max,
min(成绩) over (order by 学号) c_min
from class
```

![image-20230727143011820](C:/Users/Lenovo/AppData/Roaming/Typora/typora-user-images/image-20230727143011820.png)

## 经典面试题

### 排名问题

#### 每个班按成绩排名

```sql
SELECT *, 
rank() over (PARTITION BY scourse ORDER BY sresult DESC) AS ranking,
dense_rank() over (PARTITION BY scourse ORDER BY sresult DESC) AS des_rank,
row_number() over (PARTITION BY scourse ORDER BY sresult DESC) AS row_num
FROM score 
-- rank:存在并列排名，且占用原来名次
   dense_rank:存在并列排名，不占用原来名次
   row_number:不存在并列排名
```

#### 每个班的最大值/最小值

```sql
SELECT * 
FROM score as a 
WHERE sresult = (SELECT max(sresult) FROM score as b WHERE b.scourse = a.scourse);-
```

### TOP N问题

```sql
-- 这个运行是错误的，因为select语句在where后面执行的
SELECT *, row_number() over (partition by sid order by scresult DESC) as ranking 
FROM score WHERE ranking <=N;
-- 正确运行
SELECT *
FROM (SELECT *, row_number() over (partition by sid order by sresult DESC) as ranking FROM score)as a 
WHERE ranking <=N;
```

### 查找每个组里大于平均值的数据

```sql
-- 窗口函数实现
select *
from (
     SELECT *, avg(sresult) over (partition by scourse) as avg_score FROM score
     ) as a 
where sresult > avg_score ;

-- 标量子查询实现
select *
from score a
where sresult > (
select avg(sresult) from score b where a.scourse=b.scourse group by scourse)
```

### 移动平均问题

```sql
SELECT *,
avg(sresult) over (order by scourse rows 2 preceding) as current_avg
FROM score;
-- 比如第四行的current_avg，是等于自己的sresult（90）+它前两行的sresult（60+80）的平均值
```

<img src="https://img-blog.csdnimg.cn/img_convert/ef84c056b2f4a9af78ea15e36c4e0f5c.jpeg" alt="img" style="zoom:50%;" />

### 连续天数

```sql
SELECT DISTINCT user_id,
FROM(
    SELECT user_id,DATE_SUB(log_date, INTERVAL rank_id DAY) AS flag_date
FROM(
    SELECT user_id, log_date, DENSE_RANK() OVER (PARTITION BY user_id ORDER BY log_date) AS rank_id FROM users
) AS A
GROUP BY user_id, flag_date
HAVING COUNT(flg_date) >= 3
) AS B
```

