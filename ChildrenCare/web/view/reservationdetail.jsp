<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Date, java.util.List, java.util.Map, java.util.HashMap" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Reservation Detail</title>
        <link rel="stylesheet" href="./resources/css/reservation-detail-style.css">
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link href="./resources/css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="layout/Header.jsp"/>
        <%@ page import="vn.fpt.edu.model.Service, vn.fpt.edu.model.Staff, vn.fpt.edu.model.StaffSchedule" %>
        <%
            String childID = (String) request.getAttribute("ChildID");
            Service service = (Service) request.getAttribute("service");
            Staff staff = (Staff) request.getAttribute("Staff");
            List<StaffSchedule> scheduleList = (List<StaffSchedule>) request.getAttribute("list");

            // Time slot mapping
            Map<Integer, String[]> slotTimeMap = new HashMap<>();
            slotTimeMap.put(1, new String[] {"07:00", "08:00"});
            slotTimeMap.put(2, new String[] {"08:00", "09:00"});
            slotTimeMap.put(3, new String[] {"09:00", "10:00"});
            slotTimeMap.put(4, new String[] {"10:00", "11:00"});
            slotTimeMap.put(5, new String[] {"14:00", "15:00"});
            slotTimeMap.put(6, new String[] {"15:00", "16:00"});
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                    <h1><%= service.getTitle() %></h1>
                    <% if (staff != null) { %>
                    <div class="staff-info" style="display: flex; align-items: center; gap: 16px;">
                        <img style="width: 128px; height: 128px; border-radius: 50%;" src="<%= staff.getProfileImage() %>" alt="staff profile image"/>
                        <p style="margin: 0; font-weight: bold;">Staff name: <%= staff.getFullName() %></p>
                    </div>
                    <% } %>
                    <p>Service Details: <%= service.getServiceDetail() %></p>
                    <p>Brief Info: <%= service.getBrief() %></p>
                </div>
                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
                    <div class="title">
                        <h2>Choose a Date</h2>
                    </div>

                    <div id="schedule-table">
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Select</th>
                                    <th>Date</th>
                                    <th>Slot</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (scheduleList != null && !scheduleList.isEmpty()) { %>
                                <% for (StaffSchedule schedule : scheduleList) { 
                                    String[] timeRange = slotTimeMap.get(schedule.getSlot());
                                %>
                                <tr>
                                    <td>
                                        <input type="radio" name="selectedSchedule" value="<%= schedule.getScheduleID() %>" onchange="toggleCheckOutButton(this)"/>
                                    </td>
                                    <td><%= schedule.getWorkday() %></td>
                                    <td><%= timeRange[0] %> - <%= timeRange[1] %></td>
                                    <td>
                                        <form action="reservationdetailcontroller" method="post" id="form_<%= schedule.getScheduleID() %>">
                                            <input type="hidden" name="action" value="save"/>
                                            <input type="hidden" name="childID" value="<%= childID %>"/>
                                            <input type="hidden" name="serviceID" value="<%= service.getServiceID() %>"/>
                                            <input type="hidden" name="staffID" value="<%= staff.getStaffID() %>"/>
                                            <input type="hidden" name="selectDate" value="<%=schedule.getWorkday()%>"/>
                                            <input type="hidden" name="slot" value="<%= schedule.getSlot() %>"/>
                                            <button type="submit" id="button_<%= schedule.getScheduleID() %>" style="background-color: #00b5f1; border-radius:10px; font-weight: bold; color: white; display: none;">Check out</button>
                                        </form>
                                    </td>
                                </tr>
                                <% } %>
                                <% } else { %>
                                <tr>
                                    <td colspan="4">No available schedules</td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div>
            <jsp:include page="layout/footer.jsp" />
        </div>

        <script>
            function toggleCheckOutButton(radio) {
                // Hide all check out buttons
                var buttons = document.querySelectorAll('button[id^="button_"]');
                buttons.forEach(button => button.style.display = 'none');

                // Show the button for the selected schedule
                var scheduleId = radio.value;
                var button = document.getElementById('button_' + scheduleId);
                if (button) {
                    button.style.display = 'block';
                }
            }
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    </body>
</html>
