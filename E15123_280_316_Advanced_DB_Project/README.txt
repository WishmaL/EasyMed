THE .sql SHOULD BE EXECUTED AS FOLLOWING ORDER(Other wise some conflicts may occur since the tables have relations)

    1) Build_the_database.sql
    2) Insert_data.sql
    3) Indexes.sql
    4) Store_procedures.sql
    5) Customer_Queries.sql
    6) Dealer_Queries.sql
    7) Delivery_people_Queries.sql

Once the above mentioned .sql files are executed, backup files can be tested out.

Go to ‘Backup-database’ directory, it includes the .bat files for each table in the database.
All the back up files will appear in that folder.
in order to backup the tables, each .bat file should be doubled clicked.


Note:  These files are configured according to the ‘root’ user by default. If a defined user is going to use these files those files must be edited as follows.

    The last line goes as follows
    mysqldump -uroot -p medical_database customers>...

    It will ask password just hit Enter
    (The password of root by default is nothing unless the user created one for it)

    Change it to, if the database user is ‘user’
    mysqldump -uuser -p medical_database customers>...

