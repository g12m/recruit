<?php

namespace app\portal\controller;

use cmf\controller\HomeBaseController;
use app\portal\model\PortalTagModel;
vendor('TencentCloud\vendor\autoload');
use TencentCloud\Common\Credential;
use TencentCloud\Common\Profile\ClientProfile;
use TencentCloud\Common\Profile\HttpProfile;
use TencentCloud\Common\Exception\TencentCloudSDKException;
use TencentCloud\Live\V20180801\LiveClient;
use TencentCloud\Live\V20180801\Models\DescribeLiveCertRequest;
class ZhiboController extends HomeBaseController
{
    public function index()
    {
        try {

            $cred = new Credential("", "");
            $httpProfile = new HttpProfile();
            $httpProfile->setEndpoint("live.tencentcloudapi.com");
              
            $clientProfile = new ClientProfile();
            $clientProfile->setHttpProfile($httpProfile);
            $client = new LiveClient($cred, "", $clientProfile);
        
            $req = new DescribeLiveCertRequest();
            
            $params = array(
        
            );
            $req->fromJsonString(json_encode($params));
        
        
            $resp = $client->DescribeLiveCert($req);
        
            print_r($resp->toJsonString());
        }
        catch(TencentCloudSDKException $e) {
            echo $e;
        }
    }

}
