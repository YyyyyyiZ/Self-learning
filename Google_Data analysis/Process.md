## Spreadsheets

> Function—a set of instructions that performs a specific calculation using the data in a spreadsheet

> Syntax—a predetermined structure that includes all required information and its proper placement
>
> Absolute refernce–a reference that is locked so that rows and/or columns won’t  change when copied

* Conditional formatting
* IF(end>start, end-start, 1-start+end) = MOD(end-start, 1)
* COUNTIF(range,”criterion”)
* SUMIF(range, “criterion”，[value])
* LEN(range)
* LEFT(range, number of characters)
* RIGHT(range, number of characters)
* MID(range, start, number)
* VALUE(String)
	* convert a string into a numerical
* CONCATENATE(item1,item2)
* TRIM(range)
* CONVERT()
* SUMPRODUCT(array1, [array2],……)
* VLOOKUP()
	* data aggregation
	* limitations
		* only returns the first match its finds
		* only finds the value from lookup value to the right, can’t look left
		* version control
* Sorting
	* SORT(range, sort_col, TRUE/FALSE)
	* sort range
	* customized sort order
* Filtering
* Pivot table
	* pivot group
	* calculated field — a new field within a pivot table that carries out certain calculations based on he values of other fields

* Plotting
* Data Validation
  * Add dropdown lists with predetermined options
  * Create custom checkboxes
  * Protect structured data and formulas
* Data mapping

## Database

* Database—a collection of data stored in a computer system
* Relational database
* Primary key & Foreign key
* Normalized database—a database in which only related data is stored in each table
* Redundancy—when the same piece of data is stored in two or more separate places
* Schema—a way of describing how something is organized
* Verification—a process to confirm that a data-cleaning effort was well-executed and the resulting data is accurate and reliable
* Changelog—a file containing a chronologically ordered list of modifications made to a project
* Aliasing—when you temporarily name a table or a column in your query to make it easier to read and write
* operator—a symbol that names the type pf operation or calculation to be performed in a formula
	* +, -, *, /

* Modulo—an operator(%) that returns the remainder when one number is divided by another
* syntax— the syntax of a SQL is its structure

## Metadata

* Stored in a single, central location, and gives the company standardized information about all of its data. It’s a kind of shorthand or a cliffs notes version of a much more complex set of information.
* Metadata—data about data (descriptive, structural, administrative)
* Metadata creates a single source of truth by keeping things consistent and uniform
* Metadata repository—a database specifically created to store metadata

## Data Aggregation

> Collecting or gathering many separate pieces into a whole

* Identify trends
* Make comparisons
* Gain insights

## SQL

### 分类

