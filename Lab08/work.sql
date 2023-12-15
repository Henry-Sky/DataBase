use club;
# (1) 查找姓张的男性职工的姓名和手机号，查询结果按照年龄降序排列，年龄相同的按职工号升序排列
select ENAME, TEL from E
where left(ENAME,1) = '张'
order by E.AGE desc,E.ENO asc;

# (2) 查找在2020年参加书法社或篮球队的职工姓名
select E.ENAME
from EC left join E on EC.ENO = E.ENO left join C on EC.CNO = C.CNO
where year(EC.TIME) = 2020
and C.CNAME IN ('篮球社', '书法社');

# (3) 查找50岁以上、没有参加任何团体的职工工号和姓名
select E.ENO, E.ENAME
from E left join EC on E.ENO = EC.ENO
where EC.CNO is NULL and E.AGE >= 50;

# (4) 查找篮球队和话剧社的负责人的姓名
SELECT E.ENAME
FROM E
JOIN C ON E.ENO = C.LEADER_ENO
WHERE C.CNAME IN ('篮球队', '话剧社');

# (5) 求社会团体的参加人数超过2人的社团名称及参加人数
SELECT C.CNAME, COUNT(EC.ENO) AS Participants
FROM C
LEFT JOIN EC ON C.CNO = EC.CNO
GROUP BY C.CNO, C.CNAME
HAVING COUNT(EC.ENO) > 2;

# (6) 建立视图：参加了两个或两个以上社团的职工工号和姓名
CREATE VIEW view1 AS
SELECT E.ENO, E.ENAME
FROM E JOIN EC ON E.ENO = EC.ENO
GROUP BY E.ENO, E.ENAME
HAVING COUNT(DISTINCT EC.CNO) >= 2;

# (7) 添加一个新社团：舞蹈社、编号W56，由工号是005的职工负责，其它信息暂无
INSERT INTO C (CNO, CNAME, LEADER_ENO)
VALUES ('W56', '舞蹈社', '005');

# (8) 篮球队获得了奖项，请将所有篮球队队员的“获奖情况”修改为“市级冠军”
UPDATE EC
SET AWARDS = '市级冠军'
WHERE CNO = (select CNO from C where CNAME = "篮球队");

# (9)删除职工任盈盈的一切信息，如果她有正在负责的社团，则将该社团负责人改为他人。
# 注: 任盈盈负责的社团改郭靖
UPDATE C
SET C.LEADER_ENO = (SELECT ENO FROM E WHERE ENAME = "郭靖")
WHERE C.LEADER_ENO = (SELECT ENO FROM E WHERE ENAME = "任盈盈");

DELETE FROM EC
WHERE EC.CNO = (SELECT ENO FROM E WHERE ENAME = "任盈盈");

DELETE FROM E
WHERE E.ENAME = "任盈盈";