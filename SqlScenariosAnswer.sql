1)select * from Employees
where Department='IT' and Salary>50000;



2)Select O.OrderID,O.CustomerID,O.OrderDate,O.TotalAmount,C.CustomerName,C.ContactNumber 
from Orders as O
left join Customers  as C 
on O.CustomerID=C.CustomerID;



3)Select S.ProductID,Sum(S.QuantitySold)Total_QuantitySold  
from Sales S
group by S.ProductID;



4)Select extract( month from S.SaleDate) as Month ,
 avg(S.QuantitySold)as Average_Sold_Quantity
from  Sales S
group by extract( month from S.SaleDate);



5)Select UPPER(ProductName) from Products as P;



6)
SELECT EventID, EventName, EventDate
FROM Events
WHERE EventDate between current_date  and  current_date + INTERVAL '30 days';



7)Select * from Employees E
where E.Salary>(Select avg(Salary) from Employee e);



8)create function update_lastmodified()
returns trigger as $$
begin
if NEW.lastmodified<>OLD.lastmodified
then
update products
set OLD.lastmodified=now();
end if;
return new;
end;
$$ language plpgsql;

create trigger lastmodified_update
after update on products
for each row
execute function update_lastmodified(); 


 
9)Create View Customeractive as
Select * from Customers c
inner join Orders o
on c.CustomerID=o.CustomerID
where extract (year from o.OrderDate)=extract(year from current_date - interval '1 year');



10)Select count(*) from Sales
where TotalAmount is null;



11)Select p.*,rank()over(Order by p.Score) Rank_Score from Participants p;



12)Select s.EmployeeId,s.Salary,s.Department,sum(s.Salary)over( partition by s.Department order by s.Department) as Cumulative from Salaries s
group by s.Department;



13)Select l.SaleID, l.ProductID, l.Quantity, l.SaleDate,sum(l.Quantity)over(Partition by l.ProductID ORDER BY l.SaleDate, l.SaleID)as Running_quantity
 from Sales l;


 
14)Update Products
   Set Price=(Price*10)/100
   where Category='Electronics';
   


15)Delete from Customers
   where City='Delhi';

