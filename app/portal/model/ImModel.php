<?php
namespace app\portal\model;
use think\Db;
use think\Model;

class ImModel extends Model
{
    public function send($url,$json){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_POST, TRUE);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $json);
        $json = curl_exec($ch);
        curl_close($ch);
        return $json;
    }

}