<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
</head>


<button onclick="mon()"> Mon Start </button>   <button onclick="nomon()"> Mon Stop </button>  

<p id="monout"></p>

<script>
function mon(){
/* $.ajax({
      type        : 'GET', 
      url         : '/core/monstart.php', 
      .done(function(data){
             document.getElementById("monout").innerHTML = data;       
      });
}
*/

$.ajax({
   url: './core/monstart.php',
   data: {
      format: 'text'
   },
   error: function() {
      $('#monout').html('An error has occurred');
   },
   success: function(data) {
      document.getElementById("monout").innerHTML = data;
   },
   type: 'GET'
});

}


function nomon(){

$.ajax({
   url: './core/monstop.php',
   data: {
      format: 'text'
   },
   error: function() {
      $('#monout').html('An error has occurred');
   },
   success: function(data) {
      document.getElementById("monout").innerHTML = data;
   },
   type: 'GET'
});



}

</script>

</html>
