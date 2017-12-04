package main.scripts.part4.sqlapi;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

public class CallableStatementExample {

    /**
     * CREATE PROCEDURE CHANGE_REGION
     * (IN OFFICE INTEGER,
     * OUT OLD_REG VARCHAR(10),
     * IN NEW_REG VARCHAR(10));
     * <p>
     * CREATE FUNCTION GET_REGION
     * (IN OFFICE INTEGER)
     * RETURNS VARCHAR(10);
     */

    public static void main(String[] args) {

        Connection dbconn = null;
        String str1 = "{CALL CHANGE_REGION(?,?,?)}";
        String str2 = "{? = CALL GET_REGION(?)}";
        String oldreg;
        String ansreg;

        try {
            CallableStatement cs1 = dbconn.prepareCall(str1);
            CallableStatement cs2 = dbconn.prepareCall(str2);

            cs1.setInt(1, 12);
            cs1.setString(3, "Central");
            cs1.registerOutParameter(2, Types.VARCHAR);
            cs1.executeUpdate();

            oldreg = cs1.getString(1);

            cs2.setInt(1, 12);
            cs2.registerOutParameter(1, Types.VARCHAR);
            cs2.executeUpdate();

            ansreg = cs2.getString(1);

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                dbconn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
