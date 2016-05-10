<?php
$product=$_POST['product'];
$code=$_POST['code'];

$connection = mysql_connect("mysql.hostinger.es", "u944924796_sl", "trevize1");
$db = mysql_select_db("u944924796_sl", $connection);

$query = mysql_query("select * from OwnerCodes where lockSerial='$product' AND code='$code'", $connection);
$rowsOwner = mysql_num_rows($query);

$query = mysql_query("SELECT * FROM RecipientCodes, Permissions WHERE RecipientCodes.code = '$code' AND RecipientCodes.permissionId = Permissions.id AND Permissions.lockSerial = '$product'", $connection);
$rowsRecipient = mysql_num_rows($query);

if ($rowsOwner >= 1 || $rowsRecipient >= 1) 
{
    echo "access";
    $query = mysql_query("delete from OwnerCodes where lockSerial='$product' AND code='$code'", $connection);
    $query = mysql_query("delete from RecipientCodes where code = '$code'", $connection);  
} 
else
{
    echo "$";
}

mysql_close($connection); 
?>		