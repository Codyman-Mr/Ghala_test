<?php
namespace backend\controllers;

use Yii;
use yii\web\Controller;
use backend\models\Merchant;
class MerchantController extends Controller
{
    public function actionCreate()
    {
        $model = new Merchant();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', 'Merchant saved!');
            return $this->refresh();
        }

        return $this->render('create', ['model' => $model]);
    }
}
