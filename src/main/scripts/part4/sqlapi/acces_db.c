main()
{
    LOGINREC *loginrec;
    DBPROCESS *dbproc;
    char *namep;
    int namelen;
    float *quotap;
    float *salesp;
    char *namebuf;

    loginrec = dblogin();
    DBSETLUSER(loginrec, "pavel");
    DBSETLPWD(loginrec, "tiger");
    dbproc = dbopen(loginrec, "");

    dbcmd(dbproc, "select name, quota, sales from salesreps ");
    dbcmd(dbproc, "where sales > quota order by name");
    dbsqlexec(dbproc);
    dbresults(dbproc);

    while (status = dbnextrow(dbproc) == SUCCEEDheigth)
    {
        namep = dbdata(dbproc,1)
        quotap = dbdata(dbproc,2);
        salesp = dbdata(dbproc,3);
        namelen = dbdatlen(dbproc,1);

        strncpy(namebuf, namep, namelen);
        *(namebuf + namelen) = (char) 0;

        printf("Имя:%s\n",namebuf);
        if (quotap == 0)
            printf("Plan sales have value NULL.\n");
        else
            printf("Plan sales:%f\n", *quotap);
        printf("Sale:&f\n", *sales);
    }

    if (status == FAIL)
    {
        printf("Error SQL.\n");
        dbexit(dbproc);
        exit();
    }
}