<!DOCTYPE html>
<html>
<head>
  <script>
  $(document).ready(function() {
    $("input#autocomplete").autocomplete({
    source: ["c++", "java", "php", "coldfusion", "javascript", "asp", "ruby"]
});
  });
  </script>
</head>
<body style="font-size:62.5%;">
  <jsp:include  page="/jsp/head.jsp" ></jsp:include> 
<input id="autocomplete" />

</body>
</html>