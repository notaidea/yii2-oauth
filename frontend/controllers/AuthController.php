<?php
namespace frontend\controllers;

use common\models\LoginForm;

class AuthController extends \yii\web\Controller
{
    public function behaviors()
    {
        return [
            /**
            * checks oauth2 credentions
            * and performs OAuth2 authorization, if user is logged on
            */
            'oauth2Auth' => [
                'class' => \conquer\oauth2\AuthorizeFilter::className(),
                'only' => ['index'],
            ],
        ];
    }

    public function actions()
    {
        return [
            // returns access token
            'token' => [
                'class' => \conquer\oauth2\TokenAction::classname(),
            ],
        ];
    }

    //http://localhost/yii2/yii2-oauth/frontend/web/index.php?r=auth/index&response_type=code&client_id=testclient&state=xyz&redirect_uri=www.baidu.com
    /**
    * Display login form to authorize user
    */
    public function actionIndex()
    {
        $model = new LoginForm();
        if ($model->load(\Yii::$app->request->post()) && $model->login()) {
            return $this->goBack();
        } else {
            return $this->render('@frontend/views/site/login', [
                'model' => $model,
            ]);
        }
    }


}