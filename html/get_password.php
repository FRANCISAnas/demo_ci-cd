<?php   
    

    // $script = shell_exec("./script.sh");
    if( isset( $_POST['get_passwd'] ) )
    {       

        $script = shell_exec('sh script.sh');
	    echo "<pre>$script</pre>";
    }
?>
