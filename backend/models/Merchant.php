<?php

namespace backend\models;

use Yii;
use yii\db\ActiveRecord;

class Merchant extends ActiveRecord
{
    public static function tableName()
    {
        return 'merchants';
    }

    public function rules()
    {
        return [
            [['name', 'payment_method', 'payment_config'], 'required'],
            [['payment_config'], 'string'],
            [['name', 'payment_method'], 'string', 'max' => 255],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => 'Merchant Name',
            'payment_method' => 'Payment Method',
            'payment_config' => 'Payment Configuration (JSON)',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    // Optional: decode JSON config
    public function getDecodedConfig()
    {
        return json_decode($this->payment_config, true);
    }
}
