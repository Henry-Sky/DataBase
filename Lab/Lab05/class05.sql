use library;
# （1）查询从未被借阅过的图书编号和书名
select Books.BID, Books.Bname 
from Books left join Borrow on Books.BID = Borrow.BID 
where Borrow.BID is null;

# （2）某读者遗失了他的借书证，他提供了他的姓名“蒋萧萧”，希望查询他是否有未归还的图书，请将他所需要的信息列出：姓名、未还图书名、到期时间
select Readers.Rname, Books.Bname, Borrow.Due_date
from Borrow left join Readers on Borrow.RID = Readers.RID left join Books on Borrow.BID = Books.BID
where Readers.Rname = "蒋萧萧" and Borrow.Return_date is null; 

# （3）统计每位女性读者的借书次数（包括已归还和未归还的图书；一个读者借阅一本书，为一次借书）
select Readers.Rname, count(Borrow.BID) as cnt
from Readers left join Borrow on Readers.RID = Borrow.RID
where Readers.Gender = '女'
group by Readers.RID;

# （4）统计清华大学出版社的图书从2018年至今被借出过的总次数
select Books.Publisher, count(Borrow.BID) as cnt
from Borrow left join Books on Borrow.BID = Books.BID
where Books.Publisher = "清华大学出版社" and Borrow.Borrow_date >= date("2018-01-01")
group by Books.Publisher;

# （5）查询比清华大学出版社所有图书价格都低的图书信息，结果按照图书类型降序排序，图书类型相同的按照价格升序排序。
select *
from Books
where Books.price < (select min(price) from Books where Books.Publisher = "清华大学出版社")
order by Books.BTID desc, Books.price asc;

use dlqx;
# （1）查询没有使用m003号物资的工程编号和名称
select out_stock.prj_num, salvaging.prj_name
from out_stock left join salvaging on out_stock.prj_num = salvaging.prj_num
where out_stock.prj_num not in (select prj_num from out_stock where out_stock.mat_num = "m003")
group by out_stock.prj_num;

# （2）查询与规格为“BVV-150”的“护套绝缘电线”在同一仓库的物资编号、名称和规格
select mat_num, mat_name, speci
from stock
where warehouse in (select warehouse from stock where mat_name ="护套绝缘电线" and speci = "BVV-150");

# （3）查询每种物资的总价格 
select mat_name, speci, sum(amount * unit) as total
from stock
group by mat_num;

# （4）查询库存量超过所在仓库平均库存量的物资名称和库存量
select mat_name, amount
from stock
where amount > (select avg(amount) from stock);

# （5）查询单价最贵的两种物资
select *
from stock
order by unit desc
limit 2;