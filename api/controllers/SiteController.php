<?php
namespace api\controllers;

use Yii;
use yii\rest\ActiveController;
use yii\web\Response;

/**
 * http://localhost/yii2/yii2-oauth/frontend/web/index.php?r=auth/index&response_type=code&client_id=testclient&state=xyz&redirect_uri=http://baidu.com

http://localhost/yii2/yii2-oauth/frontend/web/index.php?r=auth/token

grant_type:password
username:admin
password:123456
client_id:testclient
client_secret:testclient

grant_type:authorization_code
code:123
client_id:testclient
client_secret:testclient

grant_type:refresh_token
refresh_token:9C_SSMqDacZJjJRqT3bMxZ-F19c-ZbeRJPlccgov
client_id:testclient
client_secret:testclient
 */
class SiteController extends ActiveController
{
    public $modelClass = 'api\models\Article';

    public function behaviors()
    {
        $behaviors = parent::behaviors();
        $behaviors["compositeAuth"] =  [
            'class' => \yii\filters\auth\CompositeAuth::className(),
            'authMethods' => [
                \yii\filters\auth\HttpBasicAuth::className(),
                \yii\filters\auth\QueryParamAuth::className(),
            ],
        ];
        $behaviors['contentNegotiator']['formats']['text/html'] = Response::FORMAT_JSON;

        return $behaviors;
    }

    public function actionIndex()
    {
        echo 111;die;
    }
}
