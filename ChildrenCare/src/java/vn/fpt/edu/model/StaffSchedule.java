
package vn.fpt.edu.model;

import java.sql.Date;

public class StaffSchedule {

    private int ScheduleID;
    private int StaffID;
    private Date Workday;
    private int Slot;
    private String status;

    public StaffSchedule() {
    }

    public StaffSchedule(int ScheduleID, int StaffID, Date Workday, int Slot) {
        this.ScheduleID = ScheduleID;
        this.StaffID = StaffID;
        this.Workday = Workday;
        this.Slot = Slot;
    }

    public StaffSchedule(int ScheduleID, int StaffID, Date Workday, int Slot, String status) {
        this.ScheduleID = ScheduleID;
        this.StaffID = StaffID;
        this.Workday = Workday;
        this.Slot = Slot;
        this.status = status;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    

    public int getScheduleID() {
        return ScheduleID;
    }

    public void setScheduleID(int ScheduleID) {
        this.ScheduleID = ScheduleID;
    }

    public int getStaffID() {
        return StaffID;
    }

    public void setStaffID(int StaffID) {
        this.StaffID = StaffID;
    }

    public Date getWorkday() {
        return Workday;
    }

    public void setWorkday(Date Workday) {
        this.Workday = Workday;
    }

    public int getSlot() {
        return Slot;
    }

    public void setSlot(int Slot) {
        this.Slot = Slot;
    }
    
}
