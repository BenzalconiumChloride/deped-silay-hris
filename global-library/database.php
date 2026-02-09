<?php
ini_set('max_execution_time', 2400); //in seconds
ini_set('display_errors', 'On');

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

date_default_timezone_set("Asia/Manila");
$today_date1 = date("Y-m-d H:i:s");
$today_date2 = date("Y-m-d");
$today_date3 = date("M d, Y");
$today_date4 = date("M d, Y | h:i a");
$today_month = date("m");
$today_year = date("Y");
$today_day = date("l");
$today_time = date("H");
$today_a = date("a");

// database connection config
$dbHost = 'localhost';
$dbUser = 'root';
$dbPass = '';
$dbName = 'db_hris';

try {
    
    $conn = new PDO("mysql:host=$dbHost;dbname=$dbName", $dbUser, $dbPass);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

}
catch(PDOException $e)
    { echo "Connection failed: " . $e->getMessage(); }

class Database {
    private $host = "localhost";
    private $db_name = "db_hris";
    private $username = "root";
    private $password = "";
    public $conn;
    
    public function getConnection() {
        $this->conn = null;
        
        try {
            $this->conn = new PDO(
                "mysql:host=" . $this->host . ";dbname=" . $this->db_name,
                $this->username, 
                $this->password
            );
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            $this->conn->exec("set names utf8");
        } catch(PDOException $exception) {
            echo "Connection error: " . $exception->getMessage();
        }
        
        return $this->conn;
    }
    
    public function generateEmployeeID() {
        $year = date('Y');
        $month = date('m');
        $random = rand(1000, 9999);
        return "DEPED-SILAY-" . $year . $month . "-" . $random;
    }
    
    public function generateDepEdID($firstName, $lastName) {
        $firstThree = substr(strtoupper($firstName), 0, 3);
        $lastThree = substr(strtoupper($lastName), -3);
        $random = rand(100, 999);
        return $firstThree . $lastThree . $random;
    }
}

// Salary Grades (DepEd Standard)
$salary_grades = array(
    1 => 13000,
    2 => 13819,
    3 => 14678,
    4 => 15589,
    5 => 16556,
    6 => 17582,
    7 => 18670,
    8 => 19825,
    9 => 21051,
    10 => 22353,
    11 => 23735,
    12 => 25203,
    13 => 26762,
    14 => 28419,
    15 => 30182,
    16 => 32057,
    17 => 34053,
    18 => 36179,
    19 => 38445,
    20 => 40861,
    21 => 43439,
    22 => 46191,
    23 => 49130,
    24 => 52271,
    25 => 55630,
    26 => 59222,
    27 => 63066,
    28 => 67181,
    29 => 71586,
    30 => 76304,
    31 => 81357,
    32 => 86771,
    33 => 92573
);

// DepEd Silay Schools
$silay_schools = array(
    'SDO001' => 'Silay National High School',
    'SDO002' => 'Silay Institute',
    'SDO003' => 'Doña Montserrat Lopez Memorial High School',
    'SDO004' => 'E. B. Magalona National High School',
    'SDO005' => 'Silay City Elementary School',
    'SDO006' => 'Rizal Elementary School',
    'SDO007' => 'Mambulac Elementary School',
    'SDO008' => 'E. Lopez Elementary School',
    'SDO009' => 'Kapitan Ramon Elementary School',
    'SDO010' => 'Silay City SPED Center'
);

// Barangays in Silay City
$silay_barangays = array(
    'Bagtic',
    'Balaring',
    'Barangay I',
    'Barangay II',
    'Barangay III',
    'Barangay IV',
    'Barangay V',
    'Barangay VI',
    'E. Lopez',
    'Guimbala-on',
    'Guinhalaran',
    'Kapitan Ramon',
    'Lantad',
    'Mambulac',
    'Rizal',
    'Sagay',
    'Patag',
    'Punta Salong',
    'Tubuangan'
);

$link  = mysqli_connect("$dbHost","$dbUser","$dbPass","$dbName");

if(isset($_SESSION['user_id'])){ $userId = $_SESSION['user_id']; }else{ $userId = ""; }

# Get user details
$user = $conn->prepare("SELECT * FROM bs_user WHERE user_id = '$userId'");
$user->execute();
$user_data = $user->fetch();

// setting up the web root and server root for this website application
$thisFile = str_replace('\\', '/', __FILE__);
$docRoot = '/deped-silay-hris/';

$srvRoot  = str_replace('global-library/database.php', '', $thisFile);
$webRoot  = '/deped-silay-hris/';

if (!defined('WEB_ROOT')) {
    define('WEB_ROOT', $webRoot);
}

if (!defined('SRV_ROOT')) {
    define('SRV_ROOT', $srvRoot);
}
?>