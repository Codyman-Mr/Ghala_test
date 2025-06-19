# 🧠 Ghala Payment System Simulation

This project is a simplified simulation system that models how Ghala handles merchant payment configuration and order processing for WhatsApp commerce.

---

## 🎯 Goal

Build a system where:
- Merchants can submit and store their preferred payment method and configuration details (e.g., mobile money label, provider, and config fields).
- Customers can place orders for products with a total amount.
- The system records each order and assigns a status: `pending`, `paid`, or `failed`.
- A mock function simulates payment confirmation by changing the order status to `paid` after a specified delay.

---

## ⚙️ Features

### Backend
- Merchant management with payment method configuration saved as JSON.
- Order creation by customers linked to merchants.
- Order status management and simulation of payment confirmation.
- Automatic status update after 5 minutes (or manual simulation via button).

### Frontend
- Basic admin UI built with Yii2 and Tailwind CSS.
- Merchant Settings: Form to input payment method and configuration.
- Order List: View all orders with their current status.
- Button to manually simulate payment confirmation.

---

## 🏗️ Architecture & Design

### Support for Multiple Merchants
- Each merchant has unique payment configurations stored in JSON format.
- Orders reference merchants via foreign keys, allowing scalable multi-merchant support.

### Commission Rates Extension
- To extend commission support, add a `commission_rate` field to the merchant model and adjust payment processing logic accordingly.

### Scalability for 10,000+ Merchants
- Use proper database indexing on merchant and order tables.
- Cache frequently accessed merchant configurations.
- Offload payment simulation to asynchronous jobs or queue workers.
- Paginate large lists of merchants and orders to optimize UI performance.

---

## 💻 Tech Stack

- **Backend:** Yii2 Framework (PHP 8.x)
- **Database:** MySQL
- **Frontend:** Tailwind CSS, Bootstrap (for table styling)
- **Others:** JSON for payment config, Yii2 Active Record for DB abstraction

---

## 🚀 How to Run

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/ghala-payment-system.git
   cd ghala-payment-system