![img](file:///C:/Users/Lenovo/AppData/Local/Temp/msohtmlclip1/01/clip_image002.png)

### 分页查询–limit

```sql
select 字段列表 from 表名列表 where 条件列表 group by 分组字段列表 order by 排序字段列表 limit 分页参数;
```

<img src="file:///C:/Users/Lenovo/AppData/Local/Temp/msohtmlclip1/01/clip_image004.png" alt="img" style="zoom:50%;" />

### 去重–distinct

```sql
select distinct/all 字段列表 from 表名;
```

### 通配符

![img](file:///C:/Users/Lenovo/AppData/Local/Temp/msohtmlclip1/01/clip_image006.png)

### 聚合查询

```sql
select 聚合函数( 字段列表 ) from 表名;
```

| 函数                   | 功能     |
| ---------------------- | -------- |
| count/count (distinct) | 统计函数 |
| max                    | 最大值   |
| min                    | 最小值   |
| avg                    | 平均值   |
| sum                    | 求和     |

### 分组查询–group by

```sql
select 字段列表 from 表名 [where 条件] group by 分组字段名 [having 分组后过滤条件];
```

```sql
select 
	workaddress, 
	count(*) '员工数量' 
from 
	emp 
where 
	age<45 
group by 
	workaddress 
having 
	count(*)>3;
```

```sql
SELECT 
	EXTRACT(YEAR FROM STARTTIME) AS year,
	COUNT(*) AS number_of_rides
FROM
	temp
GROUP BY
	year
ORDER BY
	year DESC
```

* group by后面的字段一定要被select
* 执行顺序：where>聚合函数>having
* 分组之后，查询的字段一般为聚合函数和分组字段，查询其他字段无任何意义
* where 后面只能写普通字段的条件，不能包含聚合函数
* having后面可以包含聚合函数的条件，且having需要和group by 结合使用，写在group by的后面

### 排序查询

#### order by

```sql
select 字段列表 from 表名 order by 字段1 排序方式1, 字段2 排序方式2, ...;
select * from emp order by age asc, entrydate desc;
```

#### rank

```sql
SELECT player_id, device_id FROM 
(SELECT *,RANK() OVER (PARTITION BY player_id ORDER BY event_date desc/asc) AS ranking FROM gamelist) WHERE ranking=1;
```

### 子查询

> A query within another query

<img src="file:///C:/Users/Lenovo/AppData/Local/Temp/msohtmlclip1/01/clip_image010.png" alt="img" style="zoom:50%;" />

```sql
select * from emp where sal > (select avg(sal) from emp where dept_id = 2);

select empno, ename, sal, deptno from emp
where sal>any/all( --大于任一个即可  --大于所有
	select avg(sal) from emp group by deptno);

#查询各个部门工资最高的员工信息,通过成对比较方式
select * from emp where (deptno, sal) in (
	select deptno, max(sal) from emp group by deptno); 

#查询各个部门工资最高的员工信息,通过非成对比较方式
select * from emp where deptno in(select deptno from emp) and sal in (select max(sal) from emp group by deptno);

#from子句中的子查询被看作视图，并需要指定别名（不能用as）
select ename, job, sal from emp e, (select deptno, avg(sal) avgsal from emp
                                    group by deptno)temp_dept
                                    where e.deptno=temp_dept.deptno and sal>temp_dept.avgsal;
```

### 关联查询

#### 关联查询之等值连接

==不常用==

```sql
select * from A,B where 关联关系;
select e.name,d.name from emp e,dept d where e.dept_id = d.id and e.sal > 2000;
```

#### 关联查询之内连接–inner join

```sql
select * from A join B on 关联关系;
select empno, ename, sal, grade from emp e inner join salgrade s on e.sal=salgrade.sal between s.losal and s.hisal;
```

#### 关联查询之左右连接–left/right join

```sql
select * from A left/right join B on 关联关系;
#left和right选一个，表示左边或右边的表为全部
select e.name,d.name from emp e left join dept d on e.dept_id = d.id;
```

#### 关联查询之外连接–outer join

```sql
select d.name,d.loc,e.name,e.sal from dept d full outer join emp e on d.id=e.dept_id;
```

> 等值连接和内连接查询的是两个表的交集数据，推荐使用内连接

> 查询一张表的全部和另外一张表的交集时，使用外连接，只需要掌握左外即可，因为表的位置可以交换

#### 集合查询

> union/intersect/minus

```sql
select empno, ename, sal, deptno from emp where empno>7800
union
# minus
# intersect
select empno, ename, sal, deptno from emp where deptno=30
order by deptno asc;
```

#### 窗口函数

#### Temporary Table

> WITH clause

```sql
WITH temp AS(
	SELECT *
	FROM
    	citibike_trips
    WHERE
    	tripduration >= 60
)
# Count how many trips are 60+ minutes long
SELECT
	COUNT(*) AS cnt
FROM
	temp
```

> SELECT INTO

> bigquery don’t always recognize select into command

```sql
SELECT *
INTO temp
FROM original_table
WHERE
	region="Africa"
```

> CREATE TEMP TABLE

#### Others

```sql
Unique,len(),trim(),substr()
Cast(A1 AS A2)
Concat(A1, A2)
Coalesce(A1, A2, A3,…)--返回第一个非NULL
```



