<?php
namespace think\wxcompany;
/*
 *  企业付款到用户零钱或银行卡，
 */
 use think\wxcompany\WxCompany;

class WxPayCompanyToMember extends WxCompany
{
    /**
     * @param $openid
     * @param $amount
     * @param $desc
     * @return array
     * 付款到零钱
     */
    public function wxPayToPocket($openid,$order_sn, $amount, $desc)
    {
        $this->payurl = 'https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers';
        $result       = $this->companyToPocket($openid, $amount,$order_sn, $desc);
        return $this->returnResult($result);

    }

    /**
     * @param $enc_bank_no
     * @param $enc_true_name
     * @param $bank_code
     * @param $amount
     * @param $desc
     * @return array
     * 付款到银行卡
     */
    public function wxPayToBank($enc_bank_no, $enc_true_name, $amount, $desc)
    {
        $this->payurl = 'https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers';
        $this->setBankData($enc_bank_no, $enc_true_name);
        $result = $this->companyPayToBank($amount, $desc);
        return $this->returnResult($result);

    }

    /**
     * @param $result
     * @return array
     * 反參
     */
    private function returnResult($result)
    {
        if ($result['return_code'] == "SUCCESS" && $result['result_code'] == "SUCCESS") {
            $result['is']=true;
            return $result;
        } else {
            return array('is'=>false,'state' => 0, 'msg' => "错误代码:" . $result['err_code'] . ";描述:" . $result['err_code_des']);
        }
    }

}
