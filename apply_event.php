<?php
include 'db.php';
session_start();

header('Content-Type: application/json'); // Set the response content type to JSON

$response = ["status" => "error", "message" => "An unknown error occurred."];

try {
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Sanitize input data
        $fullName = htmlspecialchars(trim($_POST['full_name']));
        $address = htmlspecialchars(trim($_POST['address']));
        $phoneNumber = htmlspecialchars(trim($_POST['phone_number']));
        $preferredDate = htmlspecialchars(trim($_POST['preferred_date']));
        $preferredTime = htmlspecialchars(trim($_POST['preferred_time']));
        $eventName = htmlspecialchars(trim($_POST['event_name']));

        // Ensure required fields are not empty
        if (empty($fullName) || empty($address) || empty($phoneNumber) || empty($preferredDate) || empty($preferredTime) || empty($eventName)) {
            throw new Exception("All fields are required.");
        }

        // Prepare SQL statement
        $stmt = $conn->prepare("INSERT INTO applications (full_name, address, phone_number, preferred_date, preferred_time, event_name) VALUES (?, ?, ?, ?, ?, ?)");
        if (!$stmt) {
            throw new Exception("Failed to prepare the database statement: " . $conn->error);
        }

        $stmt->bind_param("ssssss", $fullName, $address, $phoneNumber, $preferredDate, $preferredTime, $eventName);

        // Execute the statement
        if ($stmt->execute()) {
            $response = ["status" => "success", "message" => "Application submitted successfully!"];
        } else {
            throw new Exception("Database error: " . $stmt->error);
        }

        $stmt->close();
    } else {
        throw new Exception("Invalid request method.");
    }
} catch (Exception $e) {
    $response = ["status" => "error", "message" => $e->getMessage()];
}

$conn->close();

// Output JSON response
echo json_encode($response);
exit;
?>
