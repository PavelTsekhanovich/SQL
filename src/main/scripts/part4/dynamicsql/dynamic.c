main()
{
    ехес sql include sqlca ;
    exec sql begin declare section;
        char stmtbuf[301];
        float search_value;
        float new_value;
    exec sql end declare section;
    char tblname[31];
    char searchcol[31];
    char updatecol[31];
    char yes_no[31];

    printf("Set name table, witch is will be update");
    gets(tbname);
    printf("Set column name for search");
    gets(searchcol);
    printf("Set column name for update");
    gets(updatecol);

    sprintf(stmtbut, "update %s set %s = ? where %s = ?",
            tblname, searchcol, updatecol);
    exec sql prepare mystmt from :stmbuf;
    if (sqlca.sqlcode) {
        printf("Error PREPARE: %ld\n", sqlca.sqlcode);
        exit();
    }

    for(;;)
    {
        printf("\nSet value search %s: ", searchcol);
        scanf("&f", &search_value);
        printf("Set new value %s: ", updatecol);
        scanf("&f", &new_value);

        if (sqlca.sqlcode)
        {
            printf("Error EXECUTE: &ld\n", sqlca.sqlcode);
            exit();
        }
        printf("Try (y/n)? ");
        gets(yes_no);

        if (yes_no[0] == 'n')
        {
            break;
        }
        printf("\nUpdate done.\n");
        exit();
    }
}