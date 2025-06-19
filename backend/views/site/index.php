<!DOCTYPE html>
<html lang="en" >
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Admin Dashboard</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex h-screen">

  <!-- Sidebar -->
  <aside class="w-64 bg-gradient-to-b from-indigo-700 via-indigo-800 to-indigo-900 text-white flex flex-col">
    <div class="px-6 py-4 text-3xl font-extrabold tracking-wide border-b border-indigo-600">
      MyAdmin
    </div>
    <nav class="flex-1 px-4 py-6 space-y-3 text-lg">
  <a href="<?= \yii\helpers\Url::to(['merchant/create']) ?>" class="block py-3 px-4 rounded-lg hover:bg-indigo-600 transition">
  🏠 Merchant
</a>
<a href="<?= \yii\helpers\Url::to(['order/index']) ?>" class="block py-3 px-4 rounded-lg hover:bg-indigo-600 transition">
  📦 Orders
</a>
</nav>

    <div class="px-6 py-4 border-t border-indigo-600">
      <button class="w-full bg-red-600 hover:bg-red-700 rounded-lg py-3 font-semibold transition">🚪 Logout</button>
    </div>
  </aside>

  <!-- Main content -->
  <div class="flex-1 flex flex-col">
    <!-- Header -->
    <header class="bg-white shadow px-6 py-4 flex justify-between items-center">
      <!-- Jina la app upande wa kushoto -->
      <h1 class="text-2xl font-bold text-gray-800">Dashboard</h1>

      <!-- Maneno upande wa kulia -->
      <div class="text-right text-gray-700 space-y-1">
        <p class="font-semibold">Welcome, Admin 👋</p>
        <p class="text-sm text-gray-500">June 19, 2025</p>
      </div>
    </header>
      </section>
    </main>
  </div>

</body>
</html>


