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

