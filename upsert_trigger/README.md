## Commen practice: Upsert trigger SQL Server

When updating rows in a table without being able to use an upsert functionality. 
It's quite cumbersome to take care for with Python.

Your cumbersome Python algoritm might look like this:
1. retrieve the uuid's of the existing rows via SQL;
2. split your dataframe into new rows and rows to be updated;
3. insert the new rows (in batch);
4. update the existing rows (one-by-one).

#### Solution: upsert trigger

The alternative is to put a trigger on the table as a stored procedure in your database.

Your improved Python algoritm would look like this:
1. insert all the rows in the table.

That's it. The database takes care of the rest.

Works for: SQL Server, 

#### Pros 

* Oneliner (_link to article: dao as a package: "Insert your dataframe in one line"_)
* Automatic and always

You might end up in a situation where there is more than one script that updates your table. 
Withour a trigger, you end up using the same cumbersome algorith in your Python code:

#### Cons

* As always with triggers: be careful for conflicting triggers