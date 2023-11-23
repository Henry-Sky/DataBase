use library;
# （1）加入一个新的读者信息：F1000，王小明，访学者，男，12233335555，计算机学院，这是一个新的读者类型，“访学者”，请完成这个添加操作
insert into Readers (RID, Rname, Rtype, Gender, Dept) 
values ("F1000", "王小明", "访学者", "男", "计算机学院");

# （2）读者张琳琳，从经管学院调到数理部工作，用SQL语句在数据库中完成此操作
select RID from Readers where Rname = "张琳琳";
update Readers set Dept = "数理部" where RID = "T0252";

# （3）将王可心同学所借的图书到期日期延长10天。
update library.Borrow 
set Due_date = date_add(Due_date, interval 10 day) 
where RID = (select RID from Readers where Rname = "王可心");

# （4）读者蒋萧萧要转学了，他的信息需要从数据库中删除，请在数据库中完成所有相关操作，写出相应SQL语句。提示：要用不止一条语句完成
delete from Borrow where RID in (select RID from Readers where Rname = "蒋萧萧");
select RID from Readers where Rname = "蒋萧萧";
delete from Readers where RID = "S4077";

use dlqx;
#（1）供电局4#仓库更名为“供电局4号仓库”
SET sql_safe_updates = 0;
update stock set warehouse = "供电局4号仓库" where warehouse = "供电局4#仓库";
SET sql_safe_updates = 1;

#（2）添加抢修工程信息：编号20180030的工程“上海大学计算中心光缆抢修”，开始时间2018-9-20，结束时间2018-9-21，按期完成，
# 领用的物资是m001，领用数量3
insert into salvaging (prj_num, prj_name, start_date, end_date, prj_status)
values ("20180030", "上海大学计算中心光缆抢修", date("2018-09-20"), date("2018-09-21"), 1);
insert into out_stock (prj_num, mat_num, amount, get_date)
values ("20180030", "m001", 3, date("2018-09-20"));

#（3）现需要从Salvaging表中删除第一条记录，应该怎样才能顺利完成？
# 按照end_date升序排列的第一条记录 
select prj_num from salvaging order by end_date asc limit 1;
delete from salvaging where 1 order by end_date asc limit 1;

