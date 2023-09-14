Створюємо EC2 в який засовуємо свій паблік кей для підключення по SSH у майбутньому.
Також створюємо Security group з правилом шо тільки з твоєго ip доступний порт 22.



1. внести свої креди
```
set AWS_ACCESS_KEY_ID=
set AWS_SECRET_ACCESS_KEY=
set AWS_REGION=
```

2. вбити IP з якого буде доступ по SSH у файлі ```terraform.tfvars```