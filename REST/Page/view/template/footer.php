
<script>
    $('#menu-bar-icon').on('click', function(){
      if($('#icon-menu-sider').hasClass("fa-bars")){
        $('#navMenu').addClass("active-siderbar");
        $('#icon-menu-sider').removeClass("fas fa-bars").addClass("fas fa-times");        
      }else{
        $('#navMenu').removeClass("active-siderbar");
        $('#icon-menu-sider').removeClass("fas fa-times").addClass("fas fa-bars");
      }
    });
</script>
</main><!-- ////////////// End Main ////////////// -->
<!-- ////////////// Javascript Include ////////////// -->
    <!-- inject:js -->
    <!-- endinject -->
  </body>
</html>