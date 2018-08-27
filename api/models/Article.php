<?php
namespace api\models;

use Yii;
use yii\db\ActiveRecord;
use yii\behaviors\TimestampBehavior;

/**
 * 基类的类名用Tbl结尾
 */
class Article extends ActiveRecord
{
    public static function tableName()
    {
        return "article";
    }

    public function behaviors()
    {
        return [
            TimestampBehavior::className(),
        ];
    }

    /**
     * 基类，只描述每个字段的类型，
     * 不能出现 requires、when、on
     * @return array
     */
    public function rules()
    {
        return [
            [
                ["user_id"], "number"
            ],
            [
                ["title", "text"], "string"
            ]
        ];
    }
}