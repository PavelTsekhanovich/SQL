main()
{
    exec sql include sqlca;
    exec sql begin declare section;
        int officenum;
        char cityname [lб];
        char regionname [ll];
        float targetval;
        float salesval;
    ехес sql end declare section;

    ехес sql whenever sqlerror goto query error;
    ехес sql whenever not found goto bad_;u er;

    printf ("Number office:");
    scanf ("%d", &officenum);

    ехес sql select city, region, target, sales
             from offices
             where office=:officenum
             into :cityname, :regionname, :targetval ,:salesval;

    printf("City %s\n", cityname);
    printf("Region : %s\n", regionname);
    printf("Plan %f\n", targetval);
    printf("Sale: %f\n", salesval);
    exit();
query_error :
    printf("Error SQL: %ld\n", sqlca.sqlcode);
    exit();
bad number:
    printf("Error number.\n");
    exit();
}