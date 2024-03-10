<?php
    include '../../includes/dbconn.php';

    $sql = "SELECT SN from leave_types";
    $query = $dbh->prepare($sql);
    $query -> execute();
    $results = $query->fetchAll(PDO::FETCH_OBJ);
    $leavtypcount = $query->rowCount();

    echo htmlentities($leavtypcount);

?>