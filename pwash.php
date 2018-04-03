<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js">
</script>
</head>

<h1><center>PWA</center></h1>
<button onclick="pwrun()">run</button>
<p id="pwout"></p>

<script>

function pwrun(){
$.ajax({
   url: './core/pwa.php',
   data: {
      format: 'text'
   },
   error: function() {
      $('#pwout').html('An error has occurred');
   },
   success: function(data) {
      document.getElementById("pwout").innerHTML = data;
   },
   type: 'GET'
});

}

</script>

</html>
