<?php
// employees/delete_employee.php
require_once '../global-library/database.php';
require_once '../include/functions.php';
requireRole('HR Staff');

$database = new Database();
$db = $database->getConnection();

$id = isset($_GET['id']) ? clean_input($_GET['id']) : '';

if (empty($id)) {
    header('Location: index.php');
    exit();
}

try {
    $db->beginTransaction();

    // Prepare delete from employment_details (child table)
    $stmt1 = $db->prepare("DELETE FROM employment_details WHERE employee_id = :id");
    $stmt1->bindParam(':id', $id);
    $stmt1->execute();

    // Prepare delete from employees (parent table)
    $stmt2 = $db->prepare("DELETE FROM employees WHERE employee_id = :id");
    $stmt2->bindParam(':id', $id);
    $stmt2->execute();

    // Log activity
    logActivity('Deleted employee', 'employees', $id, 'Employee record and employment details removed');

    $db->commit();

    // Redirect with success (handled by list view)
    header('Location: index.php?msg=deleted');
    exit();

} catch (Exception $e) {
    if ($db->inTransaction()) {
        $db->rollBack();
    }
    die("Error deleting employee: " . $e->getMessage());
}
?>