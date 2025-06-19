<?php

namespace common\models;

use Yii;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "orders".
 *
 * @property int $id
 * @property int $merchant_id
 * @property string $product_name
 * @property float $total_amount
 * @property string $status
 * @property string|null $created_at
 * @property string|null $updated_at
 *
 * @property Merchant $merchant
 */
class Order extends ActiveRecord
{
    public static function tableName()
    {
        return 'orders'; // make sure your table is named `orders`
    }

    public function rules()
    {
        return [
            [['merchant_id', 'product_name', 'total_amount'], 'required'],
            [['merchant_id'], 'integer'],
            [['total_amount'], 'number'],
            [['product_name'], 'string', 'max' => 255],
            [['status'], 'string', 'max' => 50],
            [['status'], 'default', 'value' => 'pending'],
            [['created_at', 'updated_at'], 'safe'],
        ];
    }

    public function attributeLabels()
    {
        return [
            'id' => 'Order ID',
            'merchant_id' => 'Merchant',
            'product_name' => 'Product Name',
            'total_amount' => 'Total Amount',
            'status' => 'Status',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
        ];
    }

    /**
     * Gets the merchant associated with this order.
     * @return \yii\db\ActiveQuery
     */
    public function getMerchant()
    {
        return $this->hasOne(Merchant::class, ['id' => 'merchant_id']);

    }
}
