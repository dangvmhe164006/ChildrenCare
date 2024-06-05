<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../component/top.jsp"></jsp:include>
    <script>
        function checkAllService() {
            if (document.getElementById("checkAllService").checked == true) {
                checkboxes = document.getElementsByName('serviceSelect');
                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = true;
                }
            } else {
                checkboxes = document.getElementsByName('serviceSelect');
                for (var i = 0; i < checkboxes.length; i++) {
                    checkboxes[i].checked = false;
                }
            }
        }

        function deleteCart(id) {
            var result = confirm("Are you sure?");
            if (result) {
                window.location.href = "deleteCart?serviceID=" + id;
            }
        }

    </script>

    <!-- Full Screen Search Start -->
    <div class="modal fade" id="searchModal" tabindex="-1">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content" style="background: rgba(9, 30, 62, .7);">
                <div class="modal-header border-0">
                    <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex align-items-center justify-content-center">
                    <div class="input-group" style="max-width: 600px;">
                        <input type="text" class="form-control bg-transparent border-primary p-3" placeholder="Type search keyword">
                        <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Full Screen Search End -->

    <!-- Hero Start -->
    <div class="container-fluid bg-primary py-5 hero-header mb-5">
        <div class="row py-3">
            <div class="col-12 text-center">
                <h1 class="display-3 text-white animated zoomIn">Examination Result</h1>
                <a href="home" class="h4 text-white">Home</a>
                <i class="far fa-circle text-white px-2"></i>
                <a href="contect" class="h4 text-white">Result</a>
            </div>
        </div>
        <div class="row">
            <form>
                <div class="col-lg-12 row">

                    <div class="col-lg-4">
                        <label style='color:white;'>Search Content</label>
                        <input oninput="searchOrderDetail()" class="form-control" type="text" id='searchName' placeholder="Type in name/service/medicine... to search">

                    </div>

                    <div class="col-lg-4">
                        <label style='color:white;'>Exam date</label>
                        <input onchange='searchOrderDetail()' class="form-control" type="date"  id='searchDate' placeholder="Search by examination date">

                    </div>
                    <div class="col-lg-4"> </div>

                </div>
            </form>
        </div>
    </div>
    <!-- Hero End -->
    <style>
        details{
            transition: linear 0.5s;
        }
    </style>
    <!-- Appointment Start -->
    <div class="mt-2 mb-5 page-body container" style="margin-top: 10px;">
        <div class="row">
            
        </div>
        <div class="row" id="contentExam">
        <c:forEach items="${requestScope.listOrder}" var="o">

            <c:forEach items="${o.orderDetail}" var="od">


                <div  class="col-lg-12 odItem">
                    <div class="card text-bg-info mb-3">
                        <div class="card-header">
                            <strong>Order ID: ${o.oid}</strong>
                            <br>
                            <c:if test="${od.examStatus == true}">
                                Examined in
                            </c:if>
                            <c:if test="${od.examStatus == false}">
                                Your have examination scheduled in
                            </c:if>
                            ${od.examDate}

                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Customer: ${od.medicalRecord.userName}</h5>
                            <h5 class="card-title">Gender: ${od.medicalRecord.gender==true?"Male":"Female"}</h5>
                            <h5 class="card-title">Phone: ${od.medicalRecord.phone}</h5>
                            <h5 class="card-title">Service: ${od.service.sname}</h5>
                            <h5 class="card-title">Examined by Doctor: ${od.doctor.name}</h5>

                            <h5 class="card-title">* Examination Result:</h5>



                            <c:if test="${od.examStatus == true}">


                                <textarea class="form form-control" readonly>${od.resultNote.trim()}</textarea>     

                                <h5 class="card-title">* Medicine:</h5>




                                <c:if test="${od.medicalStatus == true}">

                                    <div class="form form-control" style="border:1px grey solid" readonly>
                                        <ul class="card-text">
                                            <c:forEach items="${medicinePresciptList}" var="mp">
                                                <c:if test="${mp.orderDetail.odId == od.odId}">

                                                    <detail>


                                                        <summary>${mp.medicine.name}/summary>
                                                            <p>Total Amount: ${mp.quantity}<br>
                                                                Using Manual: ${mp.prescription}</p>
                                                    </detail>

                                                </c:if>
                                            </c:forEach>
                                        </ul>
                                    </div>     
                                </c:if>
                                <c:if test="${od.medicalStatus == false}">
                                    <p> You don't have medical prescription. Please contact doctor to get information</p>
                                </c:if>
                                </details>
                            </c:if>

                            <c:if test="${od.examStatus == false}">
                                <p class="card-text">
                                    You currently have a schedule that has not been examined for this service
                                </p>
                            </c:if>
                            </details>
                            </ul>


                            <c:if test="${od.medicalStatus == false && od.examStatus == false}">

                            </c:if>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:forEach>
    </div>
    <div class="row">
        <div class='col-lg-4 text-left'>
           
        </div>
        <div class='col-lg-4  text-center' id='pagination'>

        </div>
        <div style="text-align:right;" class='col-lg-4'>
            
        </div>
    </div>

