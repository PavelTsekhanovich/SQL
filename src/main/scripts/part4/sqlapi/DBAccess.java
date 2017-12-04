package main.scripts.part4.sqlapi;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBAccess {

    private static final String QUERY = "SELECT OFFICE, CITY, REGION FROM OFFICES";

    public static void main(String[] args) {
        Connection dbconn = null;
        ResultSet answer = null;
        Integer num;
        String city;
        String reg;
        try {
            Statement stmt = dbconn.createStatement();
            answer = stmt.executeQuery(QUERY);

            while (answer.next()) {
                num = answer.getInt("OFFICE");
                city = answer.getString("CITY");
                reg = answer.getString(3);

                System.out.println(city + " " + num + " " + reg);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                answer.close();
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
}
