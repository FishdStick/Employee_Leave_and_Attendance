<?php
    include '../includes/dbconn.php';
    
    $eid = $_SESSION['eid'];
    $sql = "SELECT fName,empCode from employee where SN =:eid";
    $query = $dbh -> prepare($sql);
    $query->bindParam(':eid',$eid,PDO::PARAM_STR);
    $query->execute();

    $results = $query->fetchAll(PDO::FETCH_OBJ);
    $cnt = 1;

    if($query->rowCount() > 0){
        foreach($results as $result)
    {    ?>
        <p style="color:white;"><?php echo htmlentities($result->fName);?></p>
        <span><?php echo htmlentities($result->empCode)?></span>
<?php }
    } 
?>