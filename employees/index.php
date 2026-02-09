<?php

require_once '../global-library/database.php';



if (isset($_GET['view'])) {
    $view = $_GET['view'];
} else {
    $view = '';
}

$currentPage = 'employees';

switch ($view) {
    case 'add':
        $content = 'add_employee.php';
        $pageTitle = 'Add Employee';
        break;

    case 'edit':
        $content = 'edit_employee.php';
        $pageTitle = 'Edit Employee';
        break;

    case 'view':
        $content = 'view_employee.php';
        $pageTitle = 'View Employee';
        break;

    default:
        $content = 'employees.php';
        $pageTitle = 'Employee List';
        break;
}



require_once '../include/template.php';

?>