<?php
$arr = array(2, 'oscar', 1, 'juana', 6, 'alberto', 34, 'burro', 26, 'aja', 39, 'computador');
$str = 'respuesta: ';
for ($index = 0; $index < count($arr); $index++) {
    if (is_int($arr[$index]) && $index > 34){
	$str += '<br/>++'. $arr[$index];
    }
    if (is_int($arr[$index]) && $index < 34){
	$str = '<br/>--'. $arr[$index];
    }
    if (is_string($arr[$index]) && count($arr[$index]) == 5 ){
	$str += '<br/>**'. $arr[$index];
    }
    $str = $str.' fin';
}
echo "<br/>".$str;
?>


<!doctype html>
<head>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
    <script src="http://malsup.github.com/jquery.form.js"></script>
    <style>
	form { display: block; margin: 20px auto; background: #eee; border-radius: 10px; padding: 15px }
	#progress { position:relative; width:400px; border: 1px solid #ddd; padding: 1px; border-radius: 3px; }
	#bar { background-color: #B4F5B4; width:0%; height:20px; border-radius: 3px; }
	#percent { position:absolute; display:inline-block; top:3px; left:48%; }
    </style>
</head>
<body>
    <h1>Ajax Demo</h1>

    <form id="myForm" action="lib/upload.php" method="post" enctype="multipart/form-data">
	<input type="text" name="nombre"/>
	<input type="file" size="60" name="myfile">
	<input type="submit" value="Ajax File">
    </form>

    <div id="progress">
        <div id="bar"></div>
        <div id="percent">0%</div >
    </div>
    <br/>

    <div id="message"></div>

    <script>
	$(document).ready(function()
	{
 
	    var options = { 
		beforeSend: function() 
		{
		    $("#progress").show();
		    //clear everything
		    $("#bar").width('0%');
		    $("#message").html("");
		    $("#percent").html("0%");
		},
		uploadProgress: function(event, position, total, percentComplete) 
		{
		    $("#bar").width(percentComplete+'%');
		    $("#percent").html(percentComplete+'%');
 
		},
		success: function() 
		{
		    $("#bar").width('100%');
		    $("#percent").html('100%');
 
		},
		complete: function(response) 
		{
		    $("#message").html("<font color='green'>"+response.responseText+"</font>");
		},
		error: function()
		{
		    $("#message").html("<font color='red'> ERROR: unable to work</font>");
 
		}
 
	    }; 
 
	    $("#myForm").ajaxForm(options);
 
	});
 
    </script>
</body>

</html>