
<p>Новое письмо на сайте  -  {'site_name'|config} </p>
  
<p>Данные отправителя:</p>
 
{if $_pls['firstname']?}
    Имя: <strong> {$_pls['firstname']}</strong> <br>
{/if}

{if $_pls['lastname']?}
    Фамилия: <strong> {$_pls['lastname']}</strong> <br>
{/if}

{if $_pls['phone']?}
    Телефон: <strong> {$_pls['phone']}</strong> <br>
{/if}

{if $_pls['country']?}
    Страна: <strong> {$_pls['country']}</strong> <br>
{/if}

{if $_pls['type']?}
    Тип: <strong> {$_pls['type']}</strong> <br>
{/if}

{if $_pls['city']?}
    Город: <strong> {$_pls['city']}</strong> <br>
{/if}

{if $_pls['company']?}
    Компания: <strong> {$_pls['company']}</strong> <br>
{/if}

{if $_pls['email']?}
    Email: <strong> {$_pls['email']}</strong> <br>
{/if}

{if $_pls['address']?}
    Адрес: <strong> {$_pls['address']}</strong> <br>
{/if}

{if $_pls['message']?}
    Сообщение: <strong> {$_pls['message']}</strong> <br>
{/if}
 
{if $_pls['subject']?}
    Тема письма: <strong> {$_pls['subject']}</strong> <br>
{/if}
 
<br> 
 
Страница отправки: <strong>{$_pls['pageId']|url:['scheme' => 'full']}</strong><br>
 
 