# 实验一
USE library;

# （1）	查询比赵明渊所著“Oracle数据库教程”的ISBN号小、但单价却比它高的图书信息
SELECT * FROM Books 
WHERE ISBN < (SELECT ISBN FROM Books WHERE Bname = "Oracle数据库教程")
AND price > (SELECT price FROM Books WHERE Bname = "Oracle数据库教程") ;

# （2）	查询在册的“小说”类的图书都是哪些出版社出版的
SELECT Publisher FROM Books
JOIN BooksType on Books.BTID = BooksType.BTID
WHERE BTname = "小说";

# （3）	查询姓“李”的男学生的借书记录，列出学生姓名、借阅的图书名、借阅日期，结果按借阅日期升序排列
SELECT Readers.Rname, Books.Bname, Borrow.Borrow_date 
FROM Borrow
LEFT JOIN Books ON Borrow.BID = Books.BID
LEFT JOIN Readers ON Borrow.RID = Readers.RID
WHERE left(Rname, 1) = '李' And Readers.Gender = '男'
ORDER BY Borrow.Borrow_date ASC;

# （4）	查询超期且未归还的借阅记录，列出读者编号和姓名、他所借图书的图书号(定当前日期: "2020-11-14")
SELECT Readers.RID AS "读者编号", Readers.Rname AS "姓名", Books.BID AS "图书号"
FROM Borrow
LEFT JOIN Books ON Borrow.BID = Books.BID
LEFT JOIN Readers ON Borrow.RID = Readers.RID
WHERE Borrow.Due_date < date("2020-11-14")
AND Borrow.Return_date is null;

# （5）	查询属于"计算机丛书"的图书的所有被借记录，列出图书名、借阅者姓名
SELECT Books.Bname as "图书名", Readers.Rname as "借阅者姓名" 
FROM Borrow
LEFT JOIN Books ON Borrow.BID = Books.BID
LEFT JOIN Readers ON Borrow.RID = Readers.RID
LEFT JOIN BooksType ON Books.BTID = BooksType.BTID
WHERE BooksType.BTname = "计算机丛书";


# 实验二
USE dlqx;
# （1）查询同时使用了物资编号为m001和m002的抢修工程的工程号（请用至少两个不同的SELECT语句完成）
SELECT prj_num, 
count(if(mat_num = "m001",1,null)) as m1_cnt,
count(if(mat_num = "m002",1,null)) as m2_cnt
FROM out_stock 
GROUP BY prj_num
having m1_cnt > 0 and m2_cnt > 0;

SELECT prj_num 
FROM out_stock 
WHERE mat_num = 'm001' 
AND prj_num IN (SELECT prj_num FROM out_stock WHERE mat_num = 'm002');

SELECT m1_prj.prj_num
FROM (SELECT prj_num FROM out_stock WHERE mat_num = "m001") as m1_prj
INNER JOIN (SELECT prj_num FROM out_stock WHERE mat_num = "m002") as m2_prj
on m1_prj.prj_num = m2_prj.prj_num;

# （2）查询工程3部曾经领用过哪些物资，列出编号和名称
SELECT stock.mat_num, stock.mat_name
FROM out_stock
INNER JOIN stock ON out_stock.mat_num = stock.mat_num
WHERE department = "工程3部";

# （3）查询每种物资的编号、名称及被领用次数。
SELECT stock.mat_num as "编号", mat_name as "名称", sum(out_stock.amount) as "领用次数" 
FROM out_stock 
INNER JOIN stock ON out_stock.mat_num = stock.mat_num
GROUP BY stock.mat_num
ORDER BY stock.mat_num;

# （4）查询2011年1月到3月期间按期完成的抢修工程及所领用的物资编号。
SELECT prj_name, GROUP_CONCAT(mat_num SEPARATOR ', ') as mat_nums
FROM salvaging
INNER JOIN out_stock ON salvaging.prj_num = out_stock.prj_num
WHERE end_date >= date("2011-01-01") AND end_date <= date("2011-03-31")
GROUP BY prj_name;