<?php
use yii\widgets\ActiveForm;
use yii\helpers\Html;

$this->title = 'Add Merchant';
?>

<h1><?= $this->title ?></h1>

<?php $form = ActiveForm::begin(); ?>
<?= $form->field($model, 'name') ?>
<?= $form->field($model, 'payment_method')->dropDownList([
    'mobile' => 'Mobile',
    'card' => 'Card',
    'bank' => 'Bank',
]) ?>
<?= $form->field($model, 'payment_config')->textarea(['rows' => 3])->hint('Enter config as JSON') ?>
<?= Html::submitButton('Save', ['class' => 'btn btn-primary']) ?>
<?php ActiveForm::end(); ?>
