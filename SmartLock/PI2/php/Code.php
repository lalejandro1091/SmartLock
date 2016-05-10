<?php

/**
 * Description of Code
 *
 * @author Gersain Castañeda Muñoz
 */

include_once("DataController.php");

abstract class Code 
{
    protected $id;
    protected $code;
    protected $dateHour;
    protected static $dataController;
    
    public function id($id = null)
    {
        if ($id == null)
            return $this->id;
        else
            $this->id = $id;       
    }
    
    public function code($code = null)
    {
        if ($code == null)
            return $this->code;
        else
            $this->code = $code;                   
    }
    
    public function dateHour($dateHour = null)
    {
        if ($dateHour == null)
            return $this->dateHour;
        else
            $this->dateHour = $dateHour;
    }
    
    public function expired()
    {
        
    }
    
    public function generate()
    {
        
        // Define your secret seed in hexadecimal format
        $secret_seed = "3132333435363738393031323334353637383930";

        // Determine the time window
        $time_window = 30;

        // Get the exact time from the server
        $exact_time = microtime(true);

        // Round the time down to the time window
        $rounded_time = floor($exact_time/$time_window);

        // Pack the counter into binary
        $packed_time = pack("N", $rounded_time);

        // Make sure the packed time is 8 characters long
        $padded_packed_time = str_pad($packed_time,8, chr(0), STR_PAD_LEFT);

        // Pack the secret seed into a binary string
        $packed_secret_seed = pack("H*", $secret_seed);

        // Generate the hash using the SHA1 algorithm
        $hash = hash_hmac ('sha1', $padded_packed_time, $packed_secret_seed, true);

        // Extract the 6 digit number fromt the hash as per RFC 6238
        $offset = ord($hash[19]) & 0xf;
        $otp = (
            ((ord($hash[$offset+0]) & 0x7f) << 24 ) |
            ((ord($hash[$offset+1]) & 0xff) << 16 ) |
            ((ord($hash[$offset+2]) & 0xff) << 8 ) |
            (ord($hash[$offset+3]) & 0xff)
        ) % pow(10, 6);

        // Add any missing zeros to the left of the numerical output
        $otp = str_pad($otp, 6, "0", STR_PAD_LEFT);

        // Display it
        //echo $otp;

        $this->code = $otp;
        
        return $this->code;
    }
    
    protected static function query($query)
    {      
        Code::$dataController = new DataController();
        Code::$dataController->connect();        
        $result = Code::$dataController->query($query);        
        Code::$dataController->disconnect();
        
        return $result;
    }
    
    protected static function exec($query)
    {
        Code::$dataController = new DataController();
        Code::$dataController->connect();
        $result = Code::$dataController->exec($query);
        Code::$dataController->disconnect();
        
        return $result;
    }
    
    public abstract function activate();
    
    public abstract function deactivate();  
    
    public static abstract function searchAll();
    
    public static abstract function search($lockSerial, $code);
    
    public static abstract function delete($lockSerial, $code);
}