</div>
<script>
    function next(page) {
        goTo(page + 1);
    }
    function prev(page) {
        goTo(page - 1);
    }
    function dataPaginate() {
        var a = document.getElementById("contentExam");
        var b = a.getElementsByClassName("odItem");
        var c = new Array();
        for (var i = 0; i < b.length; i++) {
            if (b[i].style.display !== 'none') {
                c.push(b[i]);
            }
        }

        return c;
    }
    function addPageButton(page) {
        var button = "<button id='page" + page + "' onclick='goTo(" + page + ")' class='btn btn-primary'>" + page + "</button>";
        return button;
    }
    var totalPage;
    var toSet = dataPaginate();
    var pageSize = 3;

    function generatePaginationButton() {

        var dataSource = toSet;

        if (dataSource.length % pageSize === 0) {
            totalPage = dataSource.length / pageSize;
        } else {
            totalPage = dataSource.length / pageSize + 1;
        }


        document.getElementById("pagination").innerHTML = "";
        for (var i = 1; i <= totalPage; i++) {
            document.getElementById("pagination").innerHTML += addPageButton(i);
        }
        goTo(1);
        if (totalPage > 0) {
            document.getElementById("page" + 1).setAttribute("class", "btn btn-primary disabled");
        }



    }


    function enableButton(except, dataLength) {
        

        if (except > 0 && dataLength !== 0) {
            document.getElementById("page" + except).setAttribute("class", "btn btn-primary disabled");
            for (var i = 1; i <= dataLength; i++) {

                if (except !== i) {
                    document.getElementById("page" + i).setAttribute("class", "btn btn-primary");
                }

            }
        }



    }

    function goTo(page) {


        var dataLength = toSet.length;

        if (toSet.length % pageSize === 0) {
            totalPage = toSet.length / pageSize;
        } else {
            totalPage = toSet.length / pageSize + 1;
        }


        var start = (page - 1) * pageSize;
        if (pageSize === 1) {
            for (var i = 0; i < dataLength; i++) {
                if (i !== start) {
                    toSet[i].style.display = 'none';
                } else {
                    toSet[i].style.display = 'block';
                }

            }


        } else {
            var end = start + pageSize-1;
            if (end > dataLength) {
                end = pageSize;
            }
            for (var i = 0; i < dataLength; i++) {
                if (i < start || i > end) {
                    toSet[i].style.display = 'none';
                } else {
                    toSet[i].style.display = 'block';
                }
            }
        }
       


        enableButton(page, totalPage);

    }





    function searchOrderDetail() {
        var textSearch = document.getElementById("searchName").value.toLowerCase();
        var dateSearch = document.getElementById("searchDate").value.toLowerCase();



        $("#contentExam .odItem").filter(function () {

            if (dateSearch !== undefined) {

                $(this).toggle($(this).text().toLowerCase().indexOf(textSearch) > -1
                        && $(this).text().toLowerCase().indexOf(dateSearch) > -1
                        );




            } else {

                $(this).toggle($(this).text().toLowerCase().indexOf(textSearch) > -1);
            }


        });
        toSet = dataPaginate();
        generatePaginationButton();
    }

    generatePaginationButton();
</script>
<!-- Appointment End -->

<!-- Newsletter Start -->
<div class="container-fluid position-relative pt-5 wow fadeInUp" data-wow-delay="0.1s" style="z-index: 1;">
    <div class="container">
        <!--            <div class="bg-primary p-5">
<form class="mx-auto" style="max-width: 600px;">
    <div class="input-group">
        <h4 style="text-align: center">Have Nice Day</h4>
    </div>
</form>
</div>-->
    </div>
</div>
<!-- Newsletter End -->
</body>
<jsp:include page="../component/bottom.jsp"></jsp:include>
