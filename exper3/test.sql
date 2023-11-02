use library;
# (1) 查询单价在20-60之间的图书书名和编号
select BID, Bname from Books where price > 20 and price < 60;
# (2) 查询所有男同学的姓名
select Rname from Readers where Gender = '男';
# (3) 在Borrow表中查询每位借书者所借过图书的数目（包括借过已还的和正在借阅的）
select RID, count(RID) as Bnum from Borrow group by RID;
# (4) 在Books表中查询每类图书的最高单价、最低单价
select BTID, max(price) as Pmax, min(price) as Pmin from Books group by BTID;
# (5) 查询或是ISBN号尾号为7的、或是清华大学出版社出版的图书信息
select * from Books where right(ISBN, 1) = 7 or Publisher = "清华大学出版社";
# (6) 查询所有图书的书名、图书类型及价格，结果按图书类型排序升序排列，图书类型相同的按价格降序排序
select Bname, BTID, price from Books order by BTID asc, price desc;

use dlqx;
# (1) 查询所有工程的抢修天数 datediff(day|month|year, 日期1,日期2 ) 返回 （日期2 - 日期1） 相隔的天数（月数|年数）
select prj_name,datediff(end_date, start_date) as workday from salvaging;
#（2）查询供电局1#仓库中单价小于80的物资编号和名称
select mat_num, mat_name from stock where warehouse = "供电局1#仓库" and unit < 80;
#（3）查询物资名称中第三、四个字为“绝缘”的物资信息，结果按编号的降序排列
select * from stock where substr(mat_name, 3, 2) = "绝缘" order by mat_num desc;
#（4）查询使用了两种及两种以上物资的抢修工程项目号
select prj_num, count(mat_num) from out_stock where cnt = (select count(mat_num) from out_stock) and cnt > 1 group by prj_num;
#（5）查询每个仓库中存放的物资种类数，结果列为仓库号、物资种类数目
