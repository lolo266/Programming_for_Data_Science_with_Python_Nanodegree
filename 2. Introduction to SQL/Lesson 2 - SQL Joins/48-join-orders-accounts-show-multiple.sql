/*
Programming for Data Science with Python Nanodegree
Udacity's certified program > SQL practice > Lesson 1 : SQL Basics

Try pulling 'standard_qty', 'gloss_qty', and 'poster_qty' from the 'orders'
table, and the 'website' and the 'primary_poc' from the 'accounts' table.
*/


SELECT orders.standard_qty, orders.gloss_qty, orders.poster_qty, accounts.website, accounts.primary_poc
FROM orders
JOIN accounts
ON orders.account_id = accounts.id;