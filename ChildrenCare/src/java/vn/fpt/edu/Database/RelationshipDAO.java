
package vn.fpt.edu.Database;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import vn.fpt.edu.model.Relationship;


public class RelationshipDAO extends MyDAO {

    public Relationship getRelationByID(int relationshipID) {

        xSql = "select * from [dbo].[Relationship] where RelationshipID = ?";
        try {
            ps = con.prepareStatement(xSql);
            ps.setInt(1, relationshipID);
            rs = ps.executeQuery();
            if (rs.next()) {
                Relationship relationship = new Relationship(rs.getInt("RelationshipID"), rs.getString("RelationshipName"));
                return relationship;
            }
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Relationship> getRelationshipList() {
        List<Relationship> relationshipList = new ArrayList<>();

        String xSql = "SELECT * FROM [dbo].[Relationship]";
        try {
            ps = con.prepareStatement(xSql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Relationship relationship = new Relationship(rs.getInt("RelationshipID"), rs.getString("RelationshipName"));
                relationshipList.add(relationship);
            }

            rs.close();
            ps.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return relationshipList;
    }

}
