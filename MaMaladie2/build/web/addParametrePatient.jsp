
<%@page import="model.Parametre"%>
<%@page import="java.util.Vector"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Vector<Parametre> parametres = (Vector<Parametre>) request.getAttribute("parametres");
    String patient_id = (String)  request.getAttribute("patient_id");
 %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Dashboard - NiceAdmin Bootstrap Template</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
<!--  <link href="https://fonts.gstatic.com" rel="preconnect">-->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet">
  <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: NiceAdmin
  * Updated: May 30 2023 with Bootstrap v5.3.0
  * Template URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
   <script>
        function addSymptome() {
            var container = document.getElementById('sympt-container');
            var newProduct = document.createElement('div');
            newProduct.innerHTML ='<div class="row"> '+ 
                '<div class="input-group mb-3  col-lg-12"' +
                '<label class="input-group-text" for="nom">Symptomes</label>' +
                '<select class="" id="" name="parametre[]" required>' +
                ' <option value="">symptome</option>'+
                '<% for (int i = 0; i < parametres.size(); i++) { %>'+
            '<option value="<%= parametres.get(i).getParametre_id() %>"><%= parametres.get(i).getDesignation()%></option>'+
        '<% } %>'+
                '</select>'+
                '</div>' +
                '<div class="input-group mb-3  col-lg-12">' +
                '<label for="valeur">Valeur:</label>' +
                '<input type="number" name="valeur[]" required>' +
                '</div>' +
                '</div>'
                
            container.appendChild(newProduct);
        }
    </script>
</head>

<body>

  <!-- ======= Header ======= -->

  <!-- ======= Sidebar ======= -->


  <main id="main" class="main">


    <!--//// Form_annonce-->
<div class="container">
        <div class="card p-5">
            <div class="card-body">
                 <h5 class="card-title">SYMPTOMES DU PATIENT</h5>
                 <form method="GET" action="InsertParametrePatient">
                     <input type="hidden" name="patient_id" value="<%=patient_id %>">
                    <div id="sympt-container">
                        <div class="row">
                            <div class="input-group mb-3  col-lg-6">
                                <label class="input-group-text" for="nom">Symptomes</label>
                                 <select name="parametre[]">
                                    <option value="">symptome</option>
                                        <% for (int i = 0; i < parametres.size(); i++) { %>
                                            <option value="<%= parametres.get(i).getParametre_id() %>"><%= parametres.get(i).getDesignation() %></option>
                                        <% } %>
                                </select>
                           </div>
                            <div class="input-group mb-3  col-lg-6">
                                <label for="valeur">Valeur:</label>
                                <input type="number" name="valeur[]" required>
                            </div>
                        </div>
                    </div>    
                     <div class="input-group mb-3  col-lg-12">
                        <input type="button" value="Ajouter un autre symptome" onclick="addSymptome()">
                    </div>
                      <div class="col-12 ">
                        <button type="submit" class="btn btn-primary col-12 mt-2" data-bs-toggle="modal" data-bs-target="#exampleModal">Suivant</button>
                    </div>
                                 
                </form>
            </div>
        </div>
    </div>
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer" class="footer">
    <div class="copyright">
      &copy; Copyright <strong><span>NiceAdmin</span></strong>. All Rights Reserved
    </div>
    <div class="credits">
      <!-- All the links in the footer should remain intact. -->
      <!-- You can delete the links only if you purchased the pro version. -->
      <!-- Licensing information: https://bootstrapmade.com/license/ -->
      <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/ -->
      Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/apexcharts/apexcharts.min.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/chart.js/chart.umd.js"></script>
  <script src="assets/vendor/echarts/echarts.min.js"></script>
  <script src="assets/vendor/quill/quill.min.js"></script>
  <script src="assets/vendor/simple-datatables/simple-datatables.js"></script>
  <script src="assets/vendor/tinymce/tinymce.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>
</body>

</html>
