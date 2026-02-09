<?php
require_once '../global-library/database.php';

if (isset($_GET['employees'])) {
    $view = 'Employees';
} else {
    $view = '';

}

$currentPage = 'Employees';

switch ($view) {

    case 'employees':
            $content   = 'employees.php';
            $pageTitle = 'Employees';
        break;

    default:
            $content   = 'employees.php';
            $pageTitle = 'Employees';
        break;
}

require_once '../include/template.php';

?>