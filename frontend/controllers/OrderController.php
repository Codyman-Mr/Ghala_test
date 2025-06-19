<?php
namespace frontend\controllers;

use Yii;
use yii\web\Controller;
use app\models\Order;
use app\models\Merchant;

class OrderController extends Controller
{
    public function actionCreate()
    {
        $model = new Order();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', 'Order placed successfully!');
            return $this->refresh();
        }

        return $this->render('create', ['model' => $model]);
    }

    public function actionIndex()
    {
        $orders = Order::find()->with('merchant')->orderBy(['id' => SORT_DESC])->all();
        return $this->render('index', ['orders' => $orders]);
    }

    public function actionSimulate($id)
    {
        $order = Order::findOne($id);
        if ($order && $order->status === 'pending') {
            // Simulate payment confirmation after 5 seconds
            sleep(5);
            $order->status = 'paid';
            $order->save();
            Yii::$app->session->setFlash('success', 'Payment simulated successfully.');
        }
        return $this->redirect(['order/index']);
    }
}
