<?php
use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Merchant;

/** @var yii\web\View $this */
/** @var common\models\Order $model */

$this->title = 'Place an Order';
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="order-create container py-5">

    <h1 class="mb-4"><?= Html::encode($this->title) ?></h1>

    <p class="text-muted">Fill in the form below to order a product from a registered merchant.</p>

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'product_name')->textInput([
        'maxlength' => true,
        'placeholder' => 'Enter product name'
    ]) ?>

    <?= $form->field($model, 'total_amount')->input('number', [
        'min' => 0,
        'step' => '0.01',
        'placeholder' => 'Enter total price'
    ]) ?>

    <?= $form->field($model, 'merchant_id')->dropDownList(
        ArrayHelper::map(Merchant::find()->all(), 'id', 'name'),
        ['prompt' => 'Select a merchant']
    ) ?>

    <div class="form-group mt-4">
        <?= Html::submitButton('Place Order', ['class' => 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
