<?php
/** @var yii\web\View $this */
use yii\helpers\Html;
$this->title = 'Welcome to Ghala Payment System';
?>

<!-- Tailwind CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/tailwindcss@3.3.2/dist/tailwind.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">

<style>
  body {
    font-family: 'Inter', sans-serif;
  }

  .gradient-bg {
    background: linear-gradient(135deg, #1e3a8a, #9333ea, #f59e0b);
    background-size: 600% 600%;
    animation: gradientAnimation 15s ease infinite;
  }

  @keyframes gradientAnimation {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
  }
</style>

<div class="min-h-screen gradient-bg flex flex-col justify-center items-center text-white px-6 py-16">

  <div class="max-w-4xl w-full text-center">

    <h1 class="text-6xl md:text-7xl font-extrabold mb-10 drop-shadow-lg leading-tight">
      Welcome to <span class="text-yellow-300 underline decoration-yellow-400">Ghala Payment System</span>
    </h1>

    <p class="text-xl md:text-2xl font-light mb-16 drop-shadow-md leading-relaxed tracking-wide max-w-3xl mx-auto">
      A smart and secure platform for merchants to manage payments and orders in real-time.<br>
      Secure. Simple. Efficient.
    </p>
<a href="<?= \yii\helpers\Url::to(['merchant/create']) ?>"
   class="inline-block bg-yellow-400 text-black font-semibold px-14 py-5 rounded-full shadow-xl hover:bg-yellow-300 transition duration-300"
>
</a>
<p>
    <?= Html::a('Place Order', ['order/create'], ['class' => 'btn btn-success']) ?>
    
</p>

  </div>

  <footer class="mt-32 text-gray-200 text-sm font-light max-w-4xl w-full text-center">
    &copy; <?= date('Y') ?> 
  </footer>

</div>
