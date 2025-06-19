<?php

use yii\helpers\Html;
use yii\helpers\Url;

/** @var yii\web\View $this */
/** @var yii\data\ActiveDataProvider $dataProvider */

$this->title = 'Order List';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="order-index">
    <h1><?= Html::encode($this->title) ?></h1>

    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>ID</th>
                <th>Merchant</th>
                <th>Product</th>
                <th>Total</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($dataProvider->getModels() as $order): ?>
                <tr>
                    <td><?= Html::encode($order->id) ?></td>
                    <td><?= Html::encode($order->merchant->name ?? 'N/A') ?></td>
                    <td><?= Html::encode($order->product_name) ?></td>
                    <td>$<?= number_format($order->total_amount, 2) ?></td>
                    <td>
                        <span class="label label-<?= $order->status === 'paid' ? 'success' : ($order->status === 'pending' ? 'warning' : 'danger') ?>">
                            <?= Html::encode(ucfirst($order->status)) ?>
                        </span>
                    </td>
                    <td>
                        
                        <?php if ($order->status !== 'paid'): ?>
                            <?= Html::a('Simulate Payment', ['simulate-payment', 'id' => $order->id], [
                                'class' => 'btn btn-primary btn-sm',
                                'data' => [
                                    'confirm' => 'Simulate payment for this order?',
                                    'method' => 'post',
                                ],
                            ]) ?>
                        <?php else: ?>
                            <span class="text-muted">Paid</span>
                        <?php endif; ?>
                    </td>
                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
</div>
