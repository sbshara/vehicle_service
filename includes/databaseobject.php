<?php

require_once('../ini.php');

class DatabaseObject {

    public static function find_by_sql($sql="") {
        global $database;
        $result_set = $database->query($sql);
        $object_array = array();
        while ($row = $database->fetch_array($result_set)) {
            $object_array[] = static::instantiate($row);
        }
        return $object_array;
    }

    public static function find_all_by($column='', $value=0){
        global $connection;
        return static::find_by_sql("SELECT *, (SELECT COUNT(*) FROM " . static::$table_name . ") AS total_count FROM " . static::$table_name . " WHERE " . $column . "='" . $value  . "'");
    }

    public static function find_all () {
        return static::find_by_sql("SELECT *, (SELECT COUNT(*) FROM " . static::$table_name . ") AS total_count FROM " . static::$table_name);
    }

    public static function find_top ($limit) {
        return static::find_by_sql("SELECT *, (SELECT COUNT(*) FROM " . static::$table_name . ") AS total_count FROM " . static::$table_name . " ORDER BY id DESC LIMIT " . $limit);
    }

    public static function find_by_id($id=0) {
        global $connection;
        $result_array = static::find_by_sql("SELECT *, (SELECT COUNT(*) FROM " . static::$table_name . ") AS total_count FROM " . static::$table_name . " WHERE id=" . $id);
        return !empty($result_array) ? array_shift($result_array) : false;
    }

    public static function find_by($column='',$value=0) {
        global $connection;
        $result_array = static::find_by_sql("SELECT *, (SELECT COUNT(*) FROM " . static::$table_name . ") AS total_count FROM " . static::$table_name . " WHERE " . $column . "='" . $value . "'");
        return !empty($result_array) ? array_shift($result_array) : false;
    }

    private static function instantiate ($record) {
        $object = new static;
        foreach($record as $attribute=>$value) {
            if($object->has_attribute($attribute)) {
                $object->$attribute = $value;
            }
        }
        return $object;
    }

    private function has_attribute($attribute) {
        // Object Vards returns an assoc array with all attributes (including private ones!)
        $object_vars = static::attributes();
        // returns boolean (true or false)
        return array_key_exists($attribute, $object_vars);
    }

    protected function attributes() {
        $attributes = array();
        foreach(static::$db_fields as $field) {
            $attributes[$field] = $this->$field;
        }
        return $attributes;
    }

    protected function satnitized_attributes() {
        global $database;
        $clean_attributes = array();
        foreach(static::attributes() as $key => $value) {
            $clean_attributes[$key] = $database->escape_value($value);
        }
        return $clean_attributes;
    }

    public static function count_all(){
        global $database;
        $sql  = "SELECT COUNT(*) FROM ";
        $sql .= static::$table_name;
        $sql .= " AS total_count";
        $result_set = $database->query($sql);
        $row = $database->fetch_array($result_set);
        return array_shift($row);
    }

    public function create() {
        global $database;
        $attributes = static::satnitized_attributes();
        $sql  = "INSERT INTO " . static::$table_name . " (";
        $sql .= join(", ", array_keys($attributes));
        $sql .= ") VALUES ('";
        $sql .= join("', '", array_values($attributes));
        $sql .= "')";
        if($database->query($sql)) {
            $this->id = $database->insert_id();
            return true;
        } else {
            return false;
        }
    }

    public function update() {
        global $database;
        $attributes = static::satnitized_attributes();
        $attribute_pairs = array();
        foreach($attributes as $key => $value) {
            $attribute_pairs[] = "{$key}='{$value}'";
        }
        $sql  = "UPDATE " . static::$table_name . " SET ";
        $sql .= join(", ", $attribute_pairs);
        $sql .= " WHERE id=" . $database->escape_value($attributes['id']);

        $database->query($sql);

        return ($database->affected_rows() == 1) ? true : false;
    }

    public function save() {
        return isset(static::$id) ? static::update() : static::create();
    }

    public function delete() {
        global $database;
        $attributes = static::satnitized_attributes();
        $sql  = "DELETE FROM " . static::$table_name;
        $sql .= " WHERE id=" . $database->escape_value($attributes['id']);
        $sql .= " LIMIT 1";

        $database->query($sql);
        return ($database->affected_rows() == 1) ? true : false;
    }










}

?>
