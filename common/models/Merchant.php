<?php

namespace common\models;

use yii\db\ActiveRecord;

class Merchant extends ActiveRecord
{
    public static function tableName()
    {
        return 'merchants'; // hakikisha table yako ya merchant inaitwa hivi
    }

    public function rules()
    {
        return [
            [['name', 'email'], 'required'],
            [['email'], 'email'],
            [['name'], 'string', 'max' => 255],
            [['created_at', 'updated_at'], 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'Merchant ID',
            'name' => 'Merchant Name',
            'email' => 'Email',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    // Optional: relation to orders
    public function getOrders()
    {
        return $this->hasMany(Order::class, ['merchant_id' => 'id']);
    }
}
