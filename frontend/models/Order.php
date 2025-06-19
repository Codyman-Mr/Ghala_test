<?php

namespace app\models;

use Yii;
use yii\db\ActiveRecord;

class Order extends ActiveRecord
{
    public static function tableName()
    {
        return 'orders';
    }

    public function rules()
    {
        return [
            [['merchant_id', 'product_name', 'total_amount'], 'required'],
            [['merchant_id'], 'integer'],
            [['total_amount'], 'number'],
            [['product_name', 'status'], 'string', 'max' => 255],
            [['status'], 'default', 'value' => 'pending'],
            [['created_at', 'updated_at'], 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'merchant_id' => 'Merchant',
            'product_name' => 'Product Name',
            'total_amount' => 'Total Amount',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    // Relation to merchant
    public function getMerchant()
    {
        return $this->hasOne(Merchant::class, ['id' => 'merchant_id']);
    }
}
