<?php
require_once('../ini.php');

$errors = array();

function fieldname_as_text($fieldname) {
    $fieldname = str_replace("_", " ", $fieldname);
    $fieldname = ucfirst($fieldname);

    return $fieldname ;
}

function has_presence($value) {
	return isset($value) && $value !== "";
}

function validate_presence($required_fields) {
//    global $errors;
    foreach($required_fields as $field) {
        $value = trim($_POST[$field]);
        if (!has_presence($value)) {
            $_SESSION['message'] = "Error: " . fieldname_as_text($field) . " can't be blank";
        }
    }
}

function has_max_length($value, $max) {
    return strlen($value) <= $max;
}

function validate_max_lengths($fields_with_max_lengths) {
//    global $errors;
    foreach($fields_with_max_lengths as $field => $max) {
        $value = trim($_POST[$field]);
        if (!has_max_length($value, $max)) {
            $_SESSION['message'] = "Error: " . fieldname_as_text($field) . " is too long";
        }
    }
}

function has_inclusion_in($value, $set) {
    return in_array($value, $set);
}

function validate_password($password) {
//    global $errors;
    if (!preg_match('/^(?=.*\d)(?=.*[A-Za-z])[0-9A-Za-z!@#$%]{8,12}$/', $password)) {
        $_SESSION['message'] = "Error: " . "Password must contain at least 1 UPPER case and 1 LOWER case characters, in addition to a NUMERIC value.";
    }
}

function match_password($password, $confirm_password) {
//    global $errors;
    if ($password === $confirm_password) {
        return true;
    } else {
        $_SESSION['message'] = "Error: " . "'Password' and 'Confirm Password' fields do not match.";
        return false;
    }
}


?>
