<link rel="stylesheet" href="../assets/css/styles.css">

<?php 
    include 'dbconn.php';
    $isread = 0;
    $sql = "SELECT SN from leave_requests where isRead = :isread";
    $query = $dbh -> prepare($sql);
    $query->bindParam(':isread',$isread,PDO::PARAM_STR);
    $query->execute();
    $results = $query->fetchAll(PDO::FETCH_OBJ);
    $unreadcount = $query->rowCount();

?>
    
    <li class="dropdown">
        <i class="ti-bell dropdown-toggle" data-toggle="dropdown">
            <span><?php echo htmlentities($unreadcount);?></span>
            </i>
            <div class="dropdown-menu bell-notify-box notify-box">
                <span class="notify-title">You have <?php echo htmlentities($unreadcount);?> <b>unread</b> notifications!</span>

                <div class="notify-list">
                    <?php 
                        $isread = 0;
                        $sql = "SELECT leave_requests.SN as lid,employee.fName,employee.empCode,leave_requests.appliedOn from leave_requests join employee on leave_requests.requestee = employee.empCode where leave_requests.isRead = :isread";
                        $query = $dbh -> prepare($sql);
                        $query->bindParam(':isread',$isread,PDO::PARAM_STR);
                        $query->execute();
                        $results=$query->fetchAll(PDO::FETCH_OBJ);
                        if($query->rowCount() > 0)
                        {
                        foreach($results as $result)
                        {               
                    ?>    
                        <a href="employeeLeave-details.php?leaveid=<?php echo htmlentities($result->lid);?>" class="notify-item">
                            <div class="notify-thumb"><i class="ti-comments-smiley btn-info"></i></div>
                                <div class="notify-text">
                                    <p><b><?php echo htmlentities($result->fName);?>
                                                    <br/>(<?php echo htmlentities($result->empCode);?>)
                                                    </b> has recently applied for a leave.</p>
                                    <span>at <?php echo htmlentities($result->appliedOn);?></b</span>
                                </div>
                        </a>
                                            
                    <?php }} ?> 
                </div>
            </div>         
     </li>