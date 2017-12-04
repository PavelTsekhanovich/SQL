package main.scripts.part4.sqlapi;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class PreparedStatementExample {

    public static void main(String[] args){

        Connection dbconn = null;
        ResultSet rs = null;

        String city;
        String query1 = "UPDATE OFFICES SET REGION = ? WHERE MGR = ?";
        String query2 = "SELECT CITY FROM OFFICES WHERE REGION = ?";

        try {
            PreparedStatement ps1 = dbconn.prepareStatement(query1);
            PreparedStatement ps2 = dbconn.prepareStatement(query2);

            ps1.setString(1,"Central");
            ps1.setInt(2,108);
            ps1.executeUpdate();

            ps1.setInt(2,104);
            ps1.executeUpdate();
            dbconn.commit();

            ps2.setString(1,"Central");
            rs = ps2.executeQuery();

            while (rs.next()){
                city = rs.getString(1);
                System.out.println("City central region " + city);
            }
            rs.close();

            ps2.setString(1,"Eastern");
            rs = ps2.executeQuery();

            while (rs.next()){
                city = rs.getString(1);
                System.out.println("City eastern region " + city);
            }
            rs.close();
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
