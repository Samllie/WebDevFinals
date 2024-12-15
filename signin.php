<?php
include 'db.php';
session_start();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT * FROM users WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();

    $response = [];
    if ($row = $result->fetch_assoc()) {
        if (password_verify($password, $row['password'])) {
            $_SESSION['user_id'] = $row['id'];
            $_SESSION['email'] = $row['email'];
            $response = [
                'status' => 'success',
                'message' => 'Sign-in successful!',
            ];
        } else {
            $response = [
                'status' => 'error',
                'message' => 'Invalid password.',
            ];
        }
    } else {
        $response = [
            'status' => 'error',
            'message' => 'No user found with this email.',
        ];
    }

    $stmt->close();
    $conn->close();

    echo json_encode($response); // Send JSON response to the client
    exit;
}
?>
