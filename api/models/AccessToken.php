<?php
namespace api\models;

use Yii;
use yii\db\ActiveRecord;

class AccessToken extends ActiveRecord
{
    public static function tableName()
    {
        return "oauth2_access_token";
    }
}