<?php
    include '../../includes/dbconn.php';

    $sql = "SELECT SN from leave_requests WHERE status = '2'";
    $query = $dbh -> prepare($sql);
    $query->execute();
    $results=$query->fetchAll(PDO::FETCH_OBJ);
    $leavtypcount=$query->rowCount();

    echo htmlentities($leavtypcount);

?>   