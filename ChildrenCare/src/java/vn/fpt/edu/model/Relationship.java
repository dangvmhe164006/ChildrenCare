
package vn.fpt.edu.model;

public class Relationship {
    private int relationshipID;
    private String relationshipName;

    public Relationship(int relationshipID, String relationshipName) {
        this.relationshipID = relationshipID;
        this.relationshipName = relationshipName;
    }

    public int getRelationshipID() {
        return relationshipID;
    }

    public void setRelationshipID(int relationshipID) {
        this.relationshipID = relationshipID;
    }

    public String getRelationshipName() {
        return relationshipName;
    }

    public void setRelationshipName(String relationshipName) {
        this.relationshipName = relationshipName;
    }
    
    
}
