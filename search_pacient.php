<?php
    require_once ("connect.php");

    class Pacient{
        public $idpaciente;
        public $nome;
        public $data;

        public function __construct($IDPACIENTE,$NOME,$DATA){
            $this->idpaciente = $IDPACIENTE;
            $this->nome = $NOME;
            $this->data = $DATA;
        }
    }
    
    $rows = array();

    $cpf = mysqli_real_escape_string($conn,$_GET['cpf']);	
	
	$verificar_login = mysqli_query($conn,"SELECT * FROM paciente WHERE cpf = '$cpf'");

	if($verificar_login){

		$result = mysqli_num_rows($verificar_login);
	 
		if($result == 0){
		   die('404'); 
		} 
		else{
            while($row = mysqli_fetch_array($verificar_login)){

                array_push($rows, new Pacient($row["idpaciente"],$row["nome"],$row["dt_nascimento"]));
        
            }
            echo json_encode($rows, JSON_UNESCAPED_SLASHES | JSON_UNESCAPED_UNICODE);
            die('Paciente Logado!');
		}
	}
	 
	mysqli_close($conn);
?>