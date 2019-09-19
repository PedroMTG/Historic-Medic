<?php
    require_once ("connect.php");
	
    $email = mysqli_real_escape_string($conn,$_GET['email']);	
    $senha = mysqli_real_escape_string($conn,$_GET['senha']);
	 
	$senha = md5($senha);
	
	$verificar_login = mysqli_query($conn,"SELECT idmedico FROM medico WHERE email = '$email' AND senha = '$senha'");

	if($verificar_login){

		$result = mysqli_num_rows($verificar_login);
	 
		if($result == 0){
		   die('404'); 
		} 
		else{
            $row = mysqli_fetch_assoc($verificar_login);
            $idmedico = $row['idmedico'];
            echo json_encode($idmedico, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
            die('Medico Logado!');
		}
	}
	 
	mysqli_close($conn);
?>