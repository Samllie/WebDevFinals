<?php
// Path to XML file
$xmlFile = 'comments.xml';

// Check if XML file exists, if not, create it
if (!file_exists($xmlFile)) {
    $xmlContent = '<?xml version="1.0" encoding="UTF-8"?><comments></comments>';
    file_put_contents($xmlFile, $xmlContent);
}

// Load the XML file
$xml = simplexml_load_file($xmlFile);

// Get the comment from the POST request
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['comment'])) {
    $commentText = htmlspecialchars($_POST['comment'], ENT_QUOTES, 'UTF-8');
    
    // Add the new comment
    $newComment = $xml->addChild('comment', $commentText);

    // Save the updated XML
    $xml->asXML($xmlFile);

    echo "Comment saved successfully!";
} else {
    echo "No comment provided!";
}
?>
