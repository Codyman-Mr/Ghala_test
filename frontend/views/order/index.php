<?php
use yii\helpers\Html;

$this->title = 'Order List';
?>

<h1><?= $this->title ?></h1>

<table class="table table-bordered">
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
    <?php foreach ($orders as $order): ?>
        <tr>
            <td><?= $order->id ?></td>
            <td><?= $order->merchant->name ?></td>
            <td><?= $order->product_name ?></td>
            <td><?= $order->total_amount ?></td>
            <td><?= $order->status ?></td>
            <td>
                <?php if ($order->status == 'pending'): ?>
                    <?= Html::a('Simulate Payment', ['simulate', 'id' => $order->id], ['class' => 'btn btn-warning']) ?>
                <?php else: ?>
                    <span class="text-success">✔</span>
                <?php endif; ?>
            </td>
        </tr>
    <?php endforeach; ?>
    </tbody>
</table>
