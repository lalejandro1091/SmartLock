<?php

/**
 * Description of DataController
 *
 * @author Gersain Castañeda Muñoz
 */
class DataController 
{    
    private $connection;
    
    public function connect()
    {        
        $hostdb = 'mysql.hostinger.es';
        $namedb = 'u944924796_sl';
        $userdb = 'u944924796_sl';
        $passdb = 'trevize1';

        try
        {
            $this->connection = new PDO("mysql:host=$hostdb; dbname=$namedb", $userdb, $passdb);
        }
        catch(PDOException $e) 
        {
            echo $e->getMessage();
        }              
    } 
    
    public function exec($query)
    {       
        return $this->connection->exec($query);                
    }
    
    public function query($query)
    {       
        return $this->connection->query($query);            
    }
    
    public function disconnect()
    {
        $this->connection = null;
    }        
}