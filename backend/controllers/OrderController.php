<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use common\models\Order;
use yii\data\ActiveDataProvider;

class OrderController extends Controller
{
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => Order::find()->orderBy(['created_at' => SORT_DESC]),
            'pagination' => [
                'pageSize' => 15,
            ],
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionSimulate($id)
{
    $order =Order::findOne($id);

    if (!$order || $order->status === 'paid') {
        Yii::$app->session->setFlash('error', 'Invalid or already paid order.');
        return $this->redirect(['index']);
    }

    // Simulate delay
    sleep(5); // subiri sekunde 5

    $order->status = 'paid';
    $order->save(false);

    Yii::$app->session->setFlash('success', 'Payment simulated. Order marked as paid.');
    return $this->redirect(['index']);
}

    public function actionSimulatePayment($id)
    {
        $order = Order::findOne($id);
        if (!$order) {
            Yii::$app->session->setFlash('error', 'Order not found.');
            return $this->redirect(['index']);
        }

        // For simplicity, instantly mark as paid
        $order->status = 'paid';
        if ($order->save()) {
            Yii::$app->session->setFlash('success', 'Payment simulated for order #' . $order->id);
        } else {
            Yii::$app->session->setFlash('error', 'Failed to update order status.');
        }

        return $this->redirect(['index']);
    }
}
