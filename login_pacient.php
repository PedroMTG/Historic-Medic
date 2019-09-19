<?php
    require_once ("connect.php");
	
    $cpf = mysqli_real_escape_string($conn,$_GET['cpf']);	
    $senha = mysqli_real_escape_string($conn,$_GET['senha']);
	 
	$senha = md5($senha);
	
	$verificar_login = mysqli_query($conn,"SELECT idpaciente FROM paciente WHERE cpf = '$cpf' AND senha = '$senha'");

	if($verificar_login){

		$result = mysqli_num_rows($verificar_login);
	 
		if($result == 0){
		   die('404'); 
		} 
		else{
            $row = mysqli_fetch_assoc($verificar_login);
            $idpaciente = $row['idpaciente'];
            echo json_encode($idpaciente, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
            die('Paciente Logado!');
		}
	}
	 
	mysqli_close($conn);
?>