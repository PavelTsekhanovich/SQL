main()
{
    ехес sql include sqlca ;
    ехес sql declare salesreps
         table (empl_num integer not null,
                name varchar(15) not null,
                age integer,
                rep_office integer,
                title varchar(10),
                hire_date date not null,
                manager integer
                qouta decimal(9,2),
                sales decimal(9,2) not null);

    printf("Remove personal with low sales.\n");

    exec sql delete from salesreps
             where sales < 150000.00;
    exec sql commit;

    printf("Delete done.\n");
    exit();
}